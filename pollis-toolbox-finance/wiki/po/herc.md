# HERC

Hierarchical Equal Risk Contribution, proposed by [Raffinot (2018)](#ref-Raf2018a), cuts the tree of the assets into clusters and gives each cluster an equal share of risk. Like [HRP](hrp.md), the tab uses no expected returns.

## What HERC Computes

[Raffinot (2018)](#ref-Raf2018a) merges two earlier ideas: Hierarchical Clustering-Based Asset Allocation and the top-down recursive bisection of [HRP](hrp.md). The assets are first grouped into a tree by their correlations. The shape of the tree, its dendrogram, then sets the clusters, so that the splits follow the groups of assets and not their positions in an ordered list. Weight is passed down the tree so that clusters contribute equally to risk, following the Equal Risk Contribution approach that [Roncalli (2013)](#ref-Ron2013a) treats. On the tab, variance measures risk both across and within clusters.

## How the HERC Tab Is Set Up

| Input | Default | Role |
|---|---|---|
| **Returns Matrix (R)** | `R` | Daily returns, from which correlations and variances are estimated |
| **Risk-Free Rate (Annual)** | 0.02 | Used only by the Next Steps that compute Sharpe ratios |

The tab has no **Objective**: HERC returns one portfolio. It prints the weights in percent.

## Where HERC Works Well

HERC suits assets that fall into clear groups, such as sectors or asset classes, when each group should carry a similar share of risk whatever its number of assets. [Raffinot (2018)](#ref-Raf2018a) extends the method to downside risk measures, the conditional value-at-risk and the conditional drawdown at risk, and reports that the downside-risk versions give better risk-adjusted performance. **Risk Contribution** shows whether the clusters carry similar shares of risk.

## Where HERC Misleads

The clusters come from sample correlations, so with weak or uniform correlations they are not well defined and can change between samples, and the weights with them. Equal risk across clusters is a choice, not an optimum: a cluster of poor assets still receives its share of risk. HERC ignores expected returns, like [HRP](hrp.md). The tab measures risk by variance, so its weights are those of the variance version, not of the downside versions in [Raffinot (2018)](#ref-Raf2018a).

## What to Compare HERC With

| Alternative | When |
|---|---|
| [HRP](hrp.md) | To see whether the clusters change the weights |
| [Mean-Expected Shortfall](mean-expected-shortfall.md) | Tail losses are the risk that matters |
| **Equal Weight** in **Compare Methods** | To see whether the tree adds anything to 1/N |

## References

<a id="ref-Raf2018a"></a>Raffinot, T. (2018). The hierarchical equal risk contribution portfolio. SSRN working paper. [doi:10.2139/ssrn.3237540](https://doi.org/10.2139/ssrn.3237540)

<a id="ref-Ron2013a"></a>Roncalli, T. (2013). *Introduction to Risk Parity and Budgeting*. CRC Press. [crcpress.com](https://www.crcpress.com/Introduction-to-Risk-Parity-and-Budgeting/Roncalli/p/book/9781482207156)

## See Also

- [HRP](hrp.md) · [Mean-Variance](mean-variance.md) · [Mean-Expected Shortfall](mean-expected-shortfall.md) · [Decision Guide](decision-guide.md)
