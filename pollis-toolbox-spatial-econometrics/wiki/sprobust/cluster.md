# Cluster-Robust

## What the Cluster-Robust Tab Computes

The Cluster-Robust tab fits least squares and computes the covariance of the coefficients from the sums of the scores within each group named by the Cluster Column, through `vcov_cluster` and `ClusterRobustVCOV` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)). The errors of observations in the same group may be correlated in any way, and with variances of their own; observations in different groups are assumed independent. With one observation per group, the estimator reduces to that of White (1980), robust to heteroskedasticity only ([White (1980)](#ref-Whi1980a)). Cameron and Miller (2015) give a practitioner's guide to the estimator and its variants ([Cameron and Miller (2015)](#ref-CM2015a)).

## The Small-Sample Adjustment of Cluster-Robust Standard Errors

SpatialEconometrics.jl multiplies the cluster-robust covariance by G/(G−1) times (n−1)/(n−K), where G is the number of clusters, n the number of observations and K the number of coefficients ([Randsley (2026)](#ref-Ran2026a)). This is the adjustment of the standard errors published by Petersen (2009), which the Petersen's Test Data step reproduces ([Petersen (2009)](#ref-Pet2009b)). With Fixed Effects removed by subtracting means, K counts only the coefficients of the Explanatory Variables, the convention for fixed effects nested within the clusters ([Cameron and Miller (2015)](#ref-CM2015a)).

## How Many Clusters Cluster-Robust Standard Errors Need

The estimator is consistent as the number of clusters grows, not the number of observations. Cameron and Miller (2015) show that with few clusters cluster-robust standard errors are biased downwards and tests over-reject, and review remedies such as the wild cluster bootstrap ([Cameron and Miller (2015)](#ref-CM2015a)). The documentation of SpatialEconometrics.jl suggests another method with fewer than about 20 groups ([Randsley (2026)](#ref-Ran2026a)), and the tab prints a warning below that number. Design Check, in the Next Steps, prints the number of clusters and the sizes of the smallest and largest.

## Clustering Areas in Space

In spatial data the groups are usually administrative units, such as districts, regions or countries, or blocks of a grid. Clustering allows for correlation of any shape inside them, but not across their borders, so neighbouring areas in different groups count as independent ([Gupta (2026)](#ref-Gup2026a)). In a panel, clustering by area allows for a persistent effect of each area, and clustering by period for a shock common to all areas in a period ([Petersen (2009)](#ref-Pet2009a)). Cluster Levels, in the Next Steps, compares the standard errors with one cluster per row, per area, per period and per value of the Cluster Column.

## References

<a id="ref-CM2015a"></a>Cameron, A. C. and Miller, D. L. (2015). A practitioner's guide to cluster-robust inference. *Journal of Human Resources*, 50(2), 317–372. [doi:10.3368/jhr.50.2.317](https://doi.org/10.3368/jhr.50.2.317)

<a id="ref-Gup2026a"></a>Gupta, A. (2026). Recent developments in spatial econometrics. arXiv. [doi:10.48550/arXiv.2611.14673](https://doi.org/10.48550/arXiv.2611.14673)

<a id="ref-Pet2009a"></a>Petersen, M. A. (2009). Estimating standard errors in finance panel data sets: comparing approaches. *Review of Financial Studies*, 22(1), 435–480. [doi:10.1093/rfs/hhn053](https://doi.org/10.1093/rfs/hhn053)

<a id="ref-Pet2009b"></a>Petersen, M. A. (2009). Programming advice: test data with published OLS, White and clustered standard errors. Kellogg School of Management. [kellogg.northwestern.edu](https://www.kellogg.northwestern.edu/faculty/petersen/htm/papers/se/test_data.htm)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-Whi1980a"></a>White, H. (1980). A heteroskedasticity-consistent covariance matrix estimator and a direct test for heteroskedasticity. *Econometrica*, 48(4), 817–838. [doi:10.2307/1912934](https://doi.org/10.2307/1912934)

## See Also
- [Choosing a Cutoff](choosing-cutoff.md) · [Decision Guide](decision-guide.md) · [Conley Spatial HAC](conley.md) · [Driscoll–Kraay](dk.md) · [Replications](replications.md)
