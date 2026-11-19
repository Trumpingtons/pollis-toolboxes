# Conley Spatial HAC

## What the Conley Spatial HAC Tab Computes

The Conley Spatial HAC tab fits least squares and computes the covariance of the coefficients with the spatial heteroskedasticity and autocorrelation consistent estimator of Conley (1999) ([Conley (1999)](#ref-Con1999a)), through `vcov_conley` and `ConleySpatialHAC` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)). Conley's estimator sums the products of the scores of every pair of areas closer than the cutoff, each weighted by a kernel of the distance between them, so it allows for correlation that fades with distance and vanishes beyond the cutoff. Areas play the role that periods play in the estimator of Newey and West (1987), and distance that of the lag ([Newey and West (1987)](#ref-NW1987a)).

## Conley's Standard Errors in a Panel

In a panel, Conley Spatial HAC also allows the errors of each area to be correlated with its own errors in earlier periods, up to the number set by Lags, with Bartlett weights in time ([Randsley (2026)](#ref-Ran2026a)). Pairs of different areas are counted within the same period. Areas without every period are dropped, so the panel is balanced, as `vcov_conley` requires. With Lags at zero, the periods are treated as independent of one another, and the estimator allows only for correlation between nearby areas in the same period. A persistent effect of each area, which correlates its errors over all periods, is better handled with Fixed Effects of the areas, or with the Cluster-Robust tab clustering by area.

## Why the Distances Should Be in a Projected Coordinate System

The cutoff is a distance in kilometres, and the tab measures the distances between the areas' centroids in the Distance Coordinate System, which should be a projected system in metres, such as a national grid or a zone of the Universal Transverse Mercator. Degrees of longitude shrink away from the equator, so distances computed from latitude and longitude as if they were plane coordinates are wrong in every direction but north–south. SpatialEconometrics.jl also offers great-circle distances, with `HaversineDistance`, which the Earthquakes off Fiji step uses to match R's fixest ([Randsley (2026)](#ref-Ran2026a); [Bergé (2018)](#ref-Ber2018a)). A projected system keeps the panel's distances exact over the extent of a country or a region.

## Positive Semi-Definite Covariances

A sum of weighted products of scores need not give a covariance matrix with non-negative variances. Newey and West (1987) chose weights that guarantee one in time series ([Newey and West (1987)](#ref-NW1987a)); in space, no kernel of distance guarantees it for every arrangement of the areas. SpatialEconometrics.jl projects an indefinite result onto the nearest positive semi-definite matrix by default ([Randsley (2026)](#ref-Ran2026a)). The Bartlett and Parzen kernels, whose weights fall to zero at the cutoff, make the projection less often needed than the Uniform kernel.

## Limits of Conley's Standard Errors

Conley's estimator assumes that correlation fades with distance and vanishes beyond the cutoff. Gupta (2026) notes that consistent covariance estimators of this kind can distort the size of tests in finite samples, as in time series, which led to heteroskedasticity and autocorrelation robust approaches and to the methods of Müller and Watson for strong spatial correlation ([Gupta (2026)](#ref-Gup2026a)). With few areas, or a cutoff that pairs most areas with most others, the estimate is noisy. Standard Errors Against the Cutoff, in the Next Steps, shows how much the standard errors move with the cutoff.

## References

<a id="ref-Ber2018a"></a>Bergé, L. R. (2018). Efficient estimation of maximum likelihood models with multiple fixed-effects: the R package FENmlm. CREA Discussion Papers 13, University of Luxembourg. [uni.lu](https://wwwen-archive.uni.lu/content/download/110162/1299525/file/2018_13%20Efficient%20estimation%20of%20maximum%20likelihood%20models%20with%20multiple%20fixed-effects%20-%20the%20R%20package%20FENmlm.pdf)

<a id="ref-Con1999a"></a>Conley, T. G. (1999). GMM estimation with cross sectional dependence. *Journal of Econometrics*, 92(1), 1–45. [doi:10.1016/S0304-4076(98)00084-0](https://doi.org/10.1016/S0304-4076(98)00084-0)

<a id="ref-Gup2026a"></a>Gupta, A. (2026). Recent developments in spatial econometrics. arXiv. [doi:10.48550/arXiv.2611.14673](https://doi.org/10.48550/arXiv.2611.14673)

<a id="ref-NW1987a"></a>Newey, W. K. and West, K. D. (1987). A simple, positive semi-definite, heteroskedasticity and autocorrelation consistent covariance matrix. *Econometrica*, 55(3), 703–708. [doi:10.2307/1913610](https://doi.org/10.2307/1913610)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Choosing a Cutoff](choosing-cutoff.md) · [Decision Guide](decision-guide.md) · [Cluster-Robust](cluster.md) · [Driscoll–Kraay](dk.md) · [Replications](replications.md)
