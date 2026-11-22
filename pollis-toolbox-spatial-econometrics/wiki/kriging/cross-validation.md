# Cross-Validation

## What Leave-One-Out Cross-Validation Does

Leave-one-out cross-validation removes each station in turn, estimates its value from the remaining stations with the method and variogram model being tested, and compares the estimate with the value measured there ([Isaaks and Srivastava (1989)](#ref-IS1989a)). Each station thus gives one error, the estimate minus the value, from a map it did not help to make. The errors summarise how well the method would have estimated values at places like the stations. Isaaks and Srivastava present cross-validation as a way to compare choices, such as two variogram models, and caution against reading its errors as a proof that a model is right ([Isaaks and Srivastava (1989)](#ref-IS1989a)). Leave-One-Out Cross-Validation in the Kriging panel refits the model without each station with `GeoStatsModels.fit` and estimates the station with the others.

## Reading the Errors of Leave-One-Out Cross-Validation

| Statistic | What it shows | Good value |
|---|---|---|
| Mean error | A tendency to overestimate or underestimate | Near 0 |
| Root mean squared error | The typical size of the errors, in the units of the column | As small as possible |
| Mean of the standardised errors | Bias, in units of the kriging standard deviation | Near 0 |
| Mean square of the standardised errors | Whether the kriging standard deviation has the right size | Near 1 |
| Largest errors | Stations that the others do not predict | Worth a look on the map |

A standardised error is an error divided by the kriging standard deviation of the estimate ([Cressie (1993)](#ref-Cre1993a)). A mean square well above 1 means that the kriging standard deviations are too small, and the variogram model understates the uncertainty; well below 1, that they are too large. Inverse distance weighting has no standard deviation, so only the first, second and last rows apply to it.

## Comparing Variogram Models and Methods by Cross-Validation

Cross-validation gives each choice a single number, the root mean squared error, on the same stations, so choices can be ranked: variogram models, the number of lags, ordinary against universal kriging, kriging against inverse distance weighting ([Goovaerts (1997)](#ref-Goo1997a)). Variogram Models Compared fits the spherical, exponential, Gaussian and Matérn models to the same empirical variogram and gives the error of ordinary kriging with each; Kriging and Inverse Distance does the same for five methods. Both use `cverror(model, data, LeaveOneOut())` of GeoStats.jl, which gives the mean squared error, whose square root is printed ([Hoffimann (2026)](#ref-Hof2026a)). Small differences between the errors of two choices are not meaningful with few stations; a choice that wins clearly, and whose variogram also follows the empirical points, is the safer one.

## References

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-Goo1997a"></a>Goovaerts, P. (1997). *Geostatistics for natural resources evaluation*. Oxford University Press. [doi:10.1093/oso/9780195115383.001.0001](https://doi.org/10.1093/oso/9780195115383.001.0001)

<a id="ref-Hof2026a"></a>Hoffimann, J. (2026). GeoStats.jl: an extensible framework for geospatial data science and geostatistical modeling. [github.com/JuliaEarth/GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl)

<a id="ref-IS1989a"></a>Isaaks, E. H. and Srivastava, R. M. (1989). *An introduction to applied geostatistics*. Oxford University Press.

## See Also
- [Factsheet](factsheet.md) · [Variograms](variograms.md) · [Kriging Systems](kriging-systems.md) · [Decision Guide](decision-guide.md) · [Inverse Distance Weighting](inverse-distance.md)
