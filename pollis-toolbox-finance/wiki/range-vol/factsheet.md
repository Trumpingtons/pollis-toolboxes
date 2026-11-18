# Range-Based Volatility Estimation — Factsheet

The Range-Based Volatility Estimation panel measures historical volatility from daily open, high, low and close prices rather than from closing prices alone. A high and a low record how far the price actually travelled during the day, so each day carries more information. RangeVol.jl computes the seven estimators.

| | |
|---|---|
| **Purpose** | Estimate realised volatility over a sample or a rolling window from OHLC prices |
| **Julia stack** | RangeVol.jl, with Plots.jl, StatsBase.jl, HypothesisTests.jl and ARCHModels.jl for the actions |
| **Models** | Close-to-Close, Parkinson, Garman-Klass, Rogers-Satchell, GK-Yang-Zhang, Yang-Zhang, Alizadeh-Brandt-Diebold |
| **Output** | Annualised volatility, a rolling volatility series, a persistence forecast, efficiency comparisons |
| **Key choice** | Which estimator matches the drift and the overnight gaps of the asset |

## When to Use a Range-Based Estimator

A range-based estimator suits anyone with daily OHLC data who needs a volatility number or series, and who has no intraday data for realised variance. Short windows benefit most, because precision matters when only 20 or 30 days describe the current state of the market. Risk reports, option traders comparing implied with historical volatility, and position sizing are common uses, and [Sinclair (2013)](#ref-Sin2013a) surveys them from a trader's perspective. Illiquid assets are a poor fit, since a single stale or erroneous print sets the high or the low for the whole day.

## What a Volatility Estimator Does Not Provide

A range-based estimator summarises the past, under the assumption that volatility is constant within the window. No dynamic model is fitted, so the estimate has no forecast of its own beyond carrying the latest value forward. For a variance equation that reacts to shocks, use the GARCH-Type Models panel. For a latent volatility process with parameter inference, use the Discrete-Time Stochastic Volatility Models panel. The estimators also say nothing about the direction of returns, about jumps as a separate component, or about the shape of the return distribution beyond its scale.

## References

<a id="ref-Sin2013a"></a>Sinclair, E. (2013). Volatility Trading. *Wiley (2nd ed.)*. [Link](https://www.wiley.com/en-us/Volatility+Trading%2C+2nd+Edition-p-9781118347133)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
