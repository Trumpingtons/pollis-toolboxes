# Decision Guide

## Choosing a Tab of the Spatial Causal Inference Panel

| Situation | Tab | Reason |
|---|---|---|
| Many areas under the policy, observed before and after it, with comparison areas around them | Spatial DiD | A regression with standard errors, and the spillover onto the neighbours as a coefficient of its own |
| One or a few areas under the policy, with a long run of periods before it | Synthetic Control | A weighted mean of areas outside the policy that follows each area under it before the policy |

## Spatial DiD or Synthetic Control

Spatial DiD assumes that the areas under the policy and the comparison areas would have changed alike without it, the common trend Delgado and Florax (2015) name among their assumptions, and models the spillover through the share of neighbours under the policy ([Delgado and Florax (2015)](#ref-DF2015a)). Synthetic Control assumes instead that a weighted mean of comparison areas that followed an area under the policy before it would have gone on following it. Abadie (2021) describes the settings where synthetic controls give reliable estimates and those where they may fail, and the article recommends them when few aggregate units are affected ([Abadie (2021)](#ref-Aba2021a); [Abadie, Diamond and Hainmueller (2010)](#ref-ADH2010a)). The Spatial DiD Against Synthetic Control step fits both on the same data.

## Choosing the Neighbours

The Neighbours input decides which areas count as neighbours, and with them what a spillover is. The documentation of `ExposureMap` states that every spillover estimate is relative to the mapping that produced it: a spillover estimated with five nearest neighbours answers a different question from one estimated with a band of 50 km, and neither is the spillover ([Randsley (2026)](#ref-Ran2026a)). Queen contiguity counts areas sharing any point of their boundaries, rook contiguity those sharing a stretch of boundary, and k Nearest the k nearest centroids. The Interference Check step prints the counts of comparison areas with and without a neighbour under the policy under each of the three.

## Choosing the Standard Errors of Spatial DiD

The documentation of `fit_spatial_did` makes clustering by area the default on the evidence of its own simulations: intervals clustered by area covered close to 95% across the designs it tried, while Conley intervals covered less as the cutoff widened, with or without spatial correlation of the errors ([Randsley (2026)](#ref-Ran2026a)). It explains this by the share of neighbours under the policy: including it identifies the direct effect from the contrast between an area and its neighbours, which removes the part of the error they share. The Standard Errors step prints the effects with each choice and four cutoffs.

## Choosing the Comparison Areas of Synthetic Control

Comparison Areas set to Exclude Neighbours leaves out every area not under the policy that neighbours an area under it. The documentation of `fit_synthetic_control` gives the reason: with a spillover, the neighbours follow the area under the policy best before it, and an unscreened fit builds the counterfactual from them, so that the spillover lands inside the comparison ([Randsley (2026)](#ref-Ran2026a)). All Areas Not Under the Policy keeps them, which the documentation calls the conventional choice. The Comparison Areas step fits both.

## Choosing the Penalty of Synthetic Control

Abadie and L'Hour (2021) note that the weights that best reproduce an area under the policy may not be unique, especially with many areas, and propose a penalty on the discrepancies between the area under the policy and each comparison area it draws on ([Abadie and L'Hour (2021)](#ref-AL2021a)). The Penalty input sets its weight and Penalty Distance its distance: on the map, in km between centroids, or in the standardised predictors. The documentation of `fit_synthetic_control` states that a larger penalty moves the weights towards the single nearest comparison area ([Randsley (2026)](#ref-Ran2026a)). The Penalty step fits six values.

## References

<a id="ref-Aba2021a"></a>Abadie, A. (2021). Using synthetic controls: feasibility, data requirements, and methodological aspects. *Journal of Economic Literature*, 59(2), 391–425. [doi:10.1257/jel.20191450](https://doi.org/10.1257/jel.20191450)

<a id="ref-ADH2010a"></a>Abadie, A., Diamond, A. and Hainmueller, J. (2010). Synthetic control methods for comparative case studies: estimating the effect of California's tobacco control program. *Journal of the American Statistical Association*, 105(490), 493–505. [doi:10.1198/jasa.2009.ap08746](https://doi.org/10.1198/jasa.2009.ap08746)

<a id="ref-AL2021a"></a>Abadie, A. and L'Hour, J. (2021). A penalized synthetic control estimator for disaggregated data. *Journal of the American Statistical Association*, 116(536), 1817–1834. [doi:10.1080/01621459.2021.1971535](https://doi.org/10.1080/01621459.2021.1971535)

<a id="ref-DF2015a"></a>Delgado, M. S. and Florax, R. J. G. M. (2015). Difference-in-differences techniques for spatial data: local autocorrelation and spatial interaction. *Economics Letters*, 137, 123–126. [doi:10.1016/j.econlet.2015.10.035](https://doi.org/10.1016/j.econlet.2015.10.035)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [Inference Without Standard Errors](inference.md)
