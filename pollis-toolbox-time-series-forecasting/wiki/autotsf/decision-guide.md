# Automatic Time-Series Forecasting — Decision Guide

The first decision is which tab to run; the second is how much to trust a single selection compared with a benchmark or a combination.

## Which Automatic Method Fits the Series

| Series | Tab | Reason |
|---|---|---|
| Correlation well described by lags, trend or seasonality removed by differencing | **Auto ARIMA** | Tests settle the differencing and a search picks the orders |
| Changing level, trend or seasonality, with swings that grow with the level | **Auto ETS** | Multiplicative and damped forms are in the search |
| Long memory or slow decay with no clear period | **Auto ARARMA** | The filter shortens memory without a hard differencing choice |
| No prior view of the family, with interest in out-of-sample accuracy | **Model Race** | Candidates are scored on held-out data |

## How to Choose the Selection Criterion

**Criterion** picks what the search minimises. AICc is a sensible default: it adds a small-sample correction to AIC and it behaves as AIC for long series. BIC penalises parameters more heavily and leads to smaller models, which is useful when the sample is large and parsimony matters. Compare criterion values only between models of the same family with the same differencing, since the data differ otherwise. That limitation is why the **Model Race** tab compares families on a holdout instead. In the Auto ARARMA tab, AIC often forecasts better at short horizons.

## Stepwise or Exhaustive Search

Stepwise search, the default in the **Search** input, visits only a small part of the possible models and usually finds one close to the best. Exhaustive search adds value when the series is short enough to be quick and the stepwise result looks suspicious, for example when **Selection Stability** shows it jumping between distant orders. For long seasonal series an exhaustive search can take many minutes. Selection differences at this level rarely change forecasts by much, so the extra run is more a check than an improvement, and a model that wins by a small margin is no better for having been found exhaustively.

## When to Move Beyond Automatic Selection

Move on to a hand-built model when the residuals keep showing structure, when the series responds to known events or regressors, or when the coefficients need a clear reading. A selection that is still fragile after these checks argues for a combination rather than for any one winner. Benchmarks keep the exercise honest: if seasonal naive is not beaten at the horizons that matter, the series may simply not contain more signal. Conditional variance models fit better where risk is the target, and neural networks only start to pay off with long series or many related ones.

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
