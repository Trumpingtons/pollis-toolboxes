# Bandwidth Selection

## Why the Bandwidth Is Chosen by a Criterion

The bandwidth trades bias against variance. A small bandwidth lets the local estimates follow the data closely but rests each on few observations, so they are noisy; a large bandwidth gives stable estimates that may smooth away real variation. Unless theory fixes the scale, the bandwidth is chosen by optimising a criterion of model fit, and Oshan, Li, Kang, Wolf and Fotheringham (2019) list cross-validation, AIC, the corrected AIC (AICc) and BIC as the criteria offered by mgwr ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)).

## The Corrected Akaike Information Criterion (AICc)

Hurvich, Simonoff and Tsai (1998) proposed an improved Akaike information criterion for choosing the smoothing parameter of nonparametric regression, which penalises the effective number of parameters, the trace of the hat matrix, and avoids the undersmoothing of classical criteria ([Hurvich, Simonoff and Tsai (1998)](#ref-HST1998a)). GWR is a linear smoother of this kind, and the AICc is the criterion suggested for it, because it penalises the small bandwidths that make the model more complex and consume more degrees of freedom ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)). The bandwidth with the smallest AICc is chosen.

## Golden Section Search for the Bandwidth

The AICc of GWR is computed by fitting the model at a bandwidth, so the search for its minimum evaluates the model at a sequence of bandwidths. A golden section search narrows an interval around the minimum by a constant ratio at each step, and is the default of mgwr; an interval search evaluates a grid of bandwidths instead ([Oshan, Li, Kang, Wolf and Fotheringham (2019)](#ref-OLKWF2019a)). The GWR, Fixed Bandwidth tab runs a golden section search over distances, from one at which every area has enough neighbours to the width of the map. GWR, Adaptive and Multiscale GWR search over numbers of neighbours with the golden section search of SpatialEconometrics.jl, which, like mgwr, rounds each trial bandwidth to a whole number and starts from 40 plus twice the number of coefficients ([Randsley (2026)](#ref-Ran2026a)).

## When the AICc Curve Is Flat

The AICc can change little over a wide range of bandwidths, or have more than one local minimum, and a golden section search then stops at one of them. Plotting the AICc against the bandwidth shows how sharply the chosen bandwidth is identified: the Bandwidth Search by AICc step of the panel draws that curve. A flat curve means that the data do not tell the scale of variation apart, and the patterns on the coefficient maps should be read with that in mind.

## References

<a id="ref-HST1998a"></a>Hurvich, C. M., Simonoff, J. S. and Tsai, C.-L. (1998). Smoothing parameter selection in nonparametric regression using an improved Akaike information criterion. *Journal of the Royal Statistical Society Series B*, 60(2), 271–293. [doi:10.1111/1467-9868.00125](https://doi.org/10.1111/1467-9868.00125)

<a id="ref-OLKWF2019a"></a>Oshan, T. M., Li, Z., Kang, W., Wolf, L. J. and Fotheringham, A. S. (2019). mgwr: a Python implementation of multiscale geographically weighted regression for investigating process spatial heterogeneity and scale. *ISPRS International Journal of Geo-Information*, 8(6), 269. [doi:10.3390/ijgi8060269](https://doi.org/10.3390/ijgi8060269)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Kernels and Bandwidths](kernels-bandwidths.md) · [Local Inference and Multiple Testing](local-inference.md) · [Decision Guide](decision-guide.md)
