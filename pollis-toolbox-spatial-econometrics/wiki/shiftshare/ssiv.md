# Shift-Share IV

## What the Shift-Share IV Tab Fits

The Shift-Share IV tab estimates the effect of the Endogenous Variable on the Dependent Variable, with the shift-share regressor as the instrument: each row's shares in the shocks times the shocks. Borusyak, Hull and Jaravel (2022) show that the coefficient of this instrumental variables regression across the areas equals that of an instrumental variables regression across the shocks, in which the means of the outcome and of the Endogenous Variable over the areas exposed to each shock, after the controls, are regressed on each other with the shock as the instrument ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). The tab estimates that regression with `fit_shock_level(y, d; treatment = x, shock_controls, shock_clusters)` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)).

## What the Shift-Share IV Tab Prints

| Line | What it gives |
|---|---|
| Rows, areas, periods, shocks | The size of the design, and the clusters of the shocks |
| Shares | Whether they sum to the same total, and if not, the controls added |
| Estimate, Std. Error, z | The coefficient and its standard error across the shocks |
| 95% interval, null imposed | The values a test with the null imposed does not reject |
| First-stage F | The strength of the instrument across the shocks |
| Effective number of shocks | The reciprocal of the Herfindahl index of the mean shares |

The standard error is clustered by the Shock Clusters, without a small-sample correction ([Randsley (2026)](#ref-Ran2026a)).

## Controls of the Shift-Share IV Tab

The Shift-Share IV tab controls, across the areas, for an indicator of each period after the first and for the Controls, and adds the sum of the shares and its product with each period indicator whenever the shares do not sum to the same total in every row. Across the shocks, it controls for an indicator of each period after the first, the control Borusyak, Hull and Jaravel (2022) add in their stacked design ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). An intercept is added in both regressions ([Randsley (2026)](#ref-Ran2026a)). The Weight Column weights the areas, and the regression across the shocks weights each shock by its mean share with those weights.

## References

<a id="ref-BHJ2022a"></a>Borusyak, K., Hull, P. and Jaravel, X. (2022). Quasi-experimental shift-share research designs. *Review of Economic Studies*, 89(1), 181–213. [doi:10.1093/restud/rdab030](https://doi.org/10.1093/restud/rdab030)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Reduced Form](ssreduced.md) · [Inference Across the Shocks](inference.md) · [Overview](overview.md)
