# Reduced Form

## What the Reduced Form Tab Fits

The Reduced Form tab regresses the Dependent Variable on the shift-share regressor itself, each row's shares in the shocks times the shocks, with no endogenous variable. Borusyak, Hull and Jaravel (2022) cover this direct regression as well as the instrumental variables one: its coefficient equals that of a regression across the shocks of the outcome's means over the areas exposed to each shock, after the controls, on the shocks ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). The tab estimates it with `fit_shock_level(y, d; shock_controls, shock_clusters)` of SpatialEconometrics.jl, with no `treatment` ([Randsley (2026)](#ref-Ran2026a)). It prints the estimate, its standard error across the shocks, its interval with the null imposed and the effective number of shocks.

## When to Use the Reduced Form

The Reduced Form tab answers how the outcome moves with each area's exposure to the shocks, when that exposure is the quantity of interest, or before the endogenous change it moves is measured. The coefficient of the Shift-Share IV tab is the reduced-form coefficient divided by the first-stage one, so a reduced form near zero leaves little effect for the instrumental variables regression to find ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). The Reduced Form tab prints no first-stage F, since it has no first stage; its Next Steps are those of the Shift-Share IV tab, with the shift-share regressor in place of the Endogenous Variable.

## References

<a id="ref-BHJ2022a"></a>Borusyak, K., Hull, P. and Jaravel, X. (2022). Quasi-experimental shift-share research designs. *Review of Economic Studies*, 89(1), 181–213. [doi:10.1093/restud/rdab030](https://doi.org/10.1093/restud/rdab030)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Shift-Share IV](ssiv.md) · [Shares, Shocks and Identification](identification.md) · [Overview](overview.md)
