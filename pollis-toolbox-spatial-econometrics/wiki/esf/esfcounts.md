# ESF for Counts

## What the ESF for Counts Tab Fits

The ESF for Counts tab fits a count regression with a log link, Poisson or negative binomial, whose linear predictor holds an intercept, the explanatory variables and selected Moran eigenvectors. It calls `fit_esf` of SpatialEconometrics.jl with `family = :poisson` or `family = :negbin` and `criterion = :moran`, on the candidate eigenvectors computed once by `spatial_eigenvectors`. Each candidate tried is a refit of the regression by iteratively reweighted least squares, and the eigenvector kept at each step is the one that most reduces the absolute Moran coefficient of the Pearson residuals ([Randsley (2026)](#ref-Ran2026a)). The Dependent Variable must be a count, zero or more.

## The Count Family Input of the ESF for Counts Tab

The Count Family input chooses the distribution of the counts. Poisson takes the variance of each count equal to its expected value. Negative binomial adds a dispersion parameter, alpha, with which the variance grows with the square of the expected count; `fit_esf` estimates it by maximum likelihood and refits the regression with it until it settles, at every candidate tried. An alpha close to zero means the counts vary little more than a Poisson regression allows, and the two families then give close coefficients ([Randsley (2026)](#ref-Ran2026a)).

## Reading the Output of the ESF for Counts Tab

The ESF for Counts tab prints first the family and, for the negative binomial, alpha. The table then gives the coefficients of the intercept and the explanatory variables on the log scale of the expected count, with their standard errors and z-values; the standard errors come from the weights of the last reweighted least squares step, alpha taken as known. The selected eigenvectors follow, in the order they entered, and the Moran coefficient of the Pearson residuals without the filter and with it ([Randsley (2026)](#ref-Ran2026a)). A message says when the reweighted least squares did not converge, in which case the estimates should be read with care.

## Next Steps on the ESF for Counts Tab

The ESF for Counts tab offers the Next Steps that carry over to a count regression: the Map of the Spatial Filter, on the log scale; the Maps of the Selected Eigenvectors; Moran's I Before and After; The Eigenvectors Selected; Moran Against AIC Selection, in the chosen family; and How the Coefficients Move. Three steps are left out because they rest on least squares: How Much the Filter Explains compares R-squared values, Against Least Squares, SAR and SEM compares with spatial models for a continuous outcome, and Stepwise ESF Against RE-ESF compares with random-effects ESF, which SpatialEconometrics.jl fits for a continuous outcome only ([Griffith (2003)](#ref-Gri2003a); [Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-Gri2003a"></a>Griffith, D. A. (2003). *Spatial autocorrelation and spatial filtering: gaining understanding through theory and scientific visualization*. Springer Berlin Heidelberg. [doi:10.1007/978-3-540-24806-4](https://doi.org/10.1007/978-3-540-24806-4)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Spatial Filtering for Counts and Binary Outcomes](counts.md) · [ESF, Moran Criterion](esfmoran.md) · [Decision Guide](decision-guide.md)
