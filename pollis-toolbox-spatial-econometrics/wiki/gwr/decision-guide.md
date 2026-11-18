# Decision Guide

## Choosing a Tab of the Geographically Weighted Regression Panel

| Situation | Tab | Reason |
|---|---|---|
| Areas of similar size, evenly spread | GWR, Fixed Bandwidth | The same distance of influence everywhere is easy to read |
| Areas of very different sizes, dense in cities and sparse elsewhere | GWR, Adaptive | Every local regression has the same number of observations |
| Relationships that may vary at different scales | Multiscale GWR | One bandwidth per coefficient |
| Coefficients to be compared by their bandwidths | Multiscale GWR, with Standardise Variables on Yes | Bandwidths are comparable only on standardised variables |

## Geographically Weighted Regression or a Global Spatial Model

GWR and the spatial lag and error models answer different questions. GWR asks whether the relationship between the outcome and its explanatory variables changes over the map; the spatial lag and error models keep one relationship and model the dependence between neighbouring outcomes or errors. Brunsdon, Fotheringham and Charlton (1996) present GWR as a way to explore spatial nonstationarity ([Brunsdon, Fotheringham and Charlton (1996)](#ref-BFC1996a)). Residuals that remain spatially autocorrelated after GWR suggest dependence that local coefficients do not capture.

## From GWR to Multiscale GWR

Fotheringham, Yang and Kang (2017) argue that a single bandwidth forces every relationship to the same scale, and that the scale chosen for GWR is a compromise between the scales of its coefficients ([Fotheringham, Yang and Kang (2017)](#ref-FYK2017a)). When the AICc of Multiscale GWR is clearly smaller than that of GWR, or its bandwidths differ widely between coefficients, the coefficients vary at different scales. When the bandwidths are similar, GWR and MGWR give similar surfaces and similar tests ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)).

## Reading the Maps With Care

Local estimates rest on few observations near the edges of the map and where observations are sparse, and many local tests are made at once. Before interpreting a pattern on a coefficient map, check the local t-values against a critical value adjusted for multiple testing ([da Silva and Fotheringham (2016)](#ref-SF2016a)), and whether the variation of the coefficient exceeds what chance would give, with the Monte Carlo test of Brunsdon, Fotheringham and Charlton (1996).

## References

<a id="ref-BFC1996a"></a>Brunsdon, C., Fotheringham, A. S. and Charlton, M. E. (1996). Geographically weighted regression: a method for exploring spatial nonstationarity. *Geographical Analysis*, 28(4), 281–298. [doi:10.1111/j.1538-4632.1996.tb00936.x](https://doi.org/10.1111/j.1538-4632.1996.tb00936.x)

<a id="ref-FYK2017a"></a>Fotheringham, A. S., Yang, W. and Kang, W. (2017). Multiscale geographically weighted regression (MGWR). *Annals of the American Association of Geographers*, 107(6), 1247–1265. [doi:10.1080/24694452.2017.1352480](https://doi.org/10.1080/24694452.2017.1352480)

<a id="ref-OLKWF2019a"></a>Oshan, T. M., Li, Z., Kang, W., Wolf, L. J. and Fotheringham, A. S. (2019). mgwr: a Python implementation of multiscale geographically weighted regression for investigating process spatial heterogeneity and scale. *ISPRS International Journal of Geo-Information*, 8(6), 269. [doi:10.3390/ijgi8060269](https://doi.org/10.3390/ijgi8060269)

<a id="ref-SF2016a"></a>da Silva, A. R. and Fotheringham, A. S. (2016). The multiple testing issue in geographically weighted regression. *Geographical Analysis*, 48(3), 233–247. [doi:10.1111/gean.12084](https://doi.org/10.1111/gean.12084)

## See Also
- [Overview](overview.md) · [Local Inference and Multiple Testing](local-inference.md) · [Multiscale GWR](mgwr.md)
