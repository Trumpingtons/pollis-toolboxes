# Business Cycle Filters — Overview

All five tabs take a **Time Series** and return a trend and a cycle through `trend(res)` and `cycle(res)`. They differ in what they define as trend: something smooth, something predictable, a long-run forecast, or a band of frequencies.

## The Hodrick-Prescott Tab

The **Hodrick-Prescott** tab calls `hp_filter` with **lambda**. The trend tau minimises the sum of (y(t) - tau(t))^2 plus lambda times the sum of squared second differences of tau, following [Hodrick and Prescott (1997)](#ref-HP1997a). A larger lambda gives a smoother trend and a larger cycle. The usual value for quarterly data is 1600. [Ravn and Uhlig (2002)](#ref-RU2002a) show that lambda should change with the fourth power of the observation frequency, which gives about 6.25 for annual data and about 129,600 for monthly data. The filter is two-sided, and it returns every observation.

## The Hamilton Tab

The **Hamilton** tab calls `hamilton_filter` with **h** and **p**. [Hamilton (2018)](#ref-Ham2018a) regresses y(t+h) on a constant and y(t), y(t-1), up to y(t-p+1), and takes the residual as the cycle. The default of two years and four lags for quarterly data means h = 8 and p = 4. The cycle is thus the part of a value that its past could not forecast h periods before. The regression uses only past information on the right-hand side, and the first h + p - 1 observations have no cycle.

## The Beveridge-Nelson Tab

The **Beveridge-Nelson** tab calls `beveridge_nelson` with **AR order** and **MA order**, fitting an ARIMA(p, 1, q) to the series. [Beveridge and Nelson (1981)](#ref-BN1981a) define the permanent component as the long-run forecast of the series, net of drift, given everything known today. The trend is therefore a random walk with drift, and the cycle is the part expected to die away. The cycle's shape and sign depend heavily on the ARIMA orders, since low-order models with positive persistence in growth imply that the trend moves more than the series itself.

## The Baxter-King Tab

The **Baxter-King** tab calls `baxter_king` with **p₁ (low)**, **p₂ (high)** and **K**. [Baxter and King (1999)](#ref-BK1999a) approximate an ideal band-pass filter with a symmetric moving average of K leads and K lags, keeping cycles between p₁ and p₂ periods. The defaults of 6 and 32 quarters follow the Burns and Mitchell definition of the business cycle. A larger K sharpens the band at the cost of observations: K values are lost at each end of the sample. The output is therefore a clean cycle over a shorter range.

## The Boosted HP Tab

The **Boosted HP** tab calls `boosted_hp` with **lambda**, **Max iter** and **Stopping Rule**. [Phillips and Shi (2021)](#ref-PS2021a) apply the HP filter repeatedly to its own cycle, removing what remains of a trend after each pass. The BIC rule stops when the Phillips-Shi information criterion rises, the ADF rule stops once a test rejects a unit root in the cycle, and the fixed rule runs exactly **Max iter** passes. Iterating lets the trend follow larger movements, including those that a single pass at 1600 would leave in the cycle.

## Common Workflow for Filtering a Series

1. Convert the series to 100 times its log, then apply a filter.
2. Check the cycle's frequencies with **Power Spectrum** and its size with **Variance Ratio**.
3. Measure revisions with **End-Point Sensitivity**.
4. Date the cycle with **Turning Points**, and relate it to another series with **Cross-Correlation with GDP**.
5. Run **Filter Comparison** to learn how much the answer depends on the method.

## References

<a id="ref-BK1999a"></a>Baxter, M. and King, R. G. (1999). Measuring business cycles: Approximate band-pass filters for economic time series. *Review of Economics and Statistics* 81(4), 575–593. [doi:10.1162/003465399558454](https://doi.org/10.1162/003465399558454)

<a id="ref-BN1981a"></a>Beveridge, S. and Nelson, C. R. (1981). A new approach to decomposition of economic time series into permanent and transitory components. *Journal of Monetary Economics* 7(2), 151–174. [doi:10.1016/0304-3932(81)90040-4](https://doi.org/10.1016/0304-3932(81)90040-4)

<a id="ref-Ham2018a"></a>Hamilton, J. D. (2018). Why you should never use the Hodrick-Prescott filter. *The Review of Economics and Statistics* 100(5), 831–843. [doi:10.1162/rest_a_00706](https://doi.org/10.1162/rest_a_00706)

<a id="ref-HP1997a"></a>Hodrick, R. J. and Prescott, E. C. (1997). Postwar U.S. Business Cycles: An Empirical Investigation. *Journal of Money, Credit and Banking* 29(1), 1. [doi:10.2307/2953682](https://doi.org/10.2307/2953682)

<a id="ref-PS2021a"></a>Phillips, P. C. B. and Shi, Z. (2021). Boosting: Why You Can Use the HP Filter. *International Economic Review* 62(2), 521–570. [doi:10.1111/iere.12495](https://doi.org/10.1111/iere.12495)

<a id="ref-RU2002a"></a>Ravn, M. O. and Uhlig, H. (2002). On Adjusting the Hodrick-Prescott Filter for the Frequency of Observations. *Review of Economics and Statistics* 84(2), 371–376. [doi:10.1162/003465302317411604](https://doi.org/10.1162/003465302317411604)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
