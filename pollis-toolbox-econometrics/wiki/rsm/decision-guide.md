# Regime Switching Models — Decision Guide

The specification follows from what is believed to switch: a relationship, persistence, volatility, or the transition chances themselves.

## Which Switching Model to Choose

| Question | Tab | Reason |
|---|---|---|
| Does a relationship change between calm and turbulent periods? | **Markov-Switching Regression** | One set of coefficients and one variance per regime |
| Does persistence or mean reversion of one series change? | **Markov-Switching Autoregression** | Regime-specific coefficients on its lags |
| Do returns cluster in volatility and also jump between states? | **Markov-Switching ARCH** | Each regime has its own ARCH(q) variance |
| Does an indicator raise the chance of entering a regime? | **Time-Varying Transitions** | Transition probabilities are logistic functions of the indicator |

## How Many Regimes to Use

Begin with two. Add a third only if there is a substantive reason, such as a distinction between normal times, booms and crises, and if the new regime lasts and recurs. More than four is rarely estimable, since the parameters grow quickly and each new state has fewer observations. Criteria from **Number of Regimes (AIC and BIC)** help but do not decide, given their weak statistical justification in this setting. An extra regime that disappears under a Student-t **Error distribution** was probably capturing fat tails and not a true state.

## Which Parameters Should Switch

Switching everything is expensive and often unnecessary. Let the **Intercept** and **Variance** switch first, since average level and volatility are the most common differences. Add switching slopes through **Switching regressors** only when theory suggests a change in the relationship, and keep the rest in **Non-switching regressors**. **Specification Search** runs `grid_search_msm` across regimes, intercept type, and the switching of regressors and variance, and keeps the best model by AIC. It is useful for exploration, but it shares the same statistical caveat and raises the risk of overfitting by trying many models.

## When to Use a Different Model

A regime model is not always the right choice. A single permanent break calls for a break test rather than recurrent states. Gradual change fits a time-varying parameter or stochastic volatility model better than abrupt jumps. If volatility clustering is the only feature of interest and one persistent process describes it, the GARCH-Type Models panel is simpler and easier to estimate. When a threshold in an observed variable defines the regimes, a threshold model makes the switching rule explicit. Forecast comparison against simple linear benchmarks should be routine, since regime models often fit well in-sample and forecast no better.

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
