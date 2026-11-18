# GWR, Fixed Bandwidth

## What the GWR, Fixed Bandwidth Tab Fits

The GWR, Fixed Bandwidth tab fits geographically weighted regression with a bandwidth that is the same distance at every area: each local regression weights the other areas by the kernel of their distance from it, in metres of the Distance Coordinate System. It calls `fit_gwr` of SpatialEconometrics.jl with `FixedBandwidth(h)`, which adds an intercept and returns the local coefficients, their standard errors, the local R-squared, the residuals, the AICc and the trace of the hat matrix ([Randsley (2026)](#ref-Ran2026a)). This is the form of GWR introduced by Brunsdon, Fotheringham and Charlton (1996) ([Brunsdon, Fotheringham and Charlton (1996)](#ref-BFC1996a)).

## How the GWR, Fixed Bandwidth Tab Chooses the Distance

With Bandwidth set to AICc, the tab searches for the distance with the smallest corrected Akaike information criterion by golden section, between a distance at which every area has enough neighbours for its local regression and the largest distance between two areas. Distances at which a local regression cannot be estimated count as infinitely bad. With a number, the tab uses it as the bandwidth in metres. The AICc follows Hurvich, Simonoff and Tsai (1998) ([Hurvich, Simonoff and Tsai (1998)](#ref-HST1998a)).

## When a Fixed Bandwidth Suits the Data

A fixed bandwidth gives every local regression the same reach, which makes the scale of variation easy to state: relationships are averaged over a circle of the same radius everywhere. It suits areas of similar size, spread evenly over the map, such as the cells of a regular grid. Where areas are sparse, a fixed distance can leave too few observations in a local regression, and with the bisquare kernel some areas may have none beyond themselves; the adaptive bandwidth avoids this ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)).

## References

<a id="ref-BFC1996a"></a>Brunsdon, C., Fotheringham, A. S. and Charlton, M. E. (1996). Geographically weighted regression: a method for exploring spatial nonstationarity. *Geographical Analysis*, 28(4), 281–298. [doi:10.1111/j.1538-4632.1996.tb00936.x](https://doi.org/10.1111/j.1538-4632.1996.tb00936.x)

<a id="ref-HST1998a"></a>Hurvich, C. M., Simonoff, J. S. and Tsai, C.-L. (1998). Smoothing parameter selection in nonparametric regression using an improved Akaike information criterion. *Journal of the Royal Statistical Society Series B*, 60(2), 271–293. [doi:10.1111/1467-9868.00125](https://doi.org/10.1111/1467-9868.00125)

<a id="ref-OLKWF2019a"></a>Oshan, T. M., Li, Z., Kang, W., Wolf, L. J. and Fotheringham, A. S. (2019). mgwr: a Python implementation of multiscale geographically weighted regression for investigating process spatial heterogeneity and scale. *ISPRS International Journal of Geo-Information*, 8(6), 269. [doi:10.3390/ijgi8060269](https://doi.org/10.3390/ijgi8060269)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [GWR, Adaptive](gwradaptive.md) · [Kernels and Bandwidths](kernels-bandwidths.md) · [Bandwidth Selection](bandwidth-selection.md)
