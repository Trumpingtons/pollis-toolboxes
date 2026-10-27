# Pollis Toolboxes

Toolboxes for [Pollis](https://github.com/saragga/pollis), the desktop environment for statistical modelling, simulation and optimisation built on Code - OSS and Julia.

A toolbox is a data-only extension that adds guided panels, with their wiki pages and notebook tutorials, to a Pollis menu. Pollis lists the published toolboxes in the **Toolboxes** section of the Extensions view and installs them from there.

| Toolbox | What it adds |
|---|---|
| [pollis-toolbox-econometrics](pollis-toolbox-econometrics/README.md) | Financial Econometrics, in the Model menu: ARIMAX, VAR/VECM, GARCH-type and regime switching models, forecasting, Bayesian asset-pricing factor models. |
| [pollis-toolbox-economics](pollis-toolbox-economics/README.md) | Economic Models, in the Simulate menu: business cycle filters, stochastic volatility, DSGE, heterogeneous-agent and continuous-time macro-finance models, and game theory. |
| [pollis-toolbox-learning-and-practice](pollis-toolbox-learning-and-practice/README.md) | Learning and Practice, in the Extend menu: multiple-choice exercises whose data and answers Julia computes, on descriptive statistics, hypothesis tests and linear regression, and a panel to write new ones. |
| [pollis-toolbox-mathematical-core](pollis-toolbox-mathematical-core/README.md) | Mathematical Core, in the Extend menu: symbolic math, linear algebra, nonlinear systems, numerical differentiation and integration, ODEs and PDEs. |

New toolboxes are welcome, as pull requests: see [CONTRIBUTING.md](CONTRIBUTING.md). A toolbox can be built with the Pollis Agents skills (**Compose > Pollis Agents** in Pollis, or the [pollis-plugins](https://github.com/Trumpingtons/pollis-plugins) marketplace), which can also open the pull request.

## Layout

- `main` holds the sources: one folder per toolbox, `<name>/package.json` (the `pollisToolboxes` contribution), `panels/<id>.toml`, `wiki/<id>/`, `notebooks/<id>/` and, optionally, `docs/<document>/`, the LaTeX sources of the toolbox's documentation (see below).
- A toolbox folder with a `DEFERRED.md` stays on `main` but is not published: the packaging leaves it out until the file is deleted.

## Documentation

A toolbox can bring its own documentation, listed in **Help > Documentation > Toolboxes** in Pollis. It ships LaTeX sources, not PDFs: Pollis compiles a document with PollisTeX (the XeTeX of Tectonic) the first time it is opened, and again when the toolbox's version changes. Each toolbox entry of `pollisToolboxes` lists its documents:

```json
"documents": [
  {
    "title": "Finance Toolbox Guide",
    "description": "The models of the toolbox, how to read their output, and worked examples.",
    "source": "docs/guide/guide.tex"
  }
]
```

`source` is the main `.tex` file, relative to the toolbox folder; its name is letters, digits, `-` and `_`. The document's other `.tex` files and its `.bib` files go in the same folder, and its images (`.png`, `.jpg`) in a `resources/` folder beside them. Write the sources for XeTeX: `fontspec` rather than `inputenc`, and no shell escape.
- `dist` holds what Pollis downloads: `toolboxes.json`, the index, and for each toolbox its `.vsix` and README. It is generated, one commit with no history, by `.github/workflows/publish.yml` on every push to `main`.
- `scripts/` holds the packaging script, `packageToolboxes.ts`, and the check that runs on every pull request, `checkToolboxes.ts` (`.github/workflows/check.yml`).

## For developers

Pollis' build tools read the sources from a `toolboxes/` folder at the root of the Pollis checkout, which is a clone of this repository (ignored by Pollis' git):

```sh
cd <pollis> && git clone https://github.com/Trumpingtons/pollis-toolboxes.git toolboxes
```

`node build/pollis/packageToolboxes.ts` in Pollis runs `scripts/packageToolboxes.ts` and writes the files of `dist` to `.build/toolboxes/`, to try them locally. To publish, push to `main`: the packages are built and `dist` is replaced automatically.

## License

AGPL-3.0, see [LICENSE.txt](LICENSE.txt).
