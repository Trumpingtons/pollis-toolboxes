# Multiscale GWR

## What the Multiscale GWR Tab Fits

The Multiscale GWR tab fits multiscale geographically weighted regression (MGWR), in which each coefficient, the intercept included, has its own adaptive bandwidth. It calls `fit_mgwr` of SpatialEconometrics.jl, which returns the local coefficients and their standard errors, one bandwidth and one effective number of parameters per coefficient, the AICc, the R-squared, the number of back-fitting iterations and whether they converged ([Randsley (2026)](#ref-Ran2026a)). MGWR was proposed by Fotheringham, Yang and Kang (2017) ([Fotheringham, Yang and Kang (2017)](#ref-FYK2017a)).

## How Multiscale GWR Is Estimated by Back-Fitting

MGWR is estimated by back-fitting, an algorithm for additive models: starting from initial estimates, it fits each coefficient's surface in turn, by a GWR of the part of the outcome the other surfaces leave unexplained on that one variable, choosing that coefficient's bandwidth by AICc, and repeats until the surfaces stop changing ([Fotheringham, Yang and Kang (2017)](#ref-FYK2017a)). The tab warns when back-fitting stops before converging, as its estimates are then unreliable. MGWR takes longer than GWR, since it searches a bandwidth for every coefficient at every iteration.

## Reading the Bandwidths of Multiscale GWR

Each bandwidth of MGWR is the scale at which its relationship varies: a small number of nearest areas means a local process, a number close to the number of areas a relationship that is nearly the same everywhere. Fotheringham, Yang and Kang (2017) recommend standardising the variables, as their bandwidths are otherwise affected by the scales of the variables and cannot be compared ([Fotheringham, Yang and Kang (2017)](#ref-FYK2017a); [Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)). Set Standardise Variables to Yes for that comparison.

## Effective Number of Parameters per Coefficient in MGWR

In MGWR each coefficient's surface has its own effective number of parameters, the trace of the part of the hat matrix that belongs to it, and their sum is the effective number of parameters of the model. Yu, Fotheringham, Li, Oshan, Kang and Wolf (2020) derived these and use them for coefficient-specific adjustments of the local tests ([Yu, Fotheringham, Li, Oshan, Kang and Wolf (2020)](#ref-YFLOK...2020a)). A coefficient with a large bandwidth has an effective number of parameters close to one, as a global coefficient has.

## References

<a id="ref-FYK2017a"></a>Fotheringham, A. S., Yang, W. and Kang, W. (2017). Multiscale geographically weighted regression (MGWR). *Annals of the American Association of Geographers*, 107(6), 1247–1265. [doi:10.1080/24694452.2017.1352480](https://doi.org/10.1080/24694452.2017.1352480)

<a id="ref-OLKWF2019a"></a>Oshan, T. M., Li, Z., Kang, W., Wolf, L. J. and Fotheringham, A. S. (2019). mgwr: a Python implementation of multiscale geographically weighted regression for investigating process spatial heterogeneity and scale. *ISPRS International Journal of Geo-Information*, 8(6), 269. [doi:10.3390/ijgi8060269](https://doi.org/10.3390/ijgi8060269)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-YFLOK...2020a"></a>Yu, H., Fotheringham, A. S., Li, Z., Oshan, T. M., Kang, W. and Wolf, L. J. (2020). Inference in multiscale geographically weighted regression. *Geographical Analysis*, 52(1), 87–106. [doi:10.1111/gean.12189](https://doi.org/10.1111/gean.12189)

## See Also
- [GWR, Adaptive](gwradaptive.md) · [Local Inference and Multiple Testing](local-inference.md) · [Decision Guide](decision-guide.md)
