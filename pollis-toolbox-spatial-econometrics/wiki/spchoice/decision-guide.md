# Decision Guide

## Choosing a Tab of the Spatial Discrete Choice Panel

| Situation | Tab | Reason |
|---|---|---|
| A binary choice that spreads between neighbours, a quick estimate wanted | Probit, GMM | Fast, with direct, indirect and total effects on the probability |
| A binary choice that spreads between neighbours, rho the quantity of interest | Probit, Bayesian | More precise on rho, with posterior intervals for every parameter |
| A choice in ordered categories that spreads between neighbours | Ordered Probit | Keeps the order of the categories, with cut points between them |
| A binary choice whose spatial autocorrelation is a nuisance | Logit With a Filter | The coefficients read as in an ordinary logistic regression |

## Linearised GMM or Gibbs Sampling for the Spatial Probit

The two estimators of the spatial lag probit trade speed against precision. The documentation of SpatialEconometrics.jl reports that the linearised GMM of `fit_spatial_probit` is approximately unbiased but, in its simulations, had a standard deviation of rho about two and a half times that of the Gibbs sampler of `fit_bayesian_spatial_probit` on the same data. The Gibbs sampler, for its part, pulls rho towards zero in small samples, a property of the posterior that a longer chain does not remove, so that for rho in small samples the documentation recommends the GMM estimator ([Randsley (2026)](#ref-Ran2026a)). The GMM Against Gibbs step fits both on the same data.

## A Spatial Lag Probit or a Logit With a Spatial Filter

A spatial lag probit models the dependence between choices: a location's propensity responds to its neighbours', so a change at one location reaches the others, and the model gives direct and indirect effects on the probability ([LeSage, Pace, Lam, Campanella and Liu (2011)](#ref-LPLCL2011a)). A logistic regression with a spatial filter models no such dependence; the filter takes up the spatial pattern that the explanatory variables leave in the choices ([Griffith (2003)](#ref-Gri2003a)). When the spillover between choices is the question, as when one business's reopening draws customers back for its neighbours, the spatial lag probit answers it; when the spatial pattern is only in the way of the coefficients, the filter is simpler. The Lag Probit Against a Filter step compares the two.

## A Binary or an Ordered Spatial Probit

When the outcome has more than two categories in a natural order, such as low, medium and high, the spatial ordered probit uses all of them, with cut points on the latent propensity between the categories ([Wang and Kockelman (2009)](#ref-WK2009a)). In SpatialEconometrics.jl, `fit_spatial_ordered_probit` has no intercept, since the cut points take its place, and its documentation recommends the binary Bayesian probit for an outcome with two categories, as that one carries an intercept ([Randsley (2026)](#ref-Ran2026a)).

## Choosing the Neighbours of a Spatial Probit

The spatial weights decide whose choices count as a location's neighbours. LeSage, Pace, Lam, Campanella and Liu (2011), modelling the reopening of businesses along streets, compared models with different numbers of nearest neighbours by the deviance information criterion, and chose 11 neighbours for the first three months after the hurricane and 15 for the longer horizons; the effects they estimated with 8 to 14 neighbours stayed within the credible intervals of their chosen model ([LeSage, Pace, Lam, Campanella and Liu (2011)](#ref-LPLCL2011a)). The Neighbours and k inputs of the panel set contiguity or the number of nearest neighbours.

## References

<a id="ref-Gri2003a"></a>Griffith, D. A. (2003). *Spatial autocorrelation and spatial filtering: gaining understanding through theory and scientific visualization*. Springer Berlin Heidelberg. [doi:10.1007/978-3-540-24806-4](https://doi.org/10.1007/978-3-540-24806-4)

<a id="ref-LPLCL2011a"></a>LeSage, J. P., Pace, R. K., Lam, N., Campanella, R. and Liu, X. (2011). New Orleans business recovery in the aftermath of Hurricane Katrina. *Journal of the Royal Statistical Society Series A: Statistics in Society*, 174(4), 1007–1027. [doi:10.1111/j.1467-985X.2011.00712.x](https://doi.org/10.1111/j.1467-985X.2011.00712.x)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-WK2009a"></a>Wang, X. and Kockelman, K. M. (2009). Bayesian inference for ordered response data with a dynamic spatial-ordered probit model. *Journal of Regional Science*, 49(5), 877–913. [doi:10.1111/j.1467-9787.2009.00622.x](https://doi.org/10.1111/j.1467-9787.2009.00622.x)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md)
