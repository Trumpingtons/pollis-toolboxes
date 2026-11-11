# Bipower Variation

Bipower variation in the **Bipower** tab of High-Frequency Volatility: its definition, why it leaves out jumps, how the panel computes it, and how it gives the jump test and the jump share of the variance.

## What Is Bipower Variation?

Bipower variation, introduced by [Barndorff-Nielsen and Shephard (2004)](#ref-BS2004a), is the sum of the products of adjacent absolute returns, scaled so that it estimates the integrated variance: BV = (pi / 2) × (|r_2| |r_1| + |r_3| |r_2| + ... + |r_n| |r_n−1|). The factor pi / 2 is one over the square of the mean absolute value of a standard normal variable, sqrt(2 / pi), which makes the products of adjacent absolute returns comparable with squared returns. As the returns become shorter, bipower variation converges to the integrated variance of the continuous part of the price, whether or not the price jumps. Realized variance converges to the integrated variance plus the squared jumps. Bipower variation therefore splits the quadratic variation of the price into its continuous part and its jumps.

## Why Does Bipower Variation Leave Out Jumps?

A jump makes one return large. In realized variance that return enters squared, so its whole size counts. In bipower variation the same return enters only multiplied by the absolute return before it and by the absolute return after it, each an ordinary return of the continuous part. As returns become shorter, those neighbours shrink in proportion to the square root of the interval, and the products with the jump vanish, while the products of ordinary returns add up to the integrated variance. With a finite interval, as five minutes, the products with a jump do not vanish completely, so bipower variation is slightly raised by a jump. Two jumps in adjacent intervals also multiply each other and enter bipower variation, which is rare at intervals of minutes.

## How Does the Bipower Tab Compute Bipower Variation?

HighFrequencyCovariance.jl has no bipower estimator, so the **Bipower** tab of High-Frequency Volatility computes it in the panel's code. The helper `grid_returns(ticks, asset, every)` takes the last price at or before each multiple of `every` seconds, the **Sampling Interval (seconds)**, and returns the log returns `r` between them. The tab then computes `BPV = (pi / 2) * sum(abs.(r[2:end]) .* abs.(r[1:end-1]))` and `sigma = sqrt(BPV)`, the continuous volatility over the span. Bipower variation does not correct for microstructure noise, and products of adjacent noisy returns are biased, so the **Sampling Interval** should be long enough for noise to be negligible, as for the **Realized** tab. The **Volatility Signature Plot** helps to choose it.

## How Do Realized Variance and Bipower Variation Measure Jumps?

The difference between realized variance (RV) and bipower variation (BV) over the same returns estimates the sum of squared jumps of the span. Sampling error can make it negative, so it is usually truncated at zero. [Barndorff-Nielsen and Shephard (2006)](#ref-BS2006a) divide the difference by its standard error, estimated from tripower quarticity, to test whether the price jumped: the **Barndorff-Nielsen and Shephard Test** Next Step of High-Frequency Volatility prints the statistic and its one-sided p-value. The **Jump Share of the Variance** Next Step gives max(RV − BV, 0) / RV, the part of the span's variance that came from jumps. On **Realized** and **Two-Scales** both Next Steps use five-minute returns, and on **Bipower** the returns of the tab.

## When Is Bipower Variation the Right Measure?

Bipower variation is the measure to use when the continuous volatility of an asset matters apart from its jumps: forecasting volatility, where the continuous part is persistent and the jumps are not, or calibrating a model with separate diffusion and jump parts. Days of scheduled news, such as central bank decisions, are those on which bipower variation and realized volatility differ most. On days without jumps the two measure the same quantity, and bipower variation has a somewhat larger sampling error, so realized volatility or two-scales volatility is preferable when jumps are not a concern. Because bipower variation needs sparse returns, it gives no correction for noise that two-scales volatility does, and the comparison of the **Bipower** and **Two-Scales** tabs mixes the two effects.

## References

<a id="ref-BS2004a"></a>Barndorff-Nielsen, O. E. and Shephard, N. (2004). Power and bipower variation with stochastic volatility and jumps. *Journal of Financial Econometrics* 2(1), 1–37. [doi:10.1093/jjfinec/nbh001](https://doi.org/10.1093/jjfinec/nbh001)

<a id="ref-BS2006a"></a>Barndorff-Nielsen, O. E. and Shephard, N. (2006). Econometrics of testing for jumps in financial economics using bipower variation. *Journal of Financial Econometrics* 4(1), 1–30. [doi:10.1093/jjfinec/nbi022](https://doi.org/10.1093/jjfinec/nbi022)

## See Also

- [Overview](overview.md) · [Factsheet](factsheet.md) · [Introduction to High-Frequency Volatility](intro-hf-volatility.md) · [Realized Volatility](realized-volatility.md) · [Two-Scales Volatility](two-scales-volatility.md)
