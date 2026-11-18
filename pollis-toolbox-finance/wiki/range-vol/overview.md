# Range-Based Volatility Estimation — Overview

All seven tabs take the same price inputs: **Open prices (O)**, **High prices (H)**, **Low prices (L)** and **Close prices (C)**, oldest first and of equal length. **Trading periods** annualises the daily value, **Window (days)** sets the rolling length and **Horizon (days)** the forecast length.

## The Close-to-Close and Parkinson Tabs

The **Close-to-Close** tab calls `close_to_close`, the sample standard deviation of daily log returns, which is the textbook estimator in [Hull (2022)](#ref-Hul2022a). The **Parkinson** tab calls `parkinson`, which replaces returns with the squared log range, log(H / L)^2, divided by 4 log 2, following [Parkinson (1980)](#ref-Par1980a). The Parkinson estimator ignores the open and the close altogether. Those two tabs mark the extremes: the first ignores everything during the day, and the second uses only the extent of the day's travel, with no information about overnight moves.

## The Garman-Klass and Rogers-Satchell Tabs

The **Garman-Klass** tab calls `garman_klass`, which combines the squared range with the squared open-to-close return, as derived by [Garman and Klass (1980)](#ref-GK1980a). Each day contributes 0.5 log(H / L)^2 - (2 log 2 - 1) log(C / O)^2. The **Rogers-Satchell** tab calls `rogers_satchell`, whose daily term is log(H / C) log(H / O) + log(L / C) log(L / O), from [Rogers and Satchell (1991)](#ref-RS1991a). Rogers-Satchell has an expected value that does not depend on the drift. Both estimators cover only the trading day, so overnight moves are missed unless the market trades around the clock.

## The GK-Yang-Zhang and Yang-Zhang Tabs

The **GK-Yang-Zhang** tab calls `garman_klass_yang_zhang`, which adds the squared overnight return, log(O(t) / C(t-1))^2, to the Garman-Klass daily term. The **Yang-Zhang** tab calls `yang_zhang`, the estimator of [Yang and Zhang (2000)](#ref-YZ2000a), which combines the overnight variance, the open-to-close variance and the Rogers-Satchell term as Vo + k Vc + (1 - k) Vrs. The weight k = 0.34 / (1.34 + (m + 1) / (m - 1)), with m the number of daily returns, minimises the sampling variance. Yang-Zhang handles drift and overnight gaps together, and needs at least three observations.

## The Alizadeh-Brandt-Diebold Tab

The **Alizadeh-Brandt-Diebold** tab calls `alizadeh_brandt_diebold`, which returns the daily log range, log(log(H) - log(L)), as a vector rather than one number. [Alizadeh, Brandt and Diebold (2002)](#ref-ABD2002a) show that this quantity is close to Gaussian and moves one for one with the logarithm of volatility, which makes it a convenient observation for a state-space model. The output is an input to further modelling, not an annualised volatility. A day whose high equals its low has a range of zero and gives `-Inf`, so such days must be filtered out first.

## Common Workflow for Estimating Range-Based Volatility

1. Supply the four price vectors and set **Trading periods**.
2. Look at **Prices and Ranges** and **Rolling Volatility**.
3. Run **Drift and Overnight Gaps** to select an appropriate estimator.
4. Compare everything with **All Estimators**, and against a model with **Compare with GARCH**.
5. Read **Time Scaling** and **Empirical Efficiency**.
6. Project with **Volatility Forecast** and test with **Forecast Backtest**.

## References

<a id="ref-ABD2002a"></a>Alizadeh, S., Brandt, M. W. and Diebold, F. X. (2002). Range-Based Estimation of Stochastic Volatility Models. *Journal of Finance* 57(3), 1047–1091. [doi:10.1111/1540-6261.00454](https://doi.org/10.1111/1540-6261.00454)

<a id="ref-GK1980a"></a>Garman, M. B. and Klass, M. J. (1980). On the Estimation of Security Price Volatilities from Historical Data. *Journal of Business* 53(1), 67–78. [doi:10.1086/296072](https://doi.org/10.1086/296072)

<a id="ref-Hul2022a"></a>Hull, J. C. (2022). Options, Futures, and Other Derivatives. *Pearson (11th ed.)*. [Link](https://www.pearson.com/en-us/subject-catalog/p/options-futures-and-other-derivatives/P200000005938)

<a id="ref-Par1980a"></a>Parkinson, M. (1980). The Extreme Value Method for Estimating the Variance of the Rate of Return. *Journal of Business* 53(1), 61–65. [doi:10.1086/296071](https://doi.org/10.1086/296071)

<a id="ref-RS1991a"></a>Rogers, L. C. G. and Satchell, S. E. (1991). Estimating Variance from High, Low and Closing Prices. *Annals of Applied Probability* 1(4), 504–512. [doi:10.1214/aoap/1177005835](https://doi.org/10.1214/aoap/1177005835)

<a id="ref-YZ2000a"></a>Yang, D. and Zhang, Q. (2000). Drift-Independent Volatility Estimation Based on High, Low, Open, and Close Prices. *Journal of Business* 73(3), 477–492. [doi:10.1086/209650](https://doi.org/10.1086/209650)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
