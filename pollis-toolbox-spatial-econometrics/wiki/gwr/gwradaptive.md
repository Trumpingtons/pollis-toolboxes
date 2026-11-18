# GWR, Adaptive

## What the GWR, Adaptive Tab Fits

The GWR, Adaptive tab fits geographically weighted regression with a bandwidth that is a number of nearest areas: the local regression at each area reaches as far as its nearest neighbours, so it is wide where areas are sparse and narrow where they are dense. It calls `fit_gwr` of SpatialEconometrics.jl, with `AdaptiveBandwidth(k)` for a given number of areas, or with no bandwidth, in which case the package selects the number by the corrected Akaike information criterion ([Randsley (2026)](#ref-Ran2026a)). The adaptive bisquare kernel chosen by AICc is the default of mgwr ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)).

## Reading the Adaptive Bandwidth

The adaptive bandwidth is printed as a number of nearest areas. A number close to the total number of areas gives local regressions that span most of the map, and local coefficients that vary little from the global ones; a small number gives very local estimates, each resting on few areas. Because the reach of each local regression differs between areas, the adaptive bandwidth is not a distance, and the scale it represents is larger where areas are larger.

## When an Adaptive Bandwidth Suits the Data

Administrative areas such as counties, municipalities or census tracts are usually small and many in cities and large and few elsewhere. A fixed bandwidth chosen for the dense parts leaves the sparse parts with local regressions on too few areas, and one chosen for the sparse parts smooths away variation in the dense parts. An adaptive bandwidth gives every local regression the same number of observations, and handles irregularly shaped study areas and uneven densities better ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a); [Gollini, Lu, Charlton, Brunsdon and Harris (2015)](#ref-GLCBH2015a)).

## References

<a id="ref-GLCBH2015a"></a>Gollini, I., Lu, B., Charlton, M., Brunsdon, C. and Harris, P. (2015). GWmodel: an R package for exploring spatial heterogeneity using geographically weighted models. *Journal of Statistical Software*, 63(17). [doi:10.18637/jss.v063.i17](https://doi.org/10.18637/jss.v063.i17)

<a id="ref-OLKWF2019a"></a>Oshan, T. M., Li, Z., Kang, W., Wolf, L. J. and Fotheringham, A. S. (2019). mgwr: a Python implementation of multiscale geographically weighted regression for investigating process spatial heterogeneity and scale. *ISPRS International Journal of Geo-Information*, 8(6), 269. [doi:10.3390/ijgi8060269](https://doi.org/10.3390/ijgi8060269)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [GWR, Fixed Bandwidth](gwrfixed.md) · [Multiscale GWR](mgwr.md) · [Kernels and Bandwidths](kernels-bandwidths.md)
