# Assumptions

Every tab estimates its inputs from the rows of **Returns Matrix (R)** and treats those estimates as if they held in the future. The assumptions below concern the data, the estimates and the constraints on the weights.

## What the Returns Matrix Must Contain

**Returns Matrix (R)** is a T x N matrix of daily simple returns: T trading days in rows, N assets in columns, with no missing values. Prices must be turned into returns first, as (P_t - P_(t-1)) / P_(t-1). Log returns are close for small daily moves, but the panel's wealth paths compound simple returns, as the product of 1 + r. Annualised figures multiply daily means by 252 and daily volatilities by the square root of 252, so data at another frequency gives wrong annual figures. The walk-forward Next Steps need more than 504 + 63 rows, two years of training and one quarter held out.

## Which Distribution the Tabs Assume

The tabs fit no distribution. **Mean-Variance** uses the sample mean and covariance, and **Mean-Expected Shortfall** uses the observed days themselves as equally likely scenarios. Both assume that the past days are representative of those to come: that means, volatilities and correlations do not shift between the estimation window and the holding period. **HRP** and **HERC** need the same stability for the correlations and variances they cluster and weight, but not for the means, which they do not use.

## Why Expected Returns Are the Weakest Input

**Maximum Risk-Adjusted Return** and **Maximum Utility** depend on the sample mean of each asset, which is estimated far less precisely than its variance. [DeMiguel, Garlappi and Uppal (2009)](#ref-DGU2009a) estimate that an estimation window of about 3000 months would be needed for the sample-based mean-variance strategy to beat 1/N with 25 assets, and about 6000 months with 50. **Minimum Risk**, **HRP** and **HERC** do not use expected returns, and so they avoid this source of error.

## Which Constraints the Weights Satisfy

All four tabs give long-only, fully invested weights: no short positions, no leverage, and weights adding up to 1. There are no limits on single weights, sectors or turnover, and no transaction costs, so a weight can be 0 or close to 100%. The optimiser solves each problem with `Clarabel.jl`, and the Mean-Variance and Mean-Expected Shortfall tabs print the solver status, which should read success before the weights are used.

## References

<a id="ref-DGU2009a"></a>DeMiguel, V., Garlappi, L. and Uppal, R. (2009). Optimal versus naive diversification: how inefficient is the 1/N portfolio strategy? *Review of Financial Studies* 22(5), 1915–1953. [doi:10.1093/rfs/hhm075](https://doi.org/10.1093/rfs/hhm075)

## See Also

- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Out-of-Sample Evaluation](out-of-sample.md) · [Decision Guide](decision-guide.md)
