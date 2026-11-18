# OLS and LM Tests

## What the OLS and LM Tests Tab Computes

The OLS and LM Tests tab of the Spatial Lag and Error Models panel fits the Dependent Variable on the Explanatory Variables and an intercept by least squares, and prints the coefficients, their standard errors and t-values. It then tests the residuals for spatial dependence with the spatial weights of the Neighbours input: Moran's I of the residuals, with the expectation and variance of Cliff and Ord (1972) for regression residuals ([Cliff and Ord (1972)](#ref-CO1972a)), and the four Lagrange multiplier tests of `lm_tests` in SpatialEconometrics.jl: LM lag, LM error, and their robust forms ([Anselin, Bera, Florax and Yoon (1996)](#ref-ABFY1996a); [Randsley (2026)](#ref-Ran2026a)).

## How to Read the Output of the OLS and LM Tests Tab

| Line | What it says |
|---|---|
| Estimate, Std. Error, t | The least-squares coefficients, valid when the errors are independent |
| Moran's I of the residuals, z | Spatial dependence left in the residuals; a z beyond 1.96 is significant at the 5% level |
| LM-Lag, LM-Error | Tests of a spatial lag of the outcome and of spatially dependent errors |
| Robust LM-Lag, Robust LM-Error | The same tests, each robust to the other kind of dependence |

A significant Moran's I with the least-squares standard errors means those standard errors are not to be trusted. The Decision Guide shows how the LM tests point to a model ([Anselin (1988)](#ref-Ans1988a)).

## Least Squares as the Benchmark for Spatial Models

Least squares is the model with `rho`, `lambda` and `theta` all zero, so every spatial model of the Spatial Lag and Error Models panel nests it. Its log-likelihood under normal errors is the benchmark in the Models Compared step, where AIC and BIC weigh the gain in fit of each spatial model against its extra parameters ([LeSage and Pace (2009)](#ref-LP2009a)). When the tests find no spatial dependence, least squares remains the simplest model, and the spatial models add parameters without a gain in fit.

## References

<a id="ref-ABFY1996a"></a>Anselin, L., Bera, A. K., Florax, R. and Yoon, M. J. (1996). Simple diagnostic tests for spatial dependence. *Regional Science and Urban Economics*, 26(1), 77–104. [doi:10.1016/0166-0462(95)02111-6](https://doi.org/10.1016/0166-0462(95)02111-6)

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-CO1972a"></a>Cliff, A. and Ord, K. (1972). Testing for spatial autocorrelation among regression residuals. *Geographical Analysis*, 4(3), 267–284. [doi:10.1111/j.1538-4632.1972.tb00475.x](https://doi.org/10.1111/j.1538-4632.1972.tb00475.x)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Lagrange Multiplier Tests](lm-tests.md) · [Decision Guide](decision-guide.md) · [Spatial Lag (SAR)](sar.md) · [Spatial Error (SEM)](sem.md)
