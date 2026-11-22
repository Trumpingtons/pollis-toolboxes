# Decision Guide

## Which Tab of the Spatial Autocorrelation Panel to Use

| Question | Tab or Next Step | Why |
|---|---|---|
| Is the variable spatially clustered at all? | Global Moran's I | One statistic and one pseudo p-value for the whole map |
| Where are the clusters and outliers? | Local Moran (LISA) | A statistic, a pseudo p-value and a cluster label for every area |
| Are there hot spots of high values? | Local Moran and Getis-Ord Gi* | Gi* measures each area's neighbourhood as a whole |
| Do neighbours differ more than chance gives? | Global Moran's I, or Moran's I and Geary's c | Moran's I below its expectation, Geary's c above 1 |

A global test comes first: a significant Moran's I says that the map is not a random arrangement of its values ([Moran (1950)](#ref-Mor1950a)). Local statistics then say where the dependence lies, and are worth reading even when the global statistic is not significant, since local pockets of clustering can hide in a global average ([Anselin (1995)](#ref-Ans1995a)).

## Which Neighbours to Choose for Spatial Weights

| Areas | Neighbours | Why |
|---|---|---|
| A regular grid of cells | Queen Contiguity or Rook Contiguity | Eight or four neighbours per cell away from the edges |
| Polygons that tile a region, of similar sizes | Queen Contiguity | Every area that touches counts |
| Polygons of very different sizes | k Nearest | The same number of neighbours for every area |
| Areas with islands or gaps between boundaries | k Nearest | No area is left without neighbours |

Contiguity follows the shared boundaries of the areas; k nearest neighbours follows the distances between their centroids ([Cressie (1993)](#ref-Cre1993a)). A conclusion that holds under several kinds of neighbours is more convincing than one that holds under one only, and Weights: Contiguity and k Nearest prints Moran's I under each.

## How Many Permutations, and Which Adjustment

| Aim | Permutations | Adjustment |
|---|---|---|
| A quick first look | 999 | None |
| A pseudo p-value to report | 9999 | None for the global test |
| A cluster map that allows for testing every area | 9999 or more | Bonferroni or False Discovery Rate (FDR) |

With R permutations, no pseudo p-value falls below `1 / (R + 1)`, so an adjusted threshold needs enough permutations to be reachable ([Barbero (2026)](#ref-Bar2026a)). Bonferroni controls the chance of any false alarm among all the areas and is conservative ([Anselin (1995)](#ref-Ans1995a)); the False Discovery Rate controls the expected share of false alarms among the areas found significant, and keeps more of them ([Benjamini and Hochberg (1995)](#ref-BH1995a)). Significance Adjustments prints the cluster counts under the three choices.

## When the Spatial Autocorrelation Panel Is Not the Tool

Moran's I and the local statistics of the Spatial Autocorrelation panel take one value per area. Measurements at scattered points of a continuous surface, such as air quality at monitoring stations or soil samples, are geostatistical data, which the variogram describes and kriging interpolates: the Kriging panel of the Spatial Econometrics Toolbox handles them ([Cressie (1993)](#ref-Cre1993a)). A variable whose spatial autocorrelation comes from a covariate, such as altitude or population density, is better studied through the residuals of a model that includes the covariate, since the spatial autocorrelation of the variable itself then mixes the two.

## References

<a id="ref-Ans1995a"></a>Anselin, L. (1995). Local indicators of spatial association—LISA. *Geographical Analysis*, 27(2), 93–115. [doi:10.1111/j.1538-4632.1995.tb00338.x](https://doi.org/10.1111/j.1538-4632.1995.tb00338.x)

<a id="ref-Bar2026a"></a>Barbero, J. (2026). SpatialDependence.jl: spatial dependence, spatial weights matrices and exploratory spatial data analysis in Julia. [github.com/javierbarbero/SpatialDependence.jl](https://github.com/javierbarbero/SpatialDependence.jl)

<a id="ref-BH1995a"></a>Benjamini, Y. and Hochberg, Y. (1995). Controlling the false discovery rate: a practical and powerful approach to multiple testing. *Journal of the Royal Statistical Society Series B: Statistical Methodology*, 57(1), 289–300. [doi:10.1111/j.2517-6161.1995.tb02031.x](https://doi.org/10.1111/j.2517-6161.1995.tb02031.x)

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-Mor1950a"></a>Moran, P. A. P. (1950). Notes on continuous stochastic phenomena. *Biometrika*, 37(1-2), 17–23. [doi:10.1093/biomet/37.1-2.17](https://doi.org/10.1093/biomet/37.1-2.17)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Spatial Weights](spatial-weights.md) · [Permutation Inference](permutation-inference.md)
