# Effects on the Probability

## Why the Coefficients of a Spatial Probit Are Not Effects

In an ordinary probit, a coefficient moves the latent propensity, and its effect on the probability of the choice depends on where each observation sits on the normal curve. In a spatial lag probit, a change in an explanatory variable at one location also moves the propensities of its neighbours, through the spatial multiplier that rho sets, and of their neighbours in turn. The probability is then a non-linear function of the explanatory variables at every location, so the coefficients cannot be read as the change in the probability that a location makes the choice ([LeSage, Pace, Lam, Campanella and Liu (2011)](#ref-LPLCL2011a)).

## Direct, Indirect and Total Effects of a Spatial Probit

The changes in every location's probability for a change in a variable at every location form a matrix of partial derivatives. LeSage and Pace (2009) summarise it by three averages over the locations: the direct effect, the average of its diagonal, the change in a location's own probability for a change at that location, feedback through the neighbours included; the total effect, the average change in a location's probability when the variable changes at every location; and the indirect effect, their difference, the spillover that reaches a location from changes elsewhere ([LeSage and Pace (2009)](#ref-LP2009a)). The indirect effect cumulates spillovers over neighbours, neighbours of neighbours and so on, the largest falling on the nearest ([LeSage, Pace, Lam, Campanella and Liu (2011)](#ref-LPLCL2011a)).

## How the Spatial Discrete Choice Panel Computes the Effects

On the Probit, GMM tab, the Direct, Indirect and Total Effects step calls `marginal_effects` of SpatialEconometrics.jl, which evaluates the normal density at each location's fitted index, multiplies it by the spatial multiplier and the coefficient, and averages the diagonal and the row sums over the locations ([Randsley (2026)](#ref-Ran2026a)). It gives point estimates without standard errors. In a Bayesian fit, the effects can be evaluated on every draw of the sampler, which gives a posterior distribution for each of them and credible intervals, as LeSage, Pace, Lam, Campanella and Liu (2011) report; SpatialEconometrics.jl does not compute effects for its Gibbs sampler.

## Effects That Vary Over Locations

The direct, indirect and total effects are averages over the locations, and the effect at each location differs from them, as it depends on the location's place on the normal curve and on its neighbours. LeSage, Pace, Lam, Campanella and Liu (2011) computed the total effect at each of their 673 businesses and found that, for flood depth, median income and low-status customers, the effects varied enough over the streets that the averages did not represent every location; they suggest maps of the location-level effects to check whether the averages give a representative picture ([LeSage, Pace, Lam, Campanella and Liu (2011)](#ref-LPLCL2011a)).

## Reading the Effects of Dummy and Logged Variables

For a dummy variable, such as a size or ownership category, LeSage, Pace, Lam, Campanella and Liu (2011) read an effect as the change in the probability of the choice when a location moves from the omitted category to the category of the dummy. For a variable in logarithms, such as log median income, they read an effect as the change in the probability for a proportional change in the variable, a direct effect of 0.2116 raising the probability of reopening by 2.11% for every 10% increase in income ([LeSage, Pace, Lam, Campanella and Liu (2011)](#ref-LPLCL2011a)).

## References

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

<a id="ref-LPLCL2011a"></a>LeSage, J. P., Pace, R. K., Lam, N., Campanella, R. and Liu, X. (2011). New Orleans business recovery in the aftermath of Hurricane Katrina. *Journal of the Royal Statistical Society Series A: Statistics in Society*, 174(4), 1007–1027. [doi:10.1111/j.1467-985X.2011.00712.x](https://doi.org/10.1111/j.1467-985X.2011.00712.x)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
