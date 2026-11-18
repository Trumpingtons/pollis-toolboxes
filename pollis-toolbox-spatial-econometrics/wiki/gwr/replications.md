# Replications

## Software the Geographically Weighted Regression Panel Is Checked Against

The panel's results are compared with three implementations of GWR. GWR4 is the stand-alone software of the GWR development team, whose outputs for a standard dataset are kept as test files in libpysal, the core library of PySAL ([Rey and Anselin (2007)](#ref-RA2007a)). mgwr is the Python implementation of GWR and multiscale GWR described by Oshan, Li, Kang, Wolf and Fotheringham (2019) ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)). GWmodel is the R package of Gollini, Lu, Charlton, Brunsdon and Harris (2015), with basic and robust GWR, bandwidth selection and Monte Carlo tests ([Gollini, Lu, Charlton, Brunsdon and Harris (2015)](#ref-GLCBH2015a)).

## The Georgia Counties Dataset

The Georgia dataset records socio-demographic characteristics of the 159 counties of the state of Georgia from the 1990 US census, with the coordinates of the county centroids in UTM metres. It is the example of Oshan, Li, Kang, Wolf and Fotheringham (2019), who model the percentage of the population with a bachelor's degree on the percentages born abroad, African American and rural ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)). It is distributed with libpysal under the BSD licence, as a table with the county centroids and as a shapefile of the counties.

## Replicating GWR4 on the Georgia Counties

The GWR4 test files in libpysal hold GWR fits of the percentage with a bachelor's degree on the percentages rural, in poverty and African American, with bisquare and Gaussian kernels and fixed and adaptive bandwidths. The panel's Georgia step refits the fixed-bandwidth models at GWR4's own bandwidths and prints, beside GWR4's values, the residual sum of squares, the effective number of parameters, the AICc, the R-squared and the mean, minimum and maximum of each local coefficient.

## Replicating Oshan, Li, Kang, Wolf and Fotheringham (2019)

The article fits GWR with an adaptive bisquare kernel chosen by AICc, and reports the bandwidth, the residual sum of squares, the AIC, the AICc and the R-squared. It then fits multiscale GWR to the standardised variables and reports one bandwidth per coefficient ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)). The panel's article step prints each of these beside Julia's. The search of SpatialEconometrics.jl and the golden section search of mgwr can stop at neighbouring bandwidths where the AICc is flat ([Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-GLCBH2015a"></a>Gollini, I., Lu, B., Charlton, M., Brunsdon, C. and Harris, P. (2015). GWmodel: an R package for exploring spatial heterogeneity using geographically weighted models. *Journal of Statistical Software*, 63(17). [doi:10.18637/jss.v063.i17](https://doi.org/10.18637/jss.v063.i17)

<a id="ref-OLKWF2019a"></a>Oshan, T. M., Li, Z., Kang, W., Wolf, L. J. and Fotheringham, A. S. (2019). mgwr: a Python implementation of multiscale geographically weighted regression for investigating process spatial heterogeneity and scale. *ISPRS International Journal of Geo-Information*, 8(6), 269. [doi:10.3390/ijgi8060269](https://doi.org/10.3390/ijgi8060269)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-RA2007a"></a>Rey, S. J. and Anselin, L. (2007). PySAL: a Python library of spatial analytical methods. *Review of Regional Studies*, 37(1). [doi:10.52324/001c.8285](https://doi.org/10.52324/001c.8285)

## See Also
- [Overview](overview.md) · [Bandwidth Selection](bandwidth-selection.md) · [Multiscale GWR](mgwr.md)
