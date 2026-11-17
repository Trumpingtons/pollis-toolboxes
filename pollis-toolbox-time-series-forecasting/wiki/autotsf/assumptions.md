# Automatic Time-Series Forecasting — Assumptions

An automatic procedure shifts the assumptions from the model to the search. The conditions below decide whether the choice it returns can be trusted.

## Equal Spacing and the Seasonal Period

The series must be regular, oldest first, with no missing steps, and the **Seasonal Period** is taken as given. A wrong period is the most damaging input error, since no candidate can then represent the true seasonal pattern. Use 12 for monthly and 4 for quarterly data, 7 for daily data with a weekly cycle, and 1 for a series with no seasonality. Multiple cycles, such as hourly data with both daily and weekly patterns, are outside what a single period can represent. Gaps should be filled or the frequency reduced before fitting.

## Enough Data to Select From

Selection among many forms consumes information that estimation also needs. A monthly series with under three years of data gives seasonal estimates that are very noisy, and the holdout in the **Model Race** tab takes up to a fifth of the sample, leaving even less to fit. The criterion may also favour a complex model that happens to fit a short sample well. With few observations it is better to restrict the choice: use a non-seasonal form or a fixed simple model, and prefer the corrected criterion AICc, which penalises parameters harder in small samples.

## Stability of the Data-Generating Process

Every candidate extrapolates patterns that it has seen, on the premise that those patterns persist. A structural break in the sample misleads the unit-root tests into too much differencing and inflates the smoothing parameters of an ETS model, which then chases recent noise. The holdout comparison assumes that the last stretch of the series looks like the future, which fails if it covers an unusual period. **Selection Stability** gives an informal check: if the choice changes when a tenth of the data is removed, the series probably does not support a confident selection.

## Correctness of the Forecast Intervals

Reported intervals come from the selected model as though it had been known in advance, with its parameters fixed at their estimates. Both the search and the estimation therefore add uncertainty that the interval does not show, so true coverage is commonly below the nominal 95%. Errors are treated as roughly Gaussian on the working scale, which may be a transformed one after Box-Cox. Empirical coverage can be assessed by counting how often realised values fall inside the interval across the origins of a rolling exercise, which is the only direct test of whether the intervals hold.

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
