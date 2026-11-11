# Realized Volatility

Realized volatility in the **Realized** tab of High-Frequency Volatility: its definition, the call to HighFrequencyCovariance.jl, the choice of the **Sampling Interval**, and the volatility signature plot.

## What Is Realized Volatility?

Realized variance is the sum of the squared log returns of an asset over a span, RV = r_1^2 + r_2^2 + ... + r_n^2, where each r_i is the change in the log price over one sampling interval. Realized volatility is its square root. Without noise, realized variance converges to the quadratic variation of the log price as the intervals shrink: the integrated variance plus the squared jumps. [Andersen and Bollerslev (1998)](#ref-AB1998a) used the sum of squared five-minute returns as the measure of daily variance against which volatility forecasts are judged, and realized volatility at five minutes has since become a common benchmark. Realized volatility assumes nothing about how volatility evolves within the span, only that the returns are measured without much noise.

## How Does the Realized Tab Compute Realized Volatility?

The **Realized** tab calls `simple_volatility(ts, [asset]; fixed_spacing = every)` of HighFrequencyCovariance.jl, where `every` is the **Sampling Interval (seconds)**. The function takes the last price at or before each point of a grid spaced `fixed_spacing` seconds apart, squares the returns between them and returns a `Dict` with the volatility of each asset per square root of a second. Multiplying by `sqrt(span)`, the square root of the seconds from the first tick to the last, gives `sigma`, the realized volatility over the span. Leaving **Sampling Interval** blank calls `simple_volatility(ts, [asset])` with no spacing, and the package chooses one from its estimate of the microstructure noise. The keyword `use_all_obs = true` instead uses every tick, as the **All Four Estimators** Next Step does to show the effect of noise.

## How Should the Sampling Interval Be Chosen for Realized Volatility?

A shorter **Sampling Interval** uses more returns, which lowers the sampling error of realized variance, but each return then holds more noise relative to the change of the efficient price, which raises its bias. [Aït-Sahalia, Mykland and Zhang (2005)](#ref-AMZ2005a) derived the interval that balances the two when the noise is independent of the price: it lengthens as the noise grows relative to the volatility. In liquid assets intervals of one to fifteen minutes are common, five minutes being the usual default. For a thinly traded asset the interval must be longer than the typical gap between trades, otherwise many returns are zero. The **Volatility Signature Plot** Next Step shows realized volatility against the interval, and a reasonable interval lies where the curve has flattened.

## What Does the Volatility Signature Plot Show?

The **Volatility Signature Plot** Next Step of High-Frequency Volatility computes realized volatility over the same span at sampling intervals from one second to half an hour, and draws the tab's `sigma` as a dashed line. Without noise the curve would be flat apart from sampling error, since every interval estimates the same quadratic variation. Bid-ask bounce makes adjacent tick returns negatively correlated, so realized volatility rises steeply as the interval approaches one tick. Slow price adjustment, as in stale quotes or thin trading, can bend the curve the other way. The interval at which the curve levels off is the shortest one at which noise no longer dominates, and a **Two-Scales** estimate near the flat part confirms that the noise has been removed.

## When Does Realized Volatility Mislead?

Realized volatility measured on every tick is biased upwards by noise, roughly by twice the noise variance for every return, so its error grows with the number of ticks. Realized volatility at any interval includes jumps: a day with one large announcement return has a high realized volatility even if the price was calm before and after. When the continuous part is wanted, the **Bipower** tab measures it, and **Barndorff-Nielsen and Shephard Test** tells whether the gap is a jump. Realized volatility of a span that leaves out the overnight return measures only the trading hours, so it is lower than the volatility of close-to-close returns. A span much shorter than a day holds few returns at five minutes and gives a noisy estimate.

## References

<a id="ref-AB1998a"></a>Andersen, T. G. and Bollerslev, T. (1998). Answering the skeptics: yes, standard volatility models do provide accurate forecasts. *International Economic Review* 39(4), 885–905. [doi:10.2307/2527343](https://doi.org/10.2307/2527343)

<a id="ref-AMZ2005a"></a>Aït-Sahalia, Y., Mykland, P. A. and Zhang, L. (2005). How often to sample a continuous-time process in the presence of market microstructure noise. *Review of Financial Studies* 18(2), 351–416. [doi:10.1093/rfs/hhi016](https://doi.org/10.1093/rfs/hhi016)

## See Also

- [Overview](overview.md) · [Factsheet](factsheet.md) · [Introduction to High-Frequency Volatility](intro-hf-volatility.md) · [Two-Scales Volatility](two-scales-volatility.md) · [Bipower Variation](bipower-variation.md)
