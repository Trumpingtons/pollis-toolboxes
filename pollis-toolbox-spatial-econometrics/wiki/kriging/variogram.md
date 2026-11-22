# Variogram

## What the Variogram Tab Computes

The Variogram tab of the Kriging panel computes the empirical variogram of the Column input at the stations, with the Lags, Maximum Lag (m) and Estimator inputs, fits the Variogram Model to it, prints the fitted model with its range, sill and nugget, and draws both in the plot pane ([Matheron (1963)](#ref-Mat1963a)). The computation is `variogram(data, :z; nlags, maxlag, estimator)` of GeoStats.jl, then `GeoStatsFunctions.fit(SphericalVariogram, g)`, or the model chosen, by weighted least squares ([Hoffimann (2026)](#ref-Hof2026a)). The fitted model, named `vario` in the Example Code, is the one that the Ordinary Kriging, Universal Kriging and Gaussian Simulation tabs use, so the Variogram tab is where a model is checked before mapping. Distances are in metres, in the Metric Coordinate System.

## How to Read the Plot of the Variogram Tab

The points are the empirical variogram, one for each lag that has pairs of stations, at the mean distance of its pairs; the line is the fitted model ([Isaaks and Srivastava (1989)](#ref-IS1989a)). Where the line meets the vertical axis is the nugget, where it flattens is the sill, and the distance at which it flattens is the range. A good fit follows the points closely at short distances, which weigh most in kriging. Points that scatter widely at large distances, made from fewer pairs or from pairs at the edges of the area, matter less. A line that cannot follow points that keep rising signals a trend, which Universal Kriging handles ([Chilès and Delfiner (2012)](#ref-CD2012a)).

## Choosing the Lags and the Maximum Lag of the Variogram Tab

The Maximum Lag is the largest distance between two stations taken into the empirical variogram. Pairs of stations far apart are few, and lie at opposite edges of the area, so the points of the empirical variogram at large distances rest on few pairs and are the least reliable ([Isaaks and Srivastava (1989)](#ref-IS1989a)). The Lags input divides the distances up to the Maximum Lag into classes of equal width. More lags show more detail but put fewer pairs into each, and the points scatter more. The number of pairs in each lag is `g.counts` in the Example Code, and lags without pairs are left off the plot. Variogram Plot draws the result, and Leave-One-Out Cross-Validation tests the model that comes out.

## References

<a id="ref-CD2012a"></a>Chilès, J.-P. and Delfiner, P. (2012). *Geostatistics: modeling spatial uncertainty* (2nd ed.). John Wiley & Sons. [doi:10.1002/9781118136188](https://doi.org/10.1002/9781118136188)

<a id="ref-Hof2026a"></a>Hoffimann, J. (2026). GeoStats.jl: an extensible framework for geospatial data science and geostatistical modeling. [github.com/JuliaEarth/GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl)

<a id="ref-IS1989a"></a>Isaaks, E. H. and Srivastava, R. M. (1989). *An introduction to applied geostatistics*. Oxford University Press.

<a id="ref-Mat1963a"></a>Matheron, G. (1963). Principles of geostatistics. *Economic Geology*, 58(8), 1246–1266. [doi:10.2113/gsecongeo.58.8.1246](https://doi.org/10.2113/gsecongeo.58.8.1246)

## See Also
- [Factsheet](factsheet.md) · [Variograms](variograms.md) · [Cross-Validation](cross-validation.md) · [Ordinary Kriging](ordinary-kriging.md)
