# Fixed Effects in Spatial Panels

## What Each Fixed Effects Choice Absorbs

| Fixed Effects input | Removed by subtracting | Absorbs | Cost in effective observations |
|---|---|---|---|
| Areas | Each area's mean over the periods | Any characteristic of an area that does not change over time | One period: T − 1 effective periods |
| Periods | Each period's mean over the areas | Shocks that hit every area in a period | One area: N − 1 effective areas |
| Areas and Periods | Both means | Both | N − 1 areas and T − 1 periods |
| None | Nothing; a single intercept | Nothing | None |

The documentation of SpatialEconometrics.jl calls fixed effects of the areas and of the periods together the usual specification for spatial panels, because a shock common to all areas in a period can otherwise pass for spatial dependence. Without fixed effects the estimates are consistent only if what is unobserved about the areas is uncorrelated with the explanatory variables ([Randsley (2026)](#ref-Ran2026a)).

## Why Demeaning Alone Falls Short in a Spatial Panel

Subtracting each area's mean removes its fixed effect, but the documentation of `LeeYuTransformation` notes that the demeaned errors are no longer independent, which leaves the estimate of the error variance inconsistent when the number of periods grows slowly ([Randsley (2026)](#ref-Ran2026a)). Lee and Yu (2010) attribute the inconsistency of direct estimation with fixed effects to the incidental parameter problem; with fixed effects of the areas only, the estimates of the coefficients and of rho by the direct approach are the same as those by their transformation, and only the error variance is affected ([Lee and Yu (2010)](#ref-LY2010a)).

## How Lee and Yu's Transformation Works

Lee and Yu's transformation removes the fixed effects in a way that yields consistent estimators with properly centred distributions ([Lee and Yu (2010)](#ref-LY2010a)). The documentation of SpatialEconometrics.jl describes it as a projection onto an orthonormal basis of the complement of the demeaning operator, which keeps the transformed errors independent, so that no correction is needed afterwards. `fit_spatial_panel` with `LeeYuTransformation()` evaluates the likelihood on the N_eff × T_eff transformed observations that the Fixed Effects choice leaves; with fixed effects of the periods its log-likelihood carries a further term in rho ([Randsley (2026)](#ref-Ran2026a)). The tabs print the number of transformed observations beside the estimates.

## Direct QML and Its Bias Correction

`DirectQML()` demeans the data, maximises the likelihood, and then corrects analytically the known bias, of order one over the number of periods, in the error variance and in rho. With `bias_correct = false` it leaves the raw estimates, which the documentation describes as useful mainly for showing what the correction does; a corrected fit keeps them in `coef_uncorrected` and `sigma2_uncorrected` ([Randsley (2026)](#ref-Ran2026a)). The Lee and Yu Against Direct QML step prints the transformation's estimates, the corrected direct estimates and the raw ones in three columns; with no fixed effects nothing is removed and the three coincide.

## Recovering the Area Effects

Removing the fixed effects means the fit does not return them. Millo and Piras (2012) recover the effect of each area in a fixed effects spatial lag model as the average over the periods of its outcome minus the spatial parameter times its neighbours' outcomes and minus the part the explanatory variables explain, and in a spatial error model as the same average without the neighbours' term ([Millo and Piras (2012)](#ref-MP2012a)). The Map of the Area Effects step applies the same idea to every tab: it subtracts from each outcome the other terms of the fitted model, the neighbours' outcomes on SAR and SDM and the lagged outcomes on Dynamic Panel among them, averages what is left over the periods, and maps it relative to the average area, which also takes away the effects of the periods.

## References

<a id="ref-LY2010a"></a>Lee, L.-f. and Yu, J. (2010). Estimation of spatial autoregressive panel data models with fixed effects. *Journal of Econometrics*, 154(2), 165–185. [doi:10.1016/j.jeconom.2009.08.001](https://doi.org/10.1016/j.jeconom.2009.08.001)

<a id="ref-MP2012a"></a>Millo, G. and Piras, G. (2012). splm: spatial panel data models in R. *Journal of Statistical Software*, 47(1), 1–38. [doi:10.18637/jss.v047.i01](https://doi.org/10.18637/jss.v047.i01)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Decision Guide](decision-guide.md) · [Overview](overview.md) · [SAR, Fixed Effects](sarfe.md)
