# Regimes, Spatial Lag

## What the Regimes, Spatial Lag Tab Estimates

The Regimes, Spatial Lag tab fits a spatial lag model in which each regime has its own intercept and slopes, while the outcome of every area also depends on the average outcome of its neighbours through one coefficient, rho, shared by all regimes. It uses `fit_spatial_regime` with `spatial_lag = true` of SpatialEconometrics.jl, by maximum likelihood ([Randsley (2026)](#ref-Ran2026a)), the regime form of the spatial lag model of Anselin (1988) ([Anselin (1988)](#ref-Ans1988a)). The tab prints the coefficients by regime, rho, their standard errors, the log-likelihood, and the likelihood ratio Chow test against the spatial lag model with a single regime.

## Why Rho Is Shared by the Regimes

The neighbours of an area near a regime boundary lie partly in the other regime, and their outcomes affect it all the same. With one rho for the whole map, the spatial lag runs across the boundaries, while the intercept and slopes change at them. The documentation of spreg's `ML_Lag_Regimes` gives a single spatial lag coefficient as its default as well. A slope of this model is not the effect of its variable: as in any spatial lag model, a change in one area travels through the neighbours and back, so the slope is only its first round ([Anselin (1988)](#ref-Ans1988a)).

## How Rho and the Standard Errors Are Computed

`fit_spatial_regime` maximises the likelihood concentrated in rho, which holds the log-determinant of the identity less rho times the weights ([Randsley (2026)](#ref-Ran2026a)). By default it finds the peak with a Chebyshev approximation of that log-determinant and places it with the exact one. The standard errors come from the expected information matrix of the spatial lag model, for the coefficients, rho and the variance together, so they allow for rho having been estimated. The Replicate step checks the coefficients, rho, their variances and the log-likelihood against spreg on the Baltimore house prices ([Dubin (1992)](#ref-Dub1992a)).

## Testing the Regimes With a Spatial Lag

The likelihood ratio Chow test of the tab compares the regime spatial lag model with a spatial lag model with a single regime, both by maximum likelihood, so the spatial dependence of the outcome is in both ([Randsley (2026)](#ref-Ran2026a)). Anselin (1990) shows that ignoring spatial dependence invalidates the usual tests of equal coefficients across regimes, and compares maximum likelihood with other approaches ([Anselin (1990)](#ref-Ans1990a)). OLS Against Spatial Lag Regimes tests whether the spatial lag is needed at all, and Which Coefficients Differ tests the coefficients one by one.

## References

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-Ans1990a"></a>Anselin, L. (1990). Spatial dependence and spatial structural instability in applied regression analysis. *Journal of Regional Science*, 30(2), 185–207. [doi:10.1111/j.1467-9787.1990.tb00092.x](https://doi.org/10.1111/j.1467-9787.1990.tb00092.x)

<a id="ref-Dub1992a"></a>Dubin, R. A. (1992). Spatial autocorrelation and neighborhood quality. *Regional Science and Urban Economics*, 22(3), 433–452. [doi:10.1016/0166-0462(92)90038-3](https://doi.org/10.1016/0166-0462(92)90038-3)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Regimes, OLS](regols.md) · [Testing Regimes](testing-regimes.md) · [Replications](replications.md)
