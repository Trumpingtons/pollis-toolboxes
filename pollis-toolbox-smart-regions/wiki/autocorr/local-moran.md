# Local Moran (LISA)

## What the Local Moran (LISA) Tab Computes

The Local Moran (LISA) tab of the Spatial Autocorrelation panel computes local Moran's I for every area: with `zi` the deviation of area i from the mean and `m2 = Σi zi² / n`, `Ii = (zi / m2) × Σj wij zj` ([Anselin (1995)](#ref-Ans1995a)). A positive `Ii` means that area i and its neighbours lie on the same side of the mean; a negative one that they lie on opposite sides. The sum of the local statistics over all areas is proportional to the global Moran's I, so the local statistics split the global one among the areas ([Anselin (1995)](#ref-Ans1995a)). The computation is `localmoran(x, W; permutations, rng)` of SpatialDependence.jl, which gives each area a pseudo p-value by conditional randomisation, and `assignments` labels the significant areas ([Barbero (2026)](#ref-Bar2026a)).

## High-High, Low-Low, High-Low and Low-High Clusters

| Label | Area's value | Neighbours' values | Reading |
|---|---|---|---|
| High-High | Above the mean | Above the mean | A hot spot: part of a cluster of high values |
| Low-Low | Below the mean | Below the mean | A cold spot: part of a cluster of low values |
| High-Low | Above the mean | Below the mean | A spatial outlier: high among low |
| Low-High | Below the mean | Above the mean | A spatial outlier: low among high |
| Not Significant | Any | Any | Local Moran's I not significant at the level chosen |

The four labels are the four quadrants of the Moran scatterplot, kept only for the areas whose local Moran's I is significant ([Anselin (1995)](#ref-Ans1995a)). "Above the mean" for the neighbours means that their average, the spatial lag, is above the mean.

## The Significance Level and the Adjustment of the Local Moran (LISA) Tab

The Significance Level input sets the pseudo p-value below which an area gets one of the four labels, and the Adjustment input how that level allows for testing every area at once: None, Bonferroni, or False Discovery Rate (FDR) ([Benjamini and Hochberg (1995)](#ref-BH1995a)). With None, a map of many areas will show some significant areas even when the values are arranged at random; Anselin noted the problem and the conservativeness of the Bonferroni bound, made stronger by the dependence between the local statistics of neighbouring areas ([Anselin (1995)](#ref-Ans1995a)). The cluster map is therefore best read with its adjustment stated. Significance Adjustments prints the number of areas in each cluster under the three adjustments, and Map of the Local p-Values shows the pseudo p-values behind the labels.

## The LISA Cluster Map

The Local Moran (LISA) tab draws the LISA cluster map on an OpenStreetMap base map in Pollis's browser: High-High areas in red, Low-Low in blue, High-Low in orange, Low-High in light blue, and Not Significant areas in grey, each label a layer of its own with its entry in the legend. Clicking an area shows its attributes, its label, its local Moran's I and its pseudo p-value. The counts of areas with each label are printed in the REPL. Clusters in a Table gives, for each label, the number of areas and the mean, smallest and largest value of the column, and Save the Results as GeoParquet writes the labels, local statistics and pseudo p-values beside the areas.

## References

<a id="ref-Ans1995a"></a>Anselin, L. (1995). Local indicators of spatial association—LISA. *Geographical Analysis*, 27(2), 93–115. [doi:10.1111/j.1538-4632.1995.tb00338.x](https://doi.org/10.1111/j.1538-4632.1995.tb00338.x)

<a id="ref-Bar2026a"></a>Barbero, J. (2026). SpatialDependence.jl: spatial dependence, spatial weights matrices and exploratory spatial data analysis in Julia. [github.com/javierbarbero/SpatialDependence.jl](https://github.com/javierbarbero/SpatialDependence.jl)

<a id="ref-BH1995a"></a>Benjamini, Y. and Hochberg, Y. (1995). Controlling the false discovery rate: a practical and powerful approach to multiple testing. *Journal of the Royal Statistical Society Series B: Statistical Methodology*, 57(1), 289–300. [doi:10.1111/j.2517-6161.1995.tb02031.x](https://doi.org/10.1111/j.2517-6161.1995.tb02031.x)

## See Also
- [Factsheet](factsheet.md) · [Spatial Autocorrelation](spatial-autocorrelation.md) · [Permutation Inference](permutation-inference.md) · [Decision Guide](decision-guide.md) · [Global Moran's I](global-moran.md)
