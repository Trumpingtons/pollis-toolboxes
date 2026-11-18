# Maximum Likelihood Estimation

## Why Spatial Lag and Error Models Need Maximum Likelihood

In the spatial lag model the spatial lag `Wy` is correlated with the error term, because each area's outcome is on the right-hand side of its neighbours' equations, so least squares is biased and inconsistent for it. Ord (1975) gave the maximum likelihood estimator for models of spatial interaction, assuming normal errors ([Ord (1975)](#ref-Ord1975a)). For a given `rho` the coefficients and the variance have closed forms, so the likelihood can be concentrated on `rho` alone and maximised in one dimension; the spatial error model is estimated the same way in `lambda` ([Anselin (1988)](#ref-Ans1988a)). The SLX model has no spatial lag of the outcome and is estimated by least squares.

## The Log-Determinant in the Spatial Likelihood

The log-likelihood of the spatial lag model holds the term `ln |I - rho W|`, the log-determinant of an n by n matrix for n areas, which keeps the estimate of `rho` within its admissible range. Ord (1975) computed it from the eigenvalues of `W`, as the sum of `ln(1 - rho z_i)` over the eigenvalues `z_i` ([Ord (1975)](#ref-Ord1975a)). For many areas, sparse LU factorisations, traces of powers of `W` and Chebyshev approximations are faster ([LeSage and Pace (2009)](#ref-LP2009a); [Bivand and Piras (2015)](#ref-BP2015a)). SpatialEconometrics.jl computes the log-determinant exactly up to `max_exact_n` areas, 1000 by default, and with a Chebyshev approximation beyond ([Randsley (2026)](#ref-Ran2026a)).

## Comparing Spatial Models by Likelihood

Models fitted by maximum likelihood to the same data with the same weights can be compared by their log-likelihoods. Nested models are compared by likelihood ratio tests: twice the difference of the log-likelihoods has a chi-squared distribution, with as many degrees of freedom as the restrictions, when the restricted model is true ([Elhorst (2014)](#ref-Elh2014a)). The spatial Durbin model nests the spatial lag, SLX and spatial error models, so each can be tested against it. Models that do not nest, as the spatial lag and spatial error models, are compared by information criteria: AIC adds twice the number of parameters to minus twice the log-likelihood, and BIC the number of parameters times the log of n.

## Standard Errors of Spatial Model Estimates

The standard errors of maximum likelihood estimates come from the inverse of the information matrix at the estimates. For the spatial lag model it involves traces of `W (I - rho W)^-1` and of its square, which depend on `rho` ([Anselin (1988)](#ref-Ans1988a)). Implementations differ in whether they use the analytical information matrix or a numerical Hessian, and Bivand and Piras (2015) compare the standard errors that each gives on the same data ([Bivand and Piras (2015)](#ref-BP2015a)).

## References

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-BP2015a"></a>Bivand, R. and Piras, G. (2015). Comparing implementations of estimation methods for spatial econometrics. *Journal of Statistical Software*, 63(18). [doi:10.18637/jss.v063.i18](https://doi.org/10.18637/jss.v063.i18)

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

<a id="ref-Ord1975a"></a>Ord, K. (1975). Estimation methods for models of spatial interaction. *Journal of the American Statistical Association*, 70(349), 120–126. [doi:10.1080/01621459.1975.10480272](https://doi.org/10.1080/01621459.1975.10480272)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Spatial Lag (SAR)](sar.md) · [Spatial Error (SEM)](sem.md) · [Spatial Durbin (SDM)](sdm.md) · [Decision Guide](decision-guide.md)
