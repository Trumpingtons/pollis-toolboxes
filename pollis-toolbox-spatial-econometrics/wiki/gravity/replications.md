# Replications

## The Austrian Migration Data of Dennett and Oshan

Dennett (2012) introduces spatial interaction modelling with the migration between the nine NUTS-2 regions of Austria, with each region's total outflow and inflow and the distances between the regions ([Dennett (2012)](#ref-Den2012a)). Oshan (2016) uses the same data in his primer on spint, PySAL's module for spatial interaction models, to fit the unconstrained, production-constrained, attraction-constrained and doubly constrained models as Poisson regressions with exponential distance decay, leaving out the flows within a region ([Oshan (2016)](#ref-Osh2016a)). PollisDatasets.jl holds the data as `austria_migration`, and the regions' outlines as the file `austria_nuts2.gpkg`.

## What the Replication Step Prints

| Block | Published values |
|---|---|
| Oshan's primer: coefficients | The coefficients of the four models |
| Oshan's primer: fit | The pseudo R-squared, adjusted pseudo R-squared, AIC, SRMSE and Sørensen similarity index of each |
| spint's tests: coefficients and standard errors | The coefficients and their model-based standard errors |
| spint's tests: deviance and log-likelihood | The deviance and log-likelihood of each model |

The Austrian Migration: spint step fits the four models with `nlreg` of GLFixedEffectModels.jl and prints each value beside the published one, with their difference ([Boehm (2020)](#ref-Boe2020a); [Oshan (2016)](#ref-Osh2016a)).

## spint's Tests and Their Totals

spint's tests fit the same flows and distances, with origin and destination totals of their own in place of those of the primer, for the unconstrained, production-constrained and attraction-constrained models ([Oshan (2016)](#ref-Osh2016a)). The replication step builds those totals in Julia for the three models that use them; the doubly constrained model uses no totals, so the primer's and the tests' fits are the same. The step compares the standard errors of the tests, which are model-based, as spint reports them.

## The Intercept of the Unconstrained Model

`nlreg` of GLFixedEffectModels.jl estimates models with one or more sets of fixed effects ([Boehm (2020)](#ref-Boe2020a)). The panel fits the Unconstrained model with one effect shared by every flow, which is the intercept, so that the four models go through the same function. The replication step reads the intercept from that effect and computes the model-based standard errors of the Unconstrained model, the intercept's included, from the information matrix of the Poisson model, to set them beside those of spint's tests ([Oshan (2016)](#ref-Osh2016a)).

## References

<a id="ref-Boe2020a"></a>Boehm, J. (2020). GLFixedEffectModels.jl: fast estimation of generalized linear models with high-dimensional fixed effects in Julia. [github.com/jmboehm/GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl)

<a id="ref-Den2012a"></a>Dennett, A. (2012). Estimating flows between geographical locations: get me started in spatial interaction modelling. CASA Working Paper 181, University College London. [ucl.ac.uk/bartlett/casa](https://www.ucl.ac.uk/bartlett/casa/publications/2012/mar/casa-working-paper-181)

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

## See Also
- [Factsheet](factsheet.md) · [Goodness of Fit](goodness-of-fit.md) · [Doubly Constrained](doubly.md)
