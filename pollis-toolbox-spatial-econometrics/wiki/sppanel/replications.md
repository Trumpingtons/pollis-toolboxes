# Replications

## Software the Spatial Panel Data Panel Is Checked Against

The panel's spatial error model with fixed effects is compared with splm, the R package of Millo and Piras for spatial panel data models. splm estimates fixed and random effects spatial panel models by maximum likelihood and by generalised moments, and tests them, and its article illustrates every function on one data set, Munnell's productivity data on 48 US states over 17 years ([Millo and Piras (2012)](#ref-MP2012a)). Its `spml` function with `model = "within"` fits the fixed effects models that `fit_spatial_error` and `fit_spatial_panel` of SpatialEconometrics.jl fit with a `FixedEffectsSpec` ([Randsley (2026)](#ref-Ran2026a)). The Munnell's Production Function step sets Julia's estimates beside those the article prints.

## Munnell's Data on the US States

Munnell (1990) studied the productivity of public capital ([Munnell (1990)](#ref-Mun1990b)). Millo and Piras (2012) take from that work a Cobb-Douglas production function relating the gross product of each state to its public capital, its private capital and its labour, measured by employment, with the state's unemployment rate added to capture the business cycle; the model is estimated in logs, the unemployment rate entering as it is. Their weights are a binary contiguity matrix of the US states, distributed with splm ([Millo and Piras (2012)](#ref-MP2012a)). The Munnell's Production Function step reads the data, `Produc` of the R package plm, from PollisDatasets.jl, and builds the weights by queen contiguity of the US Census Bureau's outlines of the states, which gives the same neighbours as `usaww` of splm; the article itself reads `Produc` from the Ecdat package.

## Replicating the Spatial Error Models of Millo and Piras

Millo and Piras (2012) fit two fixed effects spatial error models with `spml`, which their output heads as error models: one with fixed effects of the states and one with fixed effects of the years. splm names the spatial error parameter rho, as the article's tables print it ([Millo and Piras (2012)](#ref-MP2012a)). The Munnell's Production Function step fits both with `fit_spatial_error` and the exact log-determinant, and prints lambda, the coefficients of public capital, private capital, employment and unemployment, and their standard errors beside the article's ([Randsley (2026)](#ref-Ran2026a)). The article's model with both a spatial lag and a spatial error, fitted with fixed effects of the states, has no maximum likelihood counterpart in SpatialEconometrics.jl, and is not replicated.

## Direct Approach and Lee and Yu's Transformation

splm's `spml` with `model = "within"` follows the direct approach: the data are demeaned, the demeaned data filtered by the spatial error process, and the likelihood counts every area in every period, with the error variance estimated by the sum of squared residuals divided by the number of areas times the number of periods ([Millo and Piras (2012)](#ref-MP2012a)). `fit_spatial_error` of SpatialEconometrics.jl uses by default the transformation of Lee and Yu, which drops one period under fixed effects of the areas and one area under fixed effects of the periods, and adds a term in lambda to the log-likelihood under fixed effects of the periods ([Lee and Yu (2010)](#ref-LY2010a)); with `approach = DirectQML(bias_correct = false)` it follows the direct approach ([Randsley (2026)](#ref-Ran2026a)). The Munnell's Production Function step uses the direct approach, as splm does. Under fixed effects of the areas the two approaches give the same estimates, and standard errors that differ by the square root of the number of periods over that number minus one.

## References

<a id="ref-LY2010a"></a>Lee, L.-f. and Yu, J. (2010). Estimation of spatial autoregressive panel data models with fixed effects. *Journal of Econometrics*, 154(2), 165–185. [doi:10.1016/j.jeconom.2009.08.001](https://doi.org/10.1016/j.jeconom.2009.08.001)

<a id="ref-MP2012a"></a>Millo, G. and Piras, G. (2012). splm: spatial panel data models in R. *Journal of Statistical Software*, 47(1), 1–38. [doi:10.18637/jss.v047.i01](https://doi.org/10.18637/jss.v047.i01)

<a id="ref-Mun1990b"></a>Munnell, A. H. (1990). Why has productivity growth declined? Productivity and public investment. *New England Economic Review*, 3–22.

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [SEM, Fixed Effects](semfe.md) · [Fixed Effects in Spatial Panels](fixed-effects.md) · [Overview](overview.md)
