# Continuous-Time Macro-Finance — Factsheet

The Continuous-Time Macro-Finance panel solves an asset pricing model as a partial differential equation. Its one model is the long-run risk economy of [Bansal and Yaron (2004)](#ref-BY2004a), with constant volatility and written in continuous time, in which a representative investor with recursive preferences prices a claim on consumption. EconPDEs.jl solves the equation by finite differences.

| | |
|---|---|
| **Purpose** | Solve for the wealth-consumption ratio and the risk premia implied by structural parameters |
| **Julia stack** | EconPDEs.jl, with Plots.jl for the figures |
| **Model** | Long-run risk with Epstein-Zin preferences and a single state, expected consumption growth |
| **Output** | A wealth-consumption ratio on a grid, the risk premium and its two sources, Sharpe ratios, unconditional moments |
| **Key choice** | The calibration of risk aversion, the elasticity of substitution, and the persistence of growth news |

## When to Use a Continuous-Time Pricing Model

A continuous-time solution suits a theoretical question about what a set of preferences and a consumption process imply for prices. Experimenting with one parameter and seeing the whole policy over the state is quick, and the equation is exact up to a grid error, with no need for the log-linear approximations often used in discrete-time work. The approach continues the tradition of [Merton (1973)](#ref-Mer1973a). The method is a calibration tool for understanding a mechanism, and it is not a procedure for estimating parameters from data.

## What the Panel Covers and Omits

The panel's code solves one economy only: long-run risk with constant volatility, on one state variable, for a claim to consumption. Stochastic volatility, a second state in the original model, is not included, and neither is a levered dividend claim. The panel has no tabs for habit, disaster or intermediary models. The notebook tutorials cover them, adapted from the examples of EconPDEs.jl: **Long-Run Risk** has the second state, and **Habit Formation**, **Rare Disasters**, **Intermediary Asset Pricing**, **Financial Sector** and **Uncertainty Shocks** have the other models.

## References

<a id="ref-BY2004a"></a>Bansal, R. and Yaron, A. (2004). Risks for the Long Run: A Potential Resolution of Asset Pricing Puzzles. *The Journal of Finance* 59(4), 1481–1509. [doi:10.1111/j.1540-6261.2004.00670.x](https://doi.org/10.1111/j.1540-6261.2004.00670.x)

<a id="ref-Mer1973a"></a>Merton, R. C. (1973). An Intertemporal Capital Asset Pricing Model. *Econometrica* 41(5), 867. [doi:10.2307/1913811](https://doi.org/10.2307/1913811)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
