# Overview

## What a Spatial Interaction Model Is

A spatial interaction model explains the flows between places, such as migrants, commuters, shoppers or goods, by what each origin sends, what each destination attracts and the distance between them. Wilson (1971) sets out a family of such models, derived from the flows that are most probable given what is known about the totals leaving each origin and arriving at each destination ([Wilson (1971)](#ref-Wil1971a)). The gravity model is the member with no totals known: the flows grow with the size of the origin and of the destination and fall with distance. The Spatial Interaction Models panel fits the four members of Wilson's family, one per tab, and a negative binomial version of the doubly constrained model.

## Why the Panel Fits Flows as a Poisson Regression

Flowerdew and Aitkin (1982) fit the gravity model by treating each flow as a Poisson count whose mean is the model's prediction, in place of least squares on the logarithm of the flows ([Flowerdew and Aitkin (1982)](#ref-FA1982a)). The flows are counts, flows of zero are kept, and the predicted flows add up to the observed ones over the origins and destinations whose effects the model contains. Santos Silva and Tenreyro (2006) show that least squares on the log-linearised gravity equation gives inconsistent estimates when the errors are heteroskedastic, and propose the Poisson pseudo-maximum-likelihood estimator, which needs only the mean of the flows to be specified correctly ([Santos Silva and Tenreyro (2006)](#ref-SST2006a)). Oshan (2016) describes PySAL's spint, which fits Wilson's models as Poisson regressions ([Oshan (2016)](#ref-Osh2016a)).

## Wilson's Family in the Tabs of the Panel

| Tab | Totals reproduced | Effects in the regression |
|---|---|---|
| Unconstrained | None | One shared by every flow, the intercept |
| Production | The outflow of each origin | One per origin |
| Attraction | The inflow of each destination | One per destination |
| Doubly Constrained | Both | One per origin and one per destination |
| Negative Binomial | Both, with a variance that grows faster than the mean | One per origin and one per destination |

Wilson (1971) obtains the constrained models with balancing factors that make the predicted flows add up to the known totals ([Wilson (1971)](#ref-Wil1971a)). In a Poisson regression with a log link, the origin and destination effects play the part of those factors.

## How the Spatial Interaction Models Panel Estimates

The four Poisson tabs call `nlreg` of GLFixedEffectModels.jl, with the origin and destination effects as `fe(:origin)` and `fe(:destination)`, absorbed rather than estimated one by one ([Boehm (2020)](#ref-Boe2020a)). Correia, Guimarães and Zylkin (2020) describe this approach to Poisson estimation with many fixed effects and the separation problems it can meet ([Correia, Guimarães and Zylkin (2020)](#ref-CGZ2020a)). The Negative Binomial tab calls `fit_gravity(NegBinGravity(), ...)` of SpatialEconometrics.jl, with `BilateralFE()` for the origin and destination effects ([Randsley (2026)](#ref-Ran2026a)). The Standard Errors input chooses among the model-based standard errors, robust ones and ones clustered by origin for the Poisson tabs; the Negative Binomial tab gives robust standard errors.

## How the Panel Reads Its Files

The Spatial Interaction Models panel reads an areas file of polygons, one per place, and a flows file with one row per origin and destination. DuckDB joins them by the Area Column, the Origin Column and the Destination Column, through DuckDB.jl ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)), and its spatial extension reads the polygons, finds their centroids and moves them into the Distance Coordinate System ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). With the Distance Column empty, the distance between two places is that between their centroids, in kilometres. Flows whose origin or destination has no polygon are left out. The columns come back to Julia through Tables.jl ([Quinn (2023)](#ref-Qui2023c)), and the charts are drawn with ECharts.jl ([Zwitch (2026)](#ref-Zwi2026a)).

## Words of the Panel and of the Papers

| Panel | Wilson (1971) | Anderson and van Wincoop (2003) |
|---|---|---|
| Flow | Interaction, trips | Trade flow, exports |
| Origin and destination effects | Balancing factors | Multilateral resistance terms |
| Distance | Cost of travel | Trade costs |
| Production, Attraction | Production- and attraction-constrained | Not used |

The words are those of the panel's references ([Wilson (1971)](#ref-Wil1971a); [Anderson and van Wincoop (2003)](#ref-AW2003a)).

## References

<a id="ref-AW2003a"></a>Anderson, J. E. and van Wincoop, E. (2003). Gravity with gravitas: a solution to the border puzzle. *American Economic Review*, 93(1), 170–192. [doi:10.1257/000282803321455214](https://doi.org/10.1257/000282803321455214)

<a id="ref-Boe2020a"></a>Boehm, J. (2020). GLFixedEffectModels.jl: fast estimation of generalized linear models with high-dimensional fixed effects in Julia. [github.com/jmboehm/GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl)

<a id="ref-CGZ2020a"></a>Correia, S., Guimarães, P. and Zylkin, T. (2020). Fast Poisson estimation with high-dimensional fixed effects. *The Stata Journal*, 20(1), 95–115. [doi:10.1177/1536867X20909691](https://doi.org/10.1177/1536867X20909691)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-FA1982a"></a>Flowerdew, R. and Aitkin, M. (1982). A method of fitting the gravity model based on the Poisson distribution. *Journal of Regional Science*, 22(2), 191–202. [doi:10.1111/j.1467-9787.1982.tb00744.x](https://doi.org/10.1111/j.1467-9787.1982.tb00744.x)

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

<a id="ref-Qui2023c"></a>Quinn, J. (2023). Tables.jl: an interface for tables in Julia. [github.com/JuliaData/Tables.jl](https://github.com/JuliaData/Tables.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-SST2006a"></a>Santos Silva, J. M. C. and Tenreyro, S. (2006). The log of gravity. *The Review of Economics and Statistics*, 88(4), 641–658. [doi:10.1162/rest.88.4.641](https://doi.org/10.1162/rest.88.4.641)

<a id="ref-Wil1971a"></a>Wilson, A. G. (1971). A family of spatial interaction models, and associated developments. *Environment and Planning A*, 3(1), 1–32. [doi:10.1068/a030001](https://doi.org/10.1068/a030001)

<a id="ref-Zwi2026a"></a>Zwitch, R. (2026). ECharts.jl: Julia package for the Apache ECharts v6 visualization library. [github.com/randyzwitch/ECharts.jl](https://github.com/randyzwitch/ECharts.jl)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Distance Decay](distance-decay.md)
