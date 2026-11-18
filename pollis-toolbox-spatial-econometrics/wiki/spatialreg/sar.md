# Spatial Lag (SAR)

## What the Spatial Lag (SAR) Tab Computes

The Spatial Lag (SAR) tab of the Spatial Lag and Error Models panel fits the spatial lag model `y = rho W y + X beta + e`, also called the spatial autoregressive model, by maximum likelihood with `fit_spatial(SAR(), W, X, y)` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)). The explanatory variables are passed without the intercept, which the function adds. The tab prints the coefficient table, with `rho` last, the log-likelihood, and the direct, indirect and total effects of each explanatory variable with their standard errors, from `spatial_effects` ([LeSage and Pace (2009)](#ref-LP2009a)).

## When the Spatial Lag Model Fits

The spatial lag model fits an outcome that depends on the neighbours' outcomes: prices set with an eye on nearby prices, policies copied from neighbouring municipalities, or a pollutant carried between cells. Its reduced form `y = (I - rho W)^-1 (X beta + e)` makes every area's outcome depend on the explanatory variables and errors of every area connected to it, with weights that fall with the order of the neighbours ([Anselin (1988)](#ref-Ans1988a)). The LM lag test, and its robust form, on the OLS and LM Tests tab point to this model; the likelihood ratio test of the spatial lag model against the spatial Durbin model tests whether the spatial lags of the explanatory variables can be left out ([Elhorst (2014)](#ref-Elh2014a)).

## How to Read the Output of the Spatial Lag (SAR) Tab

The coefficients of the spatial lag model are not the effects of the explanatory variables: a change in one area spreads through the spatial multiplier `1/(1 - rho)` to the other areas and back. The direct effect, the average change in an area's own outcome, is close to the coefficient but larger when `rho` is positive, because of the feedback; the indirect effect is the average change in all the other areas together ([LeSage and Pace (2009)](#ref-LP2009a)). In the spatial lag model, the indirect effect of every variable is the same multiple of its direct effect ([Elhorst (2014)](#ref-Elh2014a)). The Change One Area step maps the spread of a change in one area.

## References

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Direct and Indirect Effects](effects.md) · [Maximum Likelihood Estimation](maximum-likelihood.md) · [Spatial Durbin (SDM)](sdm.md) · [Decision Guide](decision-guide.md)
