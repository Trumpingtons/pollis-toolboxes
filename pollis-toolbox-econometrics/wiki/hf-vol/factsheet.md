# High-Frequency Volatility: Factsheet

The tabs, inputs, functions, variables and actions of High-Frequency Volatility at a glance.

## Tabs of High-Frequency Volatility

| Tab | Call | Prices used | `sigma` |
|---|---|---|---|
| **Realized** | `simple_volatility(ts, [asset]; fixed_spacing = 300)`, or without `fixed_spacing` when **Sampling Interval** is blank | Last price every **Sampling Interval** seconds | `vols[asset] * sqrt(span)` |
| **Two-Scales** | `two_scales_variance(y, K)` of TwoScalesVolatility.jl, with `y` the log prices of `asset` in time order | Every tick | `sqrt(two_scales_variance(y, K))` |
| **Bipower** | `(pi / 2) * sum(abs.(r[2:end]) .* abs.(r[1:end-1]))`, with `r = grid_returns(ticks, asset, every)` | Last price every **Sampling Interval** seconds | `sqrt(BPV)` |

Every tab gives `sigma`, the volatility over the span of the ticks, as a decimal.

## Inputs of High-Frequency Volatility

| Input | Default | Tabs | Meaning |
|---|---|---|---|
| **Tick Data** | `simulated` | All | A simulated trading day, or a Tables.jl source with columns `time` (seconds), `asset` (Symbol) and `logprice` |
| **Sampling Interval (seconds)** | 300 | **Realized** | Seconds between the prices whose returns are squared; blank lets HighFrequencyCovariance.jl choose |
| **Sub-grids (K)** | blank | **Two-Scales** | Number of sub-grids of the slow time scale; blank is K = c* n^(2/3), equation (10) of Zhang, Mykland and Aït-Sahalia (2005) |
| **Sampling Interval (seconds)** | 300 | **Bipower** | Seconds between the prices whose returns are multiplied |

## Functions of HighFrequencyCovariance.jl in High-Frequency Volatility

| Function | What it does |
|---|---|
| `SortedDataFrame(df, :time, :asset, :logprice, Second(1))` | The package's tick table, sorted by time, with one unit of time a second |
| `get_assets(ts)` | The assets of the tick table |
| `duration(ts; in_dates_period = false)` | The time from the first tick to the last, in seconds |
| `simple_volatility(ts, assets; fixed_spacing, use_all_obs)` | Realized volatility per square root of a second, on a grid of `fixed_spacing` seconds, on every tick with `use_all_obs = true`, or on the package's own spacing |

## Functions of TwoScalesVolatility.jl in High-Frequency Volatility

| Function | What it does |
|---|---|
| `two_scales_variance(y, K)` | The two-scales estimate of the integrated variance from the log prices `y` with `K` sub-grids, adjusted for small samples: equations (55) and (64) |
| `noise_variance(y)` | The noise variance from every tick, RV_all / (2n): equation (22) |
| `noise_variance(y, K)` | The noise variance from both time scales: equation (65) |
| `optimal_c(T, noise_variance, quarticity)` | The constant c* of the optimal number of sub-grids K = c* n^(2/3): equation (10) |

## Variables of High-Frequency Volatility

| Variable | Tabs | What it holds |
|---|---|---|
| `ticks` | All | The tick table, a named tuple of columns |
| `ts` | All | The same ticks as a `SortedDataFrame` |
| `asset` | All | The asset measured, the first of `get_assets(ts)` |
| `span` | All | Seconds from the first tick to the last |
| `grid_returns` | All | A function: the log returns of `asset` every `every` seconds |
| `vols` | **Realized** | Volatility per square root of a second, by asset |
| `y`, `n`, `K` | **Two-Scales** | The log prices of `asset` in time order, their number of returns and the sub-grids |
| `r`, `BPV` | **Bipower** | The sampled log returns and their bipower variation |
| `sigma` | All | Volatility over the span |

## Actions of High-Frequency Volatility

| Group | Action | Output |
|---|---|---|
| Visualise | **Price Path** | The price at every tick, against hours since the first |
| Visualise | **Volatility Signature Plot** | Realized volatility at intervals from 1 to 1,800 seconds, with the tab's `sigma` dashed |
| Diagnose | **Barndorff-Nielsen and Shephard Test** | The Z statistic and its one-sided p-value |
| Diagnose | **Microstructure Noise** | The noise standard deviation in basis points, from equation (65), and the noise-to-signal ratio |
| Diagnose | **Volatility Through the Day** | Realized volatility of each half hour, from one-minute returns |
| Compare | **All Four Estimators** | Realized on every tick and every five minutes, two-scales and bipower, in % |
| Interpret | **Annualise** | `sigma` times the square root of 252 |
| Interpret | **Jump Share of the Variance** | max(RV − BV, 0) / RV, in % |

The **Barndorff-Nielsen and Shephard Test** and **Jump Share of the Variance** use five-minute returns on **Realized** and **Two-Scales**, and the returns of the tab on **Bipower**.

## See Also

- [Overview](overview.md) · [Introduction to High-Frequency Volatility](intro-hf-volatility.md) · [Realized Volatility](realized-volatility.md) · [Two-Scales Volatility](two-scales-volatility.md) · [Bipower Variation](bipower-variation.md)
