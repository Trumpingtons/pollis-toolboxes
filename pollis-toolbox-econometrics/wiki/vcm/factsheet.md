# GARCH-Type Models — Factsheet

The GARCH-Type Models panel models the conditional variance of returns: how today's volatility depends on recent shocks and on recent volatility. Since [Engle (1982)](#ref-Eng1982a) and [Bollerslev (1986)](#ref-Bol1986a), the family has been the standard description of volatility clustering, the tendency of large moves to follow large moves. ARCHModels.jl fits all four tabs.

| | |
|---|---|
| **Purpose** | Estimate and forecast time-varying volatility and, for several assets, conditional correlation |
| **Julia stack** | ARCHModels.jl, with HypothesisTests.jl, Plots.jl and StatsBase.jl for the actions |
| **Models** | GARCH, EGARCH, GJR-GARCH, DCC |
| **Output** | Coefficients, conditional volatilities, news impact curves, volatility forecasts, Value-at-Risk |
| **Key choice** | Symmetric or asymmetric response to shocks, the lag orders, and the innovation distribution |

## When to Use a GARCH-Type Model

A conditional variance model fits financial returns at daily or higher frequency, where the mean is close to zero and volatility shows clear clustering. Typical uses are risk measurement, Value-at-Risk, option pricing inputs and portfolio weights. Several hundred observations are a reasonable minimum, because the high persistence of volatility requires long samples for stable estimates, and around a thousand are preferable. Monthly data usually shows much weaker clustering. For multivariate questions such as hedging or diversification, DCC adds correlation dynamics at modest cost.

## What GARCH Models Do Not Capture

A GARCH model treats the variance as an exact function of past data, so it has no separate random shock to volatility, which the Discrete-Time Stochastic Volatility Models panel provides. It offers no explanation for why volatility moves, and it responds to a jump only after the event. High persistence often reflects undetected level shifts in volatility rather than long memory, a pattern that regime switching models can separate. Conditional means are not modelled in depth here, so any residual return predictability should be removed first with an appropriate mean specification.

## References

<a id="ref-Bol1986a"></a>Bollerslev, T. (1986). Generalized Autoregressive Conditional Heteroskedasticity. *Journal of Econometrics* 31(3), 307–327. [doi:10.1016/0304-4076(86)90063-1](https://doi.org/10.1016/0304-4076(86)90063-1)

<a id="ref-Eng1982a"></a>Engle, R. F. (1982). Autoregressive Conditional Heteroscedasticity with Estimates of the Variance of United Kingdom Inflation. *Econometrica* 50(4), 987. [doi:10.2307/1912773](https://doi.org/10.2307/1912773)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
