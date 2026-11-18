# Factsheet

## The Spatio-Temporal Forecasting Panel at a Glance

| Tab | Parameters printed | Further output |
|---|---|---|
| STAR | The coefficients of y(t-l), the area's own value l periods before, and of W^k y(t-l), its neighbours' up to the k-th ring, then the explanatory variables and the intercept, with standard errors and t-values | The periods fitted, the area means, the error variance, the log-likelihood and the spectral radius |
| Spatial VAR | One table per variable, in causal order: the neighbours' values in the same period, the variables before it in the same period, and the lags of all the variables, with standard errors and z-values | The mean error variance of each equation, the causal ordering, the log-likelihood and the spectral radius |
| Panel AR | The coefficients of y(t-l), then the explanatory variables and the intercept | As on STAR |

The standard errors of STAR and Panel AR are those of least squares; those of Spatial VAR come from the numerical Hessian of each equation's likelihood ([Randsley (2026)](#ref-Ran2026a)).

## Forecasts and Scores of the Spatio-Temporal Forecasting Panel

| Output | What it is |
|---|---|
| Periods fitted | The periods before the Periods Held Back; the first L periods only supply the lags |
| Forecasts | The Horizon of periods after the last period fitted, each forecast from the forecasts of the periods before it |
| Area means | On STAR and Panel AR, removed before the fit and added back to the forecasts with Area Means set to Remove; always removed on Spatial VAR |
| Scores | RMSE and MAE over the areas at each step, against the values held back |

`spatial_forecast` and `spvar_forecast` of SpatialEconometrics.jl take the last L periods as the history to forecast from and warn when the fitted system is not stationary ([Randsley (2026)](#ref-Ran2026a)).

## Inputs of the Spatio-Temporal Forecasting Panel

| Input | What it sets |
|---|---|
| Folder, Areas File | The polygons of the areas, read by DuckDB's spatial extension |
| Panel File | One row per area and period, a CSV or Parquet file |
| Area Column, Period Column | The columns that name each area, in both files, and each period |
| Variable to Forecast, Explanatory Variables | The column forecast on STAR and Panel AR, and the columns of the same period beside it |
| Variables | The columns forecast together on Spatial VAR, in causal order |
| File Coordinate System | The EPSG code of the areas file's coordinates |
| Neighbours, k | Queen or rook contiguity, or the k nearest centroids, the same in every period |
| Spatial Lags, Temporal Lags | The rings of neighbours and the past periods in the model |
| Spatial Weights | Powers of W or order-k neighbours, on STAR |
| Area Means | Remove or Keep, on STAR and Panel AR |
| Periods Held Back, Horizon | The periods left out of the fit, and the periods forecast |
| Step to Map, Areas to Show | For the Map of the Forecasts and the Forecast Paths |

Only areas with a polygon and every value in every period enter the model ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Next Steps of the Spatio-Temporal Forecasting Panel

| Group | Steps |
|---|---|
| Visualise | Map of the Forecasts; Forecast Paths |
| Diagnose | Moran's I of the Residuals; Stationarity; Pesaran's CD Test |
| Predict | Forecast Beyond the Data |
| Compare | Forecast Accuracy by Horizon; Powers Against Orders of W; Lag Orders |
| Interpret | Space-Time Impulse Responses; Spatial Interaction Test |

Powers Against Orders of W is offered only on STAR, and Lag Orders only on STAR and Panel AR. Forecast Beyond the Data saves every area's forecasts beside the panel file.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md)
