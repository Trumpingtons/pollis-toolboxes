# Continuous-Time Macro-Finance — Decision Guide

The panel has one model, so decisions concern calibration, how far to trust a solution, and when another mechanism is needed.

## Which Parameters to Move First

| Question | Parameter | Effect |
|---|---|---|
| How much is long-run risk priced? | **gamma (risk aversion)** | Raises the prices of both risks; gamma psi = 1 removes the long-run price |
| Which way do prices react to growth? | **psi (EIS)** | Above 1, prices rise with growth; below 1, they fall |
| How long does growth news last? | **kappa (mean reversion)** | A lower value means more persistence and a larger premium |
| How large is growth news? | **nu (growth-news volatility)** | Scales the volatility of expected growth |
| How accurate is the solution? | **N (grid points)** | A finer grid costs more and reduces discretisation error |

## How to Calibrate the Long-Run Risk Model

The defaults translate the [Bansal and Yaron (2004)](#ref-BY2004a) calibration into continuous annual units, with stochastic volatility removed. Start there and change one parameter at a time. Use **State Variable Dynamics** to keep the implied consumption process consistent with data, since the small variance share of expected growth is part of the model's plausibility. Use **Asset Pricing Moments** to compare with targets, and keep in mind that this is a consumption claim. Reaching a target with an implausibly high **gamma (risk aversion)** or a very small **kappa (mean reversion)** teaches something about the limits of the mechanism.

## Which Mechanism Suits Which Question

Time-varying risk premia call for a state that changes risk, whereas the panel's version keeps risk nearly constant. Habit formation in [Campbell and Cochrane (1999)](#ref-CC1999a) raises risk aversion in bad times. Rare disasters in [Wachter (2013)](#ref-Wac2013a) make crash probability the main risk. Intermediary models in [He and Krishnamurthy (2013)](#ref-HK2013a) and [Brunnermeier and Sannikov (2014)](#ref-BS2014a) make the balance sheets of financial institutions the state, generating crisis dynamics that a single-agent model cannot produce. For those mechanisms, start from the notebook tutorials **Habit Formation**, **Rare Disasters**, **Intermediary Asset Pricing** and **Financial Sector**, adapted from the examples of EconPDEs.jl, since none is available through this panel's inputs.

## When a Continuous-Time Model Is the Wrong Tool

The approach suits one or two state variables. With many states, a grid becomes impractical, and a perturbation method in the Dynamic Stochastic General Equilibrium (DSGE) panel may fit better. For estimating risk prices from returns rather than deriving them, the factor pricing panels are the right place. A model with many household types needs a distribution as well, which the Heterogeneous-Agent Models panel handles. If the goal is to fit moments formally, the solver here must be wrapped in an estimation loop, since the panel only computes a solution for each given calibration.

## References

<a id="ref-BY2004a"></a>Bansal, R. and Yaron, A. (2004). Risks for the Long Run: A Potential Resolution of Asset Pricing Puzzles. *The Journal of Finance* 59(4), 1481–1509. [doi:10.1111/j.1540-6261.2004.00670.x](https://doi.org/10.1111/j.1540-6261.2004.00670.x)

<a id="ref-BS2014a"></a>Brunnermeier, M. K. and Sannikov, Y. (2014). A Macroeconomic Model with a Financial Sector. *American Economic Review* 104(2), 379–421. [doi:10.1257/aer.104.2.379](https://doi.org/10.1257/aer.104.2.379)

<a id="ref-CC1999a"></a>Campbell, J. Y. and Cochrane, J. H. (1999). By Force of Habit: A Consumption-Based Explanation of Aggregate Stock Market Behavior. *Journal of Political Economy* 107(2), 205–251. [doi:10.1086/250059](https://doi.org/10.1086/250059)

<a id="ref-HK2013a"></a>He, Z. and Krishnamurthy, A. (2013). Intermediary Asset Pricing. *American Economic Review* 103(2), 732–770. [doi:10.1257/aer.103.2.732](https://doi.org/10.1257/aer.103.2.732)

<a id="ref-Wac2013a"></a>Wachter, J. A. (2013). Can Time‐Varying Risk of Rare Disasters Explain Aggregate Stock Market Volatility?. *The Journal of Finance* 68(3), 987–1035. [doi:10.1111/jofi.12018](https://doi.org/10.1111/jofi.12018)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
