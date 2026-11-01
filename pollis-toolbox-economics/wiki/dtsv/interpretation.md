# Discrete-Time Stochastic Volatility Models — Interpretation

The output describes a level, a persistence and a volatility of volatility. Posterior intervals are part of the answer, not a detail.

## Reading the Posterior Summary

**Posterior Summary** gives the mean, standard deviation and 95% credible interval of mu, phi and sigma_eta. mu is the level of log-variance, and exp(mu / 2) converts it into a volatility. phi near 1 means that volatility shocks last long. sigma_eta is the standard deviation of shocks to log-variance. Parameters are correlated in the posterior, particularly phi and sigma_eta, as high persistence with small shocks and lower persistence with larger shocks can fit data similarly, so a joint reading is safer than reading one parameter alone.

## Reading Persistence and Half-Life

**Volatility Persistence** reports the half-life log(0.5) / log(phi) in periods, with a credible interval. A phi of 0.98 gives about 34 periods, and 0.90 about 7. The half-life refers to log-variance: how long a deviation from the long-run level takes to halve. Near 1, a small change in phi greatly stretches the half-life, so a wide interval is common and informative. In daily data, a half-life of a few weeks or more is the usual outcome, and a much longer one may indicate level shifts.

## Reading Volatility of Volatility

**Volatility of Volatility** translates sigma_eta into a typical one-period percentage move in volatility, 100 (exp(sigma_eta / 2) - 1), and gives the unconditional spread of log-variance, sigma_eta / sqrt(1 - phi^2). A higher sigma_eta gives rougher volatility paths and heavier tails in unconditional returns, even with Gaussian shocks. The ratio of high volatility to median volatility states the implied range in ordinary terms. A high sigma_eta with a modest phi can look like a fat-tailed process, which is why variants need to be compared.

## Reading Bands and Variance Forecasts

**Volatility Path** shows the posterior mean with a 95% credible band over absolute returns. A wide band means that the data do not pin down volatility on those dates, an uncertainty GARCH does not report directly. **Variance Forecast** simulates each draw forward from its last latent volatility, combining parameter and state uncertainty, so the forecast distribution is skewed and its mean sits above its median. **Long-Run Volatility** compares the current fitted level with exp(mu / 2), showing the direction in which the forecast should move.

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
