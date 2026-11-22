# Ordinary Kriging

## What the Ordinary Kriging Tab Computes

The Ordinary Kriging tab of the Kriging panel estimates the Column input at the centre of every cell of the grid by ordinary kriging with all the stations and the variogram model fitted on the Variogram tab ([Matheron (1963)](#ref-Mat1963a)). The computation is `GeoStatsModels.fit(Kriging(vario), data)` of GeoStats.jl, which sets up the kriging system once, then `GeoStatsModels.predictprob(fitted, :z, centroid(grid, k))` for each cell `k`, a normal distribution whose mean is the estimate and whose standard deviation is the kriging standard deviation ([Hoffimann (2026)](#ref-Hof2026a)). The tab prints the smallest and largest estimates and draws the cells, coloured by their estimates, on a base map with the stations. Clicking a cell shows its estimate and standard deviation.

## The Assumptions of Ordinary Kriging

Ordinary kriging assumes that the mean of the variable is constant over the area, though unknown, and that the variogram depends only on the distance between two points, not on where they are: intrinsic stationarity ([Cressie (1993)](#ref-Cre1993a)). Using all the stations, as the Ordinary Kriging tab does, extends the assumption to the whole area. With many stations, kriging with only the nearest ones, a moving neighbourhood, relaxes it to a mean that is constant locally and lets it change slowly across the area ([Goovaerts (1997)](#ref-Goo1997a)). The estimates also inherit the variogram's assumptions: an isotropic model ignores a correlation that reaches farther in one direction, which Directional Variograms checks.

## How to Read the Map of the Ordinary Kriging Tab

The map of estimates shows the variable smoothed: each estimate is a weighted average, so the map varies less than the values measured, and its highs and lows are less extreme than those at the stations ([Isaaks and Srivastava (1989)](#ref-IS1989a)). Far from all stations, the estimates tend towards the mean that kriging infers, and the kriging standard deviation grows towards about the square root of the sill, so the map says little there. Map of the Kriging Standard Deviation shows where that happens. Estimate at a Location gives one estimate with its 95% interval, the estimate plus or minus 1.96 kriging standard deviations, which holds only if the errors are normal ([Cressie (1993)](#ref-Cre1993a)).

## References

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-Goo1997a"></a>Goovaerts, P. (1997). *Geostatistics for natural resources evaluation*. Oxford University Press. [doi:10.1093/oso/9780195115383.001.0001](https://doi.org/10.1093/oso/9780195115383.001.0001)

<a id="ref-Hof2026a"></a>Hoffimann, J. (2026). GeoStats.jl: an extensible framework for geospatial data science and geostatistical modeling. [github.com/JuliaEarth/GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl)

<a id="ref-IS1989a"></a>Isaaks, E. H. and Srivastava, R. M. (1989). *An introduction to applied geostatistics*. Oxford University Press.

<a id="ref-Mat1963a"></a>Matheron, G. (1963). Principles of geostatistics. *Economic Geology*, 58(8), 1246–1266. [doi:10.2113/gsecongeo.58.8.1246](https://doi.org/10.2113/gsecongeo.58.8.1246)

## See Also
- [Factsheet](factsheet.md) · [Kriging Systems](kriging-systems.md) · [Variogram](variogram.md) · [Universal Kriging](universal-kriging.md) · [Gaussian Simulation](gaussian-simulation.md)
