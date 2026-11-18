# Replications

## The Replications of the Spatial Lag and Error Models Panel

The Replicate group of the Next Steps of the Spatial Lag and Error Models panel checks SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)) against published results and against R. Each step downloads open data, fits the models in Julia, and prints each estimate beside the value it is checked against, with the difference. The values from R were recorded once from R's own output, and the values of the article are those it prints, so neither is computed by the panel's code. Differences in the last printed digit come from rounding.

| Step | Checked against | Data |
|---|---|---|
| Bivand and Piras (2015) | Tables 2, 14, 17 and 18 of the article | The article's replication archive |
| Columbus Crime: R spatialreg | R spatialreg and spdep | spData's `columbus.gpkg` |
| Boston House Prices: R spatialreg | R spatialreg and spdep | spData's `boston_tracts.gpkg` |

## The Article Replication of Bivand and Piras (2015)

Bivand and Piras (2015) compared implementations of spatial econometric estimators in R, Stata, MATLAB and Python on a simulated data set of driving-under-the-influence arrests in 3109 US counties, with queen contiguity weights ([Bivand and Piras (2015)](#ref-BP2015a)). The step Bivand and Piras (2015) of the Spatial Lag and Error Models panel downloads the article's replication archive from the Journal of Statistical Software, reads the counties' shapefile inside it through GDAL and the weights from its GAL file, and compares least squares with Table 2, the spatial lag model with Table 14, the spatial error model with Table 17 and the direct and total impacts with Table 18, each with the column of R's estimates. The article is open access under a Creative Commons Attribution licence.

## The R Packages Checked Against: spatialreg and spdep

R's spatialreg package fits the spatial lag, spatial error, SLX and spatial Durbin models by maximum likelihood (`lagsarlm`, `errorsarlm`, `lmSLX`, and `lagsarlm` with `Durbin = TRUE`) and computes their impacts; spdep builds the neighbours (`poly2nb`) and tests least-squares residuals (`lm.morantest`, `lm.RStests`). Both are maintained by Roger Bivand and published on CRAN under the GPL. The values of the Columbus and Boston steps were recorded with spatialreg 1.4-3 and spdep 1.4-2, with queen contiguity from `poly2nb` and row-standardised weights; the panel's SQL join on `ST_Intersects` finds the same neighbours.

## The Open Datasets: Columbus and Boston from spData

The R package spData, by Roger Bivand, Jakub Nowosad and Robin Lovelace, holds the spatial data sets of many textbooks under the CC0 licence, and the panel downloads its files from its GitHub repository. The Columbus data hold crime, household income and house value in 49 neighbourhoods of Columbus, Ohio, from Anselin (1988), the classic example of spatial regression ([Anselin (1988)](#ref-Ans1988a)). The Boston data hold the median house values of 506 census tracts of Harrison and Rubinfeld (1978), with the corrections of Gilley and Pace (1996), and the tracts' boundaries ([Harrison and Rubinfeld (1978)](#ref-HR1978a); [Gilley and Pace (1996)](#ref-GP1996a)); Pace and Gilley (1997) first fitted a spatial model to them ([Pace and Gilley (1997)](#ref-PG1997a)).

## References

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-BP2015a"></a>Bivand, R. and Piras, G. (2015). Comparing implementations of estimation methods for spatial econometrics. *Journal of Statistical Software*, 63(18). [doi:10.18637/jss.v063.i18](https://doi.org/10.18637/jss.v063.i18)

<a id="ref-GP1996a"></a>Gilley, O. W. and Pace, R. K. (1996). On the Harrison and Rubinfeld data. *Journal of Environmental Economics and Management*, 31(3), 403–405. [doi:10.1006/jeem.1996.0052](https://doi.org/10.1006/jeem.1996.0052)

<a id="ref-HR1978a"></a>Harrison, D. and Rubinfeld, D. L. (1978). Hedonic housing prices and the demand for clean air. *Journal of Environmental Economics and Management*, 5(1), 81–102. [doi:10.1016/0095-0696(78)90006-2](https://doi.org/10.1016/0095-0696(78)90006-2)

<a id="ref-PG1997a"></a>Pace, R. K. and Gilley, O. W. (1997). Using the spatial configuration of the data to improve estimation. *Journal of Real Estate Finance and Economics*, 14(3), 333–340. [doi:10.1023/A:1007762613901](https://doi.org/10.1023/A:1007762613901)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Factsheet](factsheet.md) · [Maximum Likelihood Estimation](maximum-likelihood.md) · [Direct and Indirect Effects](effects.md)
