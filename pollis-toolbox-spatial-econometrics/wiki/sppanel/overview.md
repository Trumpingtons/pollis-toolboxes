# Overview

## What Spatial Panel Data Models Do

Spatial panel data models explain an outcome observed for the same areas, such as regions, municipalities or grid cells, over several periods, when the outcome of one area depends on those of its neighbours. Following each area over time lets the model control for characteristics of the area that do not change, which the explanatory variables may not measure, through fixed effects. Elhorst (2014) sets out the spatial panel models with fixed or random effects, their estimation by maximum likelihood, and their dynamic extensions ([Elhorst (2014)](#ref-Elh2014a)). The Spatial Panel Data panel fits them with SpatialEconometrics.jl, which takes the outcome and the explanatory variables stacked period by period, the areas varying fastest within each period, and the weights of the areas as one matrix for all periods ([Randsley (2026)](#ref-Ran2026a)).

## Spatial Lag, Spatial Error and Spatial Durbin Panels

The three static spatial panel models differ in where the dependence between neighbours enters ([Elhorst (2014)](#ref-Elh2014a)):

| Model | Dependence between neighbours | Parameter |
|---|---|---|
| Spatial lag (SAR) | An area's outcome depends on its neighbours' outcomes in the same period | rho |
| Spatial error (SEM) | The shocks of neighbouring areas are correlated | lambda |
| Spatial Durbin (SDM) | An area's outcome depends on its neighbours' outcomes and on their explanatory variables | rho, and a coefficient for each spatially lagged explanatory variable |

In the spatial lag and spatial Durbin models a change in one area reaches its neighbours' outcomes, so their coefficients are not the effects of the explanatory variables; the effects are read as direct, indirect and total effects ([Elhorst (2014)](#ref-Elh2014a)).

## Fixed Effects in a Spatial Panel

Fixed effects of the areas give each area a level of its own, constant over time; fixed effects of the periods give each period a level common to all areas; both can enter together. Lee and Yu (2010) show that estimating all the parameters, the fixed effects among them, runs into the incidental parameter problem: some estimators may be inconsistent or their distributions not properly centred. With fixed effects of the areas only, the direct approach does not estimate the error variance consistently unless the number of periods is large. They propose instead a transformation that removes the fixed effects and yields consistent estimators with properly centred distributions, for fixed effects of the areas and for both kinds together ([Lee and Yu (2010)](#ref-LY2010a)). `fit_spatial_panel` of SpatialEconometrics.jl uses that transformation by default, and offers the direct approach with an analytical bias correction ([Randsley (2026)](#ref-Ran2026a)).

## Dynamic Spatial Panels

A dynamic spatial panel adds the past to the spatial lag model: each area's outcome depends on its own outcome in the previous period, on its neighbours' outcomes in the previous period and on its neighbours' outcomes in the same period. `fit_dynamic_spatial_panel` of SpatialEconometrics.jl estimates the three parameters, gamma, eta and rho, by quasi-maximum likelihood with fixed effects, and corrects its bias analytically ([Randsley (2026)](#ref-Ran2026a)). Yu, de Jong and Lee (2008) derive the asymptotic properties of quasi-maximum likelihood estimators of such models with fixed effects, when both the number of areas and the number of periods are large, and propose that bias correction, which asymptotically eliminates the bias when the number of periods grows faster than the cube root of the number of areas ([Yu, de Jong and Lee (2008)](#ref-YJL2008a)).

## The Four Tabs of the Spatial Panel Data Panel

| Tab | Model | Function of SpatialEconometrics.jl |
|---|---|---|
| SAR, Fixed Effects | Spatial lag, by Lee and Yu's transformation or direct QML | `fit_spatial_panel(SAR(), ...)` |
| SEM, Fixed Effects | Spatial error, by maximum likelihood on the demeaned data | `fit_spatial_error(fe, ...)` |
| SDM, Fixed Effects | Spatial Durbin, by Lee and Yu's transformation or direct QML | `fit_spatial_panel(SDM(), ...)` |
| Dynamic Panel | Dynamic spatial lag or Durbin, bias-corrected QML | `fit_dynamic_spatial_panel` |

All four read the areas and the panel through DuckDB, keep the areas observed in every period, and take the neighbours from the areas' boundaries or centroids with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-LY2010a"></a>Lee, L.-f. and Yu, J. (2010). Estimation of spatial autoregressive panel data models with fixed effects. *Journal of Econometrics*, 154(2), 165–185. [doi:10.1016/j.jeconom.2009.08.001](https://doi.org/10.1016/j.jeconom.2009.08.001)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-YJL2008a"></a>Yu, J., de Jong, R. and Lee, L.-f. (2008). Quasi-maximum likelihood estimators for spatial dynamic panel data with fixed effects when both n and T are large. *Journal of Econometrics*, 146(1), 118–134. [doi:10.1016/j.jeconom.2008.08.002](https://doi.org/10.1016/j.jeconom.2008.08.002)

## See Also
- [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md) · [Fixed Effects in Spatial Panels](fixed-effects.md)
