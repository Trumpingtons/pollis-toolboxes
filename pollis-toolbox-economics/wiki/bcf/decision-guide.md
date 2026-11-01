# Business Cycle Filters — Decision Guide

The first choice is conceptual: what is meant by a trend. The second is practical: whether future data may be used.

## Which Business Cycle Filter to Choose

| Need | Tab | Reason |
|---|---|---|
| The conventional smooth trend, comparable with most earlier work | **Hodrick-Prescott** | Long established, one parameter, no observations lost |
| A cycle free of filter-induced dynamics, using a simple regression | **Hamilton** | Forecast-error definition using past data only |
| A permanent component defined by a forecast | **Beveridge-Nelson** | The trend is the long-run forecast of the fitted ARIMA |
| A cycle restricted to chosen periods | **Baxter-King** | A band-pass approximation that loses observations at each end |
| An HP trend that also follows larger movements | **Boosted HP** | Repeated passes, with a data-based stopping rule |

## Setting the Filter Parameters

Keep **lambda** at 1600 for quarterly data unless there is a reason not to, and set **Stopping Rule** on Boosted HP to BIC for a default that adapts to the data. For Hamilton, keep h = 8 and p = 4 with quarterly data, rescaling for other frequencies. For Baxter-King, keep 6 and 32 quarters with K = 12. For Beveridge-Nelson, compare a few orders, because the result can flip with small changes, and low orders should be treated as a starting point only. Avoid tuning a parameter until a preferred result appears.

## Real-Time and Historical Uses

Historical analysis can use any filter, and two-sided methods are the natural choice when the goal is the best estimate of a past date. Real-time use is different: a current gap for policy should come from a method with small revisions, and any evaluation should use data available at that time. Run **End-Point Sensitivity** on the candidates. Regressions on filtered data need particular care, since a two-sided filter places future values in today's regressor, and that can inflate apparent predictive relationships.

## Reporting Results Across Filters

Reporting one filter invites the question of what the others would show. A good practice is to present one preferred filter, explain why that concept of the trend suits the question, and show the main result under at least one alternative with **Filter Comparison**. Where results agree, the finding is robust to the definition. Where they disagree, say so and explain the source. For structural questions about which shocks cause a cycle, a filter is the wrong tool, and a model such as a VAR or a DSGE should be used instead.

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
