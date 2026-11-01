# Regime Switching Models — Interpretation

Output of a switching model has two parts: what differs between regimes, and how the economy or market moves between them. Read regime labels only after looking at the estimates.

## Reading Coefficients by Regime

**Coefficients by Regime** lists estimates with standard errors, z statistics and p-values for each regime. The main question is whether an effect differs across regimes, not whether each estimate is non-zero. Two estimates with overlapping intervals may not be different, even if only one is significant. A regime with a low mean and high variance is often the natural candidate for a crisis or recession state. Because labels are arbitrary, name the regimes from their coefficients, and check the naming each time the model is refitted, since the order may change.

## Reading the Transition Matrix and Durations

**Transition Matrix and Durations** reports the left-stochastic transition matrix, in which each column sums to one, along with the expected duration of each regime and the long-run share of time spent in it. A regime that persists with probability p lasts on average 1 / (1 - p) periods, so p = 0.95 implies 20 periods and p = 0.5 only 2. Very short durations in monthly or quarterly data suggest the state captures noise. Comparing the ergodic share with the fraction of dates assigned to that regime gives a quick check of consistency.

## Reading Filtered and Smoothed Dates

**Series Coloured by Regime** assigns each observation to the regime with the highest smoothed probability, which gives a visual chronology. That hard assignment discards the uncertainty, so an observation at 0.51 looks the same as one at 0.99. Comparing dates with an external chronology, such as official recession dates, helps to validate the interpretation. Agreement gives an economic meaning to the states. Disagreement does not necessarily mean failure, since a model can pick out something else, for instance a volatility regime, that the external dates were never meant to capture.

## Reading Forecasts and Time-Varying Transitions

**One-Step-Ahead Forecasts** projects regime probabilities forward through the transition matrix and weights the regime predictions, with no look-ahead. Forecasts therefore change slowly unless regimes differ sharply and the filter can identify a switch quickly. **Simulated Paths and Value-at-Risk** simulates 1,000 observations from the fitted model and reports 1% and 5% quantiles of the outcomes, which include regime changes. Under **Time-Varying Transitions**, a positive coefficient on a driver raises the chance of the corresponding transition on a logistic scale, so its size only becomes meaningful when converted to a probability.

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
