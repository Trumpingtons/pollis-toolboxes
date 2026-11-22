# Universal Kriging

## What the Universal Kriging Tab Computes

The Universal Kriging tab of the Kriging panel estimates the Column input at the centre of every cell of the grid by universal kriging with all the stations: the mean is a polynomial of the coordinates x and y, of the degree of the Trend Degree input, whose coefficients are estimated together with the weights ([Cressie (1993)](#ref-Cre1993a)). The computation is `GeoStatsModels.fit(Kriging(vario, degree, 2), data)` of GeoStats.jl, where `2` is the number of coordinates; `Kriging(vario, 1, 2)` builds the drift terms `1`, `x` and `y`, a plane, and degree 2 adds `x²`, `xy` and `y²` ([Hoffimann (2026)](#ref-Hof2026a)). As on the Ordinary Kriging tab, each cell gets a normal distribution, whose mean is the estimate and whose standard deviation is the kriging standard deviation, and the map shows the estimates.

## When to Use Universal Kriging

Universal kriging suits a variable whose mean changes steadily across the area: pollution that rises towards a city centre or along a motorway, temperature that falls with latitude, a water table that slopes towards a river ([Chilès and Delfiner (2012)](#ref-CD2012a)). Signs of such a trend are an empirical variogram that keeps rising without a sill, a map of the stations with a clear gradient, and directional variograms that rise faster along one direction. Kriging and Inverse Distance compares the leave-one-out error of universal kriging of degree 1 with that of ordinary kriging.

## Ordinary and Universal Kriging Compared

Ordinary kriging with a moving neighbourhood, the nearest stations only, re-estimates the mean in each neighbourhood, and so follows a trend where the stations are dense ([Goovaerts (1997)](#ref-Goo1997a)). The Ordinary Kriging tab uses all the stations, and therefore one mean for the whole area; universal kriging lets that mean follow the trend, which matters most near the edges of the area, where few stations surround the cells. The variogram matters for both: the variogram of values with a trend is not that of the residuals universal kriging needs, so the variogram is best fitted on short distances, where the trend weighs little ([Cressie (1993)](#ref-Cre1993a)). Shortening the Maximum Lag of the Variogram tab does this, and Leave-One-Out Cross-Validation shows the effect.

## References

<a id="ref-CD2012a"></a>Chilès, J.-P. and Delfiner, P. (2012). *Geostatistics: modeling spatial uncertainty* (2nd ed.). John Wiley & Sons. [doi:10.1002/9781118136188](https://doi.org/10.1002/9781118136188)

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-Goo1997a"></a>Goovaerts, P. (1997). *Geostatistics for natural resources evaluation*. Oxford University Press. [doi:10.1093/oso/9780195115383.001.0001](https://doi.org/10.1093/oso/9780195115383.001.0001)

<a id="ref-Hof2026a"></a>Hoffimann, J. (2026). GeoStats.jl: an extensible framework for geospatial data science and geostatistical modeling. [github.com/JuliaEarth/GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl)

## See Also
- [Factsheet](factsheet.md) · [Kriging Systems](kriging-systems.md) · [Variograms](variograms.md) · [Ordinary Kriging](ordinary-kriging.md)
