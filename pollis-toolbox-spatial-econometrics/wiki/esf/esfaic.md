# ESF, AIC Criterion

## What the ESF, AIC Criterion Tab Fits

The ESF, AIC Criterion tab fits the same kind of model as the ESF, Moran Criterion tab, a least squares regression of the outcome on an intercept, the explanatory variables and selected Moran eigenvectors, but chooses the eigenvectors by the Akaike information criterion (AIC) of the model. It calls `fit_esf` of SpatialEconometrics.jl with `criterion = :aic`, on the candidate eigenvectors computed once by `spatial_eigenvectors` and screened by the Candidate Screen ([Randsley (2026)](#ref-Ran2026a)). The spatial filter is again the selected eigenvectors times their coefficients ([Griffith (2003)](#ref-Gri2003a)).

## How the ESF, AIC Criterion Tab Selects Eigenvectors

Starting from the regression without a filter, each step tries every remaining candidate and adds the one that gives the lowest AIC. In `fit_esf`, the AIC of a least squares fit comes from its normal log-likelihood with the maximum likelihood estimate of the error variance, and counts as parameters the intercept, the explanatory variables, the eigenvectors already in and the error variance. Selection stops when no remaining candidate lowers the AIC, or when the Maximum Eigenvectors are in. Unlike the Moran criterion, it has no threshold on the residuals' Moran coefficient: it does not stop because the autocorrelation is gone ([Randsley (2026)](#ref-Ran2026a)).

## Reading the Output of the ESF, AIC Criterion Tab

The ESF, AIC Criterion tab prints the same table as the other tabs: the coefficients of the intercept and the explanatory variables with their standard errors, the selected eigenvectors in the order they entered, and the residuals' Moran coefficient without and with the filter. Because AIC does not aim at that coefficient, the value with the filter is the check on what the filter has done: it can remain clearly positive when the eigenvectors that would remove the autocorrelation add little to the fit, or the filter can hold more eigenvectors than the Moran criterion would need. The Moran's I Before and After step tests the remaining autocorrelation by permutation.

## When the AIC Criterion Suits the Data

The AIC criterion suits an analysis in which the spatial filter is part of the model of the outcome, so that its fit, and the fitted values it gives, matter alongside the coefficients of the explanatory variables. Choosing eigenvectors for fit rather than for the residual autocorrelation is also the approach of spmoran's `esf`, which uses adjusted R-squared where `fit_esf` uses AIC ([Murakami (2017)](#ref-Mur2017b)). As with every stepwise filter, the standard errors do not include the uncertainty of the choice of eigenvectors. The Moran Against AIC Selection step fits both criteria on the same candidates and shows which eigenvectors each keeps.

## References

<a id="ref-Gri2003a"></a>Griffith, D. A. (2003). *Spatial autocorrelation and spatial filtering: gaining understanding through theory and scientific visualization*. Springer Berlin Heidelberg. [doi:10.1007/978-3-540-24806-4](https://doi.org/10.1007/978-3-540-24806-4)

<a id="ref-Mur2017b"></a>Murakami, D. (2017). Gaussian spatial regression using the spmoran package: case study examples. arXiv. [doi:10.48550/arXiv.1703.04467](https://doi.org/10.48550/arXiv.1703.04467)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [ESF, Moran Criterion](esfmoran.md) · [Selecting Eigenvectors](selecting-eigenvectors.md) · [Decision Guide](decision-guide.md)
