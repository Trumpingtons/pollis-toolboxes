# Pollis Toolboxes

Toolboxes for [Pollis](https://github.com/saragga/pollis), the desktop environment for statistical modelling, simulation and optimisation built on Code - OSS and Julia.

A toolbox is a data-only extension that adds guided panels, with their wiki pages and notebook tutorials, to a Pollis menu. Pollis lists the published toolboxes in the **Toolboxes** section of the Extensions view and installs them from there.

| Toolbox | What it adds |
|---|---|
| [pollis-toolbox-chocolate-chain](pollis-toolbox-chocolate-chain/README.md) | Grow a Chocolate Chain, in Compose > Simulation Games > Host a Game...: rival teams each run a chocolate brand for five years, on a Julia model the class opens afterwards. |
| [pollis-toolbox-merge-or-be-bought](pollis-toolbox-merge-or-be-bought/README.md) | Merge or Be Bought, in Compose > Simulation Games > Host a Game...: three listed bicycle makers bid for each other's shares for six quarters, on a Julia model the class opens afterwards. |
| [pollis-toolbox-save-the-company](pollis-toolbox-save-the-company/README.md) | Save the Company, in Compose > Simulation Games > Host a Game...: the shareholders, banks and bondholders of a British retailer that cannot pay its debts negotiate a plan before its cash runs out, on a Julia model the class opens afterwards. |
| [pollis-toolbox-trading-floor](pollis-toolbox-trading-floor/README.md) | Trading Floor, in Compose > Simulation Games > Host a Game...: trading desks buy and sell one company's shares on a live order book, period by period by the clock, on a Julia model the class opens afterwards. |
| [pollis-toolbox-a-vineyard-for-the-portfolio](pollis-toolbox-a-vineyard-for-the-portfolio/README.md) | A Vineyard for the Portfolio, in Compose > Simulation Games > Host a Game...: a British drinks group negotiates to buy one of three wineries, in Chile, Italy and Australia, then every winery is run for three years, on a Julia model the class opens afterwards. |
| [pollis-toolbox-finance](pollis-toolbox-finance/README.md) | Finance, in the Model menu: ARIMAX, GARCH-type, stochastic volatility and regime switching models, Bayesian asset-pricing factor models. |
| [pollis-toolbox-time-series-forecasting](pollis-toolbox-time-series-forecasting/README.md) | Time-Series Forecasting, in the Extend menu: BATS and TBATS, the Theta method and intermittent demand, neural network forecasting, and automatic forecasting with a race between models. |
| [pollis-toolbox-economics](pollis-toolbox-economics/README.md) | Economic Models, in the Simulate menu: business cycle filters, stochastic volatility, DSGE, VAR/VECM, heterogeneous-agent and continuous-time macro-finance models, and game theory. |
| [pollis-toolbox-learning-and-practice](pollis-toolbox-learning-and-practice/README.md) | Self-Study: Learn and Practise, in the Extend menu. Turn your slides, notes and PDFs into what helps you study: more problems with their solutions, a topic explained in depth, a summary of a paper, prose and audio from slides, or slides from a long text. For students, and for teachers preparing their classes. |
| [pollis-toolbox-mathematical-core](pollis-toolbox-mathematical-core/README.md) | Core Mathematics, in the Extend menu: symbolic math, linear algebra, nonlinear systems, automatic and numerical differentiation, numerical integration, ODEs and PDEs. |
| [pollis-toolbox-smart-regions](pollis-toolbox-smart-regions/README.md) | Smart Regions, in the Extend menu: geospatial vector files read through DuckDB's spatial extension and OpenStreetMap base maps, for municipalities and regional authorities. |
| [pollis-toolbox-spatial-econometrics](pollis-toolbox-spatial-econometrics/README.md) | Spatial Econometrics, in the Extend menu: regression models for data on areas whose outcomes depend on their neighbours, starting with the spatial lag, spatial error, SLX and spatial Durbin models, each checked against R and a published article, with Moran's I and Local Moran (LISA), and kriging of values measured at stations. |
| [pollis-toolbox-geoprocessing](pollis-toolbox-geoprocessing/README.md) | Geoprocessing, in the Extend menu: map algebra on rasters, with local, focal and zonal operations, resampling and rasterizing, and the slope, aspect, hillshade, curvature, relief indices, upslope area and wetness of an elevation model, each replicated with R. |
| [pollis-toolbox-historical-geography-and-archaeology](pollis-toolbox-historical-geography-and-archaeology/README.md) | Historical Geography, in the Extend menu: the past on the map: the borders of states over the centuries on a map with a year slider, for historians, archaeologists, heritage officers, and the municipalities and regions with history attached. |
| [pollis-toolbox-archaeology](pollis-toolbox-archaeology/README.md) | Archaeology, in the Extend menu: archaeological prospection in lidar terrain models, with relief images, candidate earthworks and the trained models of ADAF, sites found in satellite images, and the ancient places of Pleiades and the Ancient Near East, for archaeologists, heritage officers and museums. |

New toolboxes are welcome, as pull requests: see [CONTRIBUTING.md](CONTRIBUTING.md). A toolbox can be built with the Pollis Agents skills (**Compose > Pollis Agents** in Pollis, or the [pollis-plugins](https://github.com/Trumpingtons/pollis-plugins) marketplace), which can also open the pull request.

## Layout

- `main` holds the sources: one folder per toolbox, `<name>/package.json` (the `pollisToolboxes` contribution), `panels/<id>.toml`, `wiki/<id>/`, `notebooks/<id>/` and, optionally, `docs/<document>/`, the LaTeX sources of the toolbox's documentation (see below).
- A toolbox folder with a `DEFERRED.md` stays on `main` but is not published: the packaging leaves it out until the file is deleted.
- `dist` holds what Pollis downloads: `toolboxes.json`, the index, and for each toolbox its `.vsix`, README and icon. It is generated, one commit with no history, by `.github/workflows/publish.yml` on every push to `main`.
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

## Simulation Games cases

A toolbox can bring cases for **Compose > Simulation Games > Host a Game...** in Pollis: games that teams play in rounds, in a session the facilitator hosts, on a Julia model run on the facilitator's computer. A toolbox of cases alone has no panels. Each toolbox entry of `pollisToolboxes` lists its cases:

```json
"panels": [],
"games": [
  {
    "folder": "games/chocolate-chain"
  }
]
```

`folder` is the case's folder, relative to the toolbox folder: its `case.toml` (the rounds, teams, decisions, results, briefings, roles, news and the model's parameters) and `model.jl` (the functions `initial` and `play`), with the Markdown files `case.toml` names. Julia files go only in a case's folder. [pollis-toolbox-chocolate-chain](pollis-toolbox-chocolate-chain/README.md) is the example to start from.

## For developers

Pollis' build tools read the sources from a `toolboxes/` folder at the root of the Pollis checkout, which is a clone of this repository (ignored by Pollis' git):

```sh
cd <pollis> && git clone https://github.com/Trumpingtons/pollis-toolboxes.git toolboxes
```

`node build/pollis/packageToolboxes.ts` in Pollis runs `scripts/packageToolboxes.ts` and writes the files of `dist` to `.build/toolboxes/`, to try them locally. To publish, push to `main`: the packages are built and `dist` is replaced automatically.

## License

AGPL-3.0, see [LICENSE.txt](LICENSE.txt).
