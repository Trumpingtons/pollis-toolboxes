# High-Frequency Volatility: Factsheet

The tabs, inputs, functions, variables and actions of High-Frequency Volatility at a glance.

## Tabs of High-Frequency Volatility

| Tab | Call | Prices used | `sigma` |
|---|---|---|---|
| **Realized** | `simple_volatility(ts, [asset]; fixed_spacing = 300)`, or without `fixed_spacing` when **Sampling Interval** is blank | Last price every **Sampling Interval** seconds | `vols[asset] * sqrt(span)` |
| **Two-Scales** | `two_scales_volatility(ts, [asset])`, with `num_grids = K` when **Sub-grids (K)** is given | Every tick | `vols[asset] * sqrt(span)` |
| **Bipower** | `(pi / 2) * sum(abs.(r[2:end]) .* abs.(r[1:end-1]))`, with `r = grid_returns(ticks, asset, every)` | Last price every **Sampling Interval** seconds | `sqrt(BPV)` |

Every tab gives `sigma`, the volatility over the span of the ticks, as a decimal.

## Inputs of High-Frequency Volatility

| Input | Default | Tabs | Meaning |
|---|---|---|---|
| **Tick Data** | `simulated` | All | A simulated trading day, or a Tables.jl source with columns `time` (seconds), `asset` (Symbol) and `logprice` |
| **Sampling Interval (seconds)** | 300 | **Realized** | Seconds between the prices whose returns are squared; blank lets HighFrequencyCovariance.jl choose |
| **Sub-grids (K)** | blank | **Two-Scales** | Number of sub-grids of the slow time scale; blank is the package default |
| **Sampling Interval (seconds)** | 300 | **Bipower** | Seconds between the prices whose returns are multiplied |

## Functions of HighFrequencyCovariance.jl in High-Frequency Volatility

| Function | What it does |
|---|---|
| `SortedDataFrame(df, :time, :asset, :logprice, Second(1))` | The package's tick table, sorted by time, with one unit of time a second |
| `get_assets(ts)` | The assets of the tick table |
| `duration(ts; in_dates_period = false)` | The time from the first tick to the last, in seconds |
| `simple_volatility(ts, assets; fixed_spacing, use_all_obs)` | Realized volatility per square root of a second, on a grid of `fixed_spacing` seconds, on every tick with `use_all_obs = true`, or on the package's own spacing |
| `two_scales_volatility(ts, assets; num_grids)` | Two-scales volatility per square root of a second and the noise variance, each a `Dict` by asset |
| `default_num_grids(ts)` | The default number of sub-grids: the fewest ticks of any asset divided by 100, at least 3 |
| `estimate_microstructure_noise(ts, assets)` | The noise variance by asset, from the two-scales estimator |

## Variables of High-Frequency Volatility

| Variable | Tabs | What it holds |
|---|---|---|
| `ticks` | All | The tick table, a named tuple of columns |
| `ts` | All | The same ticks as a `SortedDataFrame` |
| `asset` | All | The asset measured, the first of `get_assets(ts)` |
| `span` | All | Seconds from the first tick to the last |
| `grid_returns` | All | A function: the log returns of `asset` every `every` seconds |
| `vols` | **Realized**, **Two-Scales** | Volatility per square root of a second, by asset |
| `noise` | **Two-Scales** | Noise variance, by asset |
| `r`, `BPV` | **Bipower** | The sampled log returns and their bipower variation |
| `sigma` | All | Volatility over the span |

## Actions of High-Frequency Volatility

| Group | Action | Output |
|---|---|---|
| Visualise | **Price Path** | The price at every tick, against hours since the first |
| Visualise | **Volatility Signature Plot** | Realized volatility at intervals from 1 to 1,800 seconds, with the tab's `sigma` dashed |
| Diagnose | **Barndorff-Nielsen and Shephard Test** | The Z statistic and its one-sided p-value |
| Diagnose | **Microstructure Noise** | The noise standard deviation in basis points and the noise-to-signal ratio |
| Diagnose | **Volatility Through the Day** | Realized volatility of each half hour, from one-minute returns |
| Compare | **All Four Estimators** | Realized on every tick and every five minutes, two-scales and bipower, in % |
| Interpret | **Annualise** | `sigma` times the square root of 252 |
| Interpret | **Jump Share of the Variance** | max(RV − BV, 0) / RV, in % |

The **Barndorff-Nielsen and Shephard Test** and **Jump Share of the Variance** use five-minute returns on **Realized** and **Two-Scales**, and the returns of the tab on **Bipower**.

## See Also

- [Overview](overview.md) · [Introduction to High-Frequency Volatility](intro-hf-volatility.md) · [Realized Volatility](realized-volatility.md) · [Two-Scales Volatility](two-scales-volatility.md) · [Bipower Variation](bipower-variation.md)
