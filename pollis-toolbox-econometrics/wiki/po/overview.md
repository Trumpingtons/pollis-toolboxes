# Overview

Portfolio optimisation turns estimates about assets into weights. The estimates are the inputs that matter most: weights that are best for the estimated means and covariances can be far from best for the true ones, and the panel's Next Steps are built to show how far.

## What Portfolio Optimisation Tries to Achieve

[Markowitz (1952)](#ref-Mar1952a) framed the choice of a portfolio as a trade-off between expected return and variance. A portfolio is efficient when no other has a higher expected return for the same variance, or a lower variance for the same expected return. The set of efficient portfolios is the efficient frontier, and an investor picks a point on it according to how much risk they accept. [Markowitz (1991)](#ref-Mar1991a) develops the method at book length. The **Mean-Variance** tab computes points on this frontier, and **Efficient Frontier** draws it.

## Why Variance Is Not the Only Risk Measure

Variance counts gains and losses alike and summarises a whole distribution in one number. Returns with fat tails or skewness can have the same variance and very different losses on bad days. [Rockafellar and Uryasev (2000)](#ref-RU2000a) showed how to minimise the conditional value-at-risk, the expected loss beyond the value-at-risk, by linear programming. [Acerbi and Tasche (2002)](#ref-AT2002a) showed that the Expected Shortfall, the average of the 100p% worst losses, is a coherent risk measure. The **Mean-Expected Shortfall** tab uses it in place of variance.

## Why Optimised Weights Can Disappoint

Means and covariances are estimated with error, and an optimiser puts the most weight where the estimates look best, which is often where the errors are largest. [Black and Litterman (1992)](#ref-BL1992a) describe quantitative allocation models as difficult to use and prone to badly behaved portfolios. [DeMiguel, Garlappi and Uppal (2009)](#ref-DGU2009a) found that none of 14 models was consistently better than equal weights, 1/N, in Sharpe ratio, certainty-equivalent return or turnover. The [Out-of-Sample Evaluation](out-of-sample.md) page describes how the panel checks this.

## How Hierarchical Methods Avoid Expected Returns

[Lopez de Prado (2016)](#ref-Pra2016a) proposed Hierarchical Risk Parity, which uses graph theory and machine learning on the correlations, needs no inversion of the covariance matrix and works even when it is singular. In Monte Carlo experiments it gave lower out-of-sample variance than the critical line algorithm. [Raffinot (2018)](#ref-Raf2018a) proposed Hierarchical Equal Risk Contribution, which uses the shape of the tree to form clusters and follows the Equal Risk Contribution idea covered by [Roncalli (2013)](#ref-Ron2013a). The **HRP** and **HERC** tabs compute them.

## References

<a id="ref-AT2002a"></a>Acerbi, C. and Tasche, D. (2002). Expected shortfall: a natural coherent alternative to value at risk. *Economic Notes* 31(2), 379–388. [doi:10.1111/1468-0300.00091](https://doi.org/10.1111/1468-0300.00091)

<a id="ref-BL1992a"></a>Black, F. and Litterman, R. (1992). Global portfolio optimization. *Financial Analysts Journal* 48(5), 28–43. [doi:10.2469/faj.v48.n5.28](https://doi.org/10.2469/faj.v48.n5.28)

<a id="ref-DGU2009a"></a>DeMiguel, V., Garlappi, L. and Uppal, R. (2009). Optimal versus naive diversification: how inefficient is the 1/N portfolio strategy? *Review of Financial Studies* 22(5), 1915–1953. [doi:10.1093/rfs/hhm075](https://doi.org/10.1093/rfs/hhm075)

<a id="ref-Pra2016a"></a>Lopez de Prado, M. (2016). Building diversified portfolios that outperform out of sample. *Journal of Portfolio Management* 42(4), 59–69. [doi:10.3905/jpm.2016.42.4.059](https://doi.org/10.3905/jpm.2016.42.4.059)

<a id="ref-Mar1952a"></a>Markowitz, H. M. (1952). Portfolio selection. *Journal of Finance* 7(1), 77–91. [doi:10.2307/2975974](https://doi.org/10.2307/2975974)

<a id="ref-Mar1991a"></a>Markowitz, H. M. (1991). *Portfolio Selection: Efficient Diversification of Investments*, 2nd edition. Wiley. [wiley.com](https://www.wiley.com/en-us/Portfolio+Selection%3A+Efficient+Diversification+of+Investments%2C+2nd+Edition-p-9781557861085)

<a id="ref-Raf2018a"></a>Raffinot, T. (2018). The hierarchical equal risk contribution portfolio. SSRN working paper. [doi:10.2139/ssrn.3237540](https://doi.org/10.2139/ssrn.3237540)

<a id="ref-RU2000a"></a>Rockafellar, R. T. and Uryasev, S. (2000). Optimization of conditional value-at-risk. *Journal of Risk* 2(3), 21–41. [doi:10.21314/JOR.2000.038](https://doi.org/10.21314/JOR.2000.038)

<a id="ref-Ron2013a"></a>Roncalli, T. (2013). *Introduction to Risk Parity and Budgeting*. CRC Press. [crcpress.com](https://www.crcpress.com/Introduction-to-Risk-Parity-and-Budgeting/Roncalli/p/book/9781482207156)

## See Also

- [Factsheet](factsheet.md) · [Assumptions](assumptions.md) · [Decision Guide](decision-guide.md) · [Out-of-Sample Evaluation](out-of-sample.md)
