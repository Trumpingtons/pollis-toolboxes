# Spatial Durbin (SDM)

## What the Spatial Durbin (SDM) Tab Computes

The Spatial Durbin (SDM) tab of the Spatial Lag and Error Models panel fits the spatial Durbin model `y = rho W y + X beta + W X theta + e` by maximum likelihood with `fit_spatial(SDM(), W, X, y)` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)). The function adds the intercept and the spatial lags of the explanatory variables, named `W_` followed by the variable's name. The tab prints the coefficient table, with `rho` last, the log-likelihood, and the direct, indirect and total effects of each explanatory variable with their standard errors ([LeSage and Pace (2009)](#ref-LP2009a)).

## Why the Spatial Durbin Model Is a General Starting Point

The spatial Durbin model nests the spatial lag model (`theta = 0`), the SLX model (`rho = 0`) and the spatial error model (`theta = -rho beta`, the common factor restriction). LeSage and Pace (2009) recommend it as a starting point, since it gives unbiased estimates when the data come from any of the three, at the cost of more parameters ([LeSage and Pace (2009)](#ref-LP2009a)). Elhorst (2014) sets out the testing strategy: fit the spatial Durbin model, test the three restrictions by likelihood ratio or Wald tests, and keep the spatial Durbin model when they are rejected ([Elhorst (2014)](#ref-Elh2014a)). The Likelihood Ratio Tests of the SDM step of the Spatial Lag and Error Models panel runs the three tests.

## How to Read the Output of the Spatial Durbin (SDM) Tab

Neither `beta` nor `theta` is an effect in the spatial Durbin model. The effects of the k-th variable form the matrix `(I - rho W)^-1 (beta_k I + theta_k W)`, whose average diagonal is the direct effect and whose average off-diagonal row sum is the indirect effect ([LeSage and Pace (2009)](#ref-LP2009a)). Unlike the spatial lag model, the spatial Durbin model lets the ratio of the indirect to the direct effect differ from variable to variable, and lets the two have opposite signs ([Elhorst (2014)](#ref-Elh2014a)). The Chart of the Effects and Spatial Multiplier steps show them, and Change One Area maps the change a single area spreads.

## References

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Direct and Indirect Effects](effects.md) · [Decision Guide](decision-guide.md) · [Spatial Lag (SAR)](sar.md) · [Spatial Error (SEM)](sem.md) · [Lag of X (SLX)](slx.md)
