# Probit, GMM

## What the Probit, GMM Tab Fits

The Probit, GMM tab fits the spatial lag probit, in which each area's latent propensity to make the choice depends on its neighbours' propensities through the parameter rho. It calls `fit_spatial_probit` of SpatialEconometrics.jl, which fits a standard probit, takes it as the value at rho equal to zero, linearises the moment conditions of the model around it, and estimates the coefficients and rho together by two-stage least squares ([Randsley (2026)](#ref-Ran2026a)). The linearisation is the one Klier and McMillen (2008) proposed for the spatial logit, which reduces the estimation to two steps that remain feasible for large samples ([Klier and McMillen (2008)](#ref-KM2008a)).

## The Instrument Lags Input of the Probit, GMM Tab

The two-stage least squares step needs instruments for the spatial lag, which `fit_spatial_probit` builds from the explanatory variables and their spatial lags: their neighbours' averages, the averages of those averages and so on. The Instrument Lags input chooses how many lags enter, from one to three, with two by default. The spatial lag of the intercept is left out, as with row-standardised weights it equals the intercept itself ([Randsley (2026)](#ref-Ran2026a)).

## Reading the Output of the Probit, GMM Tab

The Probit, GMM tab prints the estimates, standard errors and z-values of the intercept, the explanatory variables and rho; the standard errors are heteroskedasticity-robust, from the two-stage least squares step. The pseudo log-likelihood is the probit log-likelihood at the fitted index: as the estimator is GMM, not maximum likelihood, it compares fits made the same way but is not a likelihood criterion. The fitted probabilities allow for the different variance of each area's latent propensity, which needs the inverse of a dense matrix of the size of the number of areas, so the tab suits samples of moderate size. A warning appears when the two-stage least squares step was ill-conditioned or rho reached the edge of its range ([Randsley (2026)](#ref-Ran2026a)).

## How Precise the GMM Estimate of Rho Is

Linearising around rho equal to zero buys speed at a cost in efficiency. The documentation of `fit_spatial_probit` reports that, in its simulations, the estimator was approximately unbiased but its estimates of rho were spread far more widely than those of the Gibbs sampler on the same data, and advises treating a single estimate of rho from a small sample as a coarse reading ([Randsley (2026)](#ref-Ran2026a)). The coefficients, like those of any probit, are not effects on the probability: the Direct, Indirect and Total Effects step computes those, following LeSage and Pace (2009) ([LeSage and Pace (2009)](#ref-LP2009a)).

## References

<a id="ref-KM2008a"></a>Klier, T. and McMillen, D. P. (2008). Clustering of auto supplier plants in the United States: generalized method of moments spatial logit for large samples. *Journal of Business & Economic Statistics*, 26(4), 460–471. [doi:10.1198/073500107000000188](https://doi.org/10.1198/073500107000000188)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Probit, Bayesian](probitbayes.md) · [Effects on the Probability](effects.md) · [Decision Guide](decision-guide.md)
