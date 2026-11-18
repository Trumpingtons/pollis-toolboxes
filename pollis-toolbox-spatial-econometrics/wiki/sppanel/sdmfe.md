# SDM, Fixed Effects

## What the SDM, Fixed Effects Tab Fits

The SDM, Fixed Effects tab fits the spatial Durbin panel: each area's outcome in a period depends on its explanatory variables, on the averages of those variables over its neighbours, on its fixed effects and on its neighbours' outcomes through rho ([Elhorst (2014)](#ref-Elh2014a)). The tab calls `fit_spatial_panel(SDM(), fe, W, X, y, N, T_per)` of SpatialEconometrics.jl, which adds the spatial lag of each explanatory variable to the design and then estimates as for the spatial lag panel, with the same Fixed Effects and Estimation inputs. Without fixed effects the design has an intercept, which is not given a spatial lag ([Randsley (2026)](#ref-Ran2026a)).

## Reading the Output of the SDM, Fixed Effects Tab

The SDM, Fixed Effects tab prints one row for each explanatory variable, then one for its spatial lag, named with the prefix `W_`, such as `W_income`, then rho, each with its estimate, standard error and z-value. A `W_` coefficient belongs to the neighbours' average of its variable; like the other coefficients of a model with a spatial lag of the outcome, it is not an effect on the outcome ([Elhorst (2014)](#ref-Elh2014a)). Below the table come the fixed effects, the estimation approach with the number of transformed observations, the error variance and the log-likelihood, as on the SAR, Fixed Effects tab ([Randsley (2026)](#ref-Ran2026a)).

## Effects of the Spatial Durbin Panel

In the spatial Durbin panel a change in an explanatory variable reaches the outcomes through two channels, the variable's own coefficient and that of its spatial lag, and both are then multiplied through rho. `spatial_effects` of SpatialEconometrics.jl brings the two coefficients together: the total effect of a variable is the sum of its coefficient and that of its spatial lag, divided by one minus rho; the direct effect is the average of the diagonal of the matrix of effects, computed from the same series in powers of rho as for the spatial lag panel; and the indirect effect is the difference between the two, with delta-method standard errors for all three ([Randsley (2026)](#ref-Ran2026a)). The Direct, Indirect and Total Effects step prints them.

## Testing the Spatial Durbin Panel Against SAR and SEM

As the spatial Durbin panel nests both other static models, the SAR, SEM and SDM step tests it against each: by likelihood ratio against the spatial lag panel, which leaves out the spatial lags of the explanatory variables, and both by likelihood ratio and by the Wald test of the common factor restriction against the spatial error panel. The documentation of `lr_test` warns that the likelihood ratio test is valid only when one model nests the other and both were fitted to the same data by maximum likelihood; the step fits the spatial lag and spatial Durbin panels with Lee and Yu's transformation, whose log-likelihood in SpatialEconometrics.jl, like that of the spatial error panel, is evaluated on the effective observations the fixed effects leave ([Randsley (2026)](#ref-Ran2026a)). A rejection keeps the spatial Durbin panel.

## References

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [SAR, Fixed Effects](sarfe.md) · [SEM, Fixed Effects](semfe.md) · [Decision Guide](decision-guide.md)
