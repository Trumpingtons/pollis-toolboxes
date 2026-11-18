# Dynamic Panel

## What the Dynamic Panel Tab Fits

The Dynamic Panel tab fits a dynamic spatial panel with fixed effects by `fit_dynamic_spatial_panel(variant, fe, W, X, y, N, T_per)` of SpatialEconometrics.jl. The outcome of each area in the periods from the second to the last is regressed on its own outcome and its neighbours' outcomes in the period before, on the explanatory variables and, as for the static spatial lag panel, on its neighbours' outcomes in the same period. With the fixed effects removed from all these terms, the log-likelihood is concentrated on rho and maximised over it, and the estimates are then corrected for the bias the fixed effects leave with a lagged outcome ([Randsley (2026)](#ref-Ran2026a); [Yu, de Jong and Lee (2008)](#ref-YJL2008a)). The number of periods passed counts the first one, which only supplies the lags.

## The Spatial Model Input of the Dynamic Panel Tab

The Spatial Model input chooses the form of the contemporaneous spatial term. With SAR, an area's outcome depends on its neighbours' outcomes in the same period; with SDM, also on the neighbours' averages of the explanatory variables, which enter as further regressors with the prefix `W_` and are carried into the effects ([Randsley (2026)](#ref-Ran2026a)). Elhorst (2014) sets out the dynamic extensions of the spatial panel models ([Elhorst (2014)](#ref-Elh2014a)). The Static Against Dynamic step fits the static model of the same form beside the dynamic one, and the Fixed-Effect Specifications step refits the chosen form under fixed effects of the areas and under those of the areas and the periods, the two choices this model allows.

## Reading the Output of the Dynamic Panel Tab

The Dynamic Panel tab prints a table with `y_lag`, `Wy_lag`, the explanatory variables, on SDM their `W_` terms, and rho, each with its estimate, standard error and z-value. Below it, gamma, eta and rho are named in words, then given again as they were before the bias correction, so that the size of the correction can be read. The spectral radius of the system the model implies follows, with a note saying whether it is below one, as the long-run effects require; then the error variance and the log-likelihood ([Randsley (2026)](#ref-Ran2026a)). The Driscoll–Kraay Standard Errors step computes robust standard errors for this model as for the static spatial lag panels ([Driscoll and Kraay (1998)](#ref-DK1998a)).

## Residuals and Next Steps of the Dynamic Panel Tab

The residuals of the dynamic model cover the periods from the second to the last only, and the Next Steps that use them follow: Moran's I Period by Period starts its line at the second period, and the Map of the Residual Size per Area averages over the periods the model explains. The Map of the Area Effects subtracts, besides the explanatory variables and rho times the neighbours' outcomes, gamma times the area's outcome and eta times its neighbours' outcomes in the period before. The Direct, Indirect and Total Effects step prints a short-run and a long-run table, from `dynamic_spatial_effects`, and warns first when the spectral radius is not below one ([Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-DK1998a"></a>Driscoll, J. C. and Kraay, A. C. (1998). Consistent covariance matrix estimation with spatially dependent panel data. *Review of Economics and Statistics*, 80(4), 549–560. [doi:10.1162/003465398557825](https://doi.org/10.1162/003465398557825)

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-YJL2008a"></a>Yu, J., de Jong, R. and Lee, L.-f. (2008). Quasi-maximum likelihood estimators for spatial dynamic panel data with fixed effects when both n and T are large. *Journal of Econometrics*, 146(1), 118–134. [doi:10.1016/j.jeconom.2008.08.002](https://doi.org/10.1016/j.jeconom.2008.08.002)

## See Also
- [Dynamic Spatial Panels](dynamic-panels.md) · [SAR, Fixed Effects](sarfe.md) · [Decision Guide](decision-guide.md)
