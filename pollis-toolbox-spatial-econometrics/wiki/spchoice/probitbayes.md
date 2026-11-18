# Probit, Bayesian

## What the Probit, Bayesian Tab Fits

The Probit, Bayesian tab fits the spatial lag probit by Gibbs sampling. Following Albert and Chib (1993), the latent propensities behind the observed choices are treated as parameters and drawn along with the others, which turns the probit into a regression on a continuous outcome at each step of the sampler ([Albert and Chib (1993)](#ref-AC1993a)). LeSage and Pace (2009) applied this to the spatial lag probit ([LeSage and Pace (2009)](#ref-LP2009a)). The tab calls `fit_bayesian_spatial_probit` of SpatialEconometrics.jl, whose every sweep draws each area's propensity within the sign its choice allows, then the coefficients from their normal conditional distribution, then rho by a random-walk Metropolis step ([Randsley (2026)](#ref-Ran2026a)).

## Priors, Draws and Burn-in of the Probit, Bayesian Tab

`fit_bayesian_spatial_probit` fixes the variance of the latent errors at 1, gives each coefficient a normal prior with mean zero and variance 100, and rho a uniform prior between minus one and one. The Burn-in input sets how many first draws are discarded while the chain leaves its starting values, and the Draws input how many are kept; the posterior means and standard deviations are taken over the draws kept. The documentation of the function notes that at its default length the effective sample size for rho is only about 100, so that the posterior summaries carry a few percent of Monte Carlo noise, and that more draws reduce it ([Randsley (2026)](#ref-Ran2026a)).

## Reading the Output of the Probit, Bayesian Tab

The Probit, Bayesian tab prints, for the intercept, the explanatory variables and rho, the posterior mean, the posterior standard deviation and the 2.5% and 97.5% quantiles of the draws, an interval holding 95% of the posterior. It then gives the acceptance rate of the Metropolis step for rho, which the documentation of `fit_bayesian_spatial_probit` expects between 0.2 and 0.5, and the hit rate of the fitted probabilities, computed at the posterior means ([Randsley (2026)](#ref-Ran2026a)). The Trace and Density of ρ and Chain Diagnostics steps check whether the chain has run long enough.

## Rho of the Bayesian Spatial Probit in Small Samples

The observed choices fix the latent propensities only up to their scale, so rho and the size of the coefficients can trade off against each other along a ridge of the posterior that the data identify weakly. The documentation of `fit_bayesian_spatial_probit` reports that in small samples the posterior mean of rho is pulled towards zero while the coefficients are pushed away from it, that both biases shrink as the number of areas grows, and that a longer chain does not remove them, as they belong to the posterior rather than to the sampler ([Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-AC1993a"></a>Albert, J. H. and Chib, S. (1993). Bayesian analysis of binary and polychotomous response data. *Journal of the American Statistical Association*, 88(422), 669–679. [doi:10.1080/01621459.1993.10476321](https://doi.org/10.1080/01621459.1993.10476321)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Probit, GMM](probitgmm.md) · [Decision Guide](decision-guide.md) · [Replications](replications.md)
