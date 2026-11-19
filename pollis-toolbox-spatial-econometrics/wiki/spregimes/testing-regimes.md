# Testing Regimes

## The Chow Test of Equal Coefficients

Chow (1960) gives tests of whether two linear regressions, fitted on two groups of observations, have the same coefficients ([Chow (1960)](#ref-Cho1960a)). The F form compares the residual sum of squares of a single regression on all the observations with the sum over the separate regressions. On the Regimes, OLS tab the panel prints it beside the likelihood ratio form of `regime_chow_test`, which compares the log-likelihood of the single model with that of the regime model, with as many degrees of freedom as the regime model has extra coefficients ([Randsley (2026)](#ref-Ran2026a)). A small p-value says the coefficients differ between the regimes; a large one says the single model is adequate and the split adds little.

## The Chow Test When the Errors Are Spatially Dependent

Anselin (1990) shows that when spatial error autocorrelation is present in a cross-section, the traditional tests of equal coefficients across regimes are no longer valid ([Anselin (1990)](#ref-Ans1990a)). He sets out a taxonomy of spatial effects in models with structural instability and compares the traditional tests with robust approaches, maximum likelihood and pretest strategies in Monte Carlo experiments. In the panel, Moran's I of the Residuals checks the residuals of the regime model for spatial dependence. On the Regimes, Spatial Lag tab, the Chow test compares two spatial lag models by maximum likelihood, so the spatial dependence of the outcome is in both.

## Testing One Coefficient at a Time

The Chow test asks whether all the coefficients are the same in every regime. Which Coefficients Differ asks it of one coefficient at a time: for the intercept and for each slope, a Wald test that the coefficient is the same in every regime while the others are free, from the estimates and their covariance matrix. It shows which part of the model differs, for instance that the regimes differ in level but share the slope of an explanatory variable. With two regimes each test has one degree of freedom; with more, as many as the regimes less one.

## Regimes Found From the Data

The Chow test assumes the regimes were fixed before the outcome was seen. The documentation of `regime_chow_test` warns that when the regions come from SKATER, the p-value is optimistic, as the split was chosen using the same data it is tested on ([Randsley (2026)](#ref-Ran2026a)). The Bootstrap Chow Test of the panel draws 199 data sets with no regimes, from the single model's fitted values plus resampled residuals, repeats SKATER's search and the Chow test on each, and gives the share of statistics at least as large as the one observed. When the SKATER Variables leave out the dependent variable, the regions do not depend on the outcome, and the two p-values should be close. Resampling the residuals one by one ignores any spatial dependence among them.

## References

<a id="ref-Ans1990a"></a>Anselin, L. (1990). Spatial dependence and spatial structural instability in applied regression analysis. *Journal of Regional Science*, 30(2), 185–207. [doi:10.1111/j.1467-9787.1990.tb00092.x](https://doi.org/10.1111/j.1467-9787.1990.tb00092.x)

<a id="ref-Cho1960a"></a>Chow, G. C. (1960). Tests of equality between sets of coefficients in two linear regressions. *Econometrica*, 28(3), 591–605. [doi:10.2307/1910133](https://doi.org/10.2307/1910133)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Regimes, OLS](regols.md) · [Regimes, Spatial Lag](reglag.md) · [Regionalisation](regionalisation.md)
