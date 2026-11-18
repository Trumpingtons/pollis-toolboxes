# Local Inference and Multiple Testing

## Local Standard Errors and t-Values in GWR

Every local regression of GWR gives a standard error for each local estimate, and the ratio of the two is a local t-value. Mapping the t-values beside the estimates shows where a relationship is distinguishable from zero and where it is not. SpatialEconometrics.jl returns the local standard errors in `se_local`, and does not adjust them for the number of local tests ([Randsley (2026)](#ref-Ran2026a)): the panel's Map of the Local t-Values and its diagnose step compare them with an adjusted critical value.

## The Multiple Testing Problem in Geographically Weighted Regression

A GWR model tests each coefficient once at every location, so with many locations some local t-values exceed the usual critical value by chance alone. A Bonferroni correction for the number of locations is far too conservative, because the local estimates share observations and are strongly dependent. da Silva and Fotheringham (2016) proposed adjusting the significance level by the effective number of parameters of the GWR model instead of the number of locations, which controls the familywise error rate while accounting for that dependence ([da Silva and Fotheringham (2016)](#ref-SF2016a)). The larger the bandwidth, the fewer effective parameters, and the smaller the adjustment.

## Inference in Multiscale GWR

In multiscale GWR each coefficient has its own bandwidth, so the dependence between its local estimates, and the correction its local tests need, differ from one coefficient to another. Yu, Fotheringham, Li, Oshan, Kang and Wolf (2020) derived the hat matrix of each coefficient's surface in MGWR, giving local standard errors and an effective number of parameters for every coefficient, and with it a coefficient-specific adjusted critical value ([Yu, Fotheringham, Li, Oshan, Kang and Wolf (2020)](#ref-YFLOK...2020a)). The Multiscale GWR tab prints the effective number of parameters of each coefficient.

## Testing Whether a Coefficient Varies over the Map

A map of local estimates always shows some variation, even when the true relationship is the same everywhere. Brunsdon, Fotheringham and Charlton (1996) tested whether the variation is larger than chance by a Monte Carlo procedure: the observations are randomly reassigned to the locations, the model is refitted many times, and the variability of the local estimates on the real data is compared with its distribution over the permutations ([Brunsdon, Fotheringham and Charlton (1996)](#ref-BFC1996a)). In MGWR, a coefficient whose bandwidth approaches the number of observations is close to constant.

## References

<a id="ref-BFC1996a"></a>Brunsdon, C., Fotheringham, A. S. and Charlton, M. E. (1996). Geographically weighted regression: a method for exploring spatial nonstationarity. *Geographical Analysis*, 28(4), 281–298. [doi:10.1111/j.1538-4632.1996.tb00936.x](https://doi.org/10.1111/j.1538-4632.1996.tb00936.x)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-SF2016a"></a>da Silva, A. R. and Fotheringham, A. S. (2016). The multiple testing issue in geographically weighted regression. *Geographical Analysis*, 48(3), 233–247. [doi:10.1111/gean.12084](https://doi.org/10.1111/gean.12084)

<a id="ref-YFLOK...2020a"></a>Yu, H., Fotheringham, A. S., Li, Z., Oshan, T. M., Kang, W. and Wolf, L. J. (2020). Inference in multiscale geographically weighted regression. *Geographical Analysis*, 52(1), 87–106. [doi:10.1111/gean.12189](https://doi.org/10.1111/gean.12189)

## See Also
- [Bandwidth Selection](bandwidth-selection.md) · [Multiscale GWR](mgwr.md) · [Decision Guide](decision-guide.md)
