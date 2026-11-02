# VAR Models — Factsheet

The VAR Models panel estimates systems in which several time series explain one another through their own past. Since [Sims (1980)](#ref-Sim1980a), the vector autoregression has been a standard tool for macroeconomic dynamics, because it imposes few restrictions on how series interact. MacroEconometricModels.jl handles estimation, identification and inference, and TransmissionChannelAnalysis.jl splits responses into channels.

| | |
|---|---|
| **Purpose** | Model the joint dynamics of several series, identify shocks, forecast, and test long-run relations |
| **Julia stack** | MacroEconometricModels.jl, TransmissionChannelAnalysis.jl |
| **Models** | VAR, SVAR, FAVAR, VECM |
| **Output** | Coefficients, impulse responses with bands, forecasts, variance and historical decompositions, cointegration tests |
| **Key choice** | The ordering or restrictions that identify shocks, the lag length, and whether series are cointegrated |

## When to Use a Vector Autoregression

A vector autoregression suits several series that may influence each other, with no single dependent variable and no clear exogenous regressor. Forecasts come directly from the reduced form, and with an identifying assumption, the same system can answer causal questions about shocks. [Lütkepohl (2005)](#ref-Lut2005a) is the standard reference for the reduced form, and [Kilian and Lütkepohl (2017)](#ref-KL2017a) for structural analysis. A single equation is a better choice when one series is the clear object of interest and the others are known to be exogenous.

## What the VAR Panel Does Not Cover

The panel's estimates are classical, and coefficients are constant over time. Time-varying parameters, regime-dependent dynamics and stochastic volatility are not available, and Bayesian shrinkage, which is often used for larger systems, is not offered as an input. Each equation has a linear form, so responses are symmetric and proportional to the size of a shock. Large systems quickly run out of degrees of freedom, because the number of coefficients grows with the square of the number of series, and the FAVAR tab is the panel's answer to that limit.

## References

<a id="ref-KL2017a"></a>Kilian, L. and Lütkepohl, H. (2017). Structural Vector Autoregressive Analysis. *Cambridge University Press*. [doi:10.1017/9781108164818](https://doi.org/10.1017/9781108164818)

<a id="ref-Lut2005a"></a>Lütkepohl, H. (2005). New Introduction to Multiple Time Series Analysis. *Springer Berlin Heidelberg*. [doi:10.1007/978-3-540-27752-1](https://doi.org/10.1007/978-3-540-27752-1)

<a id="ref-Sim1980a"></a>Sims, C. A. (1980). Macroeconomics and Reality. *Econometrica* 48(1), 1. [doi:10.2307/1912017](https://doi.org/10.2307/1912017)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
