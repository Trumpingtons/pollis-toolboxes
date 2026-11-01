# Discrete-Time Stochastic Volatility Models — Diagnostics

Checks fall into two classes: whether the sampler can be trusted, and whether the fitted model explains volatility in the returns.

## Reading MCMC Convergence

**MCMC Convergence** reports effective sample size and split R-hat for each parameter. An effective sample well above 100, and an R-hat below 1.01, indicate a reliable posterior. Low effective samples for sigma_eta are the most common problem. The remedy is more **Posterior draws** and a longer **Burn-in**. **Posterior Traces** shows the same information visually: traces should look like stationary noise, with no trends or long flat stretches, and any trace with a slow drift shows that the chain has not yet settled.

## Testing for Volatility Clustering

**Volatility Clustering** applies a Ljung-Box test to squared returns and plots their autocorrelation, ideally before any fit. Significant autocorrelation is the evidence that motivates a volatility model at all. Without it, the model has little to work with, and phi and sigma_eta may be poorly determined. Autocorrelation that decays slowly suggests high persistence, while a spike at one lag with little after it suggests short-lived effects or a data artefact. A return series with strong autocorrelation in levels should be cleaned before testing.

## Reading Standardised Returns

**Standardised Returns** divides returns by fitted volatility. If the model fits, the result has no remaining clustering and a variance close to 1. Remaining correlation in the squares suggests dynamics that the AR(1) misses. Excess kurtosis suggests a move to the **Student-t** tab, and asymmetry suggests the **Leverage** tab. The check uses posterior mean volatility, which already draws on all the data, including that date's return, so it is somewhat flattering and not a true out-of-sample test.

## Comparing Variants and GARCH

**Compare SV Variants** fits Basic, Leverage and Student-t on the same returns, and shows posterior means of mu, phi and sigma_eta along with standardised-return kurtosis. A large change in sigma_eta under the Student-t model shows that outliers were driving volatility of volatility. **Compare with GARCH(1,1)** plots conditional variance against the posterior mean. GARCH reacts mechanically to past squared returns, whereas the stochastic path uses the full sample and carries its own shock. Close agreement on the broad path is typical, with most differences arising around big shocks.

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
