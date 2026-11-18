# Ordered Probit

## What the Ordered Probit Tab Fits

The Ordered Probit tab fits a spatial ordered probit, for outcomes in ordered categories such as low, medium and high, when an area's category depends on its neighbours'. Each area has a latent propensity that depends on its neighbours' propensities through rho, as in the spatial lag probit, and its category is set by where that propensity falls between a series of cut points. Wang and Kockelman (2009) developed Bayesian estimation of spatial ordered probit models by Gibbs sampling ([Wang and Kockelman (2009)](#ref-WK2009a)). The tab calls `fit_spatial_ordered_probit` of SpatialEconometrics.jl, which draws the latent propensities within the cut points of their categories, the coefficients, rho and the cut points in turn ([Randsley (2026)](#ref-Ran2026a)).

## Cut Points in Place of an Intercept

The level of the latent propensity and the cut points cannot both be estimated, so `fit_spatial_ordered_probit` has no intercept and fixes the first cut point at zero; the cut points between the higher categories are free, each drawn uniformly between the propensities of the areas in the two categories it separates. The Dependent Variable must be coded 1, 2 and so on, the number of categories being the largest code, and no explanatory variable may be constant, as a constant column would play the part of the missing intercept. With two categories the model is the binary spatial probit, which the documentation of the function recommends fitting on the Probit, Bayesian tab, as that carries an intercept ([Randsley (2026)](#ref-Ran2026a)).

## Reading the Output of the Ordered Probit Tab

The Ordered Probit tab prints the posterior mean, posterior standard deviation and 2.5% and 97.5% quantiles of each explanatory variable's coefficient and of rho, with the acceptance rate of the Metropolis step for rho. It then gives each free cut point with its posterior mean and 95% interval, and the number of areas in each category. A positive coefficient moves the latent propensity up, towards the higher categories; like the coefficients of any probit, it is not an effect on the probability of a category. The model returns no fitted probabilities, so the Next Steps on this tab are those that check the chain: Trace and Density of ρ and Chain Diagnostics.

## Cut Points, Coefficients and the Scale of the Propensity

The observed categories fix the latent propensities only up to their scale, so the cut points move together with the coefficients. The documentation of `fit_spatial_ordered_probit` reports that the weak identification of the binary Bayesian sampler, where rho and the size of the coefficients trade off in small samples, applies here too, and that the free cut points come out inflated in the same proportion as the coefficients, since they share the scale of the propensity ([Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-WK2009a"></a>Wang, X. and Kockelman, K. M. (2009). Bayesian inference for ordered response data with a dynamic spatial-ordered probit model. *Journal of Regional Science*, 49(5), 877–913. [doi:10.1111/j.1467-9787.2009.00622.x](https://doi.org/10.1111/j.1467-9787.2009.00622.x)

## See Also
- [Probit, Bayesian](probitbayes.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
