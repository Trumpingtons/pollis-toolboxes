# Automatic Time-Series Forecasting — Factsheet

The Automatic Time-Series Forecasting panel leaves model selection to an algorithm: a search picks the differencing and orders of an ARIMA, the form of an exponential smoothing model, or the filter and orders of an ARARMA, and a race can choose between those families on held-out data. All the fitting runs through Durbyn.jl.

| | |
|---|---|
| **Purpose** | Forecast one series without choosing the model by hand |
| **Julia stack** | Durbyn.jl, with Plots.jl, HypothesisTests.jl and StatsBase.jl for the actions |
| **Models** | Auto ARIMA, Auto ETS, Auto ARARMA, Model Race |
| **Output** | The selected model, forecasts with 80% and 95% intervals, holdout accuracy, a record of the candidates |
| **Key choice** | Which family to search, or a race between all of them, and the seasonal period |

## When Automatic Forecasting Is the Right Tool

Automatic selection earns its place when many series need forecasts and nobody can inspect each one, or as a strong baseline against which a hand-built model must justify itself. It also protects an analyst from choosing a specification because of what the answer turned out to be. The method needs an equally spaced series and the correct seasonal period. Short series offer little to select from, so with only a couple of seasonal cycles, the choice between candidates is close to noise, and a simple method such as seasonal naive deserves serious attention.

## What Automatic Forecasting Does Not Replace

A search picks among the forms it was given, and it cannot notice that a promotion, a strike or a policy change explains a jump. Outliers and level shifts should be cleaned or modelled before selection, because they distort the differencing tests and the criterion alike. An automatic model also assumes that the past pattern continues, and its intervals only reflect uncertainty within the chosen model, not the uncertainty of having chosen it. Regressors are outside this panel's scope. Where they matter, use the ARIMAX tab of the ARIMA Models panel instead.

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
