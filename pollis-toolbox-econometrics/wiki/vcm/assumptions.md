# GARCH-Type Models — Assumptions

A GARCH-type model assumes that returns are a stable volatility process times independent shocks. Each element can fail in recognisable ways.

## Stationarity of the Variance Process

For a GARCH(1,1), covariance stationarity requires alpha + beta below 1, in which case the variance has a long-run level of omega / (1 - alpha - beta). Daily equity data frequently gives a sum close to 1. A sum at or above 1 means no long-run variance exists, and multi-step forecasts no longer converge. In GJR-GARCH with a symmetric shock distribution, the condition becomes alpha + beta + gamma / 2 below 1. Structural change can push estimated persistence toward 1 spuriously, so an estimate near the boundary calls for a look at subsamples.

## Independent Standardised Shocks

The shocks z(t) must be independent and identically distributed with mean zero and variance one. Dependence in the standardised residuals or their squares shows that the variance equation has missed something. Seasonal patterns are a typical cause in intraday data, and they call for the periodic models of [Bollerslev and Ghysels (1996)](#ref-BG1996a), since standard models treat the seasonal volatility as clustering. Any serial correlation in the mean should be removed first as well. Non-synchronous trading in portfolios can also induce dependence in returns that a volatility model should not be asked to absorb.

## Choice of the Innovation Distribution

Normal likelihood estimates are consistent for the variance parameters even when the true shocks are not normal, given a correct variance equation, but risk measures depend directly on the tails. Student's t gives heavier tails with one shape parameter, GED provides a different kind of tail, and skewed t adds asymmetry. A misspecified distribution makes standard errors wrong and tail quantiles too low. With high-frequency data or in small samples, shape parameters may be estimated imprecisely. Value-at-Risk at low probabilities depends more on the distribution choice than on the volatility equation.

## Correlation Structure in DCC

DCC assumes that all pairs of assets share the same correlation dynamics, and that returns are conditionally Gaussian in the second stage. The two-stage estimator is consistent but not fully efficient, and standard errors should account for the first stage. The correlation process can only be stationary if the two parameters sum to less than 1. With many assets, sampling error in the unconditional correlation can bias the dynamics toward constancy. An abrupt shift in correlation, such as during a crisis, may be smoothed by this process and seen only with a delay.

## References

<a id="ref-BG1996a"></a>Bollerslev, T. and Ghysels, E. (1996). Periodic Autoregressive Conditional Heteroscedasticity. *Journal of Business & Economic Statistics* 14(2), 139–151. [doi:10.1080/07350015.1996.10524640](https://doi.org/10.1080/07350015.1996.10524640)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
