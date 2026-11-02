# Factsheet

The Extreme Value Risk Measures panel turns a fitted tail model into risk figures: return levels from block maxima, the quantile of losses above a threshold, and Value at Risk (VaR) with Expected Shortfall (ES). Every figure is unconditional, so it describes the series as a whole and not the current state of the market or system.

## What the Extreme Value Risk Measures Panel Does

| Item | Description |
|---|---|
| **Purpose** | Estimating the size of rare losses from a generalised extreme value (GEV) or generalised Pareto (GP) fit |
| **Julia stack** | Extremes.jl for the fits; Distributions.jl for the GP quantile; Plots.jl for the exceedance plot |
| **Models** | **Return Levels**, **Peaks-Over-Threshold** and **Tail Risk** tabs |
| **Input shape** | **Data series** is a vector of block maxima for **Return Levels**, and a full series of positive values for the two threshold tabs |
| **Key choice** | The block length or threshold that defines the tail, and how far to extrapolate |

## How the Tabs of the Extreme Value Risk Measures Panel Differ

| Tab | Fit | Formula | Printed values |
|---|---|---|---|
| **Return Levels** | GEV on the series | `returnlevel(fm, T)` for each T | Return level for each T |
| **Peaks-Over-Threshold** | GP on excesses over **Threshold u** | Quantile 0.99 of a GP located at u | **sigma_hat**, **xi_hat**, **Exceedance rate**, **99th pct above u** |
| **Tail Risk** | GP on excesses over **Threshold u** | VaR and ES from the GP tail | **VaR (Extreme Value)**, **ES (Extreme Value)** |

## Which Inputs the Tabs of the Extreme Value Risk Measures Panel Use

| Input | Tab | Default | Meaning |
|---|---|---|---|
| **Data series** | **Return Levels** | `maxima` | Block maxima |
| **Data series** | **Peaks-Over-Threshold**, **Tail Risk** | `rainfall` | The full series, whose excesses over u are fitted |
| **Estimation method** | All | **Maximum Likelihood** | Or **Probability-Weighted Moments**, or **Bayesian Estimation** |
| **Return periods** | **Return Levels** | 10 50 100 | Periods T, counted in blocks |
| **Threshold u** | **Peaks-Over-Threshold**, **Tail Risk** | 30 | Each tab keeps its own value |
| **alpha (level)** | **Tail Risk** | 0.001 | Tail probability, so 0.001 gives the 99.9 percent VaR; it must be under the exceedance rate |

## Which Next Steps the Extreme Value Risk Measures Panel Offers

| Group | Next Step | What it does |
|---|---|---|
| Diagnose | **Exceedance Rate Analysis** | On the two threshold tabs, plots the share of values above a threshold across 50 thresholds |
| Diagnose | **Return Level Uncertainty** | On **Return Levels**, prints a 95 percent interval for each return period |
| Interpret | **Empirical vs Extreme Value Risk** | On **Tail Risk**, prints the empirical VaR and ES beside the Extreme Value ones |

Run the Diagnose steps before relying on any risk figure from the panel.

## See Also

- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
