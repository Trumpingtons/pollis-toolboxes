# Regimes, OLS

## What the Regimes, OLS Tab Estimates

The Regimes, OLS tab fits a regression in which each regime has its own intercept and its own slope on each explanatory variable, by least squares, with `fit_spatial_regime` and `spatial_lag = false` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)). The regimes come from Regime Column or from SKATER, as Regimes From sets. The tab prints the coefficients with their standard errors, named R1, R2 and so on by regime, the regimes each number stands for, the likelihood ratio Chow test of `regime_chow_test`, and the F test of Chow (1960) ([Chow (1960)](#ref-Cho1960a)). It is the regime model of Anselin (1988) without a spatial term ([Anselin (1988)](#ref-Ans1988a)).

## The Design of a Regime Regression

`fit_spatial_regime` builds one block of columns per regime: a column of ones for the regime's intercept and a copy of each explanatory variable, set to zero outside the regime ([Randsley (2026)](#ref-Ran2026a)). Least squares on that design gives the same coefficients as a separate regression in each regime. The standard errors use one variance of the errors for all regimes, the unbiased estimate from the residuals, so they differ from those of separate regressions when the regimes have different error variances. The Explanatory Variables go in without an intercept, as one is added for each regime.

## When a Regime Regression Cannot Be Estimated

The design must have full column rank. The documentation of `fit_spatial_regime` notes that the design is block diagonal in the regimes, so an explanatory variable that is constant inside one regime collides with that regime's intercept even when it varies over the whole map; the function then stops with an error that names the column ([Randsley (2026)](#ref-Ran2026a)). A regime also needs more areas than its coefficients. Regime Sizes and Spread, in the Next Steps, lists the areas and the spread of each variable in every regime and flags those that cannot be estimated. Merging a regime with another, dropping the variable, or raising Minimum Region Size for SKATER's regions fixes it.

## The Chow Tests of the Regimes, OLS Tab

The tab prints two forms of the test that all coefficients are the same in every regime. The likelihood ratio form of `regime_chow_test` compares the log-likelihoods of the single model and of the regime model, against a chi-squared distribution ([Randsley (2026)](#ref-Ran2026a)). The F form of Chow (1960) compares their residual sums of squares, against an F distribution ([Chow (1960)](#ref-Cho1960a)). Anselin (1990) shows that both lose their stated size when the errors are spatially autocorrelated, which Moran's I of the Residuals checks ([Anselin (1990)](#ref-Ans1990a)).

## References

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-Ans1990a"></a>Anselin, L. (1990). Spatial dependence and spatial structural instability in applied regression analysis. *Journal of Regional Science*, 30(2), 185–207. [doi:10.1111/j.1467-9787.1990.tb00092.x](https://doi.org/10.1111/j.1467-9787.1990.tb00092.x)

<a id="ref-Cho1960a"></a>Chow, G. C. (1960). Tests of equality between sets of coefficients in two linear regressions. *Econometrica*, 28(3), 591–605. [doi:10.2307/1910133](https://doi.org/10.2307/1910133)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Testing Regimes](testing-regimes.md) · [Regimes, Spatial Lag](reglag.md) · [Decision Guide](decision-guide.md)
