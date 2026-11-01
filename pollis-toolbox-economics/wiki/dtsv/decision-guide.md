# Discrete-Time Stochastic Volatility Models — Decision Guide

Variant selection depends on the return series and what the output is for. A basic fit is the right start in almost every case.

## Which Stochastic Volatility Model to Choose

| Feature of the returns | Tab | Reason |
|---|---|---|
| Volatility clustering, with full uncertainty wanted | **Basic** | Gaussian AR(1) log-variance, with the path drawn jointly |
| Falls followed by more volatility than rises | **Leverage** | Correlates the return shock with the next volatility shock |
| Extreme outliers that remain after changing volatility | **Student-t** | Heavy-tailed shocks so that outliers do not inflate the path |

## How Many Draws to Run

Treat **Posterior draws** and **Burn-in** as settings to verify rather than fixed numbers. Start with the defaults, read **MCMC Convergence**, and increase both if the effective sample falls far below a few hundred or R-hat exceeds 1.01. Longer return series do not need proportionally more draws for parameters, although each sweep costs more. **Seed** keeps a run repeatable, and a second run with a different seed gives a quick check of Monte Carlo variation in the main results.

## Stochastic Volatility or GARCH

The two approaches usually give similar volatility paths, and the choice depends on need. GARCH, in the GARCH-Type Models panel, is fast, gives a single likelihood, and is simple to refit daily. Stochastic volatility has an independent volatility shock, which often fits the tails and persistence of returns better, and full posterior uncertainty. When speed and repeated refits matter, use GARCH. When inference about the volatility process matters, or the uncertainty around a volatility estimate needs reporting, use this panel.

## When to Consider Other Approaches

Some data call for different tools. Abrupt shifts between volatility levels fit Markov-Switching ARCH in the Regime Switching Models panel better than a single AR(1). For a volatility measurement without any model, the Range-Based Volatility Estimation panel makes more use of daily highs and lows, and its log range can also serve as an observation of log volatility. Macroeconomic time-varying volatility inside a vector autoregression needs a multivariate model, because a univariate fit cannot capture shared volatility across variables. Illiquid assets with many zero returns may need a dedicated treatment.

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
