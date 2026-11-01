# Range-Based Volatility Estimation — Parkinson

The **Parkinson** tab uses only the daily range, and it was the first estimator of its kind.

## What the Parkinson Estimator Computes

`parkinson(H, L; trading_periods)` averages the squared log range and divides by 4 log 2: variance = sum of log(H(t) / L(t))^2 / (4 n log 2). The constant comes from the expected squared range of a Brownian motion with no drift, as shown by [Parkinson (1980)](#ref-Par1980a). A wide range signals high volatility even when a stock closes where it opened, which close-to-close would record as a quiet day. The open and the close are ignored altogether, so data requirements are minimal.

## When the Parkinson Estimator Fails

Parkinson needs a market with little drift and no overnight gap, which makes currencies and crypto its natural home. A trend inflates the range, so a strong intraday move looks like high volatility. On an exchange that closes overnight, moves between sessions never enter the range, and the estimate understates full-day variance, sometimes considerably. Discrete trading works the other way, narrowing the range slightly and biasing the estimate downward. Efficiency relative to close-to-close is usually quoted near 5, under those ideal conditions only.

## References

<a id="ref-Par1980a"></a>Parkinson, M. (1980). The Extreme Value Method for Estimating the Variance of the Rate of Return. *Journal of Business* 53(1), 61–65. [doi:10.1086/296071](https://doi.org/10.1086/296071)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Close-to-Close](close-to-close.md)
