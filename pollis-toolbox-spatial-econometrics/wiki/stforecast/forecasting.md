# Forecasting in Space and Time

## How the Spatio-Temporal Forecasting Panel Makes Its Forecasts

The forecasts of the Spatio-Temporal Forecasting panel are made one period at a time from the end of the periods fitted. `spatial_forecast` of SpatialEconometrics.jl applies the fitted STAR recursion, using the values observed where they are available and the forecasts in their place thereafter; its documentation calls this a dynamic, not a static, forecast. The model does not keep the data it was fitted to, so the last L periods, as many as the temporal lags, are passed to it as the history to start from. `spvar_forecast` does the same for the spatial VAR from its reduced form, Di Giacinto's equation (12), and returns the forecasts in levels, adding back the means of the areas that `fit_spvar` removed ([Randsley (2026)](#ref-Ran2026a); [Di Giacinto (2010)](#ref-Gia2010a)).

## Forecasting With Explanatory Variables

On the STAR and Panel AR tabs, explanatory variables enter in the same period as the value they explain. `spatial_forecast` therefore needs their values in every period forecast, passed as a matrix with one row per area and period of the horizon ([Randsley (2026)](#ref-Ran2026a)). Within the periods held back those values are known, so the tabs can forecast them with the explanatory variables, and the Horizon cannot then pass the periods held back. After the end of the data they are not known, and the Forecast Beyond the Data step forecasts only without explanatory variables. `fit_spvar` takes no explanatory variables: the variables it forecasts explain one another, through their past and, following the causal ordering, within the period ([Randsley (2026)](#ref-Ran2026a)).

## Stationarity and Where the Forecasts Settle

Pfeifer and Deutsch (1980) state the stationarity of a space-time autoregression as a condition on the roots of a determinantal equation, all of which must lie inside the unit circle ([Pfeifer and Deutsch (1980)](#ref-PD1980a)). SpatialEconometrics.jl reports the same condition as the spectral radius of the companion matrix, the system rewritten with a single lag, which must be below one; the documentation of `fit_star` describes it as Pfeifer and Deutsch's determinantal condition checked in companion form. When the fitted system is not stationary, `spatial_forecast` and `spvar_forecast` warn and return diverging forecasts rather than failing, the documentation calling the divergence the honest answer for those parameters ([Randsley (2026)](#ref-Ran2026a)). The Stationarity step draws the roots against the unit circle.

## How a Shock Spreads in Space and Time

`space_time_irf` of SpatialEconometrics.jl traces a one-period shock through a fitted STAR: at each horizon, the effect on every area of a unit shock to every other. It summarises each horizon by the response of the area shocked, the diagonal, and the spillover to the others, everything else, averaged over the areas; added up over the horizons, the responses converge to the long-run multiplier when the model is stationary ([Randsley (2026)](#ref-Ran2026a)). For the spatial VAR, Di Giacinto (2010) introduces the space-time impulse response function, which portrays average effects as a function of displacement in time and space ([Di Giacinto (2010)](#ref-Gia2010a)). `space_time_stir` computes it outward, the effect on the rings of neighbours of a shock at an area, and inward, the effect at an area of shocks at its rings ([Randsley (2026)](#ref-Ran2026a)).

## Scoring Forecasts on the Periods Held Back

The Spatio-Temporal Forecasting panel scores its forecasts against the values of the periods held back from the fit, by the root mean squared error and the mean absolute error over the areas at each step ahead. Hyndman and Koehler (2006) compare measures of the accuracy of time series forecasts and find many of those used before inadequate, or degenerate in commonly occurring situations; they propose the mean absolute scaled error as the standard measure for comparing accuracy across multiple series ([Hyndman and Koehler (2006)](#ref-HK2006a)). The Forecast Accuracy by Horizon step scores every model on the same variable, the same areas and the same periods, and divides each RMSE by that of each area's last value carried forward.

## References

<a id="ref-Gia2010a"></a>Di Giacinto, V. (2010). On vector autoregressive modeling in space and time. *Journal of Geographical Systems*, 12(2), 125–154. [doi:10.1007/s10109-010-0116-6](https://doi.org/10.1007/s10109-010-0116-6)

<a id="ref-HK2006a"></a>Hyndman, R. J. and Koehler, A. B. (2006). Another look at measures of forecast accuracy. *International Journal of Forecasting*, 22(4), 679–688. [doi:10.1016/j.ijforecast.2006.03.001](https://doi.org/10.1016/j.ijforecast.2006.03.001)

<a id="ref-PD1980a"></a>Pfeifer, P. E. and Deutsch, S. J. (1980). A three-stage iterative procedure for space-time modeling. *Technometrics*, 22(1), 35–47. [doi:10.2307/1268381](https://doi.org/10.2307/1268381)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
