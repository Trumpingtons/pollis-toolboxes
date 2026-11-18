# SEM, Fixed Effects

## What the SEM, Fixed Effects Tab Fits

The SEM, Fixed Effects tab fits the spatial error panel: each area's outcome depends on its own explanatory variables and fixed effects, while the shocks of neighbouring areas are correlated, lambda measuring how strongly ([Elhorst (2014)](#ref-Elh2014a)). The dependence is in the disturbances rather than in the outcome, so no area's outcome responds to its neighbours'. The tab calls the panel method of `fit_spatial_error` of SpatialEconometrics.jl, `fit_spatial_error(fe, W, X, y, N, T_per)`, which takes the same Fixed Effects choices as the other static tabs. Unlike `fit_spatial_panel`, it has no choice of approach: it removes the fixed effects by demeaning the outcome, the explanatory variables and their spatial lags, and the Estimation input does not apply ([Randsley (2026)](#ref-Ran2026a)).

## How the SEM, Fixed Effects Tab Estimates Lambda

For each trial value of lambda, `fit_spatial_error` filters the demeaned outcome and explanatory variables by the identity minus lambda times the weights, fits the coefficients to the filtered data by least squares, and evaluates the log-likelihood concentrated on lambda; it then maximises that over lambda between −0.995 and 0.995, searching with a Chebyshev approximation of the log-determinant and placing the maximum with its exact value. The error variance is the mean of the squared filtered residuals over the effective observations that the fixed effects leave ([Randsley (2026)](#ref-Ran2026a)). The tab prints that number of effective observations.

## Reading the Output of the SEM, Fixed Effects Tab

The SEM, Fixed Effects tab prints the estimate, standard error and z-value of each explanatory variable and of lambda, after an intercept when Fixed Effects is None, then the error variance and the log-likelihood. The standard errors come from the information matrix of the likelihood, in which the coefficients and lambda are asymptotically independent ([Randsley (2026)](#ref-Ran2026a)). The residuals the tab keeps for the Next Steps are the shocks after the spatial filter, so that Moran's I Period by Period and the residual map test and show what the filter leaves. SpatialEconometrics.jl computes Driscoll and Kraay's standard errors for the spatial lag and dynamic panels but not for this one, and the Driscoll–Kraay Standard Errors step is not offered on this tab.

## Coefficients Without Spillovers

The documentation of `fit_spatial_error` notes that, when the dependence is in the disturbances, ordinary least squares stays unbiased but its standard errors are wrong, so the gain of the spatial error model is in inference: the coefficients can be read as they stand, without a decomposition into direct and indirect effects ([Randsley (2026)](#ref-Ran2026a)). The tab therefore offers no Direct, Indirect and Total Effects step. Whether the spillover is in the shocks rather than in the outcomes is a question for the data: the SAR, SEM and SDM step compares the three static models and tests the spatial error model against the spatial Durbin model, which nests it.

## References

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [SAR, Fixed Effects](sarfe.md) · [Replications](replications.md) · [Decision Guide](decision-guide.md)
