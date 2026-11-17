# Automatic Time-Series Forecasting — Diagnostics

Diagnostics here look at two things: whether the chosen model has left structure in the residuals, and whether the selection itself is reliable.

## Reading Residual Diagnostics After a Search

**Residual Diagnostics** shows the residuals over time, their autocorrelation, and a Ljung-Box test up to twice the period, or up to lag 10 for non-seasonal data. A search that left correlation behind has been limited by its order bounds or has been misled by unusual observations. Clusters of large residuals suggest changing variance, which no candidate in this panel models. A level shift appears as a run of residuals on one side of zero. Passing the test does not prove the model is right: the search has already used the same data, so the statistic is somewhat optimistic.

## Checking Whether the Selection Is Stable

**Selection Stability** reruns the automatic procedure on the first 70%, 80%, 90% and 100% of the series and lists the model chosen each time. Small changes in the orders are normal, and may not affect forecasts much. A move between families, or between a model with a trend and one without, is more serious, since those forecasts diverge at long horizons. Forecasts from fragile selections benefit most from combination. Instability is also informative about the series itself, and often appears when a recent break has changed the behaviour of the data.

## Judging Accuracy Over Forecast Horizons

**Rolling-Origin Accuracy** reselects and refits the model at five successive forecast origins and reports the mean absolute error by horizon step. Reselecting at each origin measures the full procedure, not just one fitted model, and so gives a fair picture of what the automatic method will deliver in production. Accuracy should decay steadily with the horizon. Sudden jumps often come from a seasonal effect, or simply from a small number of test points. Five origins are a modest sample, so differences of a few percent between methods should not be over-read.

## Reading the Compare Methods Table

**Compare Methods** scores the model against every automatic method and against naive and seasonal naive benchmarks on the same split, sorted by MASE. A MASE below 1 means the forecast beats the average in-sample error of the naive method; it does not mean it beats the naive forecast over the holdout, because the benchmark's own holdout score may be above or below 1. Direct comparison with the benchmark rows answers that question. Since the holdout is a single stretch, a small lead proves little, whereas a method that loses to seasonal naive by a wide margin should be dropped.

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
