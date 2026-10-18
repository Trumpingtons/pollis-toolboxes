# Pollis Toolboxes

Toolboxes for [Pollis](https://github.com/saragga/pollis), the desktop environment for statistical modelling, simulation and optimisation built on Code - OSS and Julia.

A toolbox is a data-only extension that adds guided panels, with their wiki pages and notebook tutorials, to a Pollis menu. Pollis lists the published toolboxes in the **Toolboxes** section of the Extensions view and installs them from there.

| Toolbox | What it adds |
|---|---|
| [pollis-toolbox-econometrics](pollis-toolbox-econometrics/README.md) | Financial Econometrics, in the Model menu: ARIMAX, VAR/VECM, GARCH-type and regime switching models, forecasting, Bayesian asset-pricing factor models. |
| [pollis-toolbox-economics](pollis-toolbox-economics/README.md) | Economic Models, in the Simulate menu: business cycle filters, stochastic volatility, DSGE, heterogeneous-agent and continuous-time macro-finance models, and game theory. |
| [pollis-toolbox-learning-and-practice](pollis-toolbox-learning-and-practice/README.md) | Learning and Practice, in the Extend menu: multiple-choice exercises whose data and answers Julia computes, on descriptive statistics, hypothesis tests and linear regression, and a panel to write new ones. |
| [pollis-toolbox-mathematical-core](pollis-toolbox-mathematical-core/README.md) | Mathematical Core, in the Extend menu: symbolic math, linear algebra, nonlinear systems, numerical differentiation and integration, ODEs and PDEs. |

New toolboxes are welcome. A toolbox can be built with the Pollis Agents skills (**Compose > Pollis Agents** in Pollis, or the [pollis-plugins](https://github.com/Trumpingtons/pollis-plugins) marketplace); please open an issue before sending one.

## Layout

- `main` holds the sources: one folder per toolbox, `<name>/package.json` (the `pollisToolboxes` contribution), `panels/<id>.toml`, `wiki/<id>/` and `notebooks/<id>/`.
- `dist` holds what Pollis downloads: `toolboxes.json`, the index, and for each toolbox its `.vsix` and README. It is generated, one commit with no history.

## For developers

Pollis' build tools read the sources from a `toolboxes/` folder at the root of the Pollis checkout, which is a clone of this repository (ignored by Pollis' git):

```sh
cd <pollis> && git clone https://github.com/Trumpingtons/pollis-toolboxes.git toolboxes
```

`node build/pollis/packageToolboxes.ts` in Pollis then writes the files of `dist` to `.build/toolboxes/`; the steps to publish them are at the top of that script.

## License

AGPL-3.0-or-later, see [LICENSE.txt](LICENSE.txt).
