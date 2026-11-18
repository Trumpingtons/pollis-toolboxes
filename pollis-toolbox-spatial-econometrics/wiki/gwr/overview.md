# Overview

## What Geographically Weighted Regression Does

Geographically weighted regression (GWR) fits a separate regression at every location, weighting the other observations by their distance from it, so that each coefficient takes a value at every location instead of one value for the whole map. Brunsdon, Fotheringham and Charlton (1996) proposed it to explore spatial nonstationarity: relationships between variables that change from place to place ([Brunsdon, Fotheringham and Charlton (1996)](#ref-BFC1996a)). The result is a surface of estimates for each explanatory variable, which can be mapped, together with its standard errors and a local measure of fit.

## Kernels and Bandwidths in GWR

The weight that an observation receives in a local regression is given by a kernel, a function that falls with distance, and by a bandwidth, which sets how quickly it falls. A small bandwidth gives local regressions on few nearby observations, with estimates that vary a great deal over the map; a large bandwidth approaches the global regression. The bandwidth is either a distance, the same everywhere (fixed), or a number of nearest neighbours (adaptive), and is usually chosen by the corrected Akaike information criterion ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)).

## Multiscale Geographically Weighted Regression

Classic GWR uses one bandwidth for every coefficient, so every relationship is assumed to vary at the same spatial scale. Multiscale GWR (MGWR) gives each coefficient its own bandwidth, found by a back-fitting algorithm, so that some relationships can vary locally, others regionally, and others hardly at all ([Fotheringham, Yang and Kang (2017)](#ref-FYK2017a)). A coefficient whose bandwidth reaches the number of observations is close to a global one.

## The Three Tabs of the Geographically Weighted Regression Panel

GWR, Fixed Bandwidth fits GWR with a distance bandwidth; GWR, Adaptive fits it with a number of nearest areas; Multiscale GWR fits MGWR with one adaptive bandwidth per coefficient. All three use SpatialEconometrics.jl, on the centroids of the areas, projected into the Distance Coordinate System so that the distances are in metres ([Randsley (2026)](#ref-Ran2026a)). The areas and their centroids are read with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## References

<a id="ref-BFC1996a"></a>Brunsdon, C., Fotheringham, A. S. and Charlton, M. E. (1996). Geographically weighted regression: a method for exploring spatial nonstationarity. *Geographical Analysis*, 28(4), 281–298. [doi:10.1111/j.1538-4632.1996.tb00936.x](https://doi.org/10.1111/j.1538-4632.1996.tb00936.x)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-FYK2017a"></a>Fotheringham, A. S., Yang, W. and Kang, W. (2017). Multiscale geographically weighted regression (MGWR). *Annals of the American Association of Geographers*, 107(6), 1247–1265. [doi:10.1080/24694452.2017.1352480](https://doi.org/10.1080/24694452.2017.1352480)

<a id="ref-OLKWF2019a"></a>Oshan, T. M., Li, Z., Kang, W., Wolf, L. J. and Fotheringham, A. S. (2019). mgwr: a Python implementation of multiscale geographically weighted regression for investigating process spatial heterogeneity and scale. *ISPRS International Journal of Geo-Information*, 8(6), 269. [doi:10.3390/ijgi8060269](https://doi.org/10.3390/ijgi8060269)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Kernels and Bandwidths](kernels-bandwidths.md) · [Bandwidth Selection](bandwidth-selection.md) · [Multiscale GWR](mgwr.md) · [Decision Guide](decision-guide.md)
