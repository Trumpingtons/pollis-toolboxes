# Synthetic Control

## What the Synthetic Control Tab Fits

The Synthetic Control tab compares each area under the policy with a weighted mean of comparison areas that reproduces it before the policy, the method Abadie, Diamond and Hainmueller (2010) apply to California's tobacco control programme ([Abadie, Diamond and Hainmueller (2010)](#ref-ADH2010a)). It calls `fit_synthetic_control(Y, treated, T0; W, coords, predictors, donor_pool, penalty, penalty_metric)` of SpatialEconometrics.jl. The weights of each area under the policy are non-negative and sum to one. The gap between an area's outcome and its synthetic control measures the fit before the policy and the effect after it, and the average effect is the mean gap after the policy over the areas under it ([Randsley (2026)](#ref-Ran2026a)). The policy must start in the same period in every area under it, with two or more periods before.

## The Predictors the Weights Match

The Predictors input sets what the weights match before the policy. Outcome Before uses the Dependent Variable in each period before the policy, the default of `fit_synthetic_control`; Also Explanatory Variables adds the means of the Explanatory Variables before it. Each predictor is divided by its standard deviation. The documentation states that this equal weighting of standardised predictors is taken in place of a nested search over the importance of each predictor, because the nested search has no unique answer and its results stop being reproducible ([Randsley (2026)](#ref-Ran2026a)). Abadie (2021) discusses the predictors and the length of the period before the policy among the data requirements of the method ([Abadie (2021)](#ref-Aba2021a)).

## The Penalty of Abadie and L'Hour

Abadie and L'Hour (2021) observe that the problem of finding a synthetic control that best reproduces an area under the policy may not have a unique solution, a difficulty that grows with many areas, and propose a penalty on the discrepancies between the area under the policy and each comparison area that contributes to it ([Abadie and L'Hour (2021)](#ref-AL2021a)). In `fit_synthetic_control` the discrepancy is either the distance on the map between centroids or the distance between standardised predictors, and the penalty multiplies it in the objective ([Randsley (2026)](#ref-Ran2026a)). The tab passes the centroids in km, so that a penalty of 1 weighs one km of distance like one unit of squared standardised fit.

## Reading the Output of the Synthetic Control Tab

The Synthetic Control tab prints the number of areas under the policy and of comparison areas, the penalty, and whether the weights reached their optimum, from the two optimality figures `fit_synthetic_control` reports, which should both be near zero ([Randsley (2026)](#ref-Ran2026a)). It then gives the average effect and the ratio of the RMSPE of the mean gap after the policy to that before. A table per area under the policy follows, with its RMSPE before and after, their ratio, its mean gap after and the number of comparison areas it uses, then the mean path of the areas under the policy and of their synthetic controls period by period, and the ten comparison areas of the largest mean weight.

## Why the Synthetic Control Tab Has No Standard Errors

The documentation of `SyntheticControlResult` explains that the weights solve a constrained optimisation rather than estimating a parameter with a sampling distribution of known form, and that the gap is a difference between one observed and one constructed path, so there is no standard error to report ([Randsley (2026)](#ref-Ran2026a)). Abadie, Diamond and Hainmueller (2010) propose inferential methods for synthetic controls in their article, and the tab's Permutation Test step ranks the ratio of the areas under the policy among those of random sets of comparison areas ([Abadie, Diamond and Hainmueller (2010)](#ref-ADH2010a)).

## References

<a id="ref-Aba2021a"></a>Abadie, A. (2021). Using synthetic controls: feasibility, data requirements, and methodological aspects. *Journal of Economic Literature*, 59(2), 391–425. [doi:10.1257/jel.20191450](https://doi.org/10.1257/jel.20191450)

<a id="ref-ADH2010a"></a>Abadie, A., Diamond, A. and Hainmueller, J. (2010). Synthetic control methods for comparative case studies: estimating the effect of California's tobacco control program. *Journal of the American Statistical Association*, 105(490), 493–505. [doi:10.1198/jasa.2009.ap08746](https://doi.org/10.1198/jasa.2009.ap08746)

<a id="ref-AL2021a"></a>Abadie, A. and L'Hour, J. (2021). A penalized synthetic control estimator for disaggregated data. *Journal of the American Statistical Association*, 116(536), 1817–1834. [doi:10.1080/01621459.2021.1971535](https://doi.org/10.1080/01621459.2021.1971535)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Inference Without Standard Errors](inference.md) · [Spatial DiD](spdid.md) · [Decision Guide](decision-guide.md)
