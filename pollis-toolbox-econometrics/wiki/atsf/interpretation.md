# Advanced Time-Series Forecasting — Interpretation

The estimated parameters of these models describe the shape of a series in a few numbers, and **Model Parameters** lists them. They are read differently in each tab, and a forecast from the Intermittent Demand tab means something different from the other two.

## How to Read a BATS or TBATS Fit

The Box-Cox parameter `lambda` gives the transformation: near 0 it is close to a logarithm, for variation that grows with the level, near 1 it is close to no transformation, and an empty value means none was chosen. `damping_parameter` below 1 flattens the trend as the horizon grows, and an empty value means no damping was chosen. `alpha` and `beta` say how fast the level and the trend adapt, with larger values following recent data more closely. `ar_coefficients` and `ma_coefficients` hold the ARMA errors, and `aic` allows the comparison of fits on the same series. The printed name of the model, such as `TBATS(omega, {p,q}, phi, <m,k>)`, summarises the structure that was selected.

## What the Theta Parameter Means

The theta parameter sets how much of the series' curvature each line keeps. A theta line is Z(t) = theta Y(t) + (1 − theta)(A + B t), with A + B t the straight line fitted to the series. At theta = 0 the line is the straight trend itself, and at theta = 1 the line is the original series. Values above 1 exaggerate the short-run movement. STM fixes theta at 2, and an OTM estimate far from 2 says that the series calls for a different balance between the long-run trend and the recent level. `alpha` is the smoothing parameter of the level, and `decompose` reports whether seasonal adjustment was applied, which only `auto_theta` does.

## How to Read a Croston Forecast

A Croston forecast is a demand rate per period: a value of 0.5 means an average of one unit every two periods, not half a unit in each. The forecast is flat over the whole **Horizon**, and says nothing on when the next demand falls. The total over a lead time is the rate multiplied by its length, which is the number most often wanted for stock decisions. `weights` holds the smoothing parameters of size and interval, and small weights mean that the estimates change slowly. `croston_classic`, `croston_sba` and `croston_sbj` return no prediction interval, so a safety stock needs a separate assumption on the distribution of demand.

## How the SBA and SBJ Corrections Change a Forecast

Taking the ratio of two smoothed values gives a rate that is too high on average ([Syntetos and Boylan (2005)](#ref-syntetos2005)). SBA multiplies the classic rate by 1 − a/2, where a is the smoothing parameter of the interval. SBJ multiplies by 1 − a/(2 − a), which is a little smaller ([Shale, Boylan and Johnston (2006)](#ref-shale2006)). With small smoothing parameters the three forecasts stay close, and a large gap between them means that the interval is being smoothed heavily.

## How to Read the Prediction Intervals

The bands from BATS, TBATS and Theta are 80% and 95% prediction intervals, and they are stored in `fc.lower` and `fc.upper`, one column per level. A prediction interval covers a future observation, not the mean, so it stays wide however long the series. BATS and TBATS bands can be asymmetric after a Box-Cox transformation. Theta bands grow with the horizon through the variance [1 + (h − 1) alpha squared] times the residual variance, so a small alpha gives bands that widen slowly.

## What a Good Holdout Score Does and Does Not Show

A low MASE shows that the method beat a naive forecast on one stretch of past data. Good accuracy gives no evidence that the estimated parameters describe a true mechanism, and does not say that the score will hold after a change of regime. Forecasting models can predict well for reasons unrelated to their components, so read a smoothing parameter as a description of the fit.

## References

<a id="ref-shale2006"></a>Shale, E. A., Boylan, J. E. and Johnston, F. R. (2006). Forecasting for intermittent demand: the estimation of an unbiased average. *Journal of the Operational Research Society* 57(5), 588–592. [doi:10.1057/palgrave.jors.2602031](https://doi.org/10.1057/palgrave.jors.2602031)

<a id="ref-syntetos2005"></a>Syntetos, A. A. and Boylan, J. E. (2005). The accuracy of intermittent demand estimates. *International Journal of Forecasting* 21(2), 303–314. [doi:10.1016/j.ijforecast.2004.10.001](https://doi.org/10.1016/j.ijforecast.2004.10.001)

## See Also

- [Factsheet](factsheet.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
