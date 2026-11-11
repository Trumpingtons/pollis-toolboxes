# Factsheet

The Portfolio Optimisation panel chooses weights for a set of assets from their daily returns, by four methods. Two of them trade expected return against a risk measure, variance or Expected Shortfall. The other two use the cluster structure of the correlations and ignore expected returns. Every method can be judged on returns it did not see, through a walk-forward backtest.

## What the Portfolio Optimisation Panel Does

| Item | Description |
|---|---|
| Purpose | Portfolio weights from daily returns, and their evaluation on held-out returns |
| Julia stack | `PortfolioOptimisers.jl`, with `Clarabel.jl` as the solver and `Plots.jl` for charts |
| Input | **Returns Matrix (R)**, T x N daily simple returns, one column per asset |
| Output | Weights in percent, with in-sample risk and return, risk contributions and out-of-sample Sharpe ratios |
| Key choice | The method, and for the first two methods the **Objective** |

Weights are long-only and fully invested: each weight lies between 0 and 1, and the weights add up to 1. Annualised figures assume 252 trading days.

## What Each Portfolio Optimisation Tab Fits

| Tab | What it computes | Uses expected returns |
|---|---|---|
| **Mean-Variance** | Weights trading mean return against variance, after Markowitz (1952) | Yes, unless **Objective** is **Minimum Risk** |
| **Mean-Expected Shortfall** | The same trade-off, with the Expected Shortfall in place of variance | Yes, unless **Objective** is **Minimum Risk** |
| **HRP** | Hierarchical Risk Parity: weights split down a tree of assets by inverse risk | No |
| **HERC** | Hierarchical Equal Risk Contribution: equal risk for clusters cut from the tree | No |

The [Mean-Variance](mean-variance.md), [Mean-Expected Shortfall](mean-expected-shortfall.md), [HRP](hrp.md) and [HERC](herc.md) pages describe each tab.

## Which Inputs the Portfolio Optimisation Panel Takes

| Input | Tabs | Default | Meaning |
|---|---|---|---|
| **Returns Matrix (R)** | All | `R` | Daily simple returns; with `R`, a simulated example of 8 assets in two sectors |
| **Objective** | Mean-Variance, Mean-Expected Shortfall | **Minimum Risk** | **Minimum Risk**, **Maximum Risk-Adjusted Return** or **Maximum Utility** |
| **Risk Aversion (l)** | Mean-Variance, Mean-Expected Shortfall | 2 | Weight on risk in E[r] - l * risk, used only by **Maximum Utility** |
| **Expected Shortfall Tail Probability (alpha)** | Mean-Expected Shortfall | 0.05 | Share of worst days averaged by the Expected Shortfall |
| **Risk-Free Rate (Annual)** | All | 0.02 | Converted to a daily rate, rf / 252, for Sharpe and STARR ratios |

## What the Next Steps of Portfolio Optimisation Offer

| Group | Next Steps |
|---|---|
| Visualise | **Efficient Frontier**, **Weights Bar Chart**, **Risk Contribution** |
| Diagnose | **Correlation Heatmap**, **Rolling Sharpe Ratio** |
| Predict | **Out-of-Sample Performance** |
| Compare | **vs Equal Weight**, **Compare Methods** |
| Interpret | **Portfolio Weights**, **Expected Risk & Return** |

[Diagnostics](diagnostics.md), [Interpretation](interpretation.md) and [Out-of-Sample Evaluation](out-of-sample.md) say how to read them.

## References

<a id="ref-Mar1952a"></a>Markowitz, H. M. (1952). Portfolio selection. *Journal of Finance* 7(1), 77–91. [doi:10.2307/2975974](https://doi.org/10.2307/2975974)

## See Also

- [Overview](overview.md) · [Assumptions](assumptions.md) · [Decision Guide](decision-guide.md) · [Out-of-Sample Evaluation](out-of-sample.md)
