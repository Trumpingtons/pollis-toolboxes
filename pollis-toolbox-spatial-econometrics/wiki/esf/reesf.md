# Random-Effects ESF

## What the Random-Effects ESF Tab Fits

The Random-Effects ESF tab fits random-effects eigenvector spatial filtering (RE-ESF), the specification of Murakami and Griffith (2015). The outcome is a linear regression on an intercept and the explanatory variables plus every candidate Moran eigenvector, whose coefficients are random effects: normal, centred on zero, each with a variance proportional to its eigenvector's eigenvalue, so that the eigenvectors of strong positive autocorrelation can take larger coefficients ([Murakami and Griffith (2015)](#ref-MG2015a)). The tab calls `fit_re_esf` of SpatialEconometrics.jl, which keeps the candidates with a positive eigenvalue among those that pass the Candidate Screen; the Maximum Eigenvectors input does not apply ([Randsley (2026)](#ref-Ran2026a)).

## How Random-Effects ESF Estimates the Shrinkage

Instead of choosing eigenvectors, RE-ESF shrinks the coefficients of all of them towards zero. In `fit_re_esf`, a single variance ratio, theta, the variance of the random effects over the error variance, governs the shrinkage, and is estimated by profile restricted maximum likelihood (REML). Given theta, each eigenvector's coefficient is its least squares estimate scaled down by a factor between zero and one, close to one for eigenvectors with a large eigenvalue when theta is large, and close to zero when theta is small. A theta near zero leaves almost no filter, the fit then close to ordinary least squares ([Randsley (2026)](#ref-Ran2026a)).

## Reading the Output of the Random-Effects ESF Tab

The Random-Effects ESF tab prints the coefficients of the intercept and the explanatory variables, with standard errors from their generalised least squares covariance at the estimated theta. It then gives the number of candidate eigenvectors, all kept, theta, and the effective degrees of freedom: the number of coefficients of the intercept and the explanatory variables plus the sum of the shrinkage factors, the number of free coefficients the filter is worth. Effective degrees of freedom approaching the number of areas suggest that the random effects are absorbing noise ([Randsley (2026)](#ref-Ran2026a)).

## The Residual Moran Coefficient of Random-Effects ESF

The Moran coefficient of the residuals that RE-ESF leaves is not read against zero as in stepwise ESF. The documentation of `fit_re_esf` explains that removing the filter takes out the directions of positive autocorrelation, so the residuals lie mostly among the other eigenvectors and their Moran coefficient is expected to be clearly negative. The package reports, as `moran_reference`, the Moran coefficient expected of a random vector in that space; a residual Moran coefficient close to it or above it is the healthy case, one far below it a sign that the random effects absorb noise ([Randsley (2026)](#ref-Ran2026a)).

## Random-Effects ESF Against Stepwise ESF

Because RE-ESF does not choose eigenvectors on the outcome, its standard errors are not affected by the selection that makes those of stepwise ESF somewhat too small, as the documentation of `fit_esf` notes ([Randsley (2026)](#ref-Ran2026a)). The price is a filter that cannot be read eigenvector by eigenvector, so the Maps of the Selected Eigenvectors step does not apply on this tab; the Map of the Spatial Filter shows the whole filter instead. spmoran's `resf` fits RE-ESF by restricted maximum likelihood as well ([Murakami (2017)](#ref-Mur2017b)), and the Stepwise ESF Against RE-ESF step compares the two specifications on the same candidates.

## References

<a id="ref-MG2015a"></a>Murakami, D. and Griffith, D. A. (2015). Random effects specifications in eigenvector spatial filtering: a simulation study. *Journal of Geographical Systems*, 17(4), 311–331. [doi:10.1007/s10109-015-0213-7](https://doi.org/10.1007/s10109-015-0213-7)

<a id="ref-Mur2017b"></a>Murakami, D. (2017). Gaussian spatial regression using the spmoran package: case study examples. arXiv. [doi:10.48550/arXiv.1703.04467](https://doi.org/10.48550/arXiv.1703.04467)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Decision Guide](decision-guide.md) · [Selecting Eigenvectors](selecting-eigenvectors.md) · [Moran Eigenvectors](moran-eigenvectors.md) · [Replications](replications.md)
