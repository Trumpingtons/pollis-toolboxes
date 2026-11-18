# Overview

## What Spatial Discrete Choice Models Do

Spatial discrete choice models explain outcomes that are choices or categories, such as whether a business reopens, a household adopts a technology or a plot of land is developed, when the choice made at one location depends on the choices made nearby. A probit model treats each choice as the sign of a latent propensity, independent of all others. McMillen (1992) showed that the usual models of spatial autocorrelation make the errors of that propensity heteroskedastic, which makes the ordinary probit inconsistent, and proposed estimators for probit models with spatial autocorrelation ([McMillen (1992)](#ref-Mcm1992a)).

## The Spatial Lag Probit Model

The spatial lag probit, or spatial autoregressive probit, lets each location's latent propensity depend on a weighted average of its neighbours' propensities, with a parameter, rho, measuring the strength of that dependence; with rho equal to zero it is the ordinary probit ([LeSage and Pace (2009)](#ref-LP2009a)). A change in an explanatory variable at one location then moves the probabilities of its neighbours, and of their neighbours in turn. LeSage, Pace, Lam, Campanella and Liu (2011) summarise these changes as average direct, indirect and total effects on the probability, and note that the coefficients themselves are not effects on the probability ([LeSage, Pace, Lam, Campanella and Liu (2011)](#ref-LPLCL2011a)).

## Estimating the Spatial Lag Probit

The exact likelihood of the spatial lag probit needs an integral over the latent propensities of all locations at once, which SpatialEconometrics.jl avoids in two ways ([Randsley (2026)](#ref-Ran2026a)). `fit_spatial_probit` applies to the probit the linearised generalised method of moments (GMM) that Klier and McMillen (2008) proposed for the spatial logit: a standard model first, then two-stage least squares ([Klier and McMillen (2008)](#ref-KM2008a)). `fit_bayesian_spatial_probit` follows the Bayesian approach of LeSage and Pace (2009), which draws the latent propensities as parameters by Gibbs sampling, the data augmentation of Albert and Chib (1993) ([Albert and Chib (1993)](#ref-AC1993a); [LeSage and Pace (2009)](#ref-LP2009a)).

## Ordered Choices and Filtered Choices

Some outcomes come in ordered categories, such as low, medium and high levels of land development. Wang and Kockelman (2009) estimate a spatial ordered probit by Bayesian methods, in which cut points on the latent propensity separate the categories ([Wang and Kockelman (2009)](#ref-WK2009a)); SpatialEconometrics.jl fits one with `fit_spatial_ordered_probit`. A different route leaves the choices independent and removes the spatial autocorrelation with a spatial filter of Moran eigenvectors, which can enter a logistic regression as ordinary explanatory variables ([Griffith (2003)](#ref-Gri2003a)).

## The Four Tabs of the Spatial Discrete Choice Panel

Probit, GMM fits the spatial lag probit by linearised GMM, with direct, indirect and total effects; Probit, Bayesian fits it by Gibbs sampling; Ordered Probit fits the spatial ordered probit by Gibbs sampling; Logit With a Filter fits a logistic regression with Moran eigenvectors. All four take their neighbours from the areas' boundaries or centroids, found with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## References

<a id="ref-AC1993a"></a>Albert, J. H. and Chib, S. (1993). Bayesian analysis of binary and polychotomous response data. *Journal of the American Statistical Association*, 88(422), 669–679. [doi:10.1080/01621459.1993.10476321](https://doi.org/10.1080/01621459.1993.10476321)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Gri2003a"></a>Griffith, D. A. (2003). *Spatial autocorrelation and spatial filtering: gaining understanding through theory and scientific visualization*. Springer Berlin Heidelberg. [doi:10.1007/978-3-540-24806-4](https://doi.org/10.1007/978-3-540-24806-4)

<a id="ref-KM2008a"></a>Klier, T. and McMillen, D. P. (2008). Clustering of auto supplier plants in the United States: generalized method of moments spatial logit for large samples. *Journal of Business & Economic Statistics*, 26(4), 460–471. [doi:10.1198/073500107000000188](https://doi.org/10.1198/073500107000000188)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

<a id="ref-LPLCL2011a"></a>LeSage, J. P., Pace, R. K., Lam, N., Campanella, R. and Liu, X. (2011). New Orleans business recovery in the aftermath of Hurricane Katrina. *Journal of the Royal Statistical Society Series A: Statistics in Society*, 174(4), 1007–1027. [doi:10.1111/j.1467-985X.2011.00712.x](https://doi.org/10.1111/j.1467-985X.2011.00712.x)

<a id="ref-Mcm1992a"></a>McMillen, D. P. (1992). Probit with spatial autocorrelation. *Journal of Regional Science*, 32(3), 335–348. [doi:10.1111/j.1467-9787.1992.tb00190.x](https://doi.org/10.1111/j.1467-9787.1992.tb00190.x)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-WK2009a"></a>Wang, X. and Kockelman, K. M. (2009). Bayesian inference for ordered response data with a dynamic spatial-ordered probit model. *Journal of Regional Science*, 49(5), 877–913. [doi:10.1111/j.1467-9787.2009.00622.x](https://doi.org/10.1111/j.1467-9787.2009.00622.x)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md)
