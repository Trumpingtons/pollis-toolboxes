# Replications

## Software the Spatial Panel Data Panel Is Checked Against

The panel's spatial error model with fixed effects is compared with splm, the R package of Millo and Piras for spatial panel data models. splm estimates fixed and random effects spatial panel models by maximum likelihood and by generalised moments, and tests them, and its article illustrates every function on one data set, Munnell's productivity data on 48 US states over 17 years ([Millo and Piras (2012)](#ref-MP2012a)). Its `spml` function with `model = "within"` fits the fixed effects models that `fit_spatial_error` and `fit_spatial_panel` of SpatialEconometrics.jl fit with a `FixedEffectsSpec` ([Randsley (2026)](#ref-Ran2026a)). The Munnell's Production Function step sets Julia's estimates beside those the article prints.

## Munnell's Data on the US States

Munnell (1990) studied the productivity of public capital ([Munnell (1990)](#ref-Mun1990b)). Millo and Piras (2012) take from that work a Cobb-Douglas production function relating the gross product of each state to its public capital, its private capital and its labour, measured by employment, with the state's unemployment rate added to capture the business cycle; the model is estimated in logs, the unemployment rate entering as it is. Their weights are a binary contiguity matrix of the US states, distributed with splm ([Millo and Piras (2012)](#ref-MP2012a)). The Munnell's Production Function step downloads the data, `Produc`, from the R package plm, and the weights, `usaww`, from splm, both at fixed versions; the article itself reads `Produc` from the Ecdat package.

## Replicating the Spatial Error Models of Millo and Piras

Millo and Piras (2012) fit two fixed effects spatial error models with `spml`, which their output heads as error models: one with fixed effects of the states and one with fixed effects of the years. splm names the spatial error parameter rho, as the article's tables print it ([Millo and Piras (2012)](#ref-MP2012a)). The Munnell's Production Function step fits both with `fit_spatial_error` and the exact log-determinant, and prints lambda, the coefficients of public capital, private capital, employment and unemployment, and their standard errors beside the article's ([Randsley (2026)](#ref-Ran2026a)). The article's model with both a spatial lag and a spatial error, fitted with fixed effects of the states, has no maximum likelihood counterpart in SpatialEconometrics.jl, and is not replicated.

## Where splm and SpatialEconometrics.jl Differ

The two programs do not compute the spatial error panel in the same way. splm iterates between maximum likelihood for the spatial parameter and generalised least squares for the coefficients until they converge, estimating the error variance by the sum of squared residuals divided by the number of areas times the number of periods ([Millo and Piras (2012)](#ref-MP2012a)). `fit_spatial_error` maximises the concentrated log-likelihood over lambda alone, on the number of effective observations its fixed effects leave, and with fixed effects of the periods adds a further term in lambda to the log-likelihood ([Randsley (2026)](#ref-Ran2026a)). The step prints both sets of values, so that the size of any difference, in the estimates and in the standard errors, can be read for each specification.

## References

<a id="ref-MP2012a"></a>Millo, G. and Piras, G. (2012). splm: spatial panel data models in R. *Journal of Statistical Software*, 47(1), 1–38. [doi:10.18637/jss.v047.i01](https://doi.org/10.18637/jss.v047.i01)

<a id="ref-Mun1990b"></a>Munnell, A. H. (1990). Why has productivity growth declined? Productivity and public investment. *New England Economic Review*, 3–22.

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [SEM, Fixed Effects](semfe.md) · [Fixed Effects in Spatial Panels](fixed-effects.md) · [Overview](overview.md)
