# Automatic Time-Series Forecasting — Interpretation

The output of an automatic forecast is mainly the forecast. The selected model's form still says something useful about the series, and the record of candidates tells how firm the choice was.

## Reading the ETS Form and Smoothing Parameters

**Selected Model** writes an ETS form as three letters for error, trend and seasonality, with A for additive, M for multiplicative, N for none and Ad for a damped trend. ETS(M,Ad,M), for example, is a multiplicative error with a damped trend and multiplicative seasonality. Smoothing parameters measure how quickly each component adapts: a level parameter near 1 means the latest observation dominates, and one near 0 means the level is almost fixed. Very high trend or seasonal parameters suggest instability. The name of the form describes forecast behaviour, not a mechanism at work in the data.

## Reading the Selected ARIMA and ARARMA

For Auto ARIMA, the orders tell a story about persistence: d = 1 means a stochastic level, and D = 1 means an evolving seasonal pattern. Differences between orders that have similar criterion values rarely mean anything, so **Candidates Considered** should be read before any conclusion about the dynamics. For Auto ARARMA, the report has the memory-shortening filter and then the ARMA coefficients of the filtered series. Coefficients there refer to a filtered series and do not carry over to the original, so forecasts and their intervals are the meaningful output.

## Reading Forecast Tables and Intervals

**Forecast Table** lists the point forecast with its 80% and 95% prediction intervals at each step, and **Forecast Plot** draws the series, the in-sample fit and the 95% band. A point forecast estimates the mean or median of future values on the original scale and should not be read as the most likely path, which would show more variation. An interval that looks tight next to the recent volatility of the series deserves suspicion. Comparing nominal intervals with the errors reported by **Rolling-Origin Accuracy** is a quick way to see whether they are realistic.

## When a Combination of Forecasts Wins

**Forecast Combination** scores auto ARIMA, auto ETS and auto theta against their simple average on the holdout. [Bates and Granger (1969)](#ref-BG1969a) showed that averaging forecasts tends to cut error, because different methods make different mistakes, and later forecasting competitions have repeatedly confirmed the result. A combination that beats every member suggests that no single family captures the series. It also hedges against a selection that later proves unstable. The price is that a combined forecast has no single model behind it, so its intervals are not produced directly.

## References

<a id="ref-BG1969a"></a>Bates, J. M. and Granger, C. W. J. (1969). The Combination of Forecasts. *Operational Research Quarterly* 20(4), 451–468. [doi:10.1057/jors.1969.103](https://doi.org/10.1057/jors.1969.103)

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
