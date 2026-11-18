# Mean-Expected Shortfall

Mean-Expected Shortfall optimisation replaces variance with the Expected Shortfall, the average loss on the worst days. The tab minimises it, or trades it against expected return, using the observed days of **Returns Matrix (R)** as equally likely scenarios.

## What the Expected Shortfall Measures

The Expected Shortfall at a tail probability alpha is the average of the losses on the worst alpha share of days. [Acerbi and Tasche (2002)](#ref-AT2002a) describe it as the average of the 100p% worst losses and show that it is a coherent risk measure, unlike the value-at-risk, which is only the threshold of the tail. [Rockafellar and Uryasev (2000)](#ref-RU2000a) call the same quantity, for continuous distributions, the conditional value-at-risk, and show that a low value implies a low value-at-risk as well. With **Expected Shortfall Tail Probability (alpha)** at 0.05, the measure averages the worst 5% of daily returns.

## What Mean-Expected Shortfall Computes

[Rockafellar and Uryasev (2000)](#ref-RU2000a) showed that minimising the conditional value-at-risk over the weights comes down to linear programming when the distribution is given by scenarios, here the T observed days. The tab solves that problem with weights between 0 and 1 adding up to 1. **Minimum Risk** minimises the Expected Shortfall. **Maximum Risk-Adjusted Return** maximises the STARR ratio, excess return per unit of Expected Shortfall. **Maximum Utility** maximises E[r] - l * Expected Shortfall. The tab prints the solver status, the weights and the in-sample daily Expected Shortfall of the portfolio.

## How the Mean-Expected Shortfall Tab Is Set Up

| Input | Default | Role |
|---|---|---|
| **Returns Matrix (R)** | `R` | Daily returns, used as equally likely scenarios |
| **Objective** | **Minimum Risk** | Which portfolio to return |
| **Risk Aversion (l)** | 2 | Weight on Expected Shortfall under **Maximum Utility** |
| **Expected Shortfall Tail Probability (alpha)** | 0.05 | Share of worst days averaged |
| **Risk-Free Rate (Annual)** | 0.02 | rf in the STARR ratio, as rf / 252 a day |

## Where Mean-Expected Shortfall Works Well

The Expected Shortfall looks only at the losses in the tail, so it suits returns with fat tails or skewness, where two portfolios of equal variance can lose very different amounts on bad days. The scenario form needs no assumption on the distribution: the worst days in the sample are used as they are. With **Minimum Risk**, the tab, like minimum variance, needs no estimate of expected returns.

## Where Mean-Expected Shortfall Misleads

The tail is estimated from few days. With 1,000 days and alpha = 0.05, the measure rests on 50 of them, and a different sample with other crashes can change the weights. A smaller alpha looks further into the tail with even fewer days. The worst days of the past may not resemble those to come, and losses larger than any in the sample are not represented. **Maximum Risk-Adjusted Return** and **Maximum Utility** add the error of the sample means, as on the [Mean-Variance](mean-variance.md) tab.

## References

<a id="ref-AT2002a"></a>Acerbi, C. and Tasche, D. (2002). Expected shortfall: a natural coherent alternative to value at risk. *Economic Notes* 31(2), 379–388. [doi:10.1111/1468-0300.00091](https://doi.org/10.1111/1468-0300.00091)

<a id="ref-RU2000a"></a>Rockafellar, R. T. and Uryasev, S. (2000). Optimization of conditional value-at-risk. *Journal of Risk* 2(3), 21–41. [doi:10.21314/JOR.2000.038](https://doi.org/10.21314/JOR.2000.038)

## See Also

- [Mean-Variance](mean-variance.md) · [HRP](hrp.md) · [HERC](herc.md) · [Decision Guide](decision-guide.md)
