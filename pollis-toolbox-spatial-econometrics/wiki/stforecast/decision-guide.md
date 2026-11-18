# Decision Guide

## Choosing a Tab of the Spatio-Temporal Forecasting Panel

| Situation | Tab | Reason |
|---|---|---|
| One variable, whose value in each area follows its own past and its neighbours' past | STAR | Any number of spatial and temporal lags, estimated by least squares |
| Several variables that move together, each possibly responding to the others within a period | Spatial VAR | Forecasts them jointly, with the neighbours' values in the same period and a causal ordering of the variables |
| A benchmark, to see what the neighbours add | Panel AR | Each area's own past only, fitted and scored on the same periods |

## STAR or a Spatial VAR

The documentation of `fit_star` states that STAR and the spatial panels with a contemporaneous spatial lag answer different questions and that neither nests the other: STAR dates every spatial term before the period it explains, which allows any lag orders and estimation by least squares but rules out spatial feedback within a period ([Randsley (2026)](#ref-Ran2026a)). A spatial VAR keeps that feedback: each equation has the neighbours' values of its variable in the same period, and Di Giacinto (2010) estimates the system by full information maximum likelihood after adapting the recursive identification of time-series VAR models to space and time ([Di Giacinto (2010)](#ref-Gia2010a)). The documentation of `fit_spvar` adds that its inference holds as the periods grow with the areas fixed, and calls bringing a wide, short panel to it a mistake ([Randsley (2026)](#ref-Ran2026a)).

## Choosing the Causal Ordering of a Spatial VAR

The Variables input of the Spatial VAR tab lists the variables in causal order: within a period, each variable can respond to those before it, not to those after it. The documentation of `fit_spvar` states that the identification of the model's contemporaneous matrix rests entirely on this ordering, that the data does not settle it, and that reversing it changes the impulse responses, which is why the function gives the ordering no default. The matrix is block triangular across the variables rather than triangular, so that within each variable the areas still interact both ways, as spatial interaction requires ([Randsley (2026)](#ref-Ran2026a); [Di Giacinto (2010)](#ref-Gia2010a)). The ordering is a statement about which variable moves first within a period, made before the fit.

## Powers of W or Order-k Neighbours

The Spatial Weights input of the STAR tab chooses what the k-th ring of neighbours is. Pfeifer and Deutsch (1980) define it as the neighbours of order k, the areas exactly k steps away, each ring's weights summing to one ([Pfeifer and Deutsch (1980)](#ref-PD1980a)). `fit_star` takes powers of the weights by default, and the order-k neighbours on request. Its documentation notes that the two coincide with one spatial lag and differ from the second: the k-th power counts the paths of k steps between two areas, places weight on the area itself, and keeps first-order neighbours wherever the map has triangles ([Randsley (2026)](#ref-Ran2026a)). The Powers Against Orders of W step fits STAR both ways.

## Choosing the Lag Orders

The Spatial Lags and Temporal Lags inputs set how many rings of neighbours and how many past periods enter the model. Pfeifer and Deutsch (1980) build space-time models in three stages, the identification of a tentative model, its estimation and diagnostic checking, repeated until a model passes ([Pfeifer and Deutsch (1980)](#ref-PD1980a)). The Lag Orders step fits STAR for every spatial order from 0 to 3 and every temporal order from 1 to 3 on the same periods, with AIC, BIC and the accuracy of the forecasts of the periods held back. The documentation of `fit_star` warns that powers of a regular weights matrix can repeat lower powers, leaving the design rank-deficient, and that order-k neighbours run out beyond the diameter of the neighbours' graph ([Randsley (2026)](#ref-Ran2026a)).

## Removing or Keeping the Area Means

`fit_star` has one intercept for all the areas. With Area Means set to Remove, the STAR and Panel AR tabs subtract each area's mean over the periods fitted before the fit and add it back to the forecasts, so that areas at different levels share the dynamics; with Keep, the values are fitted as they are. `fit_spvar` always removes each area's mean over the periods it explains, and its documentation states that this is algebraically the same as estimating an intercept for each area and carries the usual dynamic-panel bias of order one over the number of periods ([Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-Gia2010a"></a>Di Giacinto, V. (2010). On vector autoregressive modeling in space and time. *Journal of Geographical Systems*, 12(2), 125–154. [doi:10.1007/s10109-010-0116-6](https://doi.org/10.1007/s10109-010-0116-6)

<a id="ref-PD1980a"></a>Pfeifer, P. E. and Deutsch, S. J. (1980). A three-stage iterative procedure for space-time modeling. *Technometrics*, 22(1), 35–47. [doi:10.2307/1268381](https://doi.org/10.2307/1268381)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [Forecasting in Space and Time](forecasting.md)
