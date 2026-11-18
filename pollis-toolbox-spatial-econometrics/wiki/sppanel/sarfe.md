# SAR, Fixed Effects

## What the SAR, Fixed Effects Tab Fits

The SAR, Fixed Effects tab fits the spatial lag panel: each area's outcome in a period depends on its explanatory variables, on its fixed effects and on a weighted average of its neighbours' outcomes in the same period, with rho measuring how strongly ([Elhorst (2014)](#ref-Elh2014a)). The tab calls `fit_spatial_panel(SAR(), fe, W, X, y, N, T_per)` of SpatialEconometrics.jl. After the fixed effects are removed, it regresses the outcome and its spatial lag on the explanatory variables by least squares, writes the log-likelihood as a function of rho alone, finds the rho that maximises it between −0.995 and 0.995, and takes the coefficients that go with that rho; a warning appears when rho ends at the edge of that range ([Randsley (2026)](#ref-Ran2026a)). The fixed effects are removed by Lee and Yu's transformation or by demeaning, as the Estimation input chooses ([Lee and Yu (2010)](#ref-LY2010a)).

## How the SAR, Fixed Effects Tab Computes the Log-Determinant

The log-likelihood of a spatial lag model contains the log-determinant of the identity minus rho times the weights, a matrix of the size of the number of areas. `fit_spatial_panel` approximates it by a Chebyshev expansion while it searches for the maximum, then recomputes it exactly by a sparse LU factorisation to place the maximum precisely. The standard errors need traces of powers of the weights, which it computes exactly for up to 1000 areas and estimates with random probes for more ([Randsley (2026)](#ref-Ran2026a)). The tab passes a seeded random number generator, so a panel of more than 1000 areas gives the same standard errors every time it is run.

## Reading the Output of the SAR, Fixed Effects Tab

The SAR, Fixed Effects tab prints the estimate, standard error and z-value of each explanatory variable and of rho; with Fixed Effects set to None, an intercept comes first. It then names the fixed effects removed and the estimation approach, with Lee and Yu's transformation the number of transformed observations on which the likelihood was evaluated, and gives the error variance and the log-likelihood. The standard errors come from the information matrix of the quasi-likelihood ([Randsley (2026)](#ref-Ran2026a)); the Driscoll–Kraay Standard Errors step sets beside them standard errors robust to correlation of the errors across areas and over time ([Driscoll and Kraay (1998)](#ref-DK1998a)).

## Effects of the Spatial Lag Panel

In a spatial lag model a change in an explanatory variable in one area changes its outcome, which changes its neighbours' outcomes, and through them its own again, so the coefficients are not the effects of the explanatory variables ([Elhorst (2014)](#ref-Elh2014a)). `spatial_effects` of SpatialEconometrics.jl summarises the matrix of these effects by three averages: the direct effect, the average of its diagonal; the indirect effect, the average sum of each row's off-diagonal elements, the spillover; and the total effect, their sum. It computes them from a series in powers of rho, truncated at 50 terms by default, which the documentation notes converges more slowly as rho approaches one, and gives each a delta-method standard error ([Randsley (2026)](#ref-Ran2026a)). The Direct, Indirect and Total Effects step prints them.

## References

<a id="ref-DK1998a"></a>Driscoll, J. C. and Kraay, A. C. (1998). Consistent covariance matrix estimation with spatially dependent panel data. *Review of Economics and Statistics*, 80(4), 549–560. [doi:10.1162/003465398557825](https://doi.org/10.1162/003465398557825)

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-LY2010a"></a>Lee, L.-f. and Yu, J. (2010). Estimation of spatial autoregressive panel data models with fixed effects. *Journal of Econometrics*, 154(2), 165–185. [doi:10.1016/j.jeconom.2009.08.001](https://doi.org/10.1016/j.jeconom.2009.08.001)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [SDM, Fixed Effects](sdmfe.md) · [Fixed Effects in Spatial Panels](fixed-effects.md) · [Decision Guide](decision-guide.md)
