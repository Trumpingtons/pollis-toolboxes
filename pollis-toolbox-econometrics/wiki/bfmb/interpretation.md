# Fama-MacBeth Regression — Interpretation

A risk premium is the compensation for one unit of beta. Reading one well means looking at its units, its interval and its identification together.

## What a Risk Premium Means

An estimated premium says that an asset with one more unit of beta on the factor has earned that much extra return per period, on average, at given exposures to the other factors. In this panel the input is in percent per month, so a premium of 0.5 is half a percent per month. **Interval Estimates** annualises the figure. Comparison with the factor's own mean is a useful check when the factor is a traded portfolio: pricing theory says the two should be close, and a large gap signals that the test assets do not span the factor well.

## Reading Interval Estimates and Significance

**Interval Estimates** gives the 95% credible interval in the Bayesian tab or the 95% confidence interval in the Classical tab, and notes whether each excludes zero. **Risk Premium Significance** reports the posterior probability of a positive premium or the two-sided p-value. These numbers answer different questions. The posterior probability speaks directly about the premium, given the model, whereas the p-value speaks about the data under a zero premium. A wide posterior centred on a positive number is not evidence of pricing, and a credible interval spanning zero is the honest answer when identification is poor.

## Reading Implied Expected Returns

**Implied Expected Returns** shows the premium of each test asset implied by its betas and the estimated factor premia, next to its realised mean. **Expected Return Bands** adds a 90% band from the uncertainty about the premia, given the estimated betas. Those implied returns describe the cross-section over the sample and are not a return forecast for next month. They are useful for costs of capital, and for spotting assets that the model misprices. The band excludes uncertainty about betas themselves, so it gives a lower bound on the true uncertainty about any given asset.

## Reading OLS and GLS Differences

**OLS vs GLS** sets risk premia, t-statistics and adjusted R2 under both weighting schemes. OLS asks about fit across the given portfolios and treats them equally. GLS asks about fit relative to the tangency portfolio and is the more efficient estimator when the model is correct, since it weights assets by the inverse residual covariance. A factor whose premium survives only under one of them deserves some doubt. With a misspecified model, the two estimators target different quantities, so disagreement is itself evidence of misspecification and should not simply be resolved by choosing the more favourable number.

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
