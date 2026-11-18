# Factsheet

## The Geographically Weighted Regression Panel at a Glance

| Tab | Bandwidth | Function of SpatialEconometrics.jl |
|---|---|---|
| GWR, Fixed Bandwidth | A distance in metres, by AICc or as given | `fit_gwr` with `FixedBandwidth(h)` |
| GWR, Adaptive | A number of nearest areas, by AICc or as given | `fit_gwr` with `AdaptiveBandwidth(k)`, or none for AICc |
| Multiscale GWR | One number of nearest areas per coefficient, by AICc | `fit_mgwr` |

Every tab prints the bandwidth, the AICc, the R-squared, the effective number of parameters, and for each coefficient its global least-squares value beside the minimum, quartiles and maximum of its local values ([Randsley (2026)](#ref-Ran2026a)).

## Inputs of the Geographically Weighted Regression Panel

| Input | What it sets |
|---|---|
| Folder, File | The file of areas, as polygons, read by DuckDB's spatial extension |
| Dependent Variable, Explanatory Variables | The columns of the model; every local regression adds an intercept |
| File Coordinate System | The EPSG code of the file's coordinates |
| Distance Coordinate System | A projected EPSG code in metres, for the centroids and the distances |
| Kernel | Bisquare, Gaussian or Exponential |
| Bandwidth | AICc, or a number: metres on the fixed tab, nearest areas on the adaptive tab |
| Standardise Variables | Centres and scales the variables, so that MGWR bandwidths can be compared |

The areas are read, and their centroids found and projected, with SQL ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Next Steps of the Geographically Weighted Regression Panel

| Group | Steps |
|---|---|
| Visualise | Maps of the Local Coefficients, of the Local t-Values and of the Local R-squared |
| Diagnose | Moran's I of the residuals; local t-values against a multiple-testing critical value |
| Compare | Bandwidth Search by AICc; GWR against global least squares; GWR against MGWR |
| Interpret | A Monte Carlo test of whether a coefficient varies over the map |
| Replicate | GWR4 on the Georgia counties; Oshan, Li, Kang, Wolf and Fotheringham (2019) |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Replications](replications.md)
