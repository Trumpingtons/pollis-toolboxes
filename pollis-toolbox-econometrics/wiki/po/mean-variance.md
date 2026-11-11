# Mean-Variance

Mean-variance optimisation chooses weights by expected return and variance alone, after [Markowitz (1952)](#ref-Mar1952a). The tab computes the minimum-variance, the maximum Sharpe or the maximum utility portfolio from the sample mean and covariance of **Returns Matrix (R)**.

## What Mean-Variance Computes

With mean returns mu, covariance Sigma and weights w, a portfolio has expected return w'mu and variance w'Sigma w. [Markowitz (1952)](#ref-Mar1952a) calls a portfolio efficient when no other has higher expected return for the same variance, or lower variance for the same return. The tab finds one efficient portfolio, chosen by **Objective**, with weights between 0 and 1 adding up to 1. **Minimum Risk** minimises w'Sigma w. **Maximum Risk-Adjusted Return** maximises the Sharpe ratio, (w'mu - rf) / sqrt(w'Sigma w), the tangency portfolio. **Maximum Utility** maximises w'mu - l * w'Sigma w.

## How the Mean-Variance Tab Is Set Up

| Input | Default | Role |
|---|---|---|
| **Returns Matrix (R)** | `R` | Daily returns, from which the sample mean and covariance are estimated |
| **Objective** | **Minimum Risk** | Which efficient portfolio to return |
| **Risk Aversion (l)** | 2 | Weight on variance under **Maximum Utility** |
| **Risk-Free Rate (Annual)** | 0.02 | rf in the Sharpe ratio, as rf / 252 a day |

The tab prints the solver status and the weights in percent.

## Where Mean-Variance Works Well

Mean-variance weights suit returns close to normal, where variance describes risk well, and samples long enough for stable estimates of the covariance. **Minimum Risk** needs only the covariance, which is estimated far more precisely than the means, and so it is the most robust of the three objectives. [Markowitz (1991)](#ref-Mar1991a) develops the method, including the computation of the whole efficient frontier, which **Efficient Frontier** draws.

## Where Mean-Variance Misleads

Sample means carry large errors, and **Maximum Risk-Adjusted Return** puts the most weight where the means look highest. [Black and Litterman (1992)](#ref-BL1992a) report that such models produce badly behaved portfolios, and propose starting from equilibrium returns instead, tilted by views held with a stated confidence. [DeMiguel, Garlappi and Uppal (2009)](#ref-DGU2009a) found sample-based mean-variance weights no better than 1/N out of sample. Variance also treats gains and losses alike, so fat tails are not penalised beyond their effect on variance.

## What to Compare Mean-Variance With

| Alternative | When |
|---|---|
| [Mean-Expected Shortfall](mean-expected-shortfall.md) | Losses on the worst days matter more than variance |
| [HRP](hrp.md) | The covariance is noisy or close to singular |
| **vs Equal Weight** | Always, to see whether optimisation adds anything out of sample |

## References

<a id="ref-BL1992a"></a>Black, F. and Litterman, R. (1992). Global portfolio optimization. *Financial Analysts Journal* 48(5), 28–43. [doi:10.2469/faj.v48.n5.28](https://doi.org/10.2469/faj.v48.n5.28)

<a id="ref-DGU2009a"></a>DeMiguel, V., Garlappi, L. and Uppal, R. (2009). Optimal versus naive diversification: how inefficient is the 1/N portfolio strategy? *Review of Financial Studies* 22(5), 1915–1953. [doi:10.1093/rfs/hhm075](https://doi.org/10.1093/rfs/hhm075)

<a id="ref-Mar1952a"></a>Markowitz, H. M. (1952). Portfolio selection. *Journal of Finance* 7(1), 77–91. [doi:10.2307/2975974](https://doi.org/10.2307/2975974)

<a id="ref-Mar1991a"></a>Markowitz, H. M. (1991). *Portfolio Selection: Efficient Diversification of Investments*, 2nd edition. Wiley. [wiley.com](https://www.wiley.com/en-us/Portfolio+Selection%3A+Efficient+Diversification+of+Investments%2C+2nd+Edition-p-9781557861085)

## See Also

- [Mean-Expected Shortfall](mean-expected-shortfall.md) · [HRP](hrp.md) · [HERC](herc.md) · [Decision Guide](decision-guide.md)
