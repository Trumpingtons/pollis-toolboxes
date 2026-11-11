# HRP

Hierarchical Risk Parity, proposed by [Lopez de Prado (2016)](#ref-Pra2016a), allocates by risk along a tree of the assets built from their correlations. The tab uses no expected returns and does not invert the covariance matrix.

## What HRP Computes

[Lopez de Prado (2016)](#ref-Pra2016a) builds the portfolio in three steps. Tree clustering groups the assets by a distance derived from their correlations, so that the most correlated assets join first. Quasi-diagonalisation reorders the covariance matrix along the tree, putting similar assets next to each other. Recursive bisection then splits the ordered list in two, again and again, and divides the weight between the two halves in inverse proportion to their risk. Assets in a risky half share less capital. On the tab, risk is measured by variance.

## How the HRP Tab Is Set Up

| Input | Default | Role |
|---|---|---|
| **Returns Matrix (R)** | `R` | Daily returns, from which correlations and variances are estimated |
| **Risk-Free Rate (Annual)** | 0.02 | Used only by the Next Steps that compute Sharpe ratios |

The tab has no **Objective**: HRP returns one portfolio. It prints the weights in percent.

## Where HRP Works Well

According to [Lopez de Prado (2016)](#ref-Pra2016a), HRP works even when the covariance matrix is ill-conditioned or singular, since it requires no inversion, and in Monte Carlo experiments its portfolios had lower out-of-sample variance than those of the critical line algorithm. It suits many correlated assets with a noisy covariance, and data with a clear cluster structure, which **Correlation Heatmap** shows as blocks along the diagonal.

## Where HRP Misleads

HRP ignores expected returns, so it cannot prefer an asset for its return, and it does not aim at the minimum variance of the whole portfolio. The bisection splits the ordered list in halves by position, which need not follow the clusters of the tree; [Raffinot (2018)](#ref-Raf2018a) uses the shape of the tree instead in [HERC](herc.md). The tree comes from sample correlations, and with uniform correlations its shape, and so the weights, can change from one sample to the next.

## What to Compare HRP With

| Alternative | When |
|---|---|
| [HERC](herc.md) | Clusters of different sizes, with risk to balance across them |
| [Mean-Variance](mean-variance.md) under **Minimum Risk** | The covariance is well estimated |
| **Inverse Vol** and **Equal Weight** in **Compare Methods** | To see whether the tree adds anything to simple rules |

## References

<a id="ref-Pra2016a"></a>Lopez de Prado, M. (2016). Building diversified portfolios that outperform out of sample. *Journal of Portfolio Management* 42(4), 59–69. [doi:10.3905/jpm.2016.42.4.059](https://doi.org/10.3905/jpm.2016.42.4.059)

<a id="ref-Raf2018a"></a>Raffinot, T. (2018). The hierarchical equal risk contribution portfolio. SSRN working paper. [doi:10.2139/ssrn.3237540](https://doi.org/10.2139/ssrn.3237540)

## See Also

- [HERC](herc.md) · [Mean-Variance](mean-variance.md) · [Mean-Expected Shortfall](mean-expected-shortfall.md) · [Decision Guide](decision-guide.md)
