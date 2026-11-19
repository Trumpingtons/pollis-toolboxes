# Overview

## What a Shift-Share Design Is

A shift-share design measures each area's exposure to a set of common shocks by its shares in them: the regressor, or the instrument, is the sum over the shocks of the area's share in each shock times the shock. Borusyak, Hull and Jaravel (2022) describe these shift-share, or Bartik, instruments as averaging a set of shocks with exposure shares as weights ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). Goldsmith-Pinkham, Sorkin and Swift (2020) describe the instrument as formed by interacting local industry shares and national industry growth rates ([Goldsmith-Pinkham, Sorkin and Swift (2020)](#ref-GSS2020a)). Autor, Dorn and Hanson (2013) use such a design to relate the growth of imports from China in US local labour markets to changes in their manufacturing employment, through the industries in which each market was specialised ([Autor, Dorn and Hanson (2013)](#ref-ADH2013a)).

## The Regression Across the Shocks

Borusyak, Hull and Jaravel (2022) show that the coefficient of a shift-share regression across the areas can be obtained from an equivalent regression across the shocks, which motivates conditions for consistency at the level of the shocks ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). In that regression each shock is one observation: the outcome and the endogenous variable, after the controls, are averaged over the areas weighted by their shares in the shock, and those averages are regressed on each other with the shock as the instrument, each shock weighted by its mean share. `fit_shock_level` of SpatialEconometrics.jl estimates this regression and returns its standard error and its interval with the null imposed ([Randsley (2026)](#ref-Ran2026a)). The Shift-Share Designs panel estimates every tab this way.

## The Two Tabs of the Shift-Share Designs Panel

| Tab | Regression | Coefficient |
|---|---|---|
| Shift-Share IV | The outcome on the Endogenous Variable, instrumented by the shift-share regressor | The effect of the endogenous change |
| Reduced Form | The outcome on the shift-share regressor | The effect of the exposure to the shocks |

Both tabs build the design with `shift_share_design(S, g; controls, weights, shock_names)` and estimate it with `fit_shock_level`, with an indicator of each period after the first as the controls of the shocks ([Randsley (2026)](#ref-Ran2026a)). Both print the estimate, its standard error, its interval with the null imposed and the effective number of shocks; Shift-Share IV adds the first-stage F across the shocks.

## How the Shift-Share Designs Panel Reads Its Files

The Shift-Share Designs panel reads four files: an areas file of polygons, a changes file with one row per area and period, a shares file with one row per area, period and shock, and a shocks file with one row per shock and period. DuckDB joins them by the Area Column, the Period Column and the Shock Column, through DuckDB.jl ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)), and its spatial extension reads the polygons and finds the neighbours of the map ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The columns come back to Julia through Tables.jl ([Quinn (2023)](#ref-Qui2023c)). A share missing from the shares file is a share of 0.

## Words of the Shift-Share Designs Panel and of the Papers

| Panel | Borusyak, Hull and Jaravel (2022) | Goldsmith-Pinkham, Sorkin and Swift (2020) |
|---|---|---|
| Area | Location, region | Location |
| Shock | Shock, industry | Industry growth rate |
| Share | Exposure share | Industry share |
| Shift-share regressor | Shift-share instrument | Bartik instrument |
| Mean share | Average exposure | Not named |
| Regression across the shocks | Shock-level regression | Not used |

The papers are those of the panel's references ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a); [Goldsmith-Pinkham, Sorkin and Swift (2020)](#ref-GSS2020a)).

## References

<a id="ref-ADH2013a"></a>Autor, D. H., Dorn, D. and Hanson, G. H. (2013). The China syndrome: local labor market effects of import competition in the United States. *American Economic Review*, 103(6), 2121–2168. [doi:10.1257/aer.103.6.2121](https://doi.org/10.1257/aer.103.6.2121)

<a id="ref-BHJ2022a"></a>Borusyak, K., Hull, P. and Jaravel, X. (2022). Quasi-experimental shift-share research designs. *Review of Economic Studies*, 89(1), 181–213. [doi:10.1093/restud/rdab030](https://doi.org/10.1093/restud/rdab030)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GSS2020a"></a>Goldsmith-Pinkham, P., Sorkin, I. and Swift, H. (2020). Bartik instruments: what, when, why, and how. *American Economic Review*, 110(8), 2586–2624. [doi:10.1257/aer.20181047](https://doi.org/10.1257/aer.20181047)

<a id="ref-Qui2023c"></a>Quinn, J. (2023). Tables.jl: an interface for tables in Julia. [github.com/JuliaData/Tables.jl](https://github.com/JuliaData/Tables.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Factsheet](factsheet.md) · [Shares, Shocks and Identification](identification.md) · [Inference Across the Shocks](inference.md)
