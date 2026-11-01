# Discrete-Time Stochastic Volatility Models — Assumptions

The results depend on assumptions about the latent process, the shocks and the prior, as well as the sampler having converged.

## Stationary AR(1) Log-Variance

Log-variance is assumed to follow a stationary AR(1), so that phi lies below 1 and volatility reverts to a long-run level of exp(mu / 2). Daily financial data usually give phi very near 1. A posterior concentrated near 1 might reflect true persistence or level shifts in volatility, and the two are hard to tell apart. One AR(1) factor has short memory compared with the slow decay often seen in volatility, so a long-horizon forecast may revert too quickly when volatility has long memory or regime changes.

## Shock Distribution and Leverage Timing

The Basic and Leverage models assume Gaussian return shocks, and the Student-t model assumes symmetric heavy tails with a single nu. Skewness and jumps are not modelled separately, so a large crash is absorbed either by the tails or by volatility. The Leverage model assumes that the return shock correlates only with the following shock to log-variance. A negative rho alone does not prove a financial leverage mechanism, and volatility feedback, in which higher risk lowers prices, gives the same sign in the data.

## Mean-Zero Returns and Data Quality

The return equation has no mean, so **Returns** should be demeaned before use. Any autocorrelation in the mean should be removed as well. Zero returns are a practical problem, since the log of a squared zero is undefined, and estimation usually relies on a small offset to avoid it. Many exact zeros, as with illiquid assets or in price data with holidays filled in, can distort the mixture approximation and the persistence estimates. Scale also matters for readability, and returns in percent give more convenient parameter values.

## Priors and Sampler Convergence

Bayesian results depend on priors, and with short samples priors can matter a great deal, especially for phi and sigma_eta, where the likelihood is flat. A longer sample lessens the influence. Results also assume that the chain has reached the posterior after **Burn-in** and that **Posterior draws** are enough. Log-variance is highly autocorrelated in the chain, and sigma_eta tends to mix slowly, so a small effective sample is common. Different values of **Seed** should give the same answers up to Monte Carlo error.

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
