# Range-Based Volatility Estimation — Interpretation

Reading the output involves annualisation, sampling error and the difference between measuring volatility and forecasting it.

## Reading an Annualised Volatility Number

The panel scales daily variance by **Trading periods**, typically 252 for equities, 260 for currencies and 365 for crypto, so an estimate is reported in annual terms. **Time Scaling** restates the same volatility over a day, a week, a month and a year using the square root of time. Scaling is exact only if returns are uncorrelated. Different estimators measure slightly different things: full-day or trading-day variance. A Parkinson value from a stock market reflects trading hours only, so it may not be directly comparable with an implied volatility that covers overnight risk too.

## What the Efficiency Figures Mean

Efficiency compares the sampling variance of a variance estimator with that of close-to-close. An efficiency of 5 means one day of data is as informative as five days of closes. The usually quoted figures, about 5.2 for Parkinson, 7.4 for Garman-Klass, 8 for Rogers-Satchell and 14 for Yang-Zhang, are best read as ceilings under ideal conditions. Simulating a driftless continuous random walk with no overnight move gives about 4.9 for Parkinson and about 6 for Rogers-Satchell. Real data with intraday patterns and discrete trading usually falls short of all of these.

## Reading Rolling Volatility and Disagreement

**Rolling Volatility** plots the annualised estimate over **Window (days)** against close-to-close. The range-based line should be smoother, since each day carries more information. Both lines lag true volatility by about half a window, regardless of the estimator. Lasting vertical distance between lines reflects a systematic cause such as overnight gaps. Brief differences reflect noise. **Prices and Ranges** helps to explain a spike, by showing whether it comes from one wide day or from a run of wide days. One wide day may be an event or a data error, so look before interpreting.

## Reading Forecasts and the GARCH Comparison

**Volatility Forecast** carries the latest window's volatility forward over **Horizon (days)**, scaled by the square root of time, and gives an implied 95% price band. A persistence forecast is a benchmark, not a model: the forecast does not account for mean reversion. **Compare with GARCH** plots GARCH(1,1) conditional volatility from close-to-close returns against the rolling range-based estimate. GARCH reacts to the latest shock, and a rolling estimate measures what happened over the window. Large differences after a shock are therefore expected, and neither line is simply wrong.

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
