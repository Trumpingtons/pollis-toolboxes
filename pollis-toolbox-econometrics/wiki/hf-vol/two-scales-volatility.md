# Two-Scales Volatility

The two-scales estimator in the **Two-Scales** tab of High-Frequency Volatility: the idea of two time scales, the estimator of Zhang, Mykland and Aït-Sahalia, the **Sub-grids (K)** input, and the noise variance it returns.

## What Is Two-Scales Volatility?

Two-scales realized volatility, introduced by [Zhang, Mykland and Aït-Sahalia (2005)](#ref-ZMA2005a), estimates the integrated variance from every tick when the prices carry microstructure noise. Realized variance on every tick is dominated by noise, while realized variance on a sparse grid throws most of the ticks away. The two-scales estimator uses both time scales: a slow scale, on which realized variance is averaged over many offset grids so that no tick is discarded, and a fast scale, every tick, whose realized variance measures the noise. Subtracting a multiple of the fast-scale variance from the slow-scale average removes the bias that noise adds to the slow scale. The result estimates the quadratic variation of the efficient price, jumps included, and converges to it as the number of ticks grows, which sparse sampling alone does not.

## How Is the Two-Scales Estimator Defined?

Split the n ticks of the span into K sub-grids: the first holds ticks 1, K + 1, 2K + 1 and so on, the second ticks 2, K + 2, 2K + 2, and so on. Realized variance on each sub-grid uses returns over K ticks, and RV_avg is their average over the K sub-grids. RV_all is realized variance on every tick, and n_bar = (n − K + 1) / K is the average number of returns per sub-grid. The two-scales estimator of [Zhang, Mykland and Aït-Sahalia (2005)](#ref-ZMA2005a) is TSRV = RV_avg − (n_bar / n) × RV_all. Each sub-grid return holds the noise of two ticks, as every tick return does, so RV_avg carries a noise bias of about 2 n_bar times the noise variance, and RV_all an estimate of 2 n times the noise variance. The second term removes that bias. Two-scales volatility is the square root of TSRV.

## How Does the Two-Scales Tab Call HighFrequencyCovariance.jl?

The **Two-Scales** tab calls `vols, noise = two_scales_volatility(ts, [asset])` of HighFrequencyCovariance.jl, with `num_grids = K` when **Sub-grids (K)** is given. The function returns two `Dict`s by asset: `vols`, the volatility per square root of a second, and `noise`, the variance of the microstructure noise in the log price. The tab multiplies the volatility by `sqrt(span)` to give `sigma` over the span, and prints the noise as a standard deviation in basis points. Left blank, **Sub-grids (K)** takes `default_num_grids(ts)`, the fewest ticks of any asset divided by 100 and at least 3. The function applies the two-scales correction to volatilities, the square roots of the realized variances: the average sub-grid volatility minus 1/K times the volatility on every tick, divided by 1 − 1/K. The **Microstructure Noise** Next Step calls `estimate_microstructure_noise(ts, [asset])`, which gives the same noise variance on any tab.

## How Should the Number of Sub-grids K Be Chosen?

**Sub-grids (K)** sets the slow time scale: with ticks one second apart, K = 300 makes each sub-grid return a five-minute return. A small K leaves the slow scale close to every tick, so the noise correction is large and the estimate has a high variance. A large K gives few returns per sub-grid and a less precise average. [Zhang, Mykland and Aït-Sahalia (2005)](#ref-ZMA2005a) show that K should grow with the number of ticks n in proportion to n to the power 2/3, which gives the estimator its rate of convergence of n to the power 1/6. In practice estimates for K across a wide range are close when the data are well behaved. A two-scales estimate that changes much with K points to noise that is correlated across ticks or to a span with too few ticks.

## What Does the Noise Estimate of Two-Scales Volatility Mean?

The noise variance that the **Two-Scales** tab reports is the variance of the gap between the observed log price and the efficient one, assumed independent across ticks and of the price. Its square root, in basis points, is of the order of the bounce between bid and ask relative to the price. The **Microstructure Noise** Next Step sets it against the variance of the efficient price over one tick: a ratio above one means a single tick return is more noise than signal, so realized volatility on every tick is mostly noise, and a sparse **Realized** interval or the **Two-Scales** tab is needed. Noise that is correlated across ticks, as with quotes that update slowly, breaks the assumption, and the estimate is then only approximate.

## References

<a id="ref-ZMA2005a"></a>Zhang, L., Mykland, P. A. and Aït-Sahalia, Y. (2005). A tale of two time scales: determining integrated volatility with noisy high-frequency data. *Journal of the American Statistical Association* 100(472), 1394–1411. [doi:10.1198/016214505000000169](https://doi.org/10.1198/016214505000000169)

## See Also

- [Overview](overview.md) · [Factsheet](factsheet.md) · [Introduction to High-Frequency Volatility](intro-hf-volatility.md) · [Realized Volatility](realized-volatility.md) · [Bipower Variation](bipower-variation.md)
