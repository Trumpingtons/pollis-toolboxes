# Advanced Time-Series Forecasting — Assumptions

Each tab of Advanced Time-Series Forecasting rests on its own picture of how the series was generated. A forecast is only as good as the match between that picture and the data.

## What BATS and TBATS Assume About a Series

BATS and TBATS assume that the series, after a Box-Cox transformation, is a sum of a level, an optional damped trend, seasonal cycles and ARMA errors. The seasonal periods must be known in advance and stay fixed, so a cycle that drifts in length is modelled poorly. The Box-Cox transformation needs positive values. Durbyn.jl searches its parameter between `bc_lower = 0` and `bc_upper = 1`, from a logarithm to no transformation.

## Why BATS and TBATS Handle Seasonality Differently

BATS keeps one seasonal state for every point of the cycle, so a period of 168 means 168 initial values to estimate, and the period must be a whole number. TBATS writes each cycle as a sum of sine and cosine terms, with the number of terms chosen by AIC ([De Livera, Hyndman and Snyder (2011)](#ref-delivera2011)). The trigonometric form assumes a seasonal shape smooth enough for a few harmonics. A sharp holiday spike is outside that assumption, and is better treated as a regressor in another model.

## What the Theta Method Assumes About Trend and Seasonality

The static variants STM and OTM fit one straight trend line over the whole sample, so they assume a trend that does not turn. The dynamic variants DSTM and DOTM update that line each period, and allow a trend that changes slowly. All four are close to simple exponential smoothing with drift, and so they assume no structure beyond a level, a drift and one seasonal pattern ([Fiorucci, Pellegrini, Louzada, Petropoulos and Koehler (2016)](#ref-fiorucci2016)).

## Which Theta Function Adjusts for Seasonality

`theta(y, period; model_type=OTM)` assumes a series with no seasonal pattern, since it applies no adjustment whatever the period. `auto_theta(y, period; model=OTM)` removes seasonality under three conditions: the period is at least 4, the series has at least two full periods, and the autocorrelation at that lag passes a test at the 90% level. The adjustment is multiplicative by default, and becomes additive when the series has values at or below zero or a seasonal index close to zero. A seasonal pattern with a changing shape breaks the assumption, because one fixed set of seasonal indices is applied to every year.

## What Croston's Method Assumes About Intermittent Demand

Croston's method assumes that demand sizes and the intervals between demands are independent of each other, and that both are stable enough for exponential smoothing to track ([Croston (1972)](#ref-croston1972)). The method has no trend and no seasonality, and values are treated as non-negative demand. A product being withdrawn or launched breaks the assumption, because its demand rate moves in one direction. `croston_classic`, `croston_sba` and `croston_sbj` need at least two non-zero values to fit.

## What the Forecast Horizon Assumes

Every point forecast extrapolates the estimated structure unchanged, so a long **Horizon** assumes that level shifts, new cycles and changes of regime do not occur within it. The prediction intervals of BATS, TBATS and Theta describe the noise of the fitted model. Model uncertainty and structural change are not in them, so real coverage tends to fall short of the stated 80% and 95% as the horizon grows.

## References

<a id="ref-croston1972"></a>Croston, J. D. (1972). Forecasting and stock control for intermittent demands. *Operational Research Quarterly* 23(3), 289–303. [doi:10.1057/jors.1972.50](https://doi.org/10.1057/jors.1972.50)

<a id="ref-delivera2011"></a>De Livera, A. M., Hyndman, R. J. and Snyder, R. D. (2011). Forecasting time series with complex seasonal patterns using exponential smoothing. *Journal of the American Statistical Association* 106(496), 1513–1527. [doi:10.1198/jasa.2011.tm09771](https://doi.org/10.1198/jasa.2011.tm09771)

<a id="ref-fiorucci2016"></a>Fiorucci, J. A., Pellegrini, T. R., Louzada, F., Petropoulos, F. and Koehler, A. B. (2016). Models for optimising the theta method and their relationship to state space models. *International Journal of Forecasting* 32(4), 1151–1161. [doi:10.1016/j.ijforecast.2016.02.005](https://doi.org/10.1016/j.ijforecast.2016.02.005)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
