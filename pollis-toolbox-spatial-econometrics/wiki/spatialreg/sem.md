# Spatial Error (SEM)

## What the Spatial Error (SEM) Tab Computes

The Spatial Error (SEM) tab of the Spatial Lag and Error Models panel fits the spatial error model `y = X beta + u`, `u = lambda W u + e`, by maximum likelihood with `fit_spatial_error(W, X, y)` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)). The explanatory variables are passed without the intercept, which the function adds. The tab prints the coefficient table, with `lambda` last, and the log-likelihood. The likelihood is concentrated on `lambda` and holds the log-determinant `ln |I - lambda W|`, as that of the spatial lag model holds `ln |I - rho W|` ([Anselin (1988)](#ref-Ans1988a)).

## When the Spatial Error Model Fits

The spatial error model fits data in which neighbouring areas share influences the explanatory variables do not capture: soils, climate, local institutions, or boundaries that cut through a single market. The dependence lies in the error term, so the coefficients keep the meaning they have in least squares, and a change in an explanatory variable in one area changes the expected outcome of that area alone ([Anselin (1988)](#ref-Ans1988a)). Least squares stays unbiased under spatially dependent errors, but its standard errors are wrong and its estimates are not efficient; the spatial error model corrects both. The LM error test and its robust form point to this model ([Anselin, Bera, Florax and Yoon (1996)](#ref-ABFY1996a)).

## The Spatial Error Model as a Restricted Spatial Durbin Model

Multiplying the spatial error model by `I - lambda W` gives `y = lambda W y + X beta - lambda W X beta + e`: a spatial Durbin model whose coefficients on the spatial lags of X equal minus the spatial parameter times the coefficients of X. This is the common factor restriction, and the likelihood ratio test of the spatial error model against the spatial Durbin model tests it ([LeSage and Pace (2009)](#ref-LP2009a); [Elhorst (2014)](#ref-Elh2014a)). A rejection says that the spatial lags of the explanatory variables matter beyond what dependent errors imply.

## References

<a id="ref-ABFY1996a"></a>Anselin, L., Bera, A. K., Florax, R. and Yoon, M. J. (1996). Simple diagnostic tests for spatial dependence. *Regional Science and Urban Economics*, 26(1), 77–104. [doi:10.1016/0166-0462(95)02111-6](https://doi.org/10.1016/0166-0462(95)02111-6)

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Spatial Durbin (SDM)](sdm.md) · [Lagrange Multiplier Tests](lm-tests.md) · [Maximum Likelihood Estimation](maximum-likelihood.md) · [Decision Guide](decision-guide.md)
