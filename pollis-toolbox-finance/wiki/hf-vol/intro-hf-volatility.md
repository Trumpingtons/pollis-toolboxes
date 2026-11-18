# Introduction to High-Frequency Volatility

Why intraday prices measure volatility, what integrated variance and quadratic variation are, how microstructure noise and jumps affect the measures, and how the jump test of Barndorff-Nielsen and Shephard works.

## Why Measure Volatility From Intraday Prices?

Volatility is the standard deviation of returns, and it changes from day to day, so the volatility of one day cannot be learnt from one daily return. Within a day, however, an asset trades or is quoted thousands of times. Each short return carries a little information about the day's variance, and summing their squares adds that information up. [Andersen and Bollerslev (1998)](#ref-AB1998a) showed that daily volatility forecasts judged against squared daily returns look poor only because a squared daily return is a very noisy measure of the day's variance, and that a sum of squared intraday returns is a far more precise target. Measures built this way are called realized measures. They need no model of how volatility evolves, which makes them both a target for volatility forecasts and a series of daily variances that can itself be modelled and forecast.

## What Are Integrated Variance and Quadratic Variation?

Under a continuous-time model in which the log price moves by a diffusion with spot volatility sigma(t), the variance of the price over a day is the integrated variance, the integral of sigma(t)^2 over the day. Integrated variance is the quantity realized measures aim at. When the price can also jump, the total variation of the log price over the day, its quadratic variation, is the integrated variance plus the sum of the squared jumps. Realized variance, the sum of squared returns, converges to the quadratic variation as the returns become shorter. Separating the two parts of the quadratic variation is the purpose of bipower variation, introduced by [Barndorff-Nielsen and Shephard (2004)](#ref-BS2004a). A volatility is the square root of a variance, so each measure gives a daily volatility by taking a square root.

## How Does Microstructure Noise Affect Realized Measures?

Observed prices differ from the efficient price by market microstructure noise: the bounce between bid and ask, prices moving in ticks, and trades of different sizes. Over a long interval the noise is small next to the change of the efficient price, but over one second it can be larger, so squared tick returns measure mostly noise. Realized variance on every tick then grows with the number of ticks rather than converging to the integrated variance. [Aït-Sahalia, Mykland and Zhang (2005)](#ref-AMZ2005a) studied how often to sample when noise is present: sampling less often lowers the bias of the noise but discards data and raises the variance. Two answers are common: sampling every few minutes, as the **Realized** tab of High-Frequency Volatility does, or using every tick with a correction, as the two-scales estimator of [Zhang, Mykland and Aït-Sahalia (2005)](#ref-ZMA2005a) in the **Two-Scales** tab does.

## How Do Jumps Affect Realized Measures?

A jump is a discontinuous move of the price, often at a news announcement or a macroeconomic release. A jump adds its square to realized variance in full, however finely the day is sampled, so realized variance and two-scales variance both include the jumps of the day. For risk management and forecasting, the continuous part and the jump part behave differently: continuous volatility is persistent from day to day, while jumps are rarer and harder to predict. Bipower variation, the sum of products of adjacent absolute returns, estimates the integrated variance alone, because a single large return enters it multiplied only by its small neighbours. The difference between realized variance and bipower variation then estimates the sum of squared jumps, and its share of realized variance is the **Jump Share of the Variance** in High-Frequency Volatility.

## How Does the Barndorff-Nielsen and Shephard Jump Test Work?

[Barndorff-Nielsen and Shephard (2006)](#ref-BS2006a) turned the gap between realized variance (RV) and bipower variation (BV) into a test of whether the price jumped. With no jumps both estimate the integrated variance, and their difference, scaled by its standard error, is approximately standard normal. The standard error depends on the integrated quarticity, the integral of sigma(t)^4, which tripower quarticity estimates from products of three adjacent absolute returns, each to the power 4/3. The test statistic is Z = (RV − BV) / sqrt((pi^2 / 4 + pi − 5) × TQ / n), with n returns and TQ the tripower quarticity. Jumps raise realized variance and leave bipower variation nearly unchanged, so the test is one-sided: a large positive Z, above 1.645 at the 5% level, rejects the absence of jumps. The test assumes returns sampled sparsely enough for noise to be negligible.

## References

<a id="ref-AB1998a"></a>Andersen, T. G. and Bollerslev, T. (1998). Answering the skeptics: yes, standard volatility models do provide accurate forecasts. *International Economic Review* 39(4), 885–905. [doi:10.2307/2527343](https://doi.org/10.2307/2527343)

<a id="ref-AMZ2005a"></a>Aït-Sahalia, Y., Mykland, P. A. and Zhang, L. (2005). How often to sample a continuous-time process in the presence of market microstructure noise. *Review of Financial Studies* 18(2), 351–416. [doi:10.1093/rfs/hhi016](https://doi.org/10.1093/rfs/hhi016)

<a id="ref-BS2004a"></a>Barndorff-Nielsen, O. E. and Shephard, N. (2004). Power and bipower variation with stochastic volatility and jumps. *Journal of Financial Econometrics* 2(1), 1–37. [doi:10.1093/jjfinec/nbh001](https://doi.org/10.1093/jjfinec/nbh001)

<a id="ref-BS2006a"></a>Barndorff-Nielsen, O. E. and Shephard, N. (2006). Econometrics of testing for jumps in financial economics using bipower variation. *Journal of Financial Econometrics* 4(1), 1–30. [doi:10.1093/jjfinec/nbi022](https://doi.org/10.1093/jjfinec/nbi022)

<a id="ref-ZMA2005a"></a>Zhang, L., Mykland, P. A. and Aït-Sahalia, Y. (2005). A tale of two time scales: determining integrated volatility with noisy high-frequency data. *Journal of the American Statistical Association* 100(472), 1394–1411. [doi:10.1198/016214505000000169](https://doi.org/10.1198/016214505000000169)

## See Also

- [Overview](overview.md) · [Factsheet](factsheet.md) · [Realized Volatility](realized-volatility.md) · [Two-Scales Volatility](two-scales-volatility.md) · [Bipower Variation](bipower-variation.md)
