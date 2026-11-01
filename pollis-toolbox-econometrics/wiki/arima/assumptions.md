# ARIMA Models — Assumptions

An ARIMA model rests on a short list of conditions about the differenced series and its errors. Each can be checked from the residuals, and a failure usually points to a specific change in the specification.

## Stationarity After Differencing

The series must become stationary once differenced d times, with its seasonal differences included: the mean, the variance and the autocovariances may not drift over time. A trend that is deterministic, or a level shift at a known date, is poorly handled by differencing and leaves a pattern in the residuals. Too little differencing shows as an autocorrelation function that decays very slowly. Too much shows as a large negative autocorrelation at lag 1, and a moving-average root close to one. The test of [Dickey and Fuller (1979)](#ref-DF1979a) takes a unit root as its null hypothesis, so a failure to reject is weak evidence and deserves to be read alongside the plot.

## Stationary and Invertible Polynomials

The autoregressive polynomial must have all its roots outside the unit circle so that the differenced process is stationary, and the moving-average polynomial must satisfy the same condition so that the shocks can be recovered from the data. Estimates close to the boundary signal a problem: an AR root near one suggests that another difference is needed, and an MA root near one suggests over-differencing. When an AR and an MA factor nearly cancel, both coefficients become unstable with wide standard errors, and a smaller model will describe the data equally well.

## White-Noise and Gaussian Errors

The shocks are taken as uncorrelated, with mean zero and constant variance, and the likelihood treats them as Gaussian. Point forecasts and coefficient estimates remain reasonable under moderate departures from normality. Forecast intervals depend on it more heavily, since they assume a symmetric distribution with thin tails. Fat tails make the 95% interval too narrow in crises. Changing variance, common in financial returns, leaves autocorrelation in the squared residuals even when the residuals look clean, and calls for a conditional variance model.

## Regressors in an ARIMAX Model

An ARIMAX model takes the regressors as exogenous, meaning that shocks to the series do not feed back into them. Reverse causality biases the coefficients, and a vector autoregression is then the better tool. The forecast also assumes that the future regressor values are known, so the reported intervals leave out any uncertainty about them. A scenario for the regressors therefore yields a conditional forecast, whose true uncertainty is wider than shown. Regressors with a stochastic trend can also produce a spurious relation, which differencing in the error model helps to remove.

## References

<a id="ref-DF1979a"></a>Dickey, D. A. and Fuller, W. A. (1979). Distribution of the Estimators for Autoregressive Time Series with a Unit Root. *Journal of the American Statistical Association* 74(366a), 427–431. [doi:10.1080/01621459.1979.10482531](https://doi.org/10.1080/01621459.1979.10482531)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
