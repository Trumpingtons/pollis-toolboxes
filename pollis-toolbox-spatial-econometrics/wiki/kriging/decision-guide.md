# Decision Guide

## Which Tab of the Kriging Panel to Use

| Question | Tab | Why |
|---|---|---|
| How far does the spatial correlation reach? | Variogram | Nugget, sill and range of the fitted model |
| What is the best estimate in every cell? | Ordinary Kriging | Estimates and their standard deviations, with an unknown constant mean |
| Does the value rise or fall steadily across the area? | Universal Kriging | A mean that is a polynomial of the coordinates |
| Is a quick map without a model enough? | Inverse Distance | Weights from distance alone, and a baseline for kriging |
| What is the probability of exceeding a limit? | Gaussian Simulation | Shares of conditional realisations |

The Variogram tab comes first: the other kriging tabs and the simulation use its model ([Matheron (1963)](#ref-Mat1963a)). Kriging gives the best estimate in each cell; simulation gives the variability that the estimates smooth out ([Goovaerts (1997)](#ref-Goo1997a)).

## Which Variogram Model to Choose

| Empirical variogram near distance 0 | Model | Why |
|---|---|---|
| Rises linearly, then flattens at a clear range | Spherical | Reaches its sill at the range |
| Rises linearly, flattens slowly | Exponential | Approaches its sill gradually |
| Rises slowly, curving upwards, then flattens | Gaussian | Parabolic near 0, for very smooth variables |
| In between | Matérn | Its smoothness moves between the exponential and the Gaussian |
| Keeps rising up to the Maximum Lag | None with a sill | A trend: use Universal Kriging |

The models differ most near the origin, which matters most for kriging ([Chilès and Delfiner (2012)](#ref-CD2012a)). When two models follow the empirical points equally well, Variogram Models Compared ranks them by cross-validation.

## Kriging or Inverse Distance Weighting

Inverse distance weighting needs no variogram, gives an estimate at once, and suits a first look or stations so few that a variogram cannot be estimated ([Shepard (1968)](#ref-She1968a)). Kriging needs a variogram, fitted from enough pairs at short distances, and gives in return weights that account for clusters of stations and a standard deviation for each estimate ([Isaaks and Srivastava (1989)](#ref-IS1989a)). Kriging and Inverse Distance compares the two by leave-one-out cross-validation on the stations. With a pure nugget effect, a variogram already at its sill at the shortest distance, ordinary kriging gives every station the same weight, and its map is the mean of the stations ([Isaaks and Srivastava (1989)](#ref-IS1989a)).

## When the Kriging Panel Is Not the Tool

Kriging estimates a variable measured at points of a continuous surface. A value attached to areas, such as a rate per municipality or a count per grid cell, is lattice data, whose spatial autocorrelation the Spatial Autocorrelation panel of the Spatial Econometrics Toolbox tests ([Cressie (1993)](#ref-Cre1993a)). Stations in longitude and latitude must first be moved into a coordinate system in metres, the Metric Coordinate System input, as distances in degrees are not the same east to west as north to south. A variable far from normal, such as a strongly skewed concentration, is usually transformed before Gaussian simulation, and the realisations transformed back ([Goovaerts (1997)](#ref-Goo1997a)).

## References

<a id="ref-CD2012a"></a>Chilès, J.-P. and Delfiner, P. (2012). *Geostatistics: modeling spatial uncertainty* (2nd ed.). John Wiley & Sons. [doi:10.1002/9781118136188](https://doi.org/10.1002/9781118136188)

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-Goo1997a"></a>Goovaerts, P. (1997). *Geostatistics for natural resources evaluation*. Oxford University Press. [doi:10.1093/oso/9780195115383.001.0001](https://doi.org/10.1093/oso/9780195115383.001.0001)

<a id="ref-IS1989a"></a>Isaaks, E. H. and Srivastava, R. M. (1989). *An introduction to applied geostatistics*. Oxford University Press.

<a id="ref-Mat1963a"></a>Matheron, G. (1963). Principles of geostatistics. *Economic Geology*, 58(8), 1246–1266. [doi:10.2113/gsecongeo.58.8.1246](https://doi.org/10.2113/gsecongeo.58.8.1246)

<a id="ref-She1968a"></a>Shepard, D. (1968). A two-dimensional interpolation function for irregularly-spaced data. In *Proceedings of the 1968 23rd ACM National Conference* (pp. 517–524). [doi:10.1145/800186.810616](https://doi.org/10.1145/800186.810616)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Variograms](variograms.md) · [Cross-Validation](cross-validation.md) · [Gaussian Simulation](gaussian-simulation.md)
