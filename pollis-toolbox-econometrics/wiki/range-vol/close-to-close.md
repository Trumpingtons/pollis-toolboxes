# Range-Based Volatility Estimation — Close-to-Close

The **Close-to-Close** tab computes the classical historical volatility, which is the baseline for every efficiency comparison in the panel.

## What the Close-to-Close Estimator Computes

`close_to_close(C; trading_periods)` forms daily log returns r(t) = log(C(t) / C(t-1)), takes their sample variance with the mean removed and a divisor of n - 1, and multiplies by the periods per year before taking the square root. The default `trading_periods` of 1 returns daily volatility. At least two closes are required. Removing the mean makes the estimator robust to a constant drift. Over short windows, many practitioners instead assume a zero mean, since an estimated mean adds noise, and the panel's function always removes it.

## Why Close-to-Close Is Unbiased but Noisy

The estimator is unbiased for close-to-close variance under independent returns, and it naturally includes overnight moves, which range-based alternatives can miss. It uses one number from each day, however, so sampling error is large: the standard error of a volatility estimate is about 1 / sqrt(2n) of its value. A 30-day estimate therefore carries a standard error near 13%. [Merton (1980)](#ref-Mer1980a) points out that variances, unlike expected returns, are estimated better with finer sampling within a fixed period, which is what motivates using more of each day's prices.

## References

<a id="ref-Mer1980a"></a>Merton, R. C. (1980). On Estimating the Expected Return on the Market: An Exploratory Investigation. *Journal of Financial Economics* 8(4), 323–361. [doi:10.1016/0304-405X(80)90007-0](https://doi.org/10.1016/0304-405X(80)90007-0)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Parkinson](parkinson.md)
