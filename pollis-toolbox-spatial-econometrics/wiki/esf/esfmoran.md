# ESF, Moran Criterion

## What the ESF, Moran Criterion Tab Fits

The ESF, Moran Criterion tab fits a linear regression by least squares with a spatial filter: the outcome is regressed on an intercept, the explanatory variables and a set of Moran eigenvectors of the spatial weights, chosen one at a time. It calls `fit_esf` of SpatialEconometrics.jl with `criterion = :moran`, on the candidate eigenvectors that `spatial_eigenvectors` computes once from the weights. The selected eigenvectors, times their coefficients, make the spatial filter, which takes up the spatial pattern that the explanatory variables leave in the outcome ([Griffith (2003)](#ref-Gri2003a); [Randsley (2026)](#ref-Ran2026a)).

## How the ESF, Moran Criterion Tab Selects Eigenvectors

The candidates are the eigenvectors whose Moran coefficient is at least the Candidate Screen times the largest, the patterns of positive spatial autocorrelation. Starting from the regression without a filter, each step tries every remaining candidate and adds the one that most reduces the absolute Moran coefficient of the residuals. Selection stops when that coefficient falls below 0.05, the default `moran_tol` of `fit_esf`, when no candidate reduces it, or when the Maximum Eigenvectors are in ([Randsley (2026)](#ref-Ran2026a)). The aim of the criterion is to remove the residual autocorrelation with as few eigenvectors as possible ([Tiefelsdorf and Griffith (2007)](#ref-TG2007a)).

## Reading the Output of the ESF, Moran Criterion Tab

The tab prints the estimate, standard error and z-value of the intercept and of each explanatory variable; the coefficients of the eigenvectors follow them in the model but are not printed. It then lists the selected eigenvectors by their number among the candidates, in the order they entered, and the Moran coefficient of the residuals without the filter and with it. A value with the filter close to zero means the filter has taken up the residual autocorrelation; a value still far from zero means selection stopped at Maximum Eigenvectors or found no candidate that helped. The standard errors of `fit_esf` use the residual variance corrected for the number of coefficients, eigenvectors included ([Randsley (2026)](#ref-Ran2026a)).

## Standard Errors After Selecting Eigenvectors by the Moran Criterion

The eigenvectors are chosen on the same outcome the regression then explains, and the standard errors treat them as if they had been fixed in advance. The documentation of `fit_esf` reports that this makes the confidence intervals of the explanatory variables' coefficients somewhat narrower than they should be when eigenvectors are selected, and right when there is no spatial autocorrelation and almost none are ([Randsley (2026)](#ref-Ran2026a)). Random-effects ESF, on the Random-Effects ESF tab, keeps every candidate and shrinks their coefficients instead, which avoids the selection ([Murakami and Griffith (2015)](#ref-MG2015a)).

## When the Moran Criterion Suits the Data

The Moran criterion suits a regression whose purpose is the coefficients of the explanatory variables and their standard errors, where the spatial autocorrelation of the residuals is a nuisance to be removed rather than a quantity of interest. It keeps the filter small, so the eigenvectors in it can be mapped and read one by one with the Maps of the Selected Eigenvectors step. When the fit of the model matters more than removing the autocorrelation, the ESF, AIC Criterion tab selects by AIC instead, and the Moran Against AIC Selection step compares the two filters.

## References

<a id="ref-Gri2003a"></a>Griffith, D. A. (2003). *Spatial autocorrelation and spatial filtering: gaining understanding through theory and scientific visualization*. Springer Berlin Heidelberg. [doi:10.1007/978-3-540-24806-4](https://doi.org/10.1007/978-3-540-24806-4)

<a id="ref-MG2015a"></a>Murakami, D. and Griffith, D. A. (2015). Random effects specifications in eigenvector spatial filtering: a simulation study. *Journal of Geographical Systems*, 17(4), 311–331. [doi:10.1007/s10109-015-0213-7](https://doi.org/10.1007/s10109-015-0213-7)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-TG2007a"></a>Tiefelsdorf, M. and Griffith, D. A. (2007). Semiparametric filtering of spatial autocorrelation: the eigenvector approach. *Environment and Planning A: Economy and Space*, 39(5), 1193–1221. [doi:10.1068/a37378](https://doi.org/10.1068/a37378)

## See Also
- [Selecting Eigenvectors](selecting-eigenvectors.md) · [ESF, AIC Criterion](esfaic.md) · [Random-Effects ESF](reesf.md) · [Moran Eigenvectors](moran-eigenvectors.md)
