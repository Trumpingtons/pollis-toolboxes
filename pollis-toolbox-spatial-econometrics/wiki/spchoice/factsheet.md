# Factsheet

## The Spatial Discrete Choice Panel at a Glance

| Tab | What it fits | Function of SpatialEconometrics.jl |
|---|---|---|
| Probit, GMM | A spatial lag probit by linearised GMM, with spatial lags of the explanatory variables as instruments | `fit_spatial_probit` |
| Probit, Bayesian | The same model by Gibbs sampling, the latent propensities drawn as parameters | `fit_bayesian_spatial_probit` |
| Ordered Probit | A spatial lag model for ordered categories by Gibbs sampling, with cut points in place of an intercept | `fit_spatial_ordered_probit` |
| Logit With a Filter | A logistic regression with Moran eigenvectors selected by the Moran coefficient of its Pearson residuals | `fit_esf` with `family = :logit` |

The probit tabs print the coefficients and rho with their standard errors, or posterior means, standard deviations and 95% intervals; the binary tabs also print the hit rate ([Randsley (2026)](#ref-Ran2026a)).

## Inputs of the Spatial Discrete Choice Panel

| Input | What it sets |
|---|---|
| Folder, File | The file of areas, as polygons, read by DuckDB's spatial extension |
| Dependent Variable | The choice, coded 0 and 1, or on Ordered Probit the categories coded 1, 2, ... |
| Explanatory Variables | The columns of the model; the binary models add an intercept, Ordered Probit does not |
| File Coordinate System | The EPSG code of the file's coordinates |
| Neighbours, k | Queen or rook contiguity, or the k nearest centroids |
| Instrument Lags | The spatial lags of the explanatory variables used as instruments, on Probit, GMM |
| Draws, Burn-in | The draws kept and discarded by the Gibbs sampler, on the Bayesian tabs |
| Candidate Screen, Maximum Eigenvectors | The candidate eigenvectors and where selection stops, on Logit With a Filter |

The neighbours are found with SQL on the areas' boundaries or centroids ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Next Steps of the Spatial Discrete Choice Panel

| Group | Steps |
|---|---|
| Visualise | Map of the Fitted Probabilities; Trace and Density of ρ |
| Diagnose | Hit Rate and Confusion Table; Chain Diagnostics; Moran's I of the Residuals |
| Compare | GMM Against Gibbs; Spatial Probit Against Probit; Lag Probit Against a Filter |
| Interpret | Direct, Indirect and Total Effects |
| Replicate | New Orleans After Katrina |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md)
