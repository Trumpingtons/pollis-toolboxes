/*---------------------------------------------------------------------------------------------
 *  Copyright (c) 2026 Antonio Saragga Seabra
 *  Licensed under the GNU Affero General Public License v3.0. See LICENSE.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/

// Check the toolboxes that a pull request adds or changes. Run by .github/workflows/check.yml;
// needs only Node 22.18 or later and git.
//
//   node scripts/checkToolboxes.ts --validator <validatePanel.mjs> --base <git ref>   the toolboxes changed since <ref>
//   node scripts/checkToolboxes.ts --validator <validatePanel.mjs> --all              every toolbox
//
// validatePanel.mjs is the panel validator of the Pollis Agents skills
// (https://github.com/Trumpingtons/pollis-skills, plugins/pollis-agents/scripts/), with its pollis.mjs.
// The checks, for each toolbox:
//   - a pull request changes one toolbox folder only, and nothing else but the README.md of this repository
//   - the folder is named like its package.json, pollis-toolbox-<name>
//   - package.json has a name, a display name, a description, a version, a publisher, an author and a
//     license, and contributes pollisToolboxes only: a toolbox has no code
//   - the version is 0.1.0 for a new toolbox, and higher than the one on <ref> for a changed one
//   - the toolbox ids, panel ids and commands are not used by another toolbox, and every panel's TOML exists
//   - only text, notebook and image files (.toml .md .json .ipynb .txt .png .svg), each at most 1 MB,
//     5 MB in all; a README.md; notebooks saved without outputs
//   - every panel TOML passes validatePanel.mjs (its warnings are shown, not counted as errors)
//   - the toolboxes package (scripts/packageToolboxes.ts)
// Writes a report to the standard output and, on GitHub, to the job summary.
// Exit status: 0 when there are no errors, 1 otherwise.

import { execFileSync, spawnSync } from 'child_process';
import * as fs from 'fs';
import * as os from 'os';
import * as path from 'path';

/** The root of this repository: one folder per toolbox. */
const ROOT = path.join(import.meta.dirname, '..');
const ALLOWED_EXTENSIONS = new Set(['.toml', '.md', '.json', '.ipynb', '.txt', '.png', '.svg']);
const MAX_FILE_BYTES = 1024 * 1024;
const MAX_TOOLBOX_BYTES = 5 * 1024 * 1024;
const NEW_TOOLBOX_VERSION = '0.1.0';
/** Files outside the toolbox folders that a pull request may change. */
const ALLOWED_ROOT_FILES = new Set(['README.md']);

/** The fields of a toolbox's package.json that are checked. */
interface ToolboxManifest {
	readonly name?: string;
	readonly displayName?: string;
	readonly description?: string;
	readonly version?: string;
	readonly publisher?: string;
	readonly author?: string | { readonly name?: string };
	readonly license?: string;
	readonly icon?: string;
	readonly main?: string;
	readonly browser?: string;
	readonly scripts?: Record<string, string>;
	readonly dependencies?: Record<string, string>;
	readonly contributes?: {
		readonly pollisToolboxes?: readonly {
			readonly id?: string;
			readonly panels?: readonly { readonly id?: string; readonly command?: string; readonly data?: string }[];
		}[];
	};
}

/** The findings about one toolbox. */
interface Report {
	readonly folder: string;
	readonly errors: string[];
	readonly warnings: string[];
}

function git(...args: string[]): string {
	return execFileSync('git', args, { cwd: ROOT, encoding: 'utf-8', stdio: ['ignore', 'pipe', 'ignore'] });
}

function readManifest(folder: string): ToolboxManifest | undefined {
	try {
		return JSON.parse(fs.readFileSync(path.join(ROOT, folder, 'package.json'), 'utf-8'));
	} catch {
		return undefined;
	}
}

/** The toolbox folders of this repository, except `skip`. */
function toolboxFolders(skip?: string): string[] {
	return fs.readdirSync(ROOT, { withFileTypes: true })
		.filter(entry => entry.isDirectory() && entry.name !== skip && fs.existsSync(path.join(ROOT, entry.name, 'package.json')))
		.map(entry => entry.name)
		.sort();
}

/** The files of a folder, relative to it with forward slashes; dot files are left out, as in the .vsix. */
function listFiles(folder: string, prefix = ''): string[] {
	const files: string[] = [];
	for (const entry of fs.readdirSync(path.join(folder, prefix), { withFileTypes: true })) {
		if (entry.name.startsWith('.')) {
			continue;
		}
		const relative = prefix ? `${prefix}/${entry.name}` : entry.name;
		if (entry.isDirectory()) {
			files.push(...listFiles(folder, relative));
		} else {
			files.push(relative);
		}
	}
	return files.sort();
}

/** -1, 0 or 1 as version a is lower than, equal to or higher than b (dotted numbers). */
function compareVersions(a: string, b: string): number {
	const x = a.split('.').map(Number);
	const y = b.split('.').map(Number);
	for (let i = 0; i < Math.max(x.length, y.length); i++) {
		const difference = (x[i] ?? 0) - (y[i] ?? 0);
		if (difference !== 0) {
			return Math.sign(difference);
		}
	}
	return 0;
}

/** The ids and commands that the other toolboxes use, to find duplicates. */
function usedIds(skip: string): { toolboxes: Map<string, string>; panels: Map<string, string>; commands: Map<string, string> } {
	const toolboxes = new Map<string, string>();
	const panels = new Map<string, string>();
	const commands = new Map<string, string>();
	for (const folder of toolboxFolders(skip)) {
		for (const toolbox of readManifest(folder)?.contributes?.pollisToolboxes ?? []) {
			if (toolbox.id) {
				toolboxes.set(toolbox.id, folder);
			}
			for (const panel of toolbox.panels ?? []) {
				if (panel.id) {
					panels.set(panel.id, folder);
				}
				if (panel.command) {
					commands.set(panel.command, folder);
				}
			}
		}
	}
	return { toolboxes, panels, commands };
}

function checkToolbox(folder: string, base: string | undefined, validator: string): Report {
	const report: Report = { folder, errors: [], warnings: [] };
	const error = (message: string) => report.errors.push(message);
	const manifest = readManifest(folder);
	if (!manifest) {
		error('package.json is missing or is not valid JSON');
		return report;
	}

	// The manifest
	for (const field of ['name', 'displayName', 'description', 'version', 'publisher', 'author', 'license'] as const) {
		if (!manifest[field]) {
			error(`package.json has no "${field}"`);
		}
	}
	if (manifest.name && folder !== manifest.name) {
		error(`the folder is named ${folder}, but package.json names the toolbox ${manifest.name}: they must be the same`);
	}
	if (manifest.name && !manifest.name.startsWith('pollis-toolbox-')) {
		error(`the name ${manifest.name} must start with pollis-toolbox-`);
	}
	if (manifest.version && !/^\d+\.\d+\.\d+$/.test(manifest.version)) {
		error(`the version ${manifest.version} must be three numbers, like ${NEW_TOOLBOX_VERSION}`);
	}
	if (manifest.main || manifest.browser || manifest.scripts || manifest.dependencies) {
		error('package.json has "main", "browser", "scripts" or "dependencies": a toolbox has no code');
	}
	const contributions = Object.keys(manifest.contributes ?? {});
	if (contributions.some(name => name !== 'pollisToolboxes')) {
		error(`package.json contributes ${contributions.filter(name => name !== 'pollisToolboxes').join(', ')}: a toolbox contributes pollisToolboxes only`);
	}
	const toolboxes = manifest.contributes?.pollisToolboxes ?? [];
	if (!toolboxes.length) {
		error('package.json contributes no pollisToolboxes');
	}

	// The version against the one on the base
	if (base && manifest.version) {
		let previous: ToolboxManifest | undefined;
		try {
			previous = JSON.parse(git('show', `${base}:${folder}/package.json`));
		} catch {
			previous = undefined;
		}
		if (!previous && manifest.version !== NEW_TOOLBOX_VERSION) {
			error(`a new toolbox starts at version ${NEW_TOOLBOX_VERSION}, not ${manifest.version}`);
		} else if (previous?.version && compareVersions(manifest.version, previous.version) <= 0) {
			error(`the version must be raised above ${previous.version}, or the installed copies are not offered the update`);
		}
	}

	// Ids, commands and the panel files
	const used = usedIds(folder);
	const panelTomls: string[] = [];
	for (const toolbox of toolboxes) {
		if (!toolbox.id) {
			error('a pollisToolboxes entry has no "id"');
		} else if (used.toolboxes.has(toolbox.id)) {
			error(`the toolbox id ${toolbox.id} is used by ${used.toolboxes.get(toolbox.id)}`);
		}
		for (const panel of toolbox.panels ?? []) {
			if (!panel.id || !panel.command || !panel.data) {
				error(`a panel of ${toolbox.id ?? 'a toolbox'} needs an "id", a "command" and a "data" file`);
				continue;
			}
			if (used.panels.has(panel.id)) {
				error(`the panel id ${panel.id} is used by ${used.panels.get(panel.id)}`);
			}
			if (used.commands.has(panel.command)) {
				error(`the command ${panel.command} is used by ${used.commands.get(panel.command)}`);
			}
			if (!fs.existsSync(path.join(ROOT, folder, panel.data))) {
				error(`the panel ${panel.id} names ${panel.data}, which does not exist`);
			} else {
				panelTomls.push(path.join(ROOT, folder, panel.data));
			}
		}
	}

	// The files
	const files = listFiles(path.join(ROOT, folder));
	if (!files.includes('README.md')) {
		error('there is no README.md');
	}
	if (manifest.icon && !files.includes(manifest.icon)) {
		error(`package.json names the icon ${manifest.icon}, which does not exist`);
	}
	let total = 0;
	for (const file of files) {
		const size = fs.statSync(path.join(ROOT, folder, file)).size;
		total += size;
		if (!ALLOWED_EXTENSIONS.has(path.posix.extname(file).toLowerCase())) {
			error(`${file}: only ${[...ALLOWED_EXTENSIONS].join(' ')} files go in a toolbox`);
		}
		if (size > MAX_FILE_BYTES) {
			error(`${file} is ${(size / 1024 / 1024).toFixed(1)} MB: at most 1 MB a file`);
		}
		if (file.endsWith('.ipynb')) {
			try {
				const notebook: { cells?: { outputs?: unknown[] }[] } = JSON.parse(fs.readFileSync(path.join(ROOT, folder, file), 'utf-8'));
				if ((notebook.cells ?? []).some(cell => cell.outputs?.length)) {
					error(`${file} has outputs: save notebooks without them`);
				}
			} catch {
				error(`${file} is not valid JSON`);
			}
		}
	}
	if (total > MAX_TOOLBOX_BYTES) {
		error(`the toolbox is ${(total / 1024 / 1024).toFixed(1)} MB: at most 5 MB in all`);
	}

	// The panels, with Pollis' own parser
	if (panelTomls.length) {
		const result = spawnSync(process.execPath, [path.resolve(validator), ...panelTomls.map(toml => path.relative(ROOT, toml))], { cwd: ROOT, encoding: 'utf-8' });
		for (const line of result.stdout.split('\n')) {
			const problem = /^(?<location>.+?:\d+): (?<kind>error|warning): (?<message>.*)$/.exec(line)?.groups;
			if (problem) {
				(problem.kind === 'error' ? report.errors : report.warnings).push(`${problem.location}: ${problem.message}`);
			}
		}
		if (result.status !== 0 && !report.errors.length) {
			error(`validatePanel.mjs failed: ${result.stderr.trim() || `exit status ${result.status}`}`);
		}
	}
	return report;
}

/** Errors in packaging all the toolboxes, as Pollis will download them. */
function checkPackaging(): string[] {
	const out = fs.mkdtempSync(path.join(os.tmpdir(), 'toolboxes-'));
	try {
		const result = spawnSync(process.execPath, [path.join(ROOT, 'scripts', 'packageToolboxes.ts'), out], { encoding: 'utf-8' });
		return result.status === 0 ? [] : [`packaging failed: ${result.stderr.trim()}`];
	} finally {
		fs.rmSync(out, { recursive: true, force: true });
	}
}

function main(): void {
	const args = process.argv.slice(2);
	const option = (name: string) => {
		const index = args.indexOf(name);
		return index >= 0 ? args[index + 1] : undefined;
	};
	const validator = option('--validator');
	const base = option('--base');
	if (!validator || (!base && !args.includes('--all'))) {
		console.error('usage: node scripts/checkToolboxes.ts --validator <validatePanel.mjs> (--base <git ref> | --all)');
		process.exit(2);
	}

	const general: string[] = [];
	let folders: string[];
	if (base) {
		const changed = git('diff', '--name-only', '--no-renames', `${base}...HEAD`).split('\n').filter(file => file);
		const outside = changed.filter(file => !file.includes('/') && !ALLOWED_ROOT_FILES.has(file) || /^(scripts|\.github)\//.test(file));
		if (outside.length) {
			general.push(`only the maintainers change ${outside.join(', ')}: a pull request changes one toolbox folder (and may add its row to README.md)`);
		}
		folders = [...new Set(changed.filter(file => file.includes('/') && !/^(scripts|\.github)\//.test(file)).map(file => file.split('/')[0]))]
			.filter(folder => fs.existsSync(path.join(ROOT, folder)));
		if (folders.length > 1) {
			general.push(`the pull request changes ${folders.length} toolboxes (${folders.join(', ')}): send one pull request for each`);
		}
	} else {
		folders = toolboxFolders();
	}

	const reports = folders.map(folder => checkToolbox(folder, base, validator));
	general.push(...checkPackaging());

	const lines: string[] = ['# Toolbox check', ''];
	for (const message of general) {
		lines.push(`- :x: ${message}`);
	}
	if (!folders.length) {
		lines.push('No toolbox changed.');
	}
	for (const report of reports) {
		lines.push('', `## ${report.folder}`, '');
		if (!report.errors.length) {
			lines.push(':white_check_mark: No errors.');
		}
		lines.push(...report.errors.map(message => `- :x: ${message}`));
		lines.push(...report.warnings.map(message => `- :warning: ${message}`));
	}
	const errors = general.length + reports.reduce((sum, report) => sum + report.errors.length, 0);
	lines.push('', errors ? `**${errors} error${errors === 1 ? '' : 's'}.** Fix ${errors === 1 ? 'it' : 'them'} and push again: the check runs on every push.` : '**All checks passed.** A maintainer will review the toolbox.', '');

	const text = lines.join('\n');
	console.log(text);
	if (process.env.GITHUB_STEP_SUMMARY) {
		fs.appendFileSync(process.env.GITHUB_STEP_SUMMARY, text);
	}
	process.exitCode = errors ? 1 : 0;
}

main();
