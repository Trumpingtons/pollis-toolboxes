# Continuous-Time Macro-Finance — Overview

The panel writes down one equation, solves it, and reads prices from the solution. All inputs are annual and in continuous time: **gamma (risk aversion)**, **psi (EIS)**, **rho (discount rate)**, **mubar (mean growth)**, **sigma (consumption volatility)**, **kappa (mean reversion)**, **nu (growth-news volatility)** and **N (grid points)**.

## How Long-Run Risk Is Set Up

Consumption grows as dC / C = mu dt + sigma dZc, and expected growth moves slowly as d mu = kappa (mubar - mu) dt + nu sigma dZmu. A small, persistent component in growth is hard to detect in consumption data, and yet it can matter a lot for investors, which is the central idea of [Bansal and Yaron (2004)](#ref-BY2004a). Mean reversion at a low **kappa** means that a change in expected growth lasts for years. The one unknown function is the wealth-consumption ratio p(mu), defined on a grid for mu that spans three stationary standard deviations around the mean.

## How Recursive Preferences Enter

The preferences of [Epstein and Zin (1989)](#ref-EZ1989a) separate **gamma (risk aversion)** from **psi (EIS)**, which standard power utility forces to be reciprocals. The market price of growth news is (gamma psi - 1) / (psi - 1) times the volatility of p. When gamma psi = 1, utility is power utility, and growth news carries no price. When gamma exceeds 1 / psi, the investor prefers early resolution of uncertainty and dislikes news about future growth. **psi (EIS)** must differ from 1, since the formulas divide by psi - 1, and a value above 1 gives a wealth-consumption ratio that rises with expected growth.

## How the Equation Is Solved

The panel defines the residual of the pricing equation as a Julia function, and the solver `pdesolve` from EconPDEs.jl finds p(mu) on the grid. Derivatives are finite differences, upwinded on the sign of the drift of mu, using `pmu_up` or `pmu_down`, which keeps the scheme stable. From p and its derivatives, the code computes the volatility of p, the risk-free rate, the excess return on the consumption claim and the market prices of risk. Results are then available at every grid point, weighted when needed by the stationary density of mu.

## Common Workflow for Solving the Model

1. Set the preferences and the consumption process, or keep the defaults.
2. Solve, then run **Convergence Check** before reading anything.
3. See the solution with **Wealth-Consumption Ratio** and **Risk Premium**.
4. Read **Sharpe Ratio** and **Asset Pricing Moments**.
5. Look at **State Variable Dynamics** to judge the calibration.
6. Change one parameter at a time, and compare with the earlier results.

## References

<a id="ref-BY2004a"></a>Bansal, R. and Yaron, A. (2004). Risks for the Long Run: A Potential Resolution of Asset Pricing Puzzles. *The Journal of Finance* 59(4), 1481–1509. [doi:10.1111/j.1540-6261.2004.00670.x](https://doi.org/10.1111/j.1540-6261.2004.00670.x)

<a id="ref-EZ1989a"></a>Epstein, L. G. and Zin, S. E. (1989). Substitution, Risk Aversion, and the Temporal Behavior of Consumption and Asset Returns: A Theoretical Framework. *Econometrica* 57(4), 937. [doi:10.2307/1913778](https://doi.org/10.2307/1913778)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
