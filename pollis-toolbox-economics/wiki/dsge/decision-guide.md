# Dynamic Stochastic General Equilibrium (DSGE) — Decision Guide

Choices concern the model's scale, the order of the solution, and how much of the structure to take to data.

## Which DSGE Tab to Use

| Question | Tab | What it needs |
|---|---|---|
| Does the calibration produce sensible business cycles? | **Moments** | A calibrated model, no data |
| What do the data say about the parameters? | **Estimation** | Observables and priors, or simulated data for a test |
| How does a shock spread through the economy? | **Impulse Responses** | A calibrated model and a shock name |

## Which Perturbation Order to Use

**Solution Order** should be the lowest that answers the question. First order suits business-cycle volatility, responses to small shocks and fast likelihood evaluation. Pruned second order is needed once a mean is affected by risk, as in welfare comparisons or risk premia, which are zero at first order. Pruned third order is needed for time-varying risk, for example responses that change with the level of uncertainty, as in [Andreasen, Fernández-Villaverde and Rubio-Ramírez (2018)](#ref-AFR2018a). Higher order costs more time, and the size of **First vs Second Order** differences helps justify that cost.

## Which Software Route to Choose

MacroModelling.jl works directly in Julia, differentiates automatically, and supplies gradients for samplers such as NUTS, which is why the panel uses it. Dynare, documented in [Adjemian, Bastani, Juillard, Mihoubi, Perendia, Ratto and Villemot (2011)](#ref-ABJMP...2011a), remains the standard outside Julia, and its model files can often be translated to the macros used here. For a larger model with many parameters, use **Draws** in the upper part of the suggested range and expect long runtimes. If **HMC** with a fixed step mixes poorly, prefer **NUTS**, which adapts its step during the **Burn-in** draws.

## When a Different Tool Fits Better

A VAR makes fewer assumptions and is a good starting benchmark: the VAR Models panel shows what a shock does with limited structure, which can be compared with the DSGE response. When the economy can switch regimes, a perturbation for that case needs a dedicated method such as [Foerster, Rubio-Ramírez, Waggoner and Zha (2016)](#ref-FRWZ2016a), and it is not available here. Nonlinear global methods are better for occasionally binding constraints. A panel with a distribution of households is better for inequality. For very long-run questions, a growth model without a business-cycle focus may be clearer.

## References

<a id="ref-ABJMP...2011a"></a>Adjemian, S., Bastani, H., Juillard, M., Mihoubi, F., Perendia, G., Ratto, M. and Villemot, S. (2011). Dynare: Reference Manual. [Link](https://www.dynare.org/wp-repo/dynarewp001.pdf)

<a id="ref-AFR2018a"></a>Andreasen, M. M., Fernández-Villaverde, J. and Rubio-Ramírez, J. F. (2018). The pruned state-space system for non-linear DSGE models: Theory and empirical applications. *The Review of Economic Studies* 85(1), 1–49. [doi:10.1093/restud/rdx037](https://doi.org/10.1093/restud/rdx037)

<a id="ref-FRWZ2016a"></a>Foerster, A., Rubio-Ramírez, J. F., Waggoner, D. F. and Zha, T. (2016). Perturbation methods for Markov-switching DSGE models. *Quantitative Economics* 7(2), 637–669. [doi:10.3982/QE596](https://doi.org/10.3982/QE596)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
