# Decision Guide

## Which Constraint of the Spatial Interaction Models Panel

| Known | Tab | Predicts |
|---|---|---|
| Nothing about the totals | Unconstrained | The flows and the totals, from the Origin and Destination Variables |
| The outflow of each origin | Production | Where the flows from each origin go |
| The inflow of each destination | Attraction | Where the flows into each destination come from |
| Both | Doubly Constrained | How the known totals are spread across the pairs |

Wilson (1971) derives each model from what is known about the totals ([Wilson (1971)](#ref-Wil1971a)). The more the constraint holds, the more of what each place sends or attracts the effects take in, and the more the distance coefficient is measured net of the places. The Four Constrained Models step fits all four on the same flows.

## Which Distance Decay

Exponential decay makes the flows fall by the same proportion for each further unit of distance; Power decay, for each further proportion of distance. The Exponential Against Power Decay step fits both on the same flows and model, and the one with the lower AIC fits them better, as the two have the same number of parameters ([Oshan (2016)](#ref-Osh2016a)). Power decay needs the flows within a place dropped, since their distance is zero.

## Poisson or Negative Binomial

The Poisson estimates of the coefficients need only the mean of the flows to be right, and stay consistent when the variance is not equal to the mean ([Santos Silva and Tenreyro (2006)](#ref-SST2006a)). The Overdispersion Test step applies the regression-based test of Cameron and Trivedi (1990), which asks whether the variance grows faster than the mean, as a negative binomial model allows ([Cameron and Trivedi (1990)](#ref-CT1990a)). With overdispersion, robust standard errors keep the Poisson estimates and correct their inference; the Negative Binomial tab models the extra variance and weighs the flows differently, with an estimate of its own. The Poisson Against Negative Binomial step sets the two side by side.

## Which Standard Errors

| Standard Errors | Assumes |
|---|---|
| Model-Based | A variance equal to the mean, as in spint's output |
| Robust | Nothing about the variance, flows independent |
| Clustered by Origin | Flows from the same origin may be correlated |

The Standard Errors Side by Side step prints the tab's coefficients with each, and with clustering by destination ([Boehm (2020)](#ref-Boe2020a)). LeSage and Pace (2008) model the dependence between flows from neighbouring origins and to neighbouring destinations ([LeSage and Pace (2008)](#ref-LP2008a)); the Moran's I of the Residual Flows step shows whether the tab's residuals hold such dependence.

## Least Squares on Logs or Poisson

Least squares on the logarithm of the flows drops the flows of zero and, Santos Silva and Tenreyro (2006) show, gives inconsistent estimates of the coefficients when the errors are heteroskedastic, because the expected value of the logarithm of a random variable depends on its variance ([Santos Silva and Tenreyro (2006)](#ref-SST2006a)). Flowerdew and Aitkin (1982) fit the gravity model as a Poisson regression for flows that are counts ([Flowerdew and Aitkin (1982)](#ref-FA1982a)). The Log-Linear Least Squares Against Poisson step fits the tab's model both ways on the same flows and prints the coefficients side by side, with the number of flows of zero that least squares leaves out.

## References

<a id="ref-Boe2020a"></a>Boehm, J. (2020). GLFixedEffectModels.jl: fast estimation of generalized linear models with high-dimensional fixed effects in Julia. [github.com/jmboehm/GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl)

<a id="ref-CT1990a"></a>Cameron, A. C. and Trivedi, P. K. (1990). Regression-based tests for overdispersion in the Poisson model. *Journal of Econometrics*, 46(3), 347–364. [doi:10.1016/0304-4076(90)90014-K](https://doi.org/10.1016/0304-4076(90)90014-K)

<a id="ref-FA1982a"></a>Flowerdew, R. and Aitkin, M. (1982). A method of fitting the gravity model based on the Poisson distribution. *Journal of Regional Science*, 22(2), 191–202. [doi:10.1111/j.1467-9787.1982.tb00744.x](https://doi.org/10.1111/j.1467-9787.1982.tb00744.x)

<a id="ref-LP2008a"></a>LeSage, J. P. and Pace, R. K. (2008). Spatial econometric modeling of origin-destination flows. *Journal of Regional Science*, 48(5), 941–967. [doi:10.1111/j.1467-9787.2008.00573.x](https://doi.org/10.1111/j.1467-9787.2008.00573.x)

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

<a id="ref-SST2006a"></a>Santos Silva, J. M. C. and Tenreyro, S. (2006). The log of gravity. *The Review of Economics and Statistics*, 88(4), 641–658. [doi:10.1162/rest.88.4.641](https://doi.org/10.1162/rest.88.4.641)

<a id="ref-Wil1971a"></a>Wilson, A. G. (1971). A family of spatial interaction models, and associated developments. *Environment and Planning A*, 3(1), 1–32. [doi:10.1068/a030001](https://doi.org/10.1068/a030001)

## See Also
- [Overview](overview.md) · [Distance Decay](distance-decay.md) · [Goodness of Fit](goodness-of-fit.md)
