# Factsheet

## The Spatial Panel Data Panel at a Glance

| Tab | Parameters printed | Further output |
|---|---|---|
| SAR, Fixed Effects | The explanatory variables' coefficients and rho, with standard errors and z-values | The fixed effects, the estimation approach, the error variance and the log-likelihood |
| SEM, Fixed Effects | The explanatory variables' coefficients and lambda | The fixed effects, the number of effective observations, the error variance and the log-likelihood |
| SDM, Fixed Effects | The coefficients, those of the spatially lagged explanatory variables, named W_, and rho | As on SAR, Fixed Effects |
| Dynamic Panel | y_lag and Wy_lag, the coefficients, on SDM the W_ terms, and rho | gamma, eta and rho before and after the bias correction, and the spectral radius of the implied system |

Without fixed effects the static tabs add an intercept; with fixed effects of the areas the dynamic tab has none ([Randsley (2026)](#ref-Ran2026a)).

## Inputs of the Spatial Panel Data Panel

| Input | What it sets |
|---|---|
| Folder, Areas File | The polygons of the areas, read by DuckDB's spatial extension |
| Panel File | One row per area and period, a CSV or Parquet file |
| Area Column, Period Column | The columns that name each area, in both files, and each period |
| Dependent Variable, Explanatory Variables | The columns of the model, from the panel file |
| File Coordinate System | The EPSG code of the areas file's coordinates |
| Neighbours, k | Queen or rook contiguity, or the k nearest centroids, the same in every period |
| Fixed Effects | Areas and Periods, Areas, Periods or None |
| Estimation | Lee and Yu Transformation or Direct QML, on SAR and SDM |
| Spatial Model | SAR or SDM, on Dynamic Panel |
| Break After | The last period before the break, for the Structural Break step |

Only areas with a polygon and every value in every period enter the model, so that the panel is balanced ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Next Steps of the Spatial Panel Data Panel

| Group | Steps |
|---|---|
| Visualise | Moran's I Period by Period; Map of the Residual Size per Area; Map of the Area Effects |
| Diagnose | Panel LM Tests; Driscoll–Kraay Standard Errors; Structural Break |
| Compare | Fixed-Effect Specifications; SAR, SEM and SDM; Lee and Yu Against Direct QML; Static Against Dynamic |
| Interpret | Direct, Indirect and Total Effects |
| Replicate | Munnell's Production Function |

Driscoll–Kraay Standard Errors, Static Against Dynamic and Direct, Indirect and Total Effects are not offered on SEM, Fixed Effects; SAR, SEM and SDM not on Dynamic Panel; Lee and Yu Against Direct QML only on SAR and SDM; Munnell's Production Function only on SEM, Fixed Effects.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md)
