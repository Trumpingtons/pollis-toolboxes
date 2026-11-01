# ARIMA Models — Interpretation

The output of an ARIMA model describes dynamics, not causes. A coefficient says how past values and past shocks carry into the present, and the way those effects decay matters more than any single estimate.

## What the AR and MA Coefficients Mean

**Coefficient Table** lists each estimate with its standard error, z statistic and p-value. An AR coefficient measures how strongly the last differenced value carries into the next, and an MA coefficient measures how much of the previous forecast error is corrected. Single coefficients are hard to read once several lags are present, because their joint effect is what shapes the dynamics. A near-zero estimate suggests a smaller model, but dropping terms one at a time by p-value is not a selection method. Information criteria compare whole specifications better than individual tests.

## Reading the Impulse Response

**Impulse Response (Psi Weights)** shows the effect of a one-off unit shock on the differenced series over the following steps, computed from the fitted AR and MA polynomials. Weights that die out quickly describe a process with short memory, and weights that oscillate indicate complex roots and a cycle. On the original series the response accumulates d times: with d = 1, a shock whose weights sum to a non-zero value shifts the level permanently. That permanence is what separates a stochastic trend from a process that always returns to a fixed mean.

## Reading Forecasts and Prediction Intervals

**Forecast with Intervals** draws the point forecast with 80% and 95% intervals. Without differencing the point forecast converges to the mean and the interval reaches a fixed width. With d = 1 the forecast flattens or follows a drift, and the interval keeps widening roughly with the square root of the horizon. A wide interval is an honest statement that the series has little predictable structure. **Simulated Scenarios** gives the same information as 500 possible paths, which helps with questions about a path, such as the chance of crossing a threshold at any point in the next year.

## Reading a Regressor's Coefficient

In the ARIMAX tab, a regressor's coefficient is its estimated effect on the series, holding the error process as modelled. With d = 1 the model relates changes to changes, so a coefficient of 2 means a one-unit rise in the regressor comes with a two-unit rise in the series in that period. Because the regression is estimated jointly with the error model, the standard errors already account for autocorrelation, unlike those of ordinary least squares. **With and Without the Regressors** tells whether the variables earn their parameters by comparing AIC, and that comparison says nothing about causality.

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
