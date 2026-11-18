# Dynamic Spatial Panels

## The Three Dependence Parameters of a Dynamic Spatial Panel

| Parameter | Term of the model | What it measures |
|---|---|---|
| gamma | The area's own outcome in the previous period, `y_lag` | Persistence over time |
| eta | The neighbours' outcomes in the previous period, `Wy_lag` | Spillover that takes a period to arrive |
| rho | The neighbours' outcomes in the same period | Spillover within the period |

`fit_dynamic_spatial_panel` of SpatialEconometrics.jl reports the three separately, as the fields `gamma`, `eta` and `rho`, and in its coefficient table names them `y_lag`, `Wy_lag` and `ρ`, the explanatory variables and, with the spatial Durbin form, their spatial lags in between. The first period serves only to form the lags, so the model is estimated on the periods from the second to the last ([Randsley (2026)](#ref-Ran2026a)).

## The Bias of Fixed Effects With a Lagged Outcome

With fixed effects and a lagged outcome, the quasi-maximum likelihood estimator suffers the Nickell bias, of order one over the number of periods, as the documentation of `fit_dynamic_spatial_panel` notes ([Randsley (2026)](#ref-Ran2026a)). Yu, de Jong and Lee (2008) work out how the estimator behaves as the numbers of areas and periods grow. When the periods grow faster than the areas, the estimators are consistent and asymptotically normal, centred on the true values; when the two grow in proportion, they remain consistent and normal but are not centred; and when the areas grow faster than the periods, they converge at a rate set by the number of periods and have a degenerate limit distribution. The bias correction they propose asymptotically removes the bias when the number of periods grows faster than the cube root of the number of areas ([Yu, de Jong and Lee (2008)](#ref-YJL2008a)).

## How the Dynamic Panel Tab Corrects the Bias

`fit_dynamic_spatial_panel` applies the analytical correction of Yu, de Jong and Lee, estimating the traces it needs from random probes, so that its results vary slightly with the random number generator; the Dynamic Panel tab passes a seeded one, which gives the same result every time. The fitted model keeps the estimates from before the correction in `coef_uncorrected`, which the tab prints beside the corrected gamma, eta and rho. The documentation adds that the correction assumes few periods relative to the number of areas, and that with long panels it matters less, the uncorrected estimates being close already ([Randsley (2026)](#ref-Ran2026a)). Only fixed effects of the areas, alone or with those of the periods, are meaningful choices for this model, and the tab stops with a message under the others.

## Short-Run and Long-Run Effects of a Dynamic Spatial Panel

`dynamic_spatial_effects` separates two horizons. The short-run effects are the response within the period of a change, through the spatial multiplier that rho sets; the short-run total effect of a variable is the sum of its coefficient and that of its spatial lag, divided by one minus rho. The long-run effects cumulate the persistence over the following periods to the new steady state, bringing in gamma and eta as well: the long-run total effect divides the same sum by one minus gamma, rho and eta. Each of the six direct, indirect and total effects comes with a delta-method standard error ([Randsley (2026)](#ref-Ran2026a)).

## When the Long-Run Effects Exist

The long-run effects exist only when gamma, rho and eta sum to less than one. As the sum approaches one, the denominator of the long-run effects goes to zero, the effects diverge, and their delta-method standard errors become unreliable well before that point. The documentation of `dynamic_spatial_effects` advises checking `spectral_radius_A`, the spectral radius of the system the model implies, which must be below one ([Randsley (2026)](#ref-Ran2026a)). The Dynamic Panel tab prints it with a note saying whether the long-run effects exist, and the Direct, Indirect and Total Effects step warns before its long-run table when they do not.

## References

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-YJL2008a"></a>Yu, J., de Jong, R. and Lee, L.-f. (2008). Quasi-maximum likelihood estimators for spatial dynamic panel data with fixed effects when both n and T are large. *Journal of Econometrics*, 146(1), 118–134. [doi:10.1016/j.jeconom.2008.08.002](https://doi.org/10.1016/j.jeconom.2008.08.002)

## See Also
- [Dynamic Panel](dynamic.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
