# Choosing a Cutoff

## What the Distance Cutoff of Conley's Standard Errors Does

Conley's estimator lets the errors of two areas be correlated when the distance between them is below a cutoff, and treats them as independent beyond it ([Conley (1999)](#ref-Con1999a)). In SpatialEconometrics.jl the cutoff is in the units of the distance, here kilometres between centroids in the Distance Coordinate System. Its documentation calls the cutoff a judgement call to which the result is sensitive: too small and spatial correlation is missed, too large and the estimate is noisy; it advises reporting standard errors at a couple of cutoffs ([Randsley (2026)](#ref-Ran2026a)).

## How to Choose the Cutoff of Conley's Standard Errors

The cutoff should reach as far as the correlation of the errors does. Three steps of the Next Steps help. Residual Correlation by Distance shows the correlation of the residuals of pairs of areas in bands of distance, and where it falls to about zero. Standard Errors Against the Cutoff recomputes each standard error at cutoffs from a quarter to three times the one chosen, so the sensitivity is in view. Map of the Neighbours Within the Cutoff shows how many areas each one is paired with; an area with none gets only a correction for heteroskedasticity. R's fixest, which also computes Conley's standard errors, offers a rule of thumb when no cutoff is given, and its documentation adds that the most appropriate cutoff depends on the application and should be provided by the user ([Bergé (2018)](#ref-Ber2018a)).

## Kernels: How the Weight of a Pair Falls With Distance

Within the cutoff each pair of areas gets a weight from a kernel of its distance divided by the cutoff. With Bartlett the weight falls in a straight line from 1 at distance 0 to 0 at the cutoff, as Newey and West's weights fall with the lag in time series ([Newey and West (1987)](#ref-NW1987a)). With Uniform every pair within the cutoff gets weight 1, which is the kernel of R's fixest ([Bergé (2018)](#ref-Ber2018a)). Parzen falls smoothly. Weights that fall to zero keep the estimate closer to positive semi-definite; SpatialEconometrics.jl projects an indefinite result onto the nearest positive semi-definite matrix ([Randsley (2026)](#ref-Ran2026a)). The Kernels step compares the three at the same cutoff.

## Lags: Correlation Over Time in a Panel

In a panel the errors of an area may also be correlated with its own errors in earlier periods. The Lags input sets over how many periods. Conley Spatial HAC adds the products of each area's scores with its own scores up to that many periods apart, weighted by a Bartlett kernel in time. Driscoll–Kraay applies Newey and West's correction to the sums of the scores of all areas period by period ([Driscoll and Kraay (1998)](#ref-DK1998a); [Newey and West (1987)](#ref-NW1987a)). SpatialEconometrics.jl gives a rule of thumb for the Driscoll–Kraay lag from the number of periods, which the Lags step prints beside the standard errors at each lag ([Randsley (2026)](#ref-Ran2026a)).

## Choosing the Clusters

Wider clusters allow for more correlation but leave fewer groups to estimate it from. Cameron and Miller (2015) describe the trade-off and the downward bias of cluster-robust standard errors with few clusters ([Cameron and Miller (2015)](#ref-CM2015a)). Petersen (2009) shows in finance panels that standard errors clustered by firm allow for a persistent firm effect and those clustered by time for a shock common to all firms in a period ([Petersen (2009)](#ref-Pet2009a)). Gupta (2026) notes that clustering assumes no correlation between clusters, so errors correlated across a cluster border are not allowed for ([Gupta (2026)](#ref-Gup2026a)). The Cluster Levels step compares clustering by each row, by area, by period and by the Cluster Column.

## References

<a id="ref-Ber2018a"></a>Bergé, L. R. (2018). Efficient estimation of maximum likelihood models with multiple fixed-effects: the R package FENmlm. CREA Discussion Papers 13, University of Luxembourg. [uni.lu](https://wwwen-archive.uni.lu/content/download/110162/1299525/file/2018_13%20Efficient%20estimation%20of%20maximum%20likelihood%20models%20with%20multiple%20fixed-effects%20-%20the%20R%20package%20FENmlm.pdf)

<a id="ref-CM2015a"></a>Cameron, A. C. and Miller, D. L. (2015). A practitioner's guide to cluster-robust inference. *Journal of Human Resources*, 50(2), 317–372. [doi:10.3368/jhr.50.2.317](https://doi.org/10.3368/jhr.50.2.317)

<a id="ref-Con1999a"></a>Conley, T. G. (1999). GMM estimation with cross sectional dependence. *Journal of Econometrics*, 92(1), 1–45. [doi:10.1016/S0304-4076(98)00084-0](https://doi.org/10.1016/S0304-4076(98)00084-0)

<a id="ref-DK1998a"></a>Driscoll, J. C. and Kraay, A. C. (1998). Consistent covariance matrix estimation with spatially dependent panel data. *Review of Economics and Statistics*, 80(4), 549–560. [doi:10.1162/003465398557825](https://doi.org/10.1162/003465398557825)

<a id="ref-Gup2026a"></a>Gupta, A. (2026). Recent developments in spatial econometrics. arXiv. [doi:10.48550/arXiv.2611.14673](https://doi.org/10.48550/arXiv.2611.14673)

<a id="ref-NW1987a"></a>Newey, W. K. and West, K. D. (1987). A simple, positive semi-definite, heteroskedasticity and autocorrelation consistent covariance matrix. *Econometrica*, 55(3), 703–708. [doi:10.2307/1913610](https://doi.org/10.2307/1913610)

<a id="ref-Pet2009a"></a>Petersen, M. A. (2009). Estimating standard errors in finance panel data sets: comparing approaches. *Review of Financial Studies*, 22(1), 435–480. [doi:10.1093/rfs/hhn053](https://doi.org/10.1093/rfs/hhn053)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Conley Spatial HAC](conley.md) · [Cluster-Robust](cluster.md) · [Driscoll–Kraay](dk.md)
