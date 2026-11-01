# Business Cycle Filters — Assumptions

Each filter carries its own assumptions about what a trend is, usually implicit and sometimes consequential.

## What Each Filter Assumes About the Trend

Hodrick-Prescott assumes that the trend is smooth and the cycle has no persistence beyond what lambda allows, which is optimal only under a very specific model. Hamilton assumes that a linear forecast at horizon h captures the trend. Beveridge-Nelson assumes a unit root and the correct ARIMA model. Baxter-King assumes that the cycle is defined by its frequency band alone. Boosted HP assumes that iterating, up to its stopping rule, separates trend from cycle better than one pass does. None of these can be verified from the data alone.

## Spurious Cycles From Random Walks

[Hamilton (2018)](#ref-Ham2018a) argues that the HP filter applied to a pure random walk produces a cycle with predictable dynamics that do not exist in the original data. That result shows that periodic behaviour in the output may be created by the filter. Differencing a series before examining it has a related risk, since a filter's frequency response can reshape the spectrum. **Filter Comparison** shows the HP cycle of a pure random walk next to the actual results, as a reminder of what a filter can produce from noise alone.

## End-of-Sample Behaviour

HP and Boosted HP are two-sided, and near the end of the sample, they effectively become one-sided, so the most recent values are revised when new data arrive. Those are often the values a policy discussion most needs. Baxter-King simply discards K observations at each end. Beveridge-Nelson and Hamilton rely on past data, but their fitted parameters still change as the sample grows. **End-Point Sensitivity** drops the last 4 observations and refits, to give a direct measure of the revision risk for a given filter and series.

## Choosing Frequency and Parameters

Filter parameters depend on data frequency, and an inconsistent choice undoes the method. A lambda of 1600 on monthly data leaves much of the business cycle in the trend. Baxter-King bands written in quarters must be rescaled for monthly data. Hamilton's h is meant as two years, and [Hamilton (2018)](#ref-Ham2018a) recommends a change to match frequency, with a seasonal series needing p at least as long as the seasonal period. Seasonally adjusted data are assumed throughout, since otherwise seasonal movements will pollute the cycle in all but the band-pass filter.

## References

<a id="ref-Ham2018a"></a>Hamilton, J. D. (2018). Why you should never use the Hodrick-Prescott filter. *The Review of Economics and Statistics* 100(5), 831–843. [doi:10.1162/rest_a_00706](https://doi.org/10.1162/rest_a_00706)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
