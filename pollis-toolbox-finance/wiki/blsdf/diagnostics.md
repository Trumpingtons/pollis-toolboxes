# Bayesian Linear Stochastic Discount Factor — Diagnostics

Two kinds of check apply: whether the sampler has run long enough, and whether the conclusions depend on the choices made.

## Reading Trace Plots of the Risk Prices

**Trace Plots** shows the kept draws of each risk price. A stable band without drift indicates a chain that has mixed. A slow wander suggests that **MCMC draws** should be increased, and a level shift at the start suggests a longer **Burn-in**. A price that jumps between a narrow band at zero and a wider one is typical of the Spike-and-Slab tabs: that behaviour reflects the factor moving in and out of the model and is not a failure. If those moves are rare, the inclusion probability of that factor is poorly estimated and more draws are required.

## Using Effective Sample Size

**Effective Sample Size** reports the lag-1 autocorrelation of each risk price chain and the implied number of independent draws. Autocorrelated chains carry less information than their length suggests. A hundred effective draws are enough for rough means but too few for the tails of a 90% interval, so a few hundred is a more comfortable target, and more for values reported in a publication. The estimate here uses only lag 1, which is a simple approximation that can overstate the effective count when longer-lag dependence is present, so it is a lower bar and not a guarantee.

## Testing Sensitivity to the Prior

**Against the Other Prior** refits the model with a different kind of prior and compares mean risk prices: spike-and-slab for the Bayesian SDF, a flat Bayesian SDF for spike-and-slab. Prices that hold under both are robust. A factor that matters only under a flat prior is probably weak. Sensitivity to **psi0** deserves a separate run across a range of plausible prior Sharpe ratios. Inclusion probabilities that move a lot across that range reveal that the data do not settle the question, which is a useful finding to report in its own right.

## Checking Fit with Fitted Sharpe Ratios

**Fitted Sharpe Ratios** compares each test asset's Sharpe ratio with the one the posterior-mean SDF predicts from correlations with the factors. Points near the diagonal indicate that the discount factor prices those assets. Groups of assets that fall away from the line identify the dimensions the factor set misses, and they can guide the next candidate to add. Fit on the test assets used for estimation is an optimistic measure. A posterior of the cross-sectional R2, shown by **Factor Relevance** in the Bayesian SDF tab, avoids a false sense of precision by showing a whole distribution of that fit.

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
