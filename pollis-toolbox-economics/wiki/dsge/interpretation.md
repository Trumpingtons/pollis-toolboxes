# Dynamic Stochastic General Equilibrium (DSGE) — Interpretation

Each interpretation action uses the structure of the model, so each result is conditional on that model being adequate.

## Reading Impulse Responses

**Impulse Response Plot** shows the response of every variable to every shock, each measured as a deviation from the steady state. The sign shows the direction of the mechanism, and the shape shows propagation: hump-shaped responses come from real or nominal frictions, and monotone ones come mainly from an autoregressive shock. Responses from a calibrated model carry no uncertainty bands. To get bands, responses must be computed at posterior draws. With higher-order solutions, responses also depend on the size and sign of the shock, so a single path no longer summarises them.

## Reading Variance Decompositions

**Variance Decomposition** gives the fraction of each variable's variance explained by each structural shock, on the first-order solution. **Variance Decomposition Plot** shows the same split by horizon, which often changes substantially: demand shocks may dominate early and technology shocks later. These shares tell how the model accounts for fluctuations rather than what caused them in reality, and a model with an extra shock will reassign variance to it. [Smets and Wouters (2007)](#ref-SW2007a) is a well-known case where such shares led to a widely discussed account of US business cycles.

## Reading the Shock Decomposition

**Shock Decomposition** splits observed fluctuations around the steady state into the contribution of each smoothed structural shock and of the initial state. The result is a narrative of the sample: how much of a recession the model attributes to each shock. Components add up to the observed deviation by construction, so good bookkeeping is no evidence that the story is right. Decompose at estimated parameter values, since calibrated values give a different story. Large and persistent contributions from one shock can show that this shock is standing in for something missing.

## Reading Simulations and Conditional Forecasts

**Simulate** draws a fresh path of 100 periods with random shocks, showing what a typical sample from the model looks like. **Conditional Forecast** makes the first observable follow a set path for four quarters, choosing the shocks that deliver the path, and reports where the rest of the system goes. Reading the implied shocks is as useful as reading the forecast: a path requiring large shocks is unlikely under the model. [Negro and Schorfheide (2013)](#ref-NS2013a) survey forecasting with these models, including conditioning on external information.

## References

<a id="ref-NS2013a"></a>Del Negro, M. and Schorfheide, F. (2013). DSGE Model-Based Forecasting. *Handbook of Economic Forecasting*, 57–140. [doi:10.1016/B978-0-444-53683-9.00002-5](https://doi.org/10.1016/B978-0-444-53683-9.00002-5)

<a id="ref-SW2007a"></a>Smets, F. and Wouters, R. (2007). Shocks and frictions in US business cycles: A Bayesian DSGE approach. *American Economic Review* 97(3), 586–606. [doi:10.1257/aer.97.3.586](https://doi.org/10.1257/aer.97.3.586)

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
