# Kriging Systems

## Simple, Ordinary and Universal Kriging

| Kriging | The mean of the variable | In GeoStats.jl |
|---|---|---|
| Simple | Known and constant | `Kriging(vario, mean)` |
| Ordinary | Unknown and constant | `Kriging(vario)` |
| Universal | A polynomial of the coordinates, its coefficients unknown | `Kriging(vario, degree, 2)` |

The three kinds of kriging differ in what they assume about the mean of the variable ([Cressie (1993)](#ref-Cre1993a)). Simple kriging needs the mean, which is seldom known. Ordinary kriging estimates it implicitly, by requiring the weights to sum to one, and is the most used. Universal kriging, also called kriging with a trend or with a drift, lets the mean change across the area ([Chilès and Delfiner (2012)](#ref-CD2012a)). The Kriging panel has an Ordinary Kriging tab and a Universal Kriging tab; `vario` there is the fitted variogram model ([Hoffimann (2026)](#ref-Hof2026a)).

## The Ordinary Kriging System and Its Weights

Ordinary kriging finds the weights of the stations by solving a linear system: one equation for each station, which balances the semivariances between the stations against the semivariances between each station and the location estimated, and one more equation that makes the weights sum to one, with a Lagrange multiplier ([Isaaks and Srivastava (1989)](#ref-IS1989a)). The system depends on the variogram and on where the stations are, not on the values measured there. The weights solve it whatever the values, so the same weights serve every variable with the same variogram and stations. In the Kriging panel, `GeoStatsModels.fit(Kriging(vario), data)` sets up and factorises the system once for all the stations, and each cell's estimate then needs only its own right-hand side ([Hoffimann (2026)](#ref-Hof2026a)).

## The Kriging Variance and the Kriging Standard Deviation

The kriging variance is the variance of the error of a kriging estimate, given the variogram model ([Cressie (1993)](#ref-Cre1993a)). It is zero at a station when the model has no nugget, grows with the distance to the nearest stations, and approaches the sill, or somewhat more, far from all of them. Its square root, the kriging standard deviation, is mapped by Map of the Kriging Standard Deviation. The kriging variance depends on the arrangement of the stations and on the variogram, not on the values measured: it is the same for a cell surrounded by stations whose values agree and for one surrounded by stations whose values differ ([Goovaerts (1997)](#ref-Goo1997a)). It therefore measures the uncertainty that the configuration of the stations leaves, and is useful for placing new stations, but is not a measure of local variability.

## Screening and Negative Kriging Weights

Kriging weights take the arrangement of the stations into account. A cluster of stations close together carries information that is largely repeated, so the cluster shares a weight not much larger than that of a single station: kriging declusters the data ([Isaaks and Srivastava (1989)](#ref-IS1989a)). A station that lies behind a nearer one, as seen from the location estimated, gets a small weight, and can get a negative one: the nearer station screens it. Negative weights are allowed, and can give estimates below the smallest or above the largest value measured, for instance a negative concentration ([Isaaks and Srivastava (1989)](#ref-IS1989a)). Kriging Weights of the Nearest Stations prints the largest weights at the centre of the map and counts the negative ones.

## Universal Kriging and the Variogram of the Residuals

With a trend, the variogram of the values mixes the trend with the spatial correlation: values far apart differ because the mean differs, and the variogram rises without a sill. Universal kriging should use the variogram of the residuals from the trend, but the residuals depend on the trend estimated, which depends on the variogram, and the variogram of estimated residuals is biased at large distances ([Cressie (1993)](#ref-Cre1993a); [Chilès and Delfiner (2012)](#ref-CD2012a)). In practice, the variogram is fitted at short distances, where the trend matters little, or along a direction in which the mean does not change. The Universal Kriging tab of the Kriging panel uses the variogram fitted on the Variogram tab, whose Maximum Lag can be shortened for that purpose.

## References

<a id="ref-CD2012a"></a>Chilès, J.-P. and Delfiner, P. (2012). *Geostatistics: modeling spatial uncertainty* (2nd ed.). John Wiley & Sons. [doi:10.1002/9781118136188](https://doi.org/10.1002/9781118136188)

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-Goo1997a"></a>Goovaerts, P. (1997). *Geostatistics for natural resources evaluation*. Oxford University Press. [doi:10.1093/oso/9780195115383.001.0001](https://doi.org/10.1093/oso/9780195115383.001.0001)

<a id="ref-Hof2026a"></a>Hoffimann, J. (2026). GeoStats.jl: an extensible framework for geospatial data science and geostatistical modeling. [github.com/JuliaEarth/GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl)

<a id="ref-IS1989a"></a>Isaaks, E. H. and Srivastava, R. M. (1989). *An introduction to applied geostatistics*. Oxford University Press.

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Variograms](variograms.md) · [Ordinary Kriging](ordinary-kriging.md) · [Universal Kriging](universal-kriging.md)
