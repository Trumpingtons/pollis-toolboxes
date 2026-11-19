# Driscoll–Kraay

## What the Driscoll–Kraay Tab Computes

The Driscoll–Kraay tab fits least squares to a panel and computes the covariance of the coefficients with the estimator of Driscoll and Kraay (1998) ([Driscoll and Kraay (1998)](#ref-DK1998a)), through `vcov_driscoll_kraay` and `DriscollKraayVCOV` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)). The scores of all areas are summed period by period, and the covariance of these sums is estimated with the Bartlett weights of Newey and West (1987) up to the number of periods set by Lags ([Newey and West (1987)](#ref-NW1987a)). Correlation between any two areas in the same period is allowed for, whatever the distance between them, as is correlation between periods up to the lag.

## Why the Driscoll–Kraay Tab Needs Several Periods

The sums of the scores period by period form a single time series, one value per period, and the covariance is estimated from that series alone. Driscoll and Kraay (1998) show that the estimator is consistent as the number of periods grows, whatever the number of areas ([Driscoll and Kraay (1998)](#ref-DK1998a)). With few periods there are few values to estimate it from, and the documentation of SpatialEconometrics.jl notes that the estimator leans on many periods ([Randsley (2026)](#ref-Ran2026a)). The tab needs at least two periods, and prints a warning below 20. Design Check, in the Next Steps, prints the number of periods.

## Choosing the Lag of Driscoll and Kraay's Standard Errors

Lags sets over how many periods the sums of the scores may be correlated. Bartlett weights fall from 1 at lag 0 to near 0 at the last lag, as in Newey and West (1987) ([Newey and West (1987)](#ref-NW1987a)). When no lag is given, SpatialEconometrics.jl uses a rule of thumb that grows slowly with the number of periods ([Randsley (2026)](#ref-Ran2026a)). R's fixest uses another rule by default ([Bergé (2018)](#ref-Ber2018a)). Lags, in the Next Steps, prints the standard errors at lags from 0 to 6 beside the rule of thumb, to show how much the choice matters.

## The Small-Sample Adjustment of Driscoll and Kraay's Standard Errors

SpatialEconometrics.jl multiplies the Driscoll–Kraay covariance by the number of observations divided by the number of observations less the number of coefficients, by default ([Randsley (2026)](#ref-Ran2026a)). R's plm, with `vcovSCC` and `type = "HC1"`, applies the same adjustment ([Croissant and Millo (2008)](#ref-CM2008a)); R's fixest, with `vcov_DK`, applies none ([Bergé (2018)](#ref-Ber2018a)). The adjustment matters little when observations far outnumber coefficients. Petersen's Test Data, in the Next Steps, compares the standard errors with both packages.

## References

<a id="ref-Ber2018a"></a>Bergé, L. R. (2018). Efficient estimation of maximum likelihood models with multiple fixed-effects: the R package FENmlm. CREA Discussion Papers 13, University of Luxembourg. [uni.lu](https://wwwen-archive.uni.lu/content/download/110162/1299525/file/2018_13%20Efficient%20estimation%20of%20maximum%20likelihood%20models%20with%20multiple%20fixed-effects%20-%20the%20R%20package%20FENmlm.pdf)

<a id="ref-CM2008a"></a>Croissant, Y. and Millo, G. (2008). Panel data econometrics in R: the plm package. *Journal of Statistical Software*, 27(2), 1–43. [doi:10.18637/jss.v027.i02](https://doi.org/10.18637/jss.v027.i02)

<a id="ref-DK1998a"></a>Driscoll, J. C. and Kraay, A. C. (1998). Consistent covariance matrix estimation with spatially dependent panel data. *Review of Economics and Statistics*, 80(4), 549–560. [doi:10.1162/003465398557825](https://doi.org/10.1162/003465398557825)

<a id="ref-NW1987a"></a>Newey, W. K. and West, K. D. (1987). A simple, positive semi-definite, heteroskedasticity and autocorrelation consistent covariance matrix. *Econometrica*, 55(3), 703–708. [doi:10.2307/1913610](https://doi.org/10.2307/1913610)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Choosing a Cutoff](choosing-cutoff.md) · [Decision Guide](decision-guide.md) · [Conley Spatial HAC](conley.md) · [Cluster-Robust](cluster.md) · [Replications](replications.md)
