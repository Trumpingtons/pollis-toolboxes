# Dynamic Stochastic General Equilibrium (DSGE) — Overview

The panel defines one model, by name or through the equations in the code, and then applies one of three tabs to it. The equations stay the same across tabs, so moments, posterior draws and impulse responses all describe the same economy.

## How a DSGE Model Is Written

MacroModelling.jl uses two macros: `@model` holds the equations, with time written as `c[0]`, `c[1]`, `k[-1]` and shocks as `eps_z[x]`, and `@parameters` holds the calibration. **Model** picks a model from the package's library, such as `FS2000` or `Smets_Wouters_2007`, or `custom` for the panel's small business-cycle model with technology and government spending shocks, named by **Custom DSGE**. The package finds the steady state and differentiates the equations automatically, so no linearisation by hand is needed.

## The Moments Tab

The **Moments** tab needs no data. Means, volatilities, autocorrelations and variance shares follow directly from the solved model and its calibration. **Solution Order** selects first order, which is linear, or pruned second or third order. Higher orders let risk affect means and allow asymmetric responses, following [Schmitt-Grohé and Uribe (2004)](#ref-SU2004a). Pruning, as in [Andreasen, Fernández-Villaverde and Rubio-Ramírez (2018)](#ref-AFR2018a), removes terms that would otherwise make simulated paths explode, and it delivers closed-form moments. Use the tab to learn whether a calibration produces business cycles of a sensible size before any estimation.

## The Estimation Tab

The **Estimation** tab draws from the Bayesian posterior of **Estimated Parameters**, leaving the others at their calibrated values. **Data** is either `simulated`, which generates 200 quarters from the model at its calibration so that the true values are known, or a table of your own with one row per variable. **Observables** names the series used. The Kalman filter gives the likelihood at first order, and **Sampler** chooses NUTS or HMC, with **Draws** and **Burn-in**. [Herbst and Schorfheide (2015)](#ref-HS2015a) give a full treatment of Bayesian estimation for these models. Priors are centred on the calibration.

## The Impulse Responses Tab

The **Impulse Responses** tab traces each variable's reaction to one structural shock over **Periods**, starting from the steady state. **Shock** is the name of the shock in the model equations, without the leading colon. A response is what the model implies rather than what data show, so a change in a parameter changes the response directly. [Smets and Wouters (2007)](#ref-SW2007a) is the usual reference for reading such responses in an estimated model, since its responses combine many frictions.

## Common Workflow for a DSGE Analysis

1. Write or choose a model, and set a calibration.
2. Run **Steady State** and **Saddle-Path Stability** to confirm that a solution exists.
3. Use **Moments** and **Model-Implied ACF** to compare with data.
4. Use **Impulse Response Plot** and **Variance Decomposition Plot** to read the mechanism.
5. Estimate on simulated data first, then on real data.
6. Read **Shock Decomposition** and **Conditional Forecast**.

## References

<a id="ref-AFR2018a"></a>Andreasen, M. M., Fernández-Villaverde, J. and Rubio-Ramírez, J. F. (2018). The pruned state-space system for non-linear DSGE models: Theory and empirical applications. *The Review of Economic Studies* 85(1), 1–49. [doi:10.1093/restud/rdx037](https://doi.org/10.1093/restud/rdx037)

<a id="ref-HS2015a"></a>Herbst, E. P. and Schorfheide, F. (2015). Bayesian Estimation of DSGE Models. *Princeton University Press*. [doi:10.23943/princeton/9780691161082.001.0001](https://doi.org/10.23943/princeton/9780691161082.001.0001)

<a id="ref-SU2004a"></a>Schmitt-Grohé, S. and Uribe, M. (2004). Solving dynamic general equilibrium models using a second-order approximation to the policy function. *Journal of Economic Dynamics and Control* 28(4), 755–775. [doi:10.1016/S0165-1889(03)00043-5](https://doi.org/10.1016/S0165-1889(03)00043-5)

<a id="ref-SW2007a"></a>Smets, F. and Wouters, R. (2007). Shocks and frictions in US business cycles: A Bayesian DSGE approach. *American Economic Review* 97(3), 586–606. [doi:10.1257/aer.97.3.586](https://doi.org/10.1257/aer.97.3.586)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
