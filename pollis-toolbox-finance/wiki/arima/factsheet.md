# ARIMA Models — Factsheet

The ARIMA Models panel fits one time series as a function of its own past values and past shocks, adds a seasonal structure where the data repeat at a fixed period, and regresses the series on other variables with ARIMA errors. The approach goes back to [Box, Jenkins, Reinsel and Ljung (2015)](#ref-BJRL2015a).

| | |
|---|---|
| **Purpose** | Model and forecast a single time series, with or without seasonality and regressors |
| **Julia stack** | StateSpaceModels.jl for ARIMA and Seasonal ARIMA; Durbyn.jl for ARIMAX |
| **Models** | ARIMA, Seasonal ARIMA, ARIMAX |
| **Output** | Coefficients with standard errors, forecasts with 80% and 95% intervals, simulated paths, backtest errors |
| **Key choice** | The orders (p, d, q), then (P, D, Q, s) for a seasonal series, and which regressors belong in the model |

## When to Use an ARIMA Model

An ARIMA model suits a series whose future depends mainly on its own recent history, such as a sales figure, a price index or a monthly count, when the horizon is short and no structural explanation is required. The model needs one observed series in time order at a regular interval. Fifty observations are a practical minimum for a non-seasonal model, and several full cycles are needed before seasonal terms can be estimated. A regression with ARIMA errors is the natural extension once another variable is known to move the series and its future values can be supplied.

## What ARIMA Models Do Not Do

An ARIMA model does not explain why a series moves, and its coefficients have no causal reading without a design that supports one. Variance is taken as constant, so a series with bursts of volatility calls for a GARCH model. Regime changes and structural breaks are absorbed into the errors instead of being identified. Long horizons converge to a mean or a drift, so distant forecasts carry little information beyond their widening intervals. Several related series that feed back on each other belong in a vector autoregression, because an ARIMAX model treats its regressors as given.

## References

<a id="ref-BJRL2015a"></a>Box, G. E. P., Jenkins, G. M., Reinsel, G. C. and Ljung, G. M. (2015). Time Series Analysis: Forecasting and Control. *Wiley*.

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
