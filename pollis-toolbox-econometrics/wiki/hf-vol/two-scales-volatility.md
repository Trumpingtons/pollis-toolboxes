# Two-Scales Volatility

The two-scales estimator in the **Two-Scales** tab of High-Frequency Volatility: the idea of two time scales, the estimator of Zhang, Mykland and Aït-Sahalia, the **Sub-grids (K)** input, and the noise variance it returns.

## What Is Two-Scales Volatility?

Two-scales realized volatility, introduced by [Zhang, Mykland and Aït-Sahalia (2005)](#ref-ZMA2005a), estimates the integrated variance from every tick when the prices carry microstructure noise. Realized variance on every tick is dominated by noise, while realized variance on a sparse grid throws most of the ticks away. The two-scales estimator uses both time scales: a slow scale, on which realized variance is averaged over many offset grids so that no tick is discarded, and a fast scale, every tick, whose realized variance measures the noise. Subtracting a multiple of the fast-scale variance from the slow-scale average removes the bias that noise adds to the slow scale. The result estimates the quadratic variation of the efficient price, jumps included, and converges to it as the number of ticks grows, which sparse sampling alone does not.

## How Is the Two-Scales Estimator Defined?

Split the n ticks of the span into K sub-grids: the first holds ticks 1, K + 1, 2K + 1 and so on, the second ticks 2, K + 2, 2K + 2, and so on. Realized variance on each sub-grid uses returns over K ticks, and RV_avg is their average over the K sub-grids. RV_all is realized variance on every tick, and n_bar = (n − K + 1) / K is the average number of returns per sub-grid. The two-scales estimator of [Zhang, Mykland and Aït-Sahalia (2005)](#ref-ZMA2005a) is TSRV = RV_avg − (n_bar / n) × RV_all, their equation (55). Each sub-grid return holds the noise of two ticks, as every tick return does, so RV_avg carries a noise bias of about 2 n_bar times the noise variance, and RV_all an estimate of 2 n times the noise variance. The second term removes that bias. Their equation (64) divides TSRV by 1 − n_bar / n, an adjustment for small samples. Two-scales volatility is the square root of the adjusted TSRV.

## How Does the Two-Scales Tab Call TwoScalesVolatility.jl?

The **Two-Scales** tab takes the log prices of the asset in time order, `y`, and calls `two_scales_variance(y, K)` of TwoScalesVolatility.jl, the adjusted TSRV of equations (55) and (64) of [Zhang, Mykland and Aït-Sahalia (2005)](#ref-ZMA2005a). Its square root is `sigma`, the volatility over the span of the ticks: a day of ticks gives a daily volatility. The tab prints the noise as a standard deviation in basis points, the square root of `noise_variance(y, K)`, their equation (65): (RV_all − RV_avg) / (2 (n − n_bar)). Left blank, **Sub-grids (K)** follows the rule of the article, K = c* n^(2/3) with c* from their equation (10), computed from the noise variance RV_all / (2n) and a first estimate of the integrated variance from five-minute returns. The **Microstructure Noise** Next Step computes the noise variance of equation (65) with the same K on any tab.

## How Should the Number of Sub-grids K Be Chosen?

**Sub-grids (K)** sets the slow time scale: with ticks one second apart, K = 300 makes each sub-grid return a five-minute return. A small K leaves the slow scale close to every tick, so the noise correction is large and the estimate has a high variance. A large K gives few returns per sub-grid and a less precise average. [Zhang, Mykland and Aït-Sahalia (2005)](#ref-ZMA2005a) show that K should grow with the number of ticks n in proportion to n to the power 2/3, which gives the estimator its rate of convergence of n to the power 1/6. In practice estimates for K across a wide range are close when the data are well behaved. A two-scales estimate that changes much with K points to noise that is correlated across ticks or to a span with too few ticks.

## What Does the Noise Estimate of Two-Scales Volatility Mean?

The noise variance that the **Two-Scales** tab reports is the variance of the gap between the observed log price and the efficient one, assumed independent across ticks and of the price. Its square root, in basis points, is of the order of the bounce between bid and ask relative to the price. The **Microstructure Noise** Next Step sets it against the variance of the efficient price over one tick: a ratio above one means a single tick return is more noise than signal, so realized volatility on every tick is mostly noise, and a sparse **Realized** interval or the **Two-Scales** tab is needed. Noise that is correlated across ticks, as with quotes that update slowly, breaks the assumption, and the estimate is then only approximate.

## References

<a id="ref-ZMA2005a"></a>Zhang, L., Mykland, P. A. and Aït-Sahalia, Y. (2005). A tale of two time scales: determining integrated volatility with noisy high-frequency data. *Journal of the American Statistical Association* 100(472), 1394–1411. [doi:10.1198/016214505000000169](https://doi.org/10.1198/016214505000000169)

## See Also

- [Overview](overview.md) · [Factsheet](factsheet.md) · [Introduction to High-Frequency Volatility](intro-hf-volatility.md) · [Realized Volatility](realized-volatility.md) · [Bipower Variation](bipower-variation.md)
