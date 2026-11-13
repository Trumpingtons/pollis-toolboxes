# Pollis Toolboxes

Toolboxes for [Pollis](https://github.com/saragga/pollis), the desktop environment for statistical modelling, simulation and optimisation built on Code - OSS and Julia.

A toolbox is a data-only extension that adds guided panels, with their wiki pages and notebook tutorials, to a Pollis menu. Pollis lists the published toolboxes in the **Toolboxes** section of the Extensions view and installs them from there.

| Toolbox | What it adds |
|---|---|
| [pollis-toolbox-econometrics](pollis-toolbox-econometrics/README.md) | Finance, in the Model menu: ARIMAX, GARCH-type, stochastic volatility and regime switching models, forecasting, Bayesian asset-pricing factor models. |
| [pollis-toolbox-economics](pollis-toolbox-economics/README.md) | Economic Models, in the Simulate menu: business cycle filters, stochastic volatility, DSGE, VAR/VECM, heterogeneous-agent and continuous-time macro-finance models, and game theory. |
| [pollis-toolbox-learning-and-practice](pollis-toolbox-learning-and-practice/README.md) | Self-Study: Learn and Practise, in the Extend menu. Turn your slides, notes and PDFs into what helps you study: more problems with their solutions, a topic explained in depth, a summary of a paper, prose and audio from slides, or slides from a long text. For students, and for teachers preparing their classes. |
| [pollis-toolbox-mathematical-core](pollis-toolbox-mathematical-core/README.md) | Core Mathematics, in the Extend menu: symbolic math, linear algebra, nonlinear systems, automatic and numerical differentiation, numerical integration, ODEs and PDEs. |

New toolboxes are welcome, as pull requests: see [CONTRIBUTING.md](CONTRIBUTING.md). A toolbox can be built with the Pollis Agents skills (**Compose > Pollis Agents** in Pollis, or the [pollis-plugins](https://github.com/Trumpingtons/pollis-plugins) marketplace), which can also open the pull request.

## Layout

- `main` holds the sources: one folder per toolbox, `<name>/package.json` (the `pollisToolboxes` contribution), `panels/<id>.toml`, `wiki/<id>/`, `notebooks/<id>/` and, optionally, `docs/<document>/`, the LaTeX sources of the toolbox's documentation (see below).
- A toolbox folder with a `DEFERRED.md` stays on `main` but is not published: the packaging leaves it out until the file is deleted.
- `dist` holds what Pollis downloads: `toolboxes.json`, the index, and for each toolbox its `.vsix` and README. It is generated, one commit with no history, by `.github/workflows/publish.yml` on every push to `main`.
- `scripts/` holds the packaging script, `packageToolboxes.ts`, and the check that runs on every pull request, `checkToolboxes.ts` (`.github/workflows/check.yml`).

## Documentation

A toolbox can bring its own documentation, listed in **Help > Documentation > Toolboxes** in Pollis. It ships LaTeX sources, not PDFs: Pollis compiles a document with PollisTeX (the XeTeX of Tectonic) the first time it is opened, and again when the toolbox's version changes. Each toolbox entry of `pollisToolboxes` lists its documents:

```json
"documents": [
  {
    "title": "Finance Toolbox Guide",
    "source": "docs/guide/guide.tex"
  }
]
```

`source` is the main `.tex` file, relative to the toolbox folder; its name is letters, digits, `-` and `_`. The document's other `.tex` files and its `.bib` files go in the same folder, and its images (`.png`, `.jpg`) in a `resources/` folder beside them. Write the sources for XeTeX: `fontspec` rather than `inputenc`, and no shell escape.

## Texts for the Knowledge Base

A toolbox can add texts to the Knowledge Base of Pollis (**Compose > Knowledge for AI Models > Knowledge Base**): lecture notes, books or articles whose authors share them under an open licence. The toolbox ships no PDF: it names where the authors keep it, at a fixed version, and Pollis downloads it the first time the user switches the text on, checks it by its SHA-256 and keeps it, with a `LICENCE.md`, in `~/.pollis/knowledge/toolboxes`. In the table of the Knowledge Base, the toolbox is the text's **Source**, and the text leaves the table when the toolbox is uninstalled. Each toolbox entry of `pollisToolboxes` lists its texts:

```json
"texts": [
  {
    "id": "empirical_asset_pricing",
    "reference": "Sod2023a",
    "title": "Lecture Notes in Empirical Asset Pricing (PhD)",
    "type": "Lecture Notes",
    "edition": "25 August 2023",
    "authors": ["Paul Söderlind"],
    "publisher": "University of St. Gallen",
    "year": 2023,
    "licence": "MIT",
    "licenceUrl": "https://github.com/PaulSoderlind/EmpiricalFinancePhD/blob/6e41df601c06c13ae097264a6604f51334d44fac/LICENSE.txt",
    "page": "https://github.com/PaulSoderlind/EmpiricalFinancePhD",
    "download": "https://raw.githubusercontent.com/PaulSoderlind/EmpiricalFinancePhD/6e41df601c06c13ae097264a6604f51334d44fac/EmpFinPhDAll.pdf",
    "sha256": "58ffdb6b9fe6c162dae9caca5f65225a1abb93c803d5c493190c1daccd32a5dd",
    "size": 9.2
  }
]
```

`id` is lower-case letters, digits and `_`. `download` is the PDF at a fixed version, such as a file of a GitHub repository at a commit, so that the file named is the one `sha256` describes; `size` is in MB. `reference` is the key of the text's work in PollisReferences, `subject`, `packages` (the Julia packages the text is about, such as `Distributions.jl`, which the Knowledge Base shows first in its subject), `keyWords` and `classifications` (each a system with its codes, such as `JEL: G12, C58`) are optional, and so is `changes`, what is changed of the PDF; without it, the PDF of its authors, unchanged.

## Notebook courses

A toolbox can add notebook courses to **Help > Notebook Courses** of Pollis: courses of its field taught in notebooks, on their authors' sites, which Pollis opens in its internal browser. They are in the menu while the toolbox is installed, after the courses Pollis has itself, by their titles. Each toolbox entry of `pollisToolboxes` lists its courses:

```json
"courses": [
  {
    "title": "QuantEcon Julia Lectures (Jupyter)",
    "url": "https://julia.quantecon.org"
  }
]
```

`title` is the menu item, with the kind of the course's notebooks in parentheses when its title does not say it, and `url` the https link to the course's page.

## For developers

Pollis' build tools read the sources from a `toolboxes/` folder at the root of the Pollis checkout, which is a clone of this repository (ignored by Pollis' git):

```sh
cd <pollis> && git clone https://github.com/Trumpingtons/pollis-toolboxes.git toolboxes
```

`node build/pollis/packageToolboxes.ts` in Pollis runs `scripts/packageToolboxes.ts` and writes the files of `dist` to `.build/toolboxes/`, to try them locally. To publish, push to `main`: the packages are built and `dist` is replaced automatically.

## License

AGPL-3.0, see [LICENSE.txt](LICENSE.txt).
