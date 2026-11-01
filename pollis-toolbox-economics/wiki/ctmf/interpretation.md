# Continuous-Time Macro-Finance — Interpretation

The output links a preference and consumption calibration to prices. Reading the output means asking where the premium comes from.

## Reading the Wealth-Consumption Ratio

**Wealth-Consumption Ratio** plots p against expected growth, with the stationary density of mu for scale. With **psi (EIS)** above 1, the ratio rises with expected growth, since the substitution effect dominates: better prospects raise asset values. With psi below 1, the ratio falls. Slope determines how much asset values react to growth news. A steep curve means a volatile claim and therefore a large long-run risk premium. Only the part of the curve where the density has mass is economically relevant, so edges of the plot should be read lightly.

## Reading the Risk Premium

**Risk Premium** plots the conditional excess return on the consumption claim, split into short-run and long-run risk. The short-run part is gamma sigma^2, as under power utility. The long-run part comes from growth news, priced at (gamma psi - 1) / (psi - 1) times the volatility of p, and multiplied by that volatility again. A long-run part much larger than the short-run part shows the mechanism at work. With constant volatility, both parts change little with the state, and the variation that exists comes from the curve's shape.

## Reading Sharpe Ratios

**Sharpe Ratio** reports the Sharpe ratio of the consumption claim and the maximum Sharpe ratio, also called the market price of risk, against the power-utility benchmark gamma sigma. A maximum well above the benchmark is the main achievement of recursive preferences: it reconciles a high price of risk with smooth consumption without assuming extreme risk aversion. The claim's own Sharpe ratio is below the maximum, because that claim is not perfectly correlated with the stochastic discount factor. Equity data suggest that a high market price of risk is needed.

## Reading Asset Pricing Moments

**Asset Pricing Moments** gives unconditional moments of the consumption claim, weighted by the stationary density of expected growth. The risk-free rate falls with psi through intertemporal substitution and also with precautionary saving, while the wealth-consumption ratio has a magnitude that can be compared with aggregate wealth data, where the wealth measure is broad. Habit models, as in [Campbell and Cochrane (1999)](#ref-CC1999a), aim at many of the same moments by a different mechanism, so reaching a target does not prove that long-run risk is the true explanation.

## References

<a id="ref-CC1999a"></a>Campbell, J. Y. and Cochrane, J. H. (1999). By Force of Habit: A Consumption-Based Explanation of Aggregate Stock Market Behavior. *Journal of Political Economy* 107(2), 205–251. [doi:10.1086/250059](https://doi.org/10.1086/250059)

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
