# Factsheet

## The Eigenvector Spatial Filtering Panel at a Glance

| Tab | What it fits | Function of SpatialEconometrics.jl |
|---|---|---|
| ESF, Moran Criterion | Eigenvectors added until the residuals' Moran coefficient is close to zero | `fit_esf` with `criterion = :moran` |
| ESF, AIC Criterion | Eigenvectors added while they reduce the AIC | `fit_esf` with `criterion = :aic` |
| ESF for Counts | A Poisson or negative binomial regression with a spatial filter | `fit_esf` with `family = :poisson` or `:negbin` |
| Random-Effects ESF | Every candidate eigenvector, its coefficient shrunk, the shrinkage by REML | `fit_re_esf` |

Every tab computes the candidate eigenvectors once with `spatial_eigenvectors`, and prints the coefficients of the explanatory variables with their standard errors and the residuals' Moran coefficient without and with the filter ([Randsley (2026)](#ref-Ran2026a)).

## Inputs of the Eigenvector Spatial Filtering Panel

| Input | What it sets |
|---|---|
| Folder, File | The file of areas, as polygons, read by DuckDB's spatial extension |
| Dependent Variable, Explanatory Variables | The columns of the model; every model adds an intercept |
| File Coordinate System | The EPSG code of the file's coordinates |
| Neighbours, k | Queen or rook contiguity, or the k nearest centroids |
| Candidate Screen | The share of the largest Moran coefficient a candidate eigenvector must reach |
| Maximum Eigenvectors | Where stepwise selection stops at the latest |
| Count Family | Poisson or negative binomial, on ESF for Counts |

The neighbours are found with SQL on the areas' boundaries or centroids ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Next Steps of the Eigenvector Spatial Filtering Panel

| Group | Steps |
|---|---|
| Visualise | Map of the Spatial Filter; Maps of the Selected Eigenvectors |
| Diagnose | Moran's I Before and After; The Eigenvectors Selected |
| Compare | Against Least Squares, SAR and SEM; Moran Against AIC Selection; Stepwise ESF Against RE-ESF |
| Interpret | How Much the Filter Explains; How the Coefficients Move |
| Replicate | Boston House Prices: spmoran |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Replications](replications.md)
