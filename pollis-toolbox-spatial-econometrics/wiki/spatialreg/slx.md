# Lag of X (SLX)

## What the Lag of X (SLX) Tab Computes

The Lag of X (SLX) tab of the Spatial Lag and Error Models panel fits the spatial lag of X model `y = X beta + W X theta + e` by least squares with `fit_slx(W, X, y)` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)). The function adds the intercept and the spatial lags of the explanatory variables, named `W_` followed by the variable's name, and the tab prints the coefficient table and the log-likelihood. Since the model has no spatial lag of the outcome, its likelihood has no log-determinant, and least squares gives the maximum likelihood estimates of the coefficients.

## When the SLX Model Fits

The SLX model fits spillovers that run through the neighbours' explanatory variables and stop there: traffic in the neighbouring cells adding to a cell's pollution, or jobs in nearby municipalities affecting a municipality's commuting. Halleck Vega and Elhorst (2015) argue for it as a point of departure in applied work, because it is estimated by least squares, its spillovers are not constrained to be the same multiple of the direct effects for every variable, and the weights can be parameterised and estimated ([Halleck Vega and Elhorst (2015)](#ref-HE2015a)). The LM tests for the Durbin terms on the OLS and LM Tests tab test the spatial lags of X from least squares.

## How to Read the Output of the Lag of X (SLX) Tab

In the SLX model the coefficient of an explanatory variable is its direct effect, and the coefficient of its spatial lag is its indirect effect: the change in an area's outcome when the variable rises by one unit in all its neighbours, with row-standardised weights ([Halleck Vega and Elhorst (2015)](#ref-HE2015a)). The Direct and Indirect Effects step prints both with their standard errors. The likelihood ratio test of the SLX model against the spatial Durbin model tests whether `rho` is zero, whether a spatial lag of the outcome is needed besides ([Elhorst (2014)](#ref-Elh2014a)).

## References

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-HE2015a"></a>Halleck Vega, S. and Elhorst, J. P. (2015). The SLX model. *Journal of Regional Science*, 55(3), 339–363. [doi:10.1111/jors.12188](https://doi.org/10.1111/jors.12188)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Direct and Indirect Effects](effects.md) · [Spatial Durbin (SDM)](sdm.md) · [Decision Guide](decision-guide.md)
