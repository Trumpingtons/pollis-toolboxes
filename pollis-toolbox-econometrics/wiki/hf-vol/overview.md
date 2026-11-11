# High-Frequency Volatility: Overview

What High-Frequency Volatility measures, its three tabs, how tick data are given to it, which estimator suits which data, and what its Next Steps add.

## What Does High-Frequency Volatility Measure?

High-Frequency Volatility measures how much one asset's price varied over a span of trading, usually one day, from the prices observed within that span. Volatility cannot be observed, only prices can, and a day of trades or quotes holds far more information about the day's variance than its closing price. Summed squared returns over short intervals estimate the integrated variance of the span with no model of how volatility changes, an idea that [Andersen and Bollerslev (1998)](#ref-AB1998a) made the benchmark for volatility forecasts. Two features of tick data complicate the sum: market microstructure noise, such as bid-ask bounce, and jumps. Each tab of High-Frequency Volatility handles them differently, and its Next Steps measure both.

## What Are the Three Tabs of High-Frequency Volatility?

| Tab | Estimator | Prices used | Jumps |
|---|---|---|---|
| **Realized** | Realized volatility, `simple_volatility` of HighFrequencyCovariance.jl | The last price every **Sampling Interval** seconds | Included |
| **Two-Scales** | Two-scales volatility, `two_scales_volatility` of HighFrequencyCovariance.jl | Every tick | Included |
| **Bipower** | Bipower variation, written in the panel's code | The last price every **Sampling Interval** seconds | Mostly left out |

**Realized** follows [Andersen and Bollerslev (1998)](#ref-AB1998a), **Two-Scales** [Zhang, Mykland and Aït-Sahalia (2005)](#ref-ZMA2005a) and **Bipower** [Barndorff-Nielsen and Shephard (2004)](#ref-BS2004a). Each tab prints the volatility over the span of the ticks as `sigma`, so one day of ticks gives a daily volatility.

## How Is Tick Data Given to High-Frequency Volatility?

**Tick Data** is `simulated`, a trading day with a jump and noise, or any Tables.jl source with one row per tick and three columns: `time` in seconds, `asset` as a Symbol and `logprice`. The panel turns the table into the `SortedDataFrame` of HighFrequencyCovariance.jl in one line, `SortedDataFrame(HighFrequencyCovariance.DataFrame(ticks), :time, :asset, :logprice, Second(1))`, the only DataFrame in the code, as the package takes no other input. Only the first asset of the table is measured. The package's estimators give a volatility per square root of a second, which the tabs multiply by the square root of the span, `duration(ts; in_dates_period = false)`, the seconds from the first tick to the last. The helper `grid_returns(ticks, asset, every)` takes the last price at or before each multiple of `every` seconds and returns their log returns.

## Which High-Frequency Volatility Estimator Fits the Data?

| Data and concern | Tab | Why |
|---|---|---|
| Prices every few minutes, little noise at that interval | **Realized** | The plain sum of squared returns, jumps included |
| Every tick, with noise that matters | **Two-Scales** | Uses all the ticks and removes the bias of the noise |
| Possible jumps, such as news announcements | **Bipower** | Measures the continuous part of the variance apart from jumps |
| A test of whether the span had a jump | **Barndorff-Nielsen and Shephard Test** | Compares realized variance with bipower variation |

Realized and two-scales volatility estimate the same quantity, the total variation of the price, jumps included. Bipower variation estimates only its continuous part, so a gap between bipower and the other two is a sign of jumps rather than a disagreement.

## What Do the Next Steps of High-Frequency Volatility Add?

**Price Path** plots every tick, and **Volatility Signature Plot** shows realized volatility at intervals from one second to half an hour: noise makes it rise as the interval shrinks. **Barndorff-Nielsen and Shephard Test** tests for jumps on five-minute returns, or on the returns of **Bipower**, after [Barndorff-Nielsen and Shephard (2006)](#ref-BS2006a). **Microstructure Noise** gives the noise variance that `estimate_microstructure_noise` finds, against the variance of the efficient price over one tick. **Volatility Through the Day** shows realized volatility of each half hour. **All Four Estimators** sets realized volatility on every tick and every five minutes, two-scales and bipower volatility side by side. **Annualise** multiplies a daily volatility by the square root of 252, and **Jump Share of the Variance** gives the part of realized variance that bipower variation leaves out.

## How Does High-Frequency Volatility Relate to Other Finance Panels?

High-Frequency Volatility and High-Frequency Covariance Matrix Estimation share the High-Frequency Analysis submenu of the Finance Toolbox and the package HighFrequencyCovariance.jl, described by [Baumann and Klymak (2022)](#ref-BK2022a). High-Frequency Covariance Matrix Estimation estimates the covariance and correlation of several assets that trade at different times, while High-Frequency Volatility measures one asset and its jumps. Measuring Volatility, beside the submenu, estimates volatility from daily open, high, low and close prices when intraday prices are not at hand.

## References

<a id="ref-AB1998a"></a>Andersen, T. G. and Bollerslev, T. (1998). Answering the skeptics: yes, standard volatility models do provide accurate forecasts. *International Economic Review* 39(4), 885–905. [doi:10.2307/2527343](https://doi.org/10.2307/2527343)

<a id="ref-BK2022a"></a>Baumann, S. and Klymak, M. (2022). HighFrequencyCovariance: a Julia package for estimating covariance matrices using high frequency financial data. *Journal of Statistical Software* 103(14). [doi:10.18637/jss.v103.i14](https://doi.org/10.18637/jss.v103.i14)

<a id="ref-BS2004a"></a>Barndorff-Nielsen, O. E. and Shephard, N. (2004). Power and bipower variation with stochastic volatility and jumps. *Journal of Financial Econometrics* 2(1), 1–37. [doi:10.1093/jjfinec/nbh001](https://doi.org/10.1093/jjfinec/nbh001)

<a id="ref-BS2006a"></a>Barndorff-Nielsen, O. E. and Shephard, N. (2006). Econometrics of testing for jumps in financial economics using bipower variation. *Journal of Financial Econometrics* 4(1), 1–30. [doi:10.1093/jjfinec/nbi022](https://doi.org/10.1093/jjfinec/nbi022)

<a id="ref-ZMA2005a"></a>Zhang, L., Mykland, P. A. and Aït-Sahalia, Y. (2005). A tale of two time scales: determining integrated volatility with noisy high-frequency data. *Journal of the American Statistical Association* 100(472), 1394–1411. [doi:10.1198/016214505000000169](https://doi.org/10.1198/016214505000000169)

## See Also

- [Factsheet](factsheet.md) · [Introduction to High-Frequency Volatility](intro-hf-volatility.md) · [Realized Volatility](realized-volatility.md) · [Two-Scales Volatility](two-scales-volatility.md) · [Bipower Variation](bipower-variation.md)
