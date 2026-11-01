# Advanced Time-Series Forecasting — Overview

Advanced Time-Series Forecasting gathers methods for series whose shape breaks the assumptions of a standard ARIMA or exponential smoothing model. All three tabs take the same **Data variable** and **Horizon** inputs, so one series can be tried under each.

## The BATS / TBATS Tab: Forecasting Complex Seasonality

BATS stands for Box-Cox transformation, ARMA errors, Trend and Seasonal components. TBATS replaces the seasonal states with trigonometric terms, which is what the leading T adds ([De Livera, Hyndman and Snyder (2011)](#ref-delivera2011)).

The **Seasonal Periods** input holds one period or several, such as `[24, 168]` for hourly data with daily and weekly cycles. BATS needs whole numbers. TBATS also accepts a non-integer period, such as `[52.18]` for weeks in a year, and copes better with long cycles because it estimates a few harmonics instead of one state per season. Both functions choose the Box-Cox transformation, the trend, the damping and the ARMA errors by AIC.

## The Theta Method Tab: A Simple and Strong Benchmark

The Theta method changes the curvature of the series through a parameter theta, forecasts the resulting lines and combines them ([Assimakopoulos and Nikolopoulos (2000)](#ref-assimakopoulos2000)). The **Variant** input picks one of four models. STM fixes theta at 2, OTM estimates theta, and the dynamic forms DSTM and DOTM update the trend line at every step ([Fiorucci, Pellegrini, Louzada, Petropoulos and Koehler (2016)](#ref-fiorucci2016)).

The **Period** input gives the seasonal cycle, with 1 for a non-seasonal series. `theta(y, period; model_type=OTM)` fits the series as given, with no seasonal adjustment, so a seasonal series should be adjusted first. `auto_theta(y, period)` tests for seasonality at that lag and removes a seasonal pattern by decomposition when the test finds one.

## The Intermittent Demand Tab: Forecasting Series with Many Zeros

Intermittent demand has many periods of zero, as with spare parts or slow-moving goods. Ordinary smoothing reacts to every zero, and so forecasts too high just after a demand and too low just before the next. Croston's method updates its estimates only when a demand occurs, and forecasts the ratio of demand size to the interval between demands ([Croston (1972)](#ref-croston1972)).

The **Method** input selects `classic`, or one of two corrections of its upward bias: `sba` ([Syntetos and Boylan (2005)](#ref-syntetos2005)) or `sbj` ([Shale, Boylan and Johnston (2006)](#ref-shale2006)). The output is one flat demand rate per period, which is an average rate and not a prediction of when the next demand falls.

## A Common Workflow for Advanced Forecasting

1. Open **Series Structure** to see the trend and the cycles, and **Demand Pattern** to see whether zeros dominate.
2. Pick the tab that fits the shape and run the Example Code.
3. Read **Forecast Plot** and **Model Parameters** to see what was estimated.
4. Check **Residual Diagnostics** for structure the model left behind.
5. Use **Holdout Accuracy** and **Compare Methods** to judge the model against a naive benchmark on data held back from fitting.

## References

<a id="ref-assimakopoulos2000"></a>Assimakopoulos, V. and Nikolopoulos, K. (2000). The theta model: a decomposition approach to forecasting. *International Journal of Forecasting* 16(4), 521–530. [doi:10.1016/S0169-2070(00)00066-2](https://doi.org/10.1016/S0169-2070(00)00066-2)

<a id="ref-croston1972"></a>Croston, J. D. (1972). Forecasting and stock control for intermittent demands. *Operational Research Quarterly* 23(3), 289–303. [doi:10.1057/jors.1972.50](https://doi.org/10.1057/jors.1972.50)

<a id="ref-delivera2011"></a>De Livera, A. M., Hyndman, R. J. and Snyder, R. D. (2011). Forecasting time series with complex seasonal patterns using exponential smoothing. *Journal of the American Statistical Association* 106(496), 1513–1527. [doi:10.1198/jasa.2011.tm09771](https://doi.org/10.1198/jasa.2011.tm09771)

<a id="ref-fiorucci2016"></a>Fiorucci, J. A., Pellegrini, T. R., Louzada, F., Petropoulos, F. and Koehler, A. B. (2016). Models for optimising the theta method and their relationship to state space models. *International Journal of Forecasting* 32(4), 1151–1161. [doi:10.1016/j.ijforecast.2016.02.005](https://doi.org/10.1016/j.ijforecast.2016.02.005)

<a id="ref-shale2006"></a>Shale, E. A., Boylan, J. E. and Johnston, F. R. (2006). Forecasting for intermittent demand: the estimation of an unbiased average. *Journal of the Operational Research Society* 57(5), 588–592. [doi:10.1057/palgrave.jors.2602031](https://doi.org/10.1057/palgrave.jors.2602031)

<a id="ref-syntetos2005"></a>Syntetos, A. A. and Boylan, J. E. (2005). The accuracy of intermittent demand estimates. *International Journal of Forecasting* 21(2), 303–314. [doi:10.1016/j.ijforecast.2004.10.001](https://doi.org/10.1016/j.ijforecast.2004.10.001)

## See Also

- [Factsheet](factsheet.md) · [Assumptions](assumptions.md) · [Decision Guide](decision-guide.md)
