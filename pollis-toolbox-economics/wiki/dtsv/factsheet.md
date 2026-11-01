# Discrete-Time Stochastic Volatility Models — Factsheet

The Discrete-Time Stochastic Volatility Models panel treats the log-variance of returns as a hidden process with its own random shock, an idea going back to [Taylor (1982)](#ref-Tay1982a). Bayesian sampling recovers the whole volatility path with full uncertainty. MacroEconometricModels.jl runs the sampler through `estimate_sv`.

| | |
|---|---|
| **Purpose** | Estimate a latent volatility path and its parameters with posterior uncertainty |
| **Julia stack** | MacroEconometricModels.jl, with MCMCDiagnosticTools.jl, Plots.jl, StatsBase.jl and HypothesisTests.jl |
| **Models** | Basic, Leverage, Student-t |
| **Output** | A posterior volatility path, parameter draws for mu, phi and sigma_eta, variance forecasts |
| **Key choice** | Whether to add leverage or fat tails, and how many draws to run |

## When to Use a Stochastic Volatility Model

Stochastic volatility suits returns that show volatility clustering, particularly when uncertainty about volatility itself matters. Credible bands around the path are produced directly by the sampler, and posterior draws carry parameter uncertainty into forecasts. Daily or weekly returns are the typical input, and the panel needs at least 20 observations, though reliable persistence estimates require several hundred. Slower computation, compared with a GARCH model, is the main cost, and the extra realism is most useful when the shock to volatility is itself a quantity of interest.

## What the Stochastic Volatility Model Assumes Away

The model describes returns as mean zero, so its input should be demeaned returns. Dynamics in the mean, jumps as a separate process, multiple volatility factors, and long memory are outside its scope. Only one latent state moves volatility, which can be too simple for data with both slow and fast volatility components. A latent path is an inference from returns and not a measurement, and when intraday data are available, realised measures provide a more direct view of daily volatility.

## References

<a id="ref-Tay1982a"></a>Taylor, S. J. (1982). Financial returns modelled by the product of two stochastic processes — a study of daily sugar prices 1961–79. *Reprinted in Stochastic Volatility: Selected Readings, Oxford University Press (2005)*, 60–82. [doi:10.1093/oso/9780199257195.003.0003](https://doi.org/10.1093/oso/9780199257195.003.0003)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
