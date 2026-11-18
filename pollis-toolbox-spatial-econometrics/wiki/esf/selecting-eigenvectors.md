# Selecting Eigenvectors

## Why Eigenvectors Are Selected

A filter built from every candidate eigenvector would use many degrees of freedom and could absorb variation that belongs to the explanatory variables. Classic eigenvector spatial filtering therefore keeps only the candidates that matter, chosen by a stepwise procedure: starting from the regression without a filter, it adds at each step the candidate that most improves a criterion, and stops when no candidate improves it enough ([Tiefelsdorf and Griffith (2007)](#ref-TG2007a)). The selected eigenvectors, with their coefficients, form the spatial filter.

## Selecting Eigenvectors by the Moran Criterion

The Moran criterion adds, at each step, the eigenvector that most reduces the absolute Moran coefficient of the residuals, and stops once that coefficient is close to zero, so that the filter removes the residual spatial autocorrelation with as few eigenvectors as possible ([Tiefelsdorf and Griffith (2007)](#ref-TG2007a)). In SpatialEconometrics.jl, `criterion = :moran` stops when the absolute Moran coefficient falls below `moran_tol`, when no candidate reduces it, or at `max_eigenvectors` ([Randsley (2026)](#ref-Ran2026a)). The ESF, Moran Criterion tab uses it.

## Selecting Eigenvectors by AIC

The AIC criterion adds, at each step, the eigenvector that most reduces the Akaike information criterion of the model, and stops when none reduces it. It chooses the filter for the fit of the model rather than for the residual autocorrelation, so it may keep eigenvectors that improve the fit when little autocorrelation remains, or stop with some left ([Randsley (2026)](#ref-Ran2026a)). spmoran's `esf` offers a related choice, adding eigenvectors by adjusted R-squared, and limits them by their variance inflation factors ([Murakami (2017)](#ref-Mur2017b)). The ESF, AIC Criterion tab uses the AIC.

## The Cost of Stepwise Selection

Stepwise selection treats the selected eigenvectors as if they had been chosen before seeing the data, so the standard errors it reports do not include the uncertainty of the selection. Murakami and Griffith (2015) note this variability of stepwise ESF and propose the random-effects specification, which keeps every candidate and shrinks their coefficients instead of selecting them ([Murakami and Griffith (2015)](#ref-MG2015a)). The Stepwise ESF Against RE-ESF step of the panel compares the two on the same candidates.

## References

<a id="ref-MG2015a"></a>Murakami, D. and Griffith, D. A. (2015). Random effects specifications in eigenvector spatial filtering: a simulation study. *Journal of Geographical Systems*, 17(4), 311–331. [doi:10.1007/s10109-015-0213-7](https://doi.org/10.1007/s10109-015-0213-7)

<a id="ref-Mur2017b"></a>Murakami, D. (2017). Gaussian spatial regression using the spmoran package: case study examples. arXiv. [doi:10.48550/arXiv.1703.04467](https://doi.org/10.48550/arXiv.1703.04467)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-TG2007a"></a>Tiefelsdorf, M. and Griffith, D. A. (2007). Semiparametric filtering of spatial autocorrelation: the eigenvector approach. *Environment and Planning A: Economy and Space*, 39(5), 1193–1221. [doi:10.1068/a37378](https://doi.org/10.1068/a37378)

## See Also
- [Moran Eigenvectors](moran-eigenvectors.md) · [ESF, Moran Criterion](esfmoran.md) · [ESF, AIC Criterion](esfaic.md) · [Random-Effects ESF](reesf.md)
