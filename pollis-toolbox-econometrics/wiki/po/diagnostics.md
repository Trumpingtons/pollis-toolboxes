# Diagnostics

The diagnostics check whether the data supports the method chosen and whether the weights are stable enough to use. None of them uses held-out returns; [Out-of-Sample Evaluation](out-of-sample.md) covers those.

## How to Check the Cluster Structure

**Correlation Heatmap** shows the N x N sample correlation matrix, blue for positive and red for negative correlations. Blocks of high correlation along the diagonal are clusters, which **HRP** and **HERC** rely on: with clear blocks, the tree they build groups the assets in a way that can be checked against sectors or asset classes. With uniform correlations there is little structure to use, and the hierarchical weights come mostly from the variances. Negative correlations are where diversification is strongest, and **Mean-Variance** under **Minimum Risk** tends to hold both assets of such a pair.

## How to Check Whether Risk-Adjusted Returns Are Stable

**Rolling Sharpe Ratio** applies the full-sample weights to the data and plots the annualised Sharpe ratio over a moving window of 126 days, about six months. A line that changes sign or swings widely shows that the in-sample ratio depends on a few periods. The weights were chosen on the same days that are plotted, so the line shows stability, not performance an investor could have had; the panel prints a reminder of this.

## How to Check Risk Concentration

**Risk Contribution** splits portfolio risk among the assets by the Euler decomposition, each asset contributing its weight times the derivative of risk with respect to that weight, so that the contributions add up to the total risk. [Roncalli (2013)](#ref-Ron2013a) treats this decomposition and the risk budgeting built on it. The chart sets each asset's share of risk against its share of capital. Large gaps between the two show that a small weight can still carry much of the risk, as volatile or highly correlated assets do.

## How to Check Weight Concentration

**Portfolio Weights** lists the weights from largest to smallest and gives the effective number of assets, the inverse of the sum of squared weights. It equals N for equal weights and 1 for a portfolio in a single asset. A value much below N means that a few assets dominate, which is typical of **Maximum Risk-Adjusted Return** with sample means. The count of assets with a weight below 0.1% shows how many have been dropped in practice.

## References

<a id="ref-Ron2013a"></a>Roncalli, T. (2013). *Introduction to Risk Parity and Budgeting*. CRC Press. [crcpress.com](https://www.crcpress.com/Introduction-to-Risk-Parity-and-Budgeting/Roncalli/p/book/9781482207156)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Out-of-Sample Evaluation](out-of-sample.md) · [Decision Guide](decision-guide.md)
