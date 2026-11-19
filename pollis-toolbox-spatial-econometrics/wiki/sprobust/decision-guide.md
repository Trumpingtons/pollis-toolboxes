# Decision Guide

## Which Tab of the Spatial Correlation Robust Inference Panel to Use

| Data and correlation | Tab |
|---|---|
| A cross-section of areas whose errors are correlated with those of nearby areas | Conley Spatial HAC |
| Areas grouped into regions, districts or countries, with correlation inside each group and many groups | Cluster-Robust |
| A panel with many periods, and shocks common to many areas in a period | Driscoll–Kraay |
| A panel with few periods and correlation between nearby areas | Conley Spatial HAC, with Lags for correlation over time |
| A panel with a persistent effect of each area | Cluster-Robust by area, or Fixed Effects of the areas |

Gupta (2026) lists cluster-robust and spatial heteroskedasticity and autocorrelation consistent estimators among the main ways to correct standard errors for spatial correlation ([Gupta (2026)](#ref-Gup2026a)).

## When to Cluster Instead of Using Conley's Standard Errors

Clustering needs no distances, only a column naming the groups, and allows for any correlation inside a group. It suits data with natural groups that hold most of the correlation, such as districts sharing a local policy. Its assumption is that areas in different groups are independent, so two neighbouring areas on either side of a group's border count as unrelated ([Gupta (2026)](#ref-Gup2026a)). It also needs many groups: Cameron and Miller (2015) show that with few clusters cluster-robust standard errors are biased downwards ([Cameron and Miller (2015)](#ref-CM2015a)), and the documentation of SpatialEconometrics.jl suggests another method with fewer than about 20 groups ([Randsley (2026)](#ref-Ran2026a)). Conley's standard errors need distances and a cutoff, and treat correlation as a matter of distance rather than of membership.

## When to Use Driscoll and Kraay's Standard Errors

Driscoll and Kraay (1998) sum the scores of all areas in each period and apply a time series correction to these sums, so any pattern of correlation between areas in the same period is allowed for, with no distances and no groups ([Driscoll and Kraay (1998)](#ref-DK1998a)). The price is that the covariance is estimated from the periods alone: the estimator's consistency rests on the number of periods growing, and the documentation of SpatialEconometrics.jl notes that it leans on many periods ([Randsley (2026)](#ref-Ran2026a)). It suits long panels of regions or countries hit by common shocks. With few periods, the Driscoll–Kraay tab prints a warning, and Conley Spatial HAC or clustering by period is the alternative.

## Reading the Robust Standard Errors Together

Each tab rests on a different assumption about which errors may be correlated, so their standard errors can differ, and none is right in every case. All Estimators Side by Side, in the Next Steps, prints the usual standard errors, those robust to heteroskedasticity only, and those of the three tabs for each coefficient. Robust standard errors close to one another give some confidence that the conclusion does not hang on the choice. A much larger standard error from one estimator points to a kind of correlation that the others leave out. Petersen (2009) used the same comparison to tell a persistent firm effect from a time effect in finance panels ([Petersen (2009)](#ref-Pet2009a)).

## When the Correlation Itself Is of Interest

When the question is how strongly an area's outcome depends on its neighbours', or when neighbours' explanatory variables affect an area's outcome, correcting the standard errors of least squares is not enough: a spatial lag or spatial error model estimates that dependence ([Gupta (2026)](#ref-Gup2026a)). With a Spatial Lag, in the Next Steps, fits a spatial lag model with the same neighbours and computes its standard errors with Conley's or Driscoll and Kraay's estimator, so the two approaches can be compared. The Spatial Lag and Error Models and Spatial Panel Data panels of the same toolbox estimate these models in full.

## References

<a id="ref-CM2015a"></a>Cameron, A. C. and Miller, D. L. (2015). A practitioner's guide to cluster-robust inference. *Journal of Human Resources*, 50(2), 317–372. [doi:10.3368/jhr.50.2.317](https://doi.org/10.3368/jhr.50.2.317)

<a id="ref-DK1998a"></a>Driscoll, J. C. and Kraay, A. C. (1998). Consistent covariance matrix estimation with spatially dependent panel data. *Review of Economics and Statistics*, 80(4), 549–560. [doi:10.1162/003465398557825](https://doi.org/10.1162/003465398557825)

<a id="ref-Gup2026a"></a>Gupta, A. (2026). Recent developments in spatial econometrics. arXiv. [doi:10.48550/arXiv.2611.14673](https://doi.org/10.48550/arXiv.2611.14673)

<a id="ref-Pet2009a"></a>Petersen, M. A. (2009). Estimating standard errors in finance panel data sets: comparing approaches. *Review of Financial Studies*, 22(1), 435–480. [doi:10.1093/rfs/hhn053](https://doi.org/10.1093/rfs/hhn053)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Choosing a Cutoff](choosing-cutoff.md) · [Conley Spatial HAC](conley.md) · [Cluster-Robust](cluster.md) · [Driscoll–Kraay](dk.md)
