# Overview

## What Eigenvector Spatial Filtering Does

Eigenvector spatial filtering (ESF) removes spatial autocorrelation from a regression by adding, as extra explanatory variables, a few map patterns computed from the spatial weights alone. Griffith (2003) developed the approach: the eigenvectors of the doubly-centred spatial weights matrix are map patterns with known amounts of spatial autocorrelation, and a linear combination of some of them, the spatial filter, captures the spatial pattern that the explanatory variables leave in the outcome ([Griffith (2003)](#ref-Gri2003a)). Once the filter is in the model, the residuals are close to independent, and the coefficients and standard errors of the explanatory variables can be read as in an ordinary regression.

## Eigenvector Spatial Filtering Compared With Spatial Lag and Error Models

The spatial lag and error models describe spatial dependence by a parameter of the outcome or of the errors, and are estimated by maximum likelihood. Eigenvector spatial filtering keeps the regression as it is and adds the selected eigenvectors as regressors, so it is estimated by least squares, and the same filter can be added to any generalised linear model, such as a Poisson regression for counts or a logistic regression ([Tiefelsdorf and Griffith (2007)](#ref-TG2007a)). The filter describes where autocorrelation lies, not how it arises: it has no spillovers between areas, as the spatial lag model has.

## Stepwise and Random-Effects Spatial Filtering

Classic ESF selects eigenvectors one at a time from a set of candidates, by how much each reduces the residual spatial autocorrelation or improves the fit. Random-effects ESF keeps every candidate eigenvector and treats their coefficients as random effects shrunk towards zero, with the amount of shrinkage estimated from the data, which avoids the variability of a stepwise selection ([Murakami and Griffith (2015)](#ref-MG2015a)). SpatialEconometrics.jl offers both, in `fit_esf` and `fit_re_esf` ([Randsley (2026)](#ref-Ran2026a)).

## The Four Tabs of the Eigenvector Spatial Filtering Panel

ESF, Moran Criterion selects eigenvectors until the residuals' Moran coefficient is close to zero; ESF, AIC Criterion selects those that improve the AIC; ESF for Counts adds the filter to a Poisson or negative binomial regression; Random-Effects ESF keeps every candidate and shrinks their coefficients. All four take their neighbours from the areas' boundaries or centroids, found with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Gri2003a"></a>Griffith, D. A. (2003). *Spatial autocorrelation and spatial filtering: gaining understanding through theory and scientific visualization*. Springer Berlin Heidelberg. [doi:10.1007/978-3-540-24806-4](https://doi.org/10.1007/978-3-540-24806-4)

<a id="ref-MG2015a"></a>Murakami, D. and Griffith, D. A. (2015). Random effects specifications in eigenvector spatial filtering: a simulation study. *Journal of Geographical Systems*, 17(4), 311–331. [doi:10.1007/s10109-015-0213-7](https://doi.org/10.1007/s10109-015-0213-7)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-TG2007a"></a>Tiefelsdorf, M. and Griffith, D. A. (2007). Semiparametric filtering of spatial autocorrelation: the eigenvector approach. *Environment and Planning A: Economy and Space*, 39(5), 1193–1221. [doi:10.1068/a37378](https://doi.org/10.1068/a37378)

## See Also
- [Moran Eigenvectors](moran-eigenvectors.md) · [Selecting Eigenvectors](selecting-eigenvectors.md) · [Random-Effects ESF](reesf.md) · [Decision Guide](decision-guide.md)
