# Range-Based Volatility Estimation — Yang-Zhang

The **Yang-Zhang** tab offers the most general of the point estimators, robust to both drift and overnight gaps.

## What the Yang-Zhang Estimator Computes

`yang_zhang(O, H, L, C; trading_periods)` combines three variances: Vo, the sample variance of overnight returns; Vc, the sample variance of open-to-close returns; and Vrs, the Rogers-Satchell average. The total is Vo + k Vc + (1 - k) Vrs, with k = 0.34 / (1.34 + (m + 1) / (m - 1)) and m the number of daily returns. [Yang and Zhang (2000)](#ref-YZ2000a) chose that k to minimise sampling variance. The sample variances remove the means, so the estimate is independent of drift. Three observations are the minimum.

## How Much Precision Yang-Zhang Gains

Yang-Zhang is usually quoted as about 14 times as efficient as close-to-close, but that is the top of a range. A simulation of a driftless walk with a 30-day window gives a gain of about 7.5 when a fifth of the variance arises overnight, and about 3.5 when half does, since an overnight return gives only one number each day. The advantage therefore shrinks where gaps dominate. Precise opening prices also matter, because the estimator depends on a clean separation of overnight and intraday moves.

## References

<a id="ref-YZ2000a"></a>Yang, D. and Zhang, Q. (2000). Drift-Independent Volatility Estimation Based on High, Low, Open, and Close Prices. *Journal of Business* 73(3), 477–492. [doi:10.1086/209650](https://doi.org/10.1086/209650)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Close-to-Close](close-to-close.md)
