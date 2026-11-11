# Decision Guide

The choice turns on two questions: whether expected returns can be trusted, and whether variance describes the risk that matters. Pick a tab and objective from them, then let the out-of-sample Next Steps decide between close options.

## Which Portfolio Optimisation Tab Suits Which Data

| Situation | Tab | Why |
|---|---|---|
| Reliable estimates of means and covariances | **Mean-Variance** | The classic trade-off between return and variance |
| Fat tails or asymmetric returns | **Mean-Expected Shortfall** | Controls the average loss on the worst days |
| Many correlated assets, a noisy covariance | **HRP** | No inversion of the covariance matrix, and no expected returns |
| Clustered assets, with risk to balance across clusters | **HERC** | Equal risk contribution across and within clusters |
| Unclear | **Compare Methods** | Scores every method on the same held-out returns |

## Which Objective Suits the First Two Tabs

| Belief about expected returns | **Objective** | Note |
|---|---|---|
| No useful estimate | **Minimum Risk** | Uses only the risk measure |
| Estimates worth using | **Maximum Risk-Adjusted Return** | The Sharpe ratio on **Mean-Variance**, the STARR ratio on **Mean-Expected Shortfall** |
| Estimates worth using, with a stated tolerance for risk | **Maximum Utility** | Maximises E[r] - l * risk, with l from **Risk Aversion (l)** |

[DeMiguel, Garlappi and Uppal (2009)](#ref-DGU2009a) give estimation windows of thousands of months before sample means improve on 1/N, so **Minimum Risk** is the usual start.

## How to Set Risk Aversion and the Tail Probability

**Risk Aversion (l)** applies to daily returns, and only under **Maximum Utility**. Larger values give more conservative portfolios, closer to the minimum-risk one, and smaller values move towards the highest-return asset. Try a few values and watch how the weights change on **Weights Bar Chart**. **Expected Shortfall Tail Probability (alpha)** sets the share of worst days averaged: 0.05 averages the worst 5%. A smaller alpha looks further into the tail but rests on fewer days, so with 1,000 days, alpha = 0.01 averages only 10 of them.

## How to Choose Between Close Methods

| Evidence | Reading |
|---|---|
| **vs Equal Weight** with \|z\| above 1.96 | The method and 1/N differ in Sharpe ratio at the 5% level |
| **vs Equal Weight** with \|z\| below 1.96 | No evidence that the method beats, or loses to, 1/N |
| **Compare Methods**, gaps well inside about 2 SE | Not evidence of a better method |
| Similar Sharpe ratios, different drawdowns or volatility | Choose by the risk that matters to the investor |

## References

<a id="ref-DGU2009a"></a>DeMiguel, V., Garlappi, L. and Uppal, R. (2009). Optimal versus naive diversification: how inefficient is the 1/N portfolio strategy? *Review of Financial Studies* 22(5), 1915–1953. [doi:10.1093/rfs/hhm075](https://doi.org/10.1093/rfs/hhm075)

## See Also

- [Overview](overview.md) · [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Out-of-Sample Evaluation](out-of-sample.md)
