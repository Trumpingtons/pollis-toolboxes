# Overview

## What the Spatial Causal Inference Panel Estimates

The Spatial Causal Inference panel estimates the effect of a policy on the areas under it, and on areas the policy does not cover but that sit near them. It has two tabs. Spatial DiD compares the change in the areas under the policy with the change in comparison areas, with the share of each area's neighbours under the policy as a further column, following Delgado and Florax (2015) ([Delgado and Florax (2015)](#ref-DF2015a)). Synthetic Control builds each area under the policy a counterfactual from a weighted mean of areas outside it, as Abadie, Diamond and Hainmueller (2010) propose ([Abadie, Diamond and Hainmueller (2010)](#ref-ADH2010a)). Both run on SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)).

## Why Spillovers Matter for a Policy Evaluation

A policy that changes traffic, prices or jobs in one area can change them in the areas around it. The documentation of `fit_spatial_did` states that a difference-in-differences regression without a column for the neighbours does not make the spillover zero: it pushes the spillover into the error, where it is correlated with the policy, and into the comparison group, which then holds areas the policy reaches ([Randsley (2026)](#ref-Ran2026a)). Delgado and Florax (2015) show that under the usual assumptions of difference-in-differences, a regression with the neighbours' policy status identifies both the direct effect and the effect on the neighbours ([Delgado and Florax (2015)](#ref-DF2015a)). The documentation of `fit_synthetic_control` makes the same point for synthetic controls: neighbours reached by the spillover track an area under the policy closely before it, and as comparison areas they carry the spillover into the counterfactual ([Randsley (2026)](#ref-Ran2026a)).

## Words of the Spatial Causal Inference Panel and of the Papers

The panel uses plain words where the papers it cites use the words of clinical trials.

| Panel | Papers |
|---|---|
| Area under the policy | Treated unit |
| Comparison area | Control unit; in synthetic control, donor |
| Comparison Areas input | Donor pool |
| Policy Column | Treatment indicator |
| Permutation Test | Placebo test |
| Share of neighbours under the policy | Exposure, WD |

The function names of SpatialEconometrics.jl keep the papers' words: `treated`, `donors`, `donor_pool` and `placebo_test` ([Randsley (2026)](#ref-Ran2026a)).

## Data the Spatial Causal Inference Panel Reads

The panel reads an areas file of polygons and a panel file with one row per area and period, joined by the Area Column, through DuckDB and its spatial extension ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The Policy Column is 1 in the periods an area is under the policy and 0 otherwise. The neighbours, by queen or rook contiguity or the k nearest centroids, are found with SQL on the polygons. Areas missing a polygon or a value in some period are left out, so that every area kept has every period. Tables are read as columns with Tables.jl, and the charts are drawn with ECharts.jl ([Quinn (2023)](#ref-Qui2023c); [Zwitch (2026)](#ref-Zwi2026a)).

## Next Steps of the Spatial Causal Inference Panel

The Next Steps map the policy and the exposure, draw the outcome paths and the weights of the comparison areas, and check, before any outcome, whether the design can identify a spillover. They compare the regression with and without the share of neighbours under the policy, the standard errors, the pools of comparison areas, the penalties of Abadie and L'Hour (2021), and Spatial DiD with Synthetic Control ([Abadie and L'Hour (2021)](#ref-AL2021a)). The Interpret steps take the effect apart into direct and spillover effects, rank the gap of a synthetic control by a permutation test, and estimate the spillover onto the neighbours with synthetic controls of their own.

## References

<a id="ref-ADH2010a"></a>Abadie, A., Diamond, A. and Hainmueller, J. (2010). Synthetic control methods for comparative case studies: estimating the effect of California's tobacco control program. *Journal of the American Statistical Association*, 105(490), 493–505. [doi:10.1198/jasa.2009.ap08746](https://doi.org/10.1198/jasa.2009.ap08746)

<a id="ref-AL2021a"></a>Abadie, A. and L'Hour, J. (2021). A penalized synthetic control estimator for disaggregated data. *Journal of the American Statistical Association*, 116(536), 1817–1834. [doi:10.1080/01621459.2021.1971535](https://doi.org/10.1080/01621459.2021.1971535)

<a id="ref-DF2015a"></a>Delgado, M. S. and Florax, R. J. G. M. (2015). Difference-in-differences techniques for spatial data: local autocorrelation and spatial interaction. *Economics Letters*, 137, 123–126. [doi:10.1016/j.econlet.2015.10.035](https://doi.org/10.1016/j.econlet.2015.10.035)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Qui2023c"></a>Quinn, J. (2023). Tables.jl: an interface for tables in Julia. [github.com/JuliaData/Tables.jl](https://github.com/JuliaData/Tables.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-Zwi2026a"></a>Zwitch, R. (2026). ECharts.jl: Julia package for the Apache ECharts v6 visualization library. [github.com/randyzwitch/ECharts.jl](https://github.com/randyzwitch/ECharts.jl)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Spillovers and Exposure](spillovers.md)
