# Lagrange Multiplier Tests

## Moran's I of Least-Squares Residuals

Moran's I of least-squares residuals tests whether the residuals of a regression are spatially autocorrelated. Least-squares residuals are not a raw variable: they sum to zero and are correlated with each other through the explanatory variables, so their Moran's I has its own expectation and variance. Cliff and Ord (1972) derived them from the residual maker `M = I - X (X'X)^-1 X'`: the expectation is `tr(MW) / (n - k)` for n areas and k coefficients, and the variance also depends on `M` and `W` ([Cliff and Ord (1972)](#ref-CO1972a)). A significant Moran's I says that spatial dependence is left in the residuals, but not whether it comes from a spatial lag of the outcome or from the error term ([Anselin (1988)](#ref-Ans1988a)).

## The LM Lag and LM Error Tests

The Lagrange multiplier tests need only the least-squares fit. The LM error test asks whether `lambda`, the spatial dependence of the errors, is zero; the LM lag test asks whether `rho`, the coefficient of the spatial lag of the outcome, is zero ([Anselin (1988)](#ref-Ans1988a)). Each has a chi-squared distribution with one degree of freedom under its null hypothesis. Each is also sensitive to the other kind of dependence: a spatial lag in the data can make the LM error test significant, and dependent errors can make the LM lag test significant, so the two tests alone do not tell the two models apart when both reject.

## The Robust LM Tests

Anselin, Bera, Florax and Yoon (1996) corrected each test for the other kind of dependence. The robust LM error test is valid when a spatial lag of the outcome may be present, and the robust LM lag test is valid when the errors may be spatially dependent ([Anselin, Bera, Florax and Yoon (1996)](#ref-ABFY1996a)). In practice the robust tests are read when both of the standard tests are significant: the model whose robust test stays significant is the one the data favour. In SpatialEconometrics.jl the four tests come from `lm_tests(y, X, W)`, with `X` holding the intercept, as `lag`, `error`, `robust_lag` and `robust_error` ([Randsley (2026)](#ref-Ran2026a)).

## Lagrange Multiplier Tests for the Spatial Durbin Model

The spatial lags of the explanatory variables, `WX`, can be tested from the least-squares fit too. SpatialEconometrics.jl's `sdm_tests(y, X, W)` gives a joint test of `rho` and `theta`, a test of the spatial lags of X, and robust forms of each, which allow for the other term ([Randsley (2026)](#ref-Ran2026a)). The LM Tests for the Durbin Terms step of the Spatial Lag and Error Models panel prints them. A significant test of the lags of X points to the SLX or the spatial Durbin model rather than the spatial lag model ([Elhorst (2014)](#ref-Elh2014a)).

## References

<a id="ref-ABFY1996a"></a>Anselin, L., Bera, A. K., Florax, R. and Yoon, M. J. (1996). Simple diagnostic tests for spatial dependence. *Regional Science and Urban Economics*, 26(1), 77–104. [doi:10.1016/0166-0462(95)02111-6](https://doi.org/10.1016/0166-0462(95)02111-6)

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-CO1972a"></a>Cliff, A. and Ord, K. (1972). Testing for spatial autocorrelation among regression residuals. *Geographical Analysis*, 4(3), 267–284. [doi:10.1111/j.1538-4632.1972.tb00475.x](https://doi.org/10.1111/j.1538-4632.1972.tb00475.x)

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [OLS and LM Tests](ols.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
