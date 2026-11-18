# Kernels and Bandwidths

## Kernel Functions in Geographically Weighted Regression

A kernel turns the distance `d` between two locations into the weight one receives in the other's local regression, given the bandwidth `h`. SpatialEconometrics.jl offers three kernels ([Randsley (2026)](#ref-Ran2026a)):

| Kernel | Weight | Reaches zero |
|---|---|---|
| Gaussian | `exp(-0.5 (d/h)^2)` | Never |
| Bisquare | `(1 - (d/h)^2)^2` within `h`, zero beyond | At `h` |
| Exponential | `exp(-d/h)` | Never |

The same kernels are offered by mgwr in Python and GWmodel in R ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a); [Gollini, Lu, Charlton, Brunsdon and Harris (2015)](#ref-GLCBH2015a)).

## Choosing Between the Bisquare and Gaussian Kernels

The bisquare kernel gives a weight of exactly zero beyond the bandwidth, so each local regression uses only the observations within it, and distant observations play no part. The Gaussian and exponential kernels give every observation some weight, however far. Oshan, Li, Kang, Wolf and Fotheringham (2019) note that with moderate to large bandwidths distant observations still influence the Gaussian kernel's local estimates, and make the adaptive bisquare kernel the default of mgwr ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)). The kernel usually matters less than the bandwidth.

## Fixed and Adaptive Bandwidths

A fixed bandwidth is a distance, the same at every location: in the panel, metres of the Distance Coordinate System. An adaptive bandwidth is a number of nearest neighbours: each local regression reaches as far as it needs to include that many observations. Where observations are sparse, a fixed bandwidth can leave a local regression with too few observations to estimate, and an adaptive bandwidth avoids this by widening there and narrowing where observations are dense ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)). The GWR, Fixed Bandwidth tab uses the first, GWR, Adaptive and Multiscale GWR the second.

## Why Distances Need a Projected Coordinate System

The kernels of SpatialEconometrics.jl take Euclidean distances between coordinates ([Randsley (2026)](#ref-Ran2026a)). Longitude and latitude are angles, and a degree of longitude covers fewer kilometres towards the poles, so Euclidean distances between them are distorted. The panel moves the centroids of the areas into the Distance Coordinate System, a projected coordinate system in metres, before the fit: choose one suited to the region of the data, such as its national grid or a UTM zone.

## References

<a id="ref-GLCBH2015a"></a>Gollini, I., Lu, B., Charlton, M., Brunsdon, C. and Harris, P. (2015). GWmodel: an R package for exploring spatial heterogeneity using geographically weighted models. *Journal of Statistical Software*, 63(17). [doi:10.18637/jss.v063.i17](https://doi.org/10.18637/jss.v063.i17)

<a id="ref-OLKWF2019a"></a>Oshan, T. M., Li, Z., Kang, W., Wolf, L. J. and Fotheringham, A. S. (2019). mgwr: a Python implementation of multiscale geographically weighted regression for investigating process spatial heterogeneity and scale. *ISPRS International Journal of Geo-Information*, 8(6), 269. [doi:10.3390/ijgi8060269](https://doi.org/10.3390/ijgi8060269)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Bandwidth Selection](bandwidth-selection.md) · [GWR, Fixed Bandwidth](gwrfixed.md) · [GWR, Adaptive](gwradaptive.md)
