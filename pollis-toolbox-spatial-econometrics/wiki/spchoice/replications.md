# Replications

## Software the Spatial Discrete Choice Panel Is Checked Against

The panel's Bayesian spatial probit is compared with the published estimates of LeSage, Pace, Lam, Campanella and Liu (2011), whose data are distributed with spatialprobit, the R package of Wilhelm and de Matos for Bayesian spatial probit models. spatialprobit estimates the spatial lag probit by Gibbs sampling, drawing the latent propensities from a truncated multivariate normal distribution with sparse matrices, which lets it handle large samples ([Wilhelm and de Matos (2013)](#ref-WM2013a)). Its `sarprobit` function fits the same model as `fit_bayesian_spatial_probit` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)).

## The New Orleans Business Data

The data follow 673 businesses on three commercial corridors of New Orleans, St Claude Avenue, Magazine Street and Carrollton Avenue, surveyed weekly from October 2005, six weeks after Hurricane Katrina. For each business they record whether it had reopened within 3, 6 and 12 months of the hurricane, 300, 425 and 478 businesses respectively, with the flood depth at its location, the log median income of its census block group, its size, the socio-economic status of its customers and its type of ownership. LeSage, Pace, Lam, Campanella and Liu (2011) fit a spatial lag probit at each horizon and report the posterior means and standard deviations in their Table 3 ([LeSage, Pace, Lam, Campanella and Liu (2011)](#ref-LPLCL2011a)).

## Replicating the New Orleans Estimates

The panel's New Orleans After Katrina step downloads the data of spatialprobit and builds the weights of the article: each business's 15 nearest businesses, by distance between their latitudes and longitudes, row-standardised, the number of neighbours the article chose for the 6- and 12-month horizons. It fits the spatial lag probit at both horizons by Gibbs sampling with the panel's Draws and Burn-in, and prints the posterior mean and standard deviation of the constant, the eight coefficients and rho beside Table 3 of the article, after checking the number of businesses reopened ([LeSage, Pace, Lam, Campanella and Liu (2011)](#ref-LPLCL2011a); [Randsley (2026)](#ref-Ran2026a)).

## Why the Replication Can Differ From the Article

A Gibbs sampler gives posterior means that vary from one chain to another by their Monte Carlo error, so a replication with different random draws, or a chain of a different length, does not reproduce the published values to the last digit; the Chain Diagnostics step reports that error for each parameter. The two samplers also need not share their priors: `fit_bayesian_spatial_probit` uses a normal prior with variance 100 for each coefficient and a uniform prior on rho ([Randsley (2026)](#ref-Ran2026a)). Businesses at equal distances from another can, finally, be ordered differently among its 15 nearest neighbours.

## References

<a id="ref-LPLCL2011a"></a>LeSage, J. P., Pace, R. K., Lam, N., Campanella, R. and Liu, X. (2011). New Orleans business recovery in the aftermath of Hurricane Katrina. *Journal of the Royal Statistical Society Series A: Statistics in Society*, 174(4), 1007–1027. [doi:10.1111/j.1467-985X.2011.00712.x](https://doi.org/10.1111/j.1467-985X.2011.00712.x)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-WM2013a"></a>Wilhelm, S. and de Matos, M. G. (2013). Estimating spatial probit models in R. *The R Journal*, 5(1), 130–143. [doi:10.32614/RJ-2013-013](https://doi.org/10.32614/RJ-2013-013)

## See Also
- [Overview](overview.md) · [Effects on the Probability](effects.md) · [Decision Guide](decision-guide.md)
