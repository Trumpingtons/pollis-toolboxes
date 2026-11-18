# Spatial Autocorrelation

## How Moran's I Is Computed

Moran's I compares each area's deviation from the mean with the deviations of its neighbours. With `zi = xi − x̄` the deviation of area i, `wij` the spatial weights and `S0` the sum of all weights, `I = (n / S0) × Σi Σj wij zi zj / Σi zi²` ([Moran (1950)](#ref-Mor1950a); [Cressie (1993)](#ref-Cre1993a)). The numerator sums the products of neighbouring deviations: positive when neighbours lie on the same side of the mean, negative when they lie on opposite sides. Under no spatial autocorrelation, the expected value of Moran's I is `−1 / (n − 1)`, close to zero for many areas ([Cressie (1993)](#ref-Cre1993a)). Values above the expectation mean positive spatial autocorrelation, similar values together; values below it mean negative spatial autocorrelation, dissimilar values together. Moran's I is read against its distribution under no spatial autocorrelation, which the Spatial Autocorrelation panel draws from random permutations.

## How Geary's c Is Computed

Geary's contiguity ratio, Geary's c, compares neighbouring values directly, through their squared differences: `c = ((n − 1) / (2 S0)) × Σi Σj wij (xi − xj)² / Σi zi²` ([Geary (1954)](#ref-Gea1954a)). Under no spatial autocorrelation Geary's c is expected to be 1. Values below 1 mean that neighbours are more alike than chance would give, positive spatial autocorrelation; values above 1 mean that they differ more, negative spatial autocorrelation. Moran's I responds to how neighbours deviate together from the overall mean, Geary's c to how much they differ from each other. Moran's I and Geary's c, in the Next Steps, prints the two side by side, each with its expectation under no spatial autocorrelation.

## The Moran Scatterplot

The Moran scatterplot puts each area's standardised value on the horizontal axis and its spatial lag, the average of its neighbours' standardised values, on the vertical axis. With row-standardised weights, the slope of the least-squares line through the points is Moran's I ([Anselin (1995)](#ref-Ans1995a)). The four quadrants classify the areas: high values among high neighbours at the top right, low among low at the bottom left, and high among low, or low among high, in the other two, the spatial outliers. Points far from the rest, or quadrants that hold few areas, show which areas weigh most on Moran's I. The Moran Scatterplot in the Next Steps draws it with ECharts.jl, with the line whose slope is Moran's I.

## The Getis-Ord Statistics Gi and Gi*

Getis and Ord proposed the statistics `Gi`, the sum of the values of area i's neighbours as a share of the sum of all values except area i's own, and `Gi*`, which counts area i among its own neighbours ([Getis and Ord (1992)](#ref-GO1992a)). The statistics need positive values, such as counts, rates or concentrations. A large `Gi*` marks a hot spot, an area in a neighbourhood of high values; a small one a cold spot. Ord and Getis studied the distribution of the local statistics and their use as standardised scores ([Ord and Getis (1995)](#ref-OG1995a)). Because `Gi*` measures a neighbourhood as a whole, it marks a low value among high ones as part of a hot spot, where local Moran's I marks it as a spatial outlier. Local Moran and Getis-Ord Gi*, in the Next Steps, cross the two classifications area by area.

## References

<a id="ref-Ans1995a"></a>Anselin, L. (1995). Local indicators of spatial association—LISA. *Geographical Analysis*, 27(2), 93–115. [doi:10.1111/j.1538-4632.1995.tb00338.x](https://doi.org/10.1111/j.1538-4632.1995.tb00338.x)

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-Gea1954a"></a>Geary, R. C. (1954). The contiguity ratio and statistical mapping. *The Incorporated Statistician*, 5(3), 115. [doi:10.2307/2986645](https://doi.org/10.2307/2986645)

<a id="ref-GO1992a"></a>Getis, A. and Ord, J. K. (1992). The analysis of spatial association by use of distance statistics. *Geographical Analysis*, 24(3), 189–206. [doi:10.1111/j.1538-4632.1992.tb00261.x](https://doi.org/10.1111/j.1538-4632.1992.tb00261.x)

<a id="ref-Mor1950a"></a>Moran, P. A. P. (1950). Notes on continuous stochastic phenomena. *Biometrika*, 37(1-2), 17–23. [doi:10.1093/biomet/37.1-2.17](https://doi.org/10.1093/biomet/37.1-2.17)

<a id="ref-OG1995a"></a>Ord, J. K. and Getis, A. (1995). Local spatial autocorrelation statistics: distributional issues and an application. *Geographical Analysis*, 27(4), 286–306. [doi:10.1111/j.1538-4632.1995.tb00912.x](https://doi.org/10.1111/j.1538-4632.1995.tb00912.x)

## See Also
- [Factsheet](factsheet.md) · [Spatial Weights](spatial-weights.md) · [Permutation Inference](permutation-inference.md) · [Global Moran's I](global-moran.md) · [Local Moran (LISA)](local-moran.md)
