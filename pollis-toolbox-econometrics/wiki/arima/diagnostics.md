# ARIMA Models — Diagnostics

Diagnostics in this panel answer one question: has the model removed all the linear structure from the series? The Diagnose group works on the residuals, and the unit root test works on the data before any model is fitted.

## Reading the Residual ACF and PACF

**Residual ACF and PACF** plots the autocorrelation and partial autocorrelation of the residuals with 95% bands. About one bar in twenty will cross the bands by chance, so a single small excursion at a long lag is not alarming. A large bar at lag 1 or 2 suggests that p or q is too small. A bar at the seasonal lag, such as lag 12 in monthly data, suggests a missing seasonal term. A slow decay across many lags means the series has not been differenced enough. A sharp cut-off in one function with gradual decay in the other indicates which term to add.

## Reading the Ljung-Box and Normality Tests

**Ljung-Box and Normality** reports two tests. The statistic of [Ljung and Box (1978)](#ref-LB1978a) pools the residual autocorrelations up to a chosen lag and is compared with a chi-squared distribution whose degrees of freedom are net of the ARMA parameters; a small p-value means correlation remains. The test of [Jarque and Bera (1987)](#ref-JB1987a) compares the skewness and kurtosis of the residuals with those of a normal distribution. A rejection there rarely harms point forecasts, but it does warn that the intervals may be off. With very long series both tests reject trivial departures, so the size of the effect matters more than the p-value.

## Using the ADF Unit Root Test

**ADF Unit Root Test** applies the augmented Dickey-Fuller test to the levels and to the first difference of the series. A unit root that is not rejected in levels but rejected in the first difference supports d = 1. Rejection in levels supports d = 0, and a failure in both suggests d = 2 or a structural break. The test has low power near the unit root, so persistent stationary series often appear non-stationary in short samples. Structural breaks also bias the test toward finding a unit root. A plot from **Differenced Series** should always accompany the result.

## Measuring Accuracy with a Rolling Backtest

**Rolling Backtest** refits the model on expanding windows and scores each forecast on the observations that followed. In-sample fit always improves with more parameters, so the backtest is the honest measure of what the model can do. Error should grow with the horizon. A model that fails to beat a naive forecast at short horizons is probably not worth keeping, whatever its residuals look like. In the ARIMAX tab the backtest uses the regressor values that actually occurred, which flatters the model compared with a real forecast, where those values must themselves be predicted.

## References

<a id="ref-JB1987a"></a>Jarque, C. M. and Bera, A. K. (1987). A Test for Normality of Observations and Regression Residuals. *International Statistical Review / Revue Internationale de Statistique* 55(2), 163. [doi:10.2307/1403192](https://doi.org/10.2307/1403192)

<a id="ref-LB1978a"></a>Ljung, G. M. and Box, G. E. P. (1978). On a measure of lack of fit in time series models. *Biometrika* 65(2), 297–303. [doi:10.1093/biomet/65.2.297](https://doi.org/10.1093/biomet/65.2.297)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
