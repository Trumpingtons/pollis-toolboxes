# Replications

## Petersen's Test Data: Cluster-Robust Standard Errors

Petersen (2009) published a panel of 500 firms over 10 years with the standard errors of a regression of one variable on another computed in several ways, so that software can be checked against them ([Petersen (2009)](#ref-Pet2009b); [Petersen (2009)](#ref-Pet2009a)). Petersen's Test Data, in the Next Steps, downloads the file, fits the same regression, and prints the standard errors clustered by firm and by year beside Petersen's published values. The clustered standard errors of SpatialEconometrics.jl apply the usual adjustment for the number of clusters and of observations ([Randsley (2026)](#ref-Ran2026a)), as Petersen's do.

## Petersen's Test Data: Driscoll and Kraay's Standard Errors in R

Petersen's page publishes no Driscoll–Kraay standard errors, so the same step compares them with two R packages on the same data. The plm package computes them with `vcovSCC` ([Croissant and Millo (2008)](#ref-CM2008a)), and its option `type = "HC1"` makes the same adjustment for degrees of freedom as SpatialEconometrics.jl by default ([Randsley (2026)](#ref-Ran2026a)). The fixest package computes them with `vcov_DK`, without that adjustment ([Bergé (2018)](#ref-Ber2018a)), which SpatialEconometrics.jl also allows to switch off. The step prints the standard errors of both packages, at a lag of two periods, beside those of Julia with and without the adjustment.

## Earthquakes off Fiji: Conley's Standard Errors in fixest

R's fixest computes Conley's standard errors with the `vcov_conley` function, from latitude and longitude ([Bergé (2018)](#ref-Ber2018a)). Earthquakes off Fiji, in the Next Steps, uses the earthquakes dataset distributed with R, a regression of the magnitude of each earthquake on its depth and on the number of stations that reported it, and prints Julia's standard errors beside those of fixest at cutoffs of 50 and 100 km. To match fixest, the step sets the same choices: the uniform kernel, great-circle distances on a sphere of radius 6,376 km, and no projection of the covariance onto positive semi-definite matrices.

## Settings That Change Conley's Standard Errors Between Software

Software computing Conley's standard errors can differ in details that the papers leave open ([Conley (1999)](#ref-Con1999a)), and these explain most differences between packages on the same data.

| Setting | Choices found in software |
|---|---|
| Kernel | Uniform, Bartlett, others |
| Distance | Great-circle on a sphere of a given radius, or Euclidean in projected coordinates |
| Pairs at the cutoff | Counted or not |
| Small-sample adjustment | n/(n−K), or none |
| Indefinite results | Kept, or projected onto positive semi-definite matrices |

fixest uses the uniform kernel, a sphere of 6,376 km and the adjustment n/(n−K) by default ([Bergé (2018)](#ref-Ber2018a)). SpatialEconometrics.jl defaults to the Bartlett kernel, no adjustment and the projection ([Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-Ber2018a"></a>Bergé, L. R. (2018). Efficient estimation of maximum likelihood models with multiple fixed-effects: the R package FENmlm. CREA Discussion Papers 13, University of Luxembourg. [uni.lu](https://wwwen-archive.uni.lu/content/download/110162/1299525/file/2018_13%20Efficient%20estimation%20of%20maximum%20likelihood%20models%20with%20multiple%20fixed-effects%20-%20the%20R%20package%20FENmlm.pdf)

<a id="ref-Con1999a"></a>Conley, T. G. (1999). GMM estimation with cross sectional dependence. *Journal of Econometrics*, 92(1), 1–45. [doi:10.1016/S0304-4076(98)00084-0](https://doi.org/10.1016/S0304-4076(98)00084-0)

<a id="ref-CM2008a"></a>Croissant, Y. and Millo, G. (2008). Panel data econometrics in R: the plm package. *Journal of Statistical Software*, 27(2), 1–43. [doi:10.18637/jss.v027.i02](https://doi.org/10.18637/jss.v027.i02)

<a id="ref-Pet2009a"></a>Petersen, M. A. (2009). Estimating standard errors in finance panel data sets: comparing approaches. *Review of Financial Studies*, 22(1), 435–480. [doi:10.1093/rfs/hhn053](https://doi.org/10.1093/rfs/hhn053)

<a id="ref-Pet2009b"></a>Petersen, M. A. (2009). Programming advice: test data with published OLS, White and clustered standard errors. Kellogg School of Management. [kellogg.northwestern.edu](https://www.kellogg.northwestern.edu/faculty/petersen/htm/papers/se/test_data.htm)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Conley Spatial HAC](conley.md) · [Cluster-Robust](cluster.md) · [Driscoll–Kraay](dk.md)
