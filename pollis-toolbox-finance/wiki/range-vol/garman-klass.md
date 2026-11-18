# Range-Based Volatility Estimation — Garman-Klass

The **Garman-Klass** tab adds the open and the close to the range, giving an efficient estimator for a market with no drift and no gaps.

## What the Garman-Klass Estimator Computes

`garman_klass(O, H, L, C; trading_periods)` averages 0.5 log(H / L)^2 - (2 log 2 - 1) log(C / O)^2 across days, the practical form of the estimator derived by [Garman and Klass (1980)](#ref-GK1980a). The second term subtracts part of the open-to-close move, which removes noise from the range because a large net move already explains part of a wide range. Individual daily terms and even the average can occasionally be negative, so the implementation floors the average variance at zero before taking the square root.

## When the Garman-Klass Estimator Fails

Garman-Klass shares its assumptions with Parkinson: zero drift, continuous prices and no overnight jump. The drift adds bias, which is usually small at daily frequency except for strongly trending series. Overnight moves are the larger problem, because the opening price already reflects them, and the estimator measures only the session. Its theoretical efficiency is usually quoted at about 7.4. When an asset trades on an exchange that closes, the fix is **GK-Yang-Zhang**, and when a trend is also present, **Yang-Zhang**.

## References

<a id="ref-GK1980a"></a>Garman, M. B. and Klass, M. J. (1980). On the Estimation of Security Price Volatilities from Historical Data. *Journal of Business* 53(1), 67–78. [doi:10.1086/296072](https://doi.org/10.1086/296072)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Close-to-Close](close-to-close.md)
