# Overview

## What Spatial Autocorrelation Is

Spatial autocorrelation is the dependence between the values of a variable at nearby places: when values at neighbouring locations are more alike than values at distant ones, the variable is positively autocorrelated in space. Tobler put the idea as a first law of geography: everything is related to everything else, but near things are more related than distant things ([Tobler (1970)](#ref-Tob1970a)). Moran proposed a statistic to test for such dependence in data observed over a plane, now called Moran's I ([Moran (1950)](#ref-Mor1950a)), and Geary a second one, the contiguity ratio, for values mapped over counties ([Geary (1954)](#ref-Gea1954a)). Negative spatial autocorrelation, neighbours that differ more than chance would give, is rarer, and looks like a chessboard of high and low values.

## Areal Data and the Other Kinds of Spatial Data

Cressie divides spatial data into three kinds: geostatistical data, measured at points of a continuous surface, such as air quality at monitoring stations; lattice data, values attached to a fixed set of areas, regular or irregular, such as rates by municipality or counts by grid cell; and point patterns, where the locations themselves are the data ([Cressie (1993)](#ref-Cre1993a)). Moran's I, Geary's c and the local statistics of the Spatial Autocorrelation panel are statistics of lattice data, also called areal data: each area has one value, and neighbourhood is defined between areas. Geostatistical data are modelled with variograms and kriging instead, in the Kriging panel of the Smart Regions Toolbox.

## Global and Local Statistics of Spatial Autocorrelation

A global statistic of spatial autocorrelation, such as Moran's I or Geary's c, summarises the whole map in one number, and tests whether similar values lie together more often than chance would give. A global statistic does not say where. Anselin defined Local Indicators of Spatial Association (LISA): a statistic for each area that measures the clustering of similar values around it, whose sum over all areas is proportional to a global statistic ([Anselin (1995)](#ref-Ans1995a)). Local statistics find hot spots and cold spots, and areas that differ from their neighbours. Anselin proposed them both to find local pockets of clustering, which a global statistic can miss, and to assess the influence of single areas on the global statistic. Getis and Ord proposed local statistics of another kind, built from sums of values within a distance ([Getis and Ord (1992)](#ref-GO1992a)).

## Why Spatial Autocorrelation Matters Before Modelling Areal Data

Most statistical methods assume that observations are independent. When areal data are positively autocorrelated, neighbouring observations carry partly the same information, so a test that ignores the dependence treats the sample as larger than it is, and standard errors come out too small ([Cressie (1993)](#ref-Cre1993a)). Testing the variable, or the residuals of a model fitted to it, with Moran's I shows whether the dependence is there. Where it is, spatial regression models, which include the values or errors of neighbours, are the usual next step.

## References

<a id="ref-Ans1995a"></a>Anselin, L. (1995). Local indicators of spatial association—LISA. *Geographical Analysis*, 27(2), 93–115. [doi:10.1111/j.1538-4632.1995.tb00338.x](https://doi.org/10.1111/j.1538-4632.1995.tb00338.x)

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-Gea1954a"></a>Geary, R. C. (1954). The contiguity ratio and statistical mapping. *The Incorporated Statistician*, 5(3), 115. [doi:10.2307/2986645](https://doi.org/10.2307/2986645)

<a id="ref-GO1992a"></a>Getis, A. and Ord, J. K. (1992). The analysis of spatial association by use of distance statistics. *Geographical Analysis*, 24(3), 189–206. [doi:10.1111/j.1538-4632.1992.tb00261.x](https://doi.org/10.1111/j.1538-4632.1992.tb00261.x)

<a id="ref-Mor1950a"></a>Moran, P. A. P. (1950). Notes on continuous stochastic phenomena. *Biometrika*, 37(1-2), 17–23. [doi:10.1093/biomet/37.1-2.17](https://doi.org/10.1093/biomet/37.1-2.17)

<a id="ref-Tob1970a"></a>Tobler, W. R. (1970). A computer movie simulating urban growth in the Detroit region. *Economic Geography*, 46, 234. [doi:10.2307/143141](https://doi.org/10.2307/143141)

## See Also
- [Factsheet](factsheet.md) · [Spatial Weights](spatial-weights.md) · [Spatial Autocorrelation](spatial-autocorrelation.md) · [Decision Guide](decision-guide.md) · [Local Moran (LISA)](local-moran.md)
