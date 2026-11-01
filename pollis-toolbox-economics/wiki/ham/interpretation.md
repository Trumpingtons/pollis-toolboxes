# Heterogeneous-Agent Models — Interpretation

Outputs speak to prices, to who holds what, and to how well households insure themselves.

## Reading the Equilibrium Interest Rate

**Equilibrium Interest Rate** reports the rate that clears the asset market. The gap below **rho (discount rate)** measures the strength of precautionary demand for the asset: more income risk or a tighter limit generally lowers the rate. [Huggett (1993)](#ref-Hug1993a) used that logic to address the low risk-free rate. In the production economy, a lower rate also means a higher capital stock and a higher wage, so precautionary saving has effects on output that it cannot have in a pure bond economy.

## Reading the Wealth Gini Coefficient

**Wealth Gini Coefficient** computes the Gini index of wealth above the borrowing limit, a minus phi, from the stationary distribution. The shift is needed because a standard Gini is not meaningful with negative wealth. A value depends on the location of the limit, so comparison across limits requires care. Models of this class tend to produce a lower Gini than wealth data, as the top tail of wealth is thin when the only source of heterogeneity is mean-reverting labour income, and no entrepreneurial or return heterogeneity exists.

## Reading Consumption Insurance

**Consumption Insurance** measures the pass-through of income shocks to consumption, d log c / d log y, averaged over the stationary distribution, in the spirit of [Blundell, Pistaferri and Preston (2008)](#ref-BPP2008a). A value of 0 means full insurance, and a value of 1 means no insurance at all. Pass-through is highest among households close to the limit and low among wealthy households, so the average hides a large gradient. The model's persistence of income affects the answer strongly: transitory shocks are easy to smooth with savings, whereas persistent ones are not.

## Reading Comparative Statics

Comparing stationary equilibria is the main use of the panel. Raising **sigma (income vol)** should raise saving, lower the rate and widen the wealth distribution. Raising **gamma (risk aversion)** raises precautionary saving. A looser **phi (borrowing limit)** raises the Huggett rate, since households have less need for buffers. These are comparisons of steady states, and they say nothing about the path between them. A change in a limit also shifts the wealth measure used for inequality, so an apparent change in the Gini can be partly mechanical.

## References

<a id="ref-BPP2008a"></a>Blundell, R., Pistaferri, L. and Preston, I. (2008). Consumption Inequality and Partial Insurance. *American Economic Review* 98(5), 1887–1921. [doi:10.1257/aer.98.5.1887](https://doi.org/10.1257/aer.98.5.1887)

<a id="ref-Hug1993a"></a>Huggett, M. (1993). The Risk-Free Rate in Heterogeneous-Agent Incomplete-Insurance Economies. *Journal of Economic Dynamics and Control* 17(5-6), 953–969. [doi:10.1016/0165-1889(93)90024-M](https://doi.org/10.1016/0165-1889(93)90024-M)

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
