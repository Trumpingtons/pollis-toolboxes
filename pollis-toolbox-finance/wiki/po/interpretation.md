# Interpretation

The weights are the main output, and everything else describes them. Figures computed on the data used to choose the weights describe the fit, not what the weights will earn.

## How to Read the Portfolio Weights

Each tab prints one weight per asset, in percent, adding up to 100. The weights are long-only, so a weight of 0 means that the asset is left out, not shorted. **Weights Bar Chart** draws them beside the equal weight, 100 / N, as a dashed line, which shows at a glance how far a method moves from 1/N. Under **Minimum Risk**, low-volatility assets and those with low correlations to the rest receive most of the weight. Under **Maximum Risk-Adjusted Return**, assets with the highest sample mean per unit of risk do.

## How to Read the Efficient Frontier

**Efficient Frontier** plots annualised mean return against annualised volatility for 30 portfolios of minimum variance at rising return floors. The left end is the minimum-variance portfolio and the upper end the highest-return one. The capital market line starts at the risk-free rate and touches the frontier at the maximum Sharpe portfolio, the tangency portfolio. Single assets lie to the right of the curve, and the current portfolio is marked with a star. The frontier is computed in-sample, from sample means, so it is the frontier of the data, not of the assets' true distributions.

## How to Read Expected Risk and Return

**Expected Risk & Return** gives the annualised expected return, the annualised volatility, the annualised Sharpe ratio and the daily Expected Shortfall at 5% of the portfolio. The Expected Shortfall is the average loss on the worst 5% of days, as a positive percentage. All four are computed on the data used to choose the weights, as the panel says. With the simulated default, the panel also prints the true expected return of the weights, from the means used to simulate the data, so that the gap between the in-sample estimate and the true value can be seen.

## How to Read the Risk Contribution Chart

**Risk Contribution** sets each asset's share of total risk against its share of capital. Under **HERC**, clusters carry similar shares of risk by construction, so the bars are close at the level of clusters but not of single assets. Under **Minimum Risk** with **Mean-Variance**, the assets held have equal marginal contributions to risk, as [Roncalli (2013)](#ref-Ron2013a) shows for the minimum-variance portfolio, so their shares of risk follow their weights. Large bars on small weights point to assets whose risk the portfolio depends on more than the weights suggest.

## References

<a id="ref-Ron2013a"></a>Roncalli, T. (2013). *Introduction to Risk Parity and Budgeting*. CRC Press. [crcpress.com](https://www.crcpress.com/Introduction-to-Risk-Parity-and-Budgeting/Roncalli/p/book/9781482207156)

## See Also

- [Diagnostics](diagnostics.md) · [Out-of-Sample Evaluation](out-of-sample.md) · [Decision Guide](decision-guide.md)
