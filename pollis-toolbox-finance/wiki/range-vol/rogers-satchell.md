# Range-Based Volatility Estimation — Rogers-Satchell

The **Rogers-Satchell** tab removes the sensitivity to drift that affects the earlier range estimators.

## What the Rogers-Satchell Estimator Computes

`rogers_satchell(O, H, L, C; trading_periods)` averages log(H / C) log(H / O) + log(L / C) log(L / O) across days, as proposed by [Rogers and Satchell (1991)](#ref-RS1991a). Each factor measures distance from an extreme to the open or to the close, and the product form makes the expected value independent of a constant drift. A steady trend therefore does not inflate the estimate, which is the main advantage over Parkinson and Garman-Klass. Each daily term is non-negative whenever the row is consistent, since the high is at or above both the open and the close.

## When the Rogers-Satchell Estimator Fails

The estimator still ignores overnight variation, so it understates full-day volatility on an exchange that closes. Discrete trading can also bias it downward, since the recorded extremes are inside the true ones. A commonly quoted efficiency of about 8 is optimistic: a simulation of a driftless continuous walk gives about 6, which is below Garman-Klass under that specific case. Choosing Rogers-Satchell is therefore a choice of robustness to drift, not of the highest precision, and it enters **Yang-Zhang** as the intraday component.

## References

<a id="ref-RS1991a"></a>Rogers, L. C. G. and Satchell, S. E. (1991). Estimating Variance from High, Low and Closing Prices. *Annals of Applied Probability* 1(4), 504–512. [doi:10.1214/aoap/1177005835](https://doi.org/10.1214/aoap/1177005835)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Close-to-Close](close-to-close.md)
