# Range-Based Volatility Estimation — Garman-Klass-Yang-Zhang

The **GK-Yang-Zhang** tab extends Garman-Klass to markets that close, so that the opening jump is counted.

## What the GK-Yang-Zhang Estimator Computes

`garman_klass_yang_zhang(O, H, L, C; trading_periods)` averages, over days 2 to n, the squared overnight return log(O(t) / C(t-1))^2 plus the two Garman-Klass terms. Summing the two sources gives an estimate of the full-day variance, and it works as an extension in the spirit of [Yang and Zhang (2000)](#ref-YZ2000a), though the combination itself is not the minimum-variance estimator of that article. Variance is floored at zero, and the first day is used only as the previous close of the second. At least two days of data are required.

## When the GK-Yang-Zhang Estimator Fails

The estimator keeps the zero-drift assumption of Garman-Klass, so a persistent trend still introduces bias. The overnight term is an uncentred square of a single return, so a large news-driven gap has a strong influence and adds noise that the range terms do not smooth. Precision therefore depends on the share of total variance arising overnight. If drift is present too, or the overnight share is large, **Yang-Zhang** should be preferred, since it treats the overnight and intraday sources separately and centres both.

## References

<a id="ref-YZ2000a"></a>Yang, D. and Zhang, Q. (2000). Drift-Independent Volatility Estimation Based on High, Low, Open, and Close Prices. *Journal of Business* 73(3), 477–492. [doi:10.1086/209650](https://doi.org/10.1086/209650)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Close-to-Close](close-to-close.md)
