# Overview

## Geostatistical Data: Values Measured at Points of a Surface

Geostatistical data are values of a variable that exists everywhere in a region, measured at a finite set of points: air pollution at monitoring stations, rainfall at gauges, the depth of groundwater at wells, the grade of ore in drill cores ([Cressie (1993)](#ref-Cre1993a)). Cressie sets them apart from lattice data, one value for each of a fixed set of areas, and from point patterns, where the locations themselves are the data. With geostatistical data the question is usually what the value is between the points: a map of the whole surface, an estimate at a place where nothing was measured, or the average over a block. The Kriging panel of the Smart Regions Toolbox answers such questions; values attached to areas, such as rates by municipality, are tested for spatial autocorrelation in the Spatial Autocorrelation panel instead.

## The Origins of Kriging in Mining

Krige studied the gold mines of the Witwatersrand, where the grade of ore in a block had to be estimated from samples taken around it, and showed by statistical analysis that estimates from the samples of a block alone were biased: high estimates tended to be too high and low ones too low ([Krige (1951)](#ref-Kri1951a)). Matheron built on that work a theory he called geostatistics: the grade is treated as a regionalised variable, its spatial structure is described by the variogram, and the best linear estimate of a value from the samples around it, with weights chosen from the variogram, is named kriging, after Krige ([Matheron (1963)](#ref-Mat1963a)). The same methods spread to petroleum, soil science, hydrology and environmental monitoring ([Goovaerts (1997)](#ref-Goo1997a); [Chilès and Delfiner (2012)](#ref-CD2012a)).

## Kriging as a Best Linear Unbiased Predictor

Kriging estimates the value at a location as a weighted sum of the values measured at the stations. The weights are chosen so that the estimate is unbiased, its error has mean zero, and the variance of its error, the kriging variance, is as small as the variogram allows ([Cressie (1993)](#ref-Cre1993a)). Kriging is therefore called the best linear unbiased predictor. Unlike weights that depend on distance alone, kriging weights account for the spatial correlation of the variable and for the arrangement of the stations: a station close to others shares its weight with them, and a station hidden behind a nearer one gets less ([Isaaks and Srivastava (1989)](#ref-IS1989a)). Simple, ordinary and universal kriging differ in what they assume about the mean of the variable.

## Interpolation and Simulation

A kriging map is smoother than the variable it estimates: each estimate is a weighted average, so the map varies less than the values measured, and least where the stations are fewest ([Goovaerts (1997)](#ref-Goo1997a)). That suits the question "what is the best estimate here?", but not questions about variability or about many places at once, such as the area where pollution exceeds a limit. Stochastic simulation answers those: it draws many maps, realisations, each with the variability of the data described by the variogram, and, in conditional simulation, each equal to the measured values at the stations ([Chilès and Delfiner (2012)](#ref-CD2012a)). Probabilities are then shares of the realisations. The Gaussian Simulation tab of the Kriging panel does this.

## References

<a id="ref-CD2012a"></a>Chilès, J.-P. and Delfiner, P. (2012). *Geostatistics: modeling spatial uncertainty* (2nd ed.). John Wiley & Sons. [doi:10.1002/9781118136188](https://doi.org/10.1002/9781118136188)

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-Goo1997a"></a>Goovaerts, P. (1997). *Geostatistics for natural resources evaluation*. Oxford University Press. [doi:10.1093/oso/9780195115383.001.0001](https://doi.org/10.1093/oso/9780195115383.001.0001)

<a id="ref-IS1989a"></a>Isaaks, E. H. and Srivastava, R. M. (1989). *An introduction to applied geostatistics*. Oxford University Press.

<a id="ref-Kri1951a"></a>Krige, D. G. (1951). A statistical approach to some basic mine valuation problems on the Witwatersrand. *Journal of the Chemical, Metallurgical and Mining Society of South Africa*, 52(6), 119–139.

<a id="ref-Mat1963a"></a>Matheron, G. (1963). Principles of geostatistics. *Economic Geology*, 58(8), 1246–1266. [doi:10.2113/gsecongeo.58.8.1246](https://doi.org/10.2113/gsecongeo.58.8.1246)

## See Also
- [Factsheet](factsheet.md) · [Variograms](variograms.md) · [Kriging Systems](kriging-systems.md) · [Gaussian Simulation](gaussian-simulation.md) · [Decision Guide](decision-guide.md)
