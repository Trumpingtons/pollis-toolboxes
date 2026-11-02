# Advanced Time-Series Forecasting — Diagnostics

Diagnostics for these forecasting models ask two questions: did the model leave structure in its residuals, and does it beat a naive benchmark on data it did not see. The second question matters more.

## How to Read the Residual Diagnostics of a Forecasting Model

**Residual Diagnostics** shows the residuals over time and their autocorrelation, and runs a Ljung-Box test up to lag min(24, n/4), for a series of length n. Residuals that look like noise suggest the model has taken up the systematic part of the series. A spike at the seasonal lag points to a seasonal period that was missed, and a slow pattern in the residual plot points to a trend the model did not follow. A small Ljung-Box p-value says that autocorrelation remains. With a long series the test can reject on effects too small to change the forecast, so read it together with the plot.

## Why Residual Tests Do Not Suit the Croston Family

The residuals of `croston_classic`, `croston_sba` and `croston_sbj` compare a flat rate with a series of zeros and occasional demands. Those residuals are autocorrelated and strongly skewed however good the forecast is, so a Ljung-Box rejection says little about them. For intermittent demand, rely on **Demand Pattern** to confirm that the method fits and on **Holdout Accuracy** to judge the forecast.

## How Holdout Accuracy Measures Forecast Skill

**Holdout Accuracy** refits the model without the last H = min(h, n/5) observations, for a **Horizon** h, and scores the forecast against them. The table gives MAE, RMSE, MASE and bias. MASE divides the mean absolute error by the in-sample error of the one-step naive forecast, so it can be compared across series of different scale ([Hyndman and Koehler (2006)](#ref-HK2006a)). A MASE under 1 means the model beats that naive forecast on average. Bias is the mean forecast error: a value far from zero shows a forecast that sits on one side of the data. One holdout is a single trial, and a different cut can give a different ranking.

## How to Use Compare Methods as a Benchmark

**Compare Methods** scores TBATS, Theta OTM, Croston SBA, a naive forecast and a seasonal naive forecast on the same holdout. A complex model that does not beat the seasonal naive forecast is not earning its parameters on that series. Theta often serves as the benchmark to beat, because it is cheap and did well in the M3 forecasting competition ([Fiorucci, Pellegrini, Louzada, Petropoulos and Koehler (2016)](#ref-FPLPK2016a)). Compare several cuts of the data before trusting a small difference.

## Which Warning Signs to Check for BATS and TBATS

A Box-Cox parameter at either end of its range means that the search stopped at a bound. A damping parameter close to 1 means that the damped trend behaves almost like a straight line, and long-horizon forecasts will keep rising or falling. Large ARMA orders on a short series suggest that the errors are absorbing a seasonal pattern that the **Seasonal Periods** input left out. **Model Parameters** lists these values. A very long fitting time usually comes from long or multiple seasonal periods.

## Which Warning Signs to Check for the Theta Method

Under OTM or DOTM, an estimated theta close to 1 means the model has reduced to smoothing the series with almost no trend line. The drift of the forecast depends on 1 − 1/theta, so a very large estimate acts much like any other large value and should not be read for its size. A smoothing parameter alpha close to 1 means the level follows the last observation closely, and the model behaves like a random walk with drift. On a seasonal series fitted by `theta`, that pattern is a sign of seasonality left in the data: compare with `auto_theta`, which adjusts for it.

## References

<a id="ref-FPLPK2016a"></a>Fiorucci, J. A., Pellegrini, T. R., Louzada, F., Petropoulos, F. and Koehler, A. B. (2016). Models for optimising the theta method and their relationship to state space models. *International Journal of Forecasting* 32(4), 1151–1161. [doi:10.1016/j.ijforecast.2016.02.005](https://doi.org/10.1016/j.ijforecast.2016.02.005)

<a id="ref-HK2006a"></a>Hyndman, R. J. and Koehler, A. B. (2006). Another look at measures of forecast accuracy. *International Journal of Forecasting* 22(4), 679–688. [doi:10.1016/j.ijforecast.2006.03.001](https://doi.org/10.1016/j.ijforecast.2006.03.001)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
