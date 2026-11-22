# Variograms

## What the Empirical Variogram Measures

The variogram describes how the values of a variable at two points differ as the distance between the points grows. The semivariance at a distance `h` is half the expected squared difference between values `h` apart; the empirical variogram estimates it from the data, by sorting the pairs of stations into distance classes, the lags, and taking for each lag half the mean squared difference of the values of its pairs ([Matheron (1963)](#ref-Mat1963a)). Values near each other are usually alike, so the semivariance is small at short distances and grows with distance. The empirical variogram is plotted as one point per lag, at the mean distance of its pairs; lags with few pairs give unreliable points ([Isaaks and Srivastava (1989)](#ref-IS1989a)). In the Kriging panel, `variogram(data, :z; nlags, maxlag, estimator)` of GeoStats.jl computes it, with the Lags and Maximum Lag inputs ([Hoffimann (2026)](#ref-Hof2026a)).

## The Matheron and the Cressie and Hawkins Estimators

Matheron's estimator, half the mean squared difference of the pairs in each lag, is the classical one ([Matheron (1963)](#ref-Mat1963a)). Squared differences let a few outlying values dominate a lag, so Cressie and Hawkins proposed a robust estimator, built from the square roots of the absolute differences, raised to the fourth power and corrected for bias, which outlying values affect much less ([Cressie (1993)](#ref-Cre1993a)). The Estimator input of the Kriging panel chooses between the two, as `:matheron` or `:cressie`. Where both give similar empirical variograms, the data have no influential outliers; where they differ, the stations with extreme values deserve a look on Map of the Stations before a model is chosen.

## Nugget, Sill and Range of a Variogram

| Parameter | What it is | What it reflects |
|---|---|---|
| Nugget | The semivariance as the distance shrinks to zero | Measurement error, and variation at distances shorter than those between stations |
| Sill | The level at which the variogram flattens | The variance of values far apart |
| Range | The distance at which the variogram reaches the sill | The distance beyond which values are uncorrelated |

The nugget takes its name from gold nuggets, whose presence or absence makes samples close together differ ([Isaaks and Srivastava (1989)](#ref-IS1989a)). A variogram with no sill, rising up to the largest lag, points to a trend across the area rather than a stationary variable ([Chilès and Delfiner (2012)](#ref-CD2012a)).

## Variogram Models: Spherical, Exponential, Gaussian and Matérn

Kriging needs the semivariance at every distance, not only at the lags, and only some functions give kriging systems with a solution and non-negative kriging variances: the valid variogram models, conditionally negative definite ([Cressie (1993)](#ref-Cre1993a)). The spherical model rises almost linearly near the origin and reaches its sill at the range. The exponential model also rises linearly near the origin but approaches its sill only asymptotically. The Gaussian model is parabolic near the origin, for very smooth variables, and gives unstable kriging weights when used without a nugget. The Matérn family has a smoothness parameter that moves between the exponential and the Gaussian behaviour ([Chilès and Delfiner (2012)](#ref-CD2012a)). The behaviour near the origin matters most for kriging, as the nearest stations get the largest weights.

## How the Variogram Model Is Fitted

The Kriging panel fits the Variogram Model to the empirical variogram with `GeoStatsFunctions.fit` of GeoStats.jl, by weighted least squares over the lags: the nugget, sill and range that make the model's curve closest to the empirical points ([Hoffimann (2026)](#ref-Hof2026a)). The weights fall, by default, as one over the lag distance, so the short distances count most. Cressie proposed weights that grow with the number of pairs of the lag and fall with the squared semivariance of the model ([Cressie (1993)](#ref-Cre1993a)). A fitted model is a starting point: Variogram Plot shows how well its curve follows the points, Variogram Models Compared fits the four models, and Leave-One-Out Cross-Validation tests the model by the errors of kriging with it.

## Anisotropy and Directional Variograms

A variable whose correlation reaches farther in one direction than in another is anisotropic: pollution spread by a prevailing wind, a soil property along a valley, ore along a vein ([Isaaks and Srivastava (1989)](#ref-IS1989a)). The variogram computed over all directions, the omnidirectional variogram, averages the directions and hides it. A directional variogram uses only the pairs of stations whose separation lies along one direction, within a tolerance. When the directional variograms differ in range but share a sill, the anisotropy is geometric, and a model with a longer range in one direction describes it; when they differ in sill, the variation differs between the directions ([Chilès and Delfiner (2012)](#ref-CD2012a)). Directional Variograms in the Kriging panel compares west to east with south to north.

## References

<a id="ref-CD2012a"></a>Chilès, J.-P. and Delfiner, P. (2012). *Geostatistics: modeling spatial uncertainty* (2nd ed.). John Wiley & Sons. [doi:10.1002/9781118136188](https://doi.org/10.1002/9781118136188)

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-Hof2026a"></a>Hoffimann, J. (2026). GeoStats.jl: an extensible framework for geospatial data science and geostatistical modeling. [github.com/JuliaEarth/GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl)

<a id="ref-IS1989a"></a>Isaaks, E. H. and Srivastava, R. M. (1989). *An introduction to applied geostatistics*. Oxford University Press.

<a id="ref-Mat1963a"></a>Matheron, G. (1963). Principles of geostatistics. *Economic Geology*, 58(8), 1246–1266. [doi:10.2113/gsecongeo.58.8.1246](https://doi.org/10.2113/gsecongeo.58.8.1246)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Kriging Systems](kriging-systems.md) · [Cross-Validation](cross-validation.md) · [Variogram](variogram.md)
