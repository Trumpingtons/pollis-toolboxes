# Spatial Interaction Models

## The Family of Spatial Interaction Models

Wilson (1971) derived a family of spatial interaction models that share one form, a flow growing with the sizes of the origin and the destination and falling with the distance between them, and differ in which totals of the observed flows they are made to reproduce ([Wilson (1971)](#ref-Wil1971a)). The unconstrained model reproduces only the grand total. The production-constrained model reproduces the flows leaving each origin, the attraction-constrained model those arriving at each destination, and the doubly constrained model both. The Constraint of Spatial Interaction chooses among them: Doubly, Production, Attraction or Unconstrained. Dennett (2012) and Oshan (2016) give introductions to the four models with worked examples ([Dennett (2012)](#ref-Den2012a); [Oshan (2016)](#ref-Osh2016a)).

## Fitting a Gravity Model as a Poisson Regression

Flowerdew and Aitkin (1982) proposed fitting the gravity model to counts of migrants or commuters as a Poisson regression, in place of a least squares regression of the logs, which cannot take flows of zero ([Flowerdew and Aitkin (1982)](#ref-FA1982a)). Santos Silva and Tenreyro (2006) showed that the logged regression is biased when the errors are heteroskedastic, and that the Poisson pseudo-maximum-likelihood estimator stays consistent without the flows following a Poisson distribution ([Santos Silva and Tenreyro (2006)](#ref-SST2006a)). Spatial Interaction and Air Traffic fit every model as a Poisson regression with a log link, using GLFixedEffectModels.jl, and report robust standard errors ([Boehm (2020)](#ref-Boe2020a)).

## Constraints as Fixed Effects

In a Poisson regression, a fixed effect for each origin makes the fitted flows leaving every origin add up to the observed ones, and a fixed effect for each destination does the same for the flows arriving ([Flowerdew and Aitkin (1982)](#ref-FA1982a); [Oshan (2016)](#ref-Osh2016a)). Spatial Interaction therefore fits the doubly constrained model with fixed effects for origins and destinations; the production-constrained model with origin effects and the log of the inflow of each destination as its size; the attraction-constrained model with destination effects and the log of the outflow of each origin; and the unconstrained model with both logs and a single intercept. GLFixedEffectModels.jl absorbs the fixed effects, so models with thousands of zones remain quick to fit ([Boehm (2020)](#ref-Boe2020a)).

## Power and Exponential Distance Functions

The Distance Function of Spatial Interaction sets how the flows fall with distance. With Power, the model contains the log of the distance, and its parameter is an elasticity: the percentage change of the flow for a one per cent change of the distance. With Exponential, the model contains the distance itself, and its parameter is the change of the log of the flow for each further unit of distance, a kilometre for Spatial Interaction and a thousand kilometres for Air Traffic. Lenormand, Bassolas and Ramasco (2016) compared the two functions on commuting data from several countries ([Lenormand, Bassolas and Ramasco (2016)](#ref-LBR2016a)). Power and Exponential fits both with the same Constraint.

## Common Part of the Flows and SRMSE

Spatial Interaction gives two measures of how closely the fitted flows follow the observed ones. The common part of the flows, which Lenormand, Bassolas and Ramasco (2016) call the common part of commuters, is the share of the flows that the fitted and the observed flows have in common: 1 when they agree pair by pair, 0 when they share nothing ([Lenormand, Bassolas and Ramasco (2016)](#ref-LBR2016a)). The standardised root mean square error divides the root mean square difference between them by the mean observed flow, and is 0 for a perfect fit; Oshan (2016) reports it among the measures of fit of spatial interaction models ([Oshan (2016)](#ref-Osh2016a)). Both depend on the zones and on how many pairs have small flows, so they compare models fitted to the same data.

## Pairs, Zeros and Intrazonal Flows in Spatial Interaction

Spatial Interaction fits the model to every ordered pair of different zones, with a flow of zero where the source has none, so the model learns where flows are absent as well as where they are large. Flows within a zone are left out, since a zone has no distance to itself measured between centroids. The distance between two zones is the distance between their centroids on the ellipsoid. Pairs whose origin sends nothing or whose destination receives nothing are dropped, as their fixed effect would have no finite estimate. Overdispersion compares the share of zero flows with the share a Poisson model expects.

## References

<a id="ref-Boe2020a"></a>Boehm, J. (2020). GLFixedEffectModels.jl: fast estimation of generalized linear models with high-dimensional fixed effects in Julia. [github.com/jmboehm/GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl)

<a id="ref-Den2012a"></a>Dennett, A. (2012). Estimating flows between geographical locations: get me started in spatial interaction modelling. CASA Working Paper 181, University College London. [ucl.ac.uk/bartlett/casa](https://www.ucl.ac.uk/bartlett/casa/publications/2012/mar/casa-working-paper-181)

<a id="ref-FA1982a"></a>Flowerdew, R. and Aitkin, M. (1982). A method of fitting the gravity model based on the Poisson distribution. *Journal of Regional Science*, 22(2), 191–202. [doi:10.1111/j.1467-9787.1982.tb00744.x](https://doi.org/10.1111/j.1467-9787.1982.tb00744.x)

<a id="ref-LBR2016a"></a>Lenormand, M., Bassolas, A. and Ramasco, J. J. (2016). Systematic comparison of trip distribution laws and models. *Journal of Transport Geography*, 51, 158–169. [doi:10.1016/j.jtrangeo.2015.12.008](https://doi.org/10.1016/j.jtrangeo.2015.12.008)

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

<a id="ref-SST2006a"></a>Santos Silva, J. M. C. and Tenreyro, S. (2006). The log of gravity. *The Review of Economics and Statistics*, 88(4), 641–658. [doi:10.1162/rest.88.4.641](https://doi.org/10.1162/rest.88.4.641)

<a id="ref-Wil1971a"></a>Wilson, A. G. (1971). A family of spatial interaction models, and associated developments. *Environment and Planning A*, 3(1), 1–32. [doi:10.1068/a030001](https://doi.org/10.1068/a030001)

## See Also
- [Overview](overview.md) · [Commuting Data](commuting-data.md) · [Air Traffic Data](air-traffic.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
