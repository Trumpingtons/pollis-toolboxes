# Contributing a toolbox

New toolboxes, and improvements to the ones here, are welcome as pull requests. Pollis lists the toolboxes of this repository in the **Toolboxes** section of its Extensions view, so a merged toolbox reaches every Pollis user.

## The easy way

Build the toolbox with the Pollis Agents skills (**Compose > Pollis Agents** in Pollis): `create-panel` writes the panels and `package-toolbox` packages them. When `package-toolbox` asks where to publish, choose **Propose it for Pollis' Toolboxes section**: it forks this repository, copies the toolbox's sources into your fork and opens the pull request. It needs the [GitHub CLI](https://cli.github.com), signed in with `gh auth login`.

## By hand

1. Fork this repository and add your toolbox as one folder, `pollis-toolbox-<name>/`, laid out like the others: `package.json` (the `pollisToolboxes` contribution), `panels/<id>.toml`, `wiki/<id>/`, `notebooks/<id>/`, `README.md` and, optionally, `icon.png`. Add its row to the table in this repository's `README.md`.
2. Open a pull request to `main`, one toolbox per pull request.

## What is checked

Every push to a pull request runs `scripts/checkToolboxes.ts`, and the result is shown on the pull request:

- the pull request changes one toolbox folder, and nothing else but the `README.md` table;
- the folder is named like its `package.json`, which has a name, display name, description, version, publisher, author and license, and contributes `pollisToolboxes` only: a toolbox has no code;
- a new toolbox is at version `0.1.0`; a changed one has a higher version than on `main`, or the installed copies are not offered the update;
- its toolbox ids, panel ids and commands are not used by another toolbox;
- only `.toml`, `.md`, `.json`, `.ipynb`, `.txt`, `.png` and `.svg` files, each at most 1 MB and 5 MB in all; notebooks saved without outputs;
- every panel passes the panel validator of the Pollis Agents skills (`validatePanel.mjs`), which reads it with Pollis' own parser;
- the toolboxes still package.

To run the check yourself, with Node 22.18 or later and a clone of [pollis-skills](https://github.com/Trumpingtons/pollis-skills):

```sh
node scripts/checkToolboxes.ts --validator <pollis-skills>/plugins/pollis-agents/scripts/validatePanel.mjs --base origin/main
```

## Review and publishing

A maintainer reviews every pull request, runs the panels in Pollis and may ask for changes. When it is merged, the toolboxes are packaged and published automatically, and Pollis shows the new toolbox or version within a few minutes.

By sending a pull request you agree that your contribution is shared under the license of this repository, AGPL-3.0.
