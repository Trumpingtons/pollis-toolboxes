# Inverse Distance Weighting

## What the Inverse Distance Tab Computes

The Inverse Distance tab of the Kriging panel estimates the Column input at the centre of every cell of the grid as a weighted average of all the stations, each weighted by one over its distance to the cell raised to the Power input ([Shepard (1968)](#ref-She1968a)). Shepard proposed the method for data at irregularly spaced points, such as weather stations, and used the power 2. The computation is `GeoStatsModels.fit(IDW(power), data)` of GeoStats.jl, then `GeoStatsModels.predict(fitted, :z, centroid(grid, k))` for each cell `k`; GeoStats.jl's own default power is 1, so the Power input sets it explicitly ([Hoffimann (2026)](#ref-Hof2026a)). The tab prints the smallest and largest estimates and draws the cells on a base map with the stations. Inverse distance weighting needs no variogram: the Variogram Model inputs serve only the Next Steps that compare it with kriging.

## The Power of Inverse Distance Weighting

The Power input sets how fast the weights fall with distance. With a power of 1, distant stations still count, and the map is smooth; with 2, the nearest stations count much more; with 3 or more, the estimate approaches the value of the nearest station, and the map tends towards patches around each station ([Isaaks and Srivastava (1989)](#ref-IS1989a)). The estimate at a station is the value measured there, whatever the power, so the method is an exact interpolator. The power is often chosen by cross-validation: Kriging and Inverse Distance gives the leave-one-out error with powers 1, 2 and 3, beside those of ordinary and universal kriging.

## Inverse Distance Weighting and Kriging Compared

Inverse distance weighting and kriging both estimate a value as a weighted average of the stations, but choose the weights differently. Inverse distance weights depend only on the distance from each station to the cell; kriging weights also depend on the variogram and on the distances between the stations, so a cluster of stations shares its weight and a station screened by a nearer one weighs less ([Isaaks and Srivastava (1989)](#ref-IS1989a)). Inverse distance weighting gives no measure of the uncertainty of an estimate, while kriging gives a kriging standard deviation. The Inverse Distance tab is therefore best read as a baseline: Leave-One-Out Cross-Validation and Kriging and Inverse Distance show whether kriging, with the effort of a variogram, does better on the stations.

## References

<a id="ref-Hof2026a"></a>Hoffimann, J. (2026). GeoStats.jl: an extensible framework for geospatial data science and geostatistical modeling. [github.com/JuliaEarth/GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl)

<a id="ref-IS1989a"></a>Isaaks, E. H. and Srivastava, R. M. (1989). *An introduction to applied geostatistics*. Oxford University Press.

<a id="ref-She1968a"></a>Shepard, D. (1968). A two-dimensional interpolation function for irregularly-spaced data. In *Proceedings of the 1968 23rd ACM National Conference* (pp. 517–524). [doi:10.1145/800186.810616](https://doi.org/10.1145/800186.810616)

## See Also
- [Factsheet](factsheet.md) · [Cross-Validation](cross-validation.md) · [Decision Guide](decision-guide.md) · [Ordinary Kriging](ordinary-kriging.md)
