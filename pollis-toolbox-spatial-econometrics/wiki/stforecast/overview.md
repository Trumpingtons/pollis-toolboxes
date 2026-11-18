# Overview

## What Spatio-Temporal Forecasting Does

Spatio-temporal forecasting predicts the values of a variable observed for the same areas, such as regions, municipalities or grid cells, over many periods, when each area's value depends on its own past and on that of its neighbours. Pfeifer and Deutsch (1980) note that models of this kind fall into the general class of space-time autoregressive integrated moving average (STARIMA) models, with autoregressive and moving average terms lagged in both time and space, and that the class collapses into that of ARIMA models in the absence of spatial correlation ([Pfeifer and Deutsch (1980)](#ref-PD1980a)). The Spatio-Temporal Forecasting panel fits its models with SpatialEconometrics.jl, which takes each variable stacked period by period, the areas varying fastest within each period, and the weights of the areas as one matrix for all periods ([Randsley (2026)](#ref-Ran2026a)).

## The Space-Time Autoregression

The space-time autoregression (STAR) explains each area's value by its own values in the last periods and by those of its neighbours, ring by ring, in the same past periods. `fit_star` of SpatialEconometrics.jl dates every spatial term before the period it explains, so the model has no simultaneity and is estimated by least squares; its documentation notes that this buys any number of spatial and temporal lags at the cost of ruling out spatial feedback within a period. Pfeifer and Deutsch define the rings as the neighbours of each order, the areas exactly that many steps away; `fit_star` takes powers of the weights by default and the order-k neighbours on request, the two being the same with one spatial lag ([Randsley (2026)](#ref-Ran2026a); [Pfeifer and Deutsch (1980)](#ref-PD1980a)).

## The Spatial Vector Autoregression

A spatial vector autoregression models several variables together over a group of connected areas. Di Giacinto (2010) adapts the recursive identification scheme of time-series VAR models to a space-time setting, estimates the parameters by full information maximum likelihood, and introduces the space-time impulse response function (STIR), which portrays average effects as a function of displacement in time and space ([Di Giacinto (2010)](#ref-Gia2010a)). `fit_spvar` of SpatialEconometrics.jl fits the version with coefficients common to all areas and error variances of each area's own, and requires the causal ordering of the variables, the identifying assumption, as an argument with no default. Its documentation states that inference holds as the periods grow with the areas fixed, unlike the package's other panel estimators ([Randsley (2026)](#ref-Ran2026a)).

## Panel AR, the Benchmark Without Space

The Panel AR tab forecasts each area from its own past alone, with the coefficients common to all areas. It is the space-time autoregression with no spatial lag: the documentation of `fit_star` notes that with no spatial lags the model nests a non-spatial panel autoregression ([Randsley (2026)](#ref-Ran2026a)). Fitted to the same periods as STAR and Spatial VAR and scored on the same periods held back, Panel AR shows what the neighbours add to the forecasts. The Forecast Accuracy by Horizon step sets the three models beside each area's last value, the simplest forecast, and the Spatial Interaction Test step tests whether the neighbours' coefficients are zero on the periods fitted.

## The Three Tabs of the Spatio-Temporal Forecasting Panel

| Tab | Model | Function of SpatialEconometrics.jl | Forecasts by |
|---|---|---|---|
| STAR | Space-time autoregression, one variable | `fit_star` | `spatial_forecast` |
| Spatial VAR | Spatial vector autoregression, several variables in a causal order | `fit_spvar` | `spvar_forecast` |
| Panel AR | Panel autoregression, each area's own past | `fit_star` with no spatial lag | `spatial_forecast` |

Each tab fits its model to the periods before those held back, forecasts the following periods, each from the forecasts of the periods before it, and scores the forecasts against the values held back. All three read the areas and the panel through DuckDB, keep the areas observed in every period, and take the neighbours from the areas' boundaries or centroids with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-Gia2010a"></a>Di Giacinto, V. (2010). On vector autoregressive modeling in space and time. *Journal of Geographical Systems*, 12(2), 125–154. [doi:10.1007/s10109-010-0116-6](https://doi.org/10.1007/s10109-010-0116-6)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-PD1980a"></a>Pfeifer, P. E. and Deutsch, S. J. (1980). A three-stage iterative procedure for space-time modeling. *Technometrics*, 22(1), 35–47. [doi:10.2307/1268381](https://doi.org/10.2307/1268381)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md) · [Forecasting in Space and Time](forecasting.md)
