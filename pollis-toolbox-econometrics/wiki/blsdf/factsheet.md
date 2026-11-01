# Bayesian Linear Stochastic Discount Factor — Factsheet

The Bayesian Linear Stochastic Discount Factor panel prices test assets with a discount factor that is linear in candidate factors, and it estimates by Bayesian methods which of those factors matter. It implements the approach of [Bryzgalova, Huang and Julliard (2023)](#ref-BHJ2023a) through BayesianFactorZoo.jl, whose priors keep weak factors from looking important.

| | |
|---|---|
| **Purpose** | Estimate risk prices and select among many candidate factors, weak ones included |
| **Julia stack** | BayesianFactorZoo.jl, with Plots.jl and StatsBase.jl for the actions |
| **Models** | Bayesian SDF (`BayesianSDF`), Spike-and-Slab (`continuous_ss_sdf`), Spike-and-Slab (Traded) (`continuous_ss_sdf_v2`) |
| **Output** | Posterior risk prices, inclusion probabilities, cross-sectional R2, the maximum Sharpe ratio |
| **Key choice** | A prior for shrinkage or for selection, and whether some factors are traded |

## When to Use a Bayesian Linear SDF

A Bayesian linear discount factor fits when a literature offers many candidate factors and the question is which of them price assets, jointly and with honest uncertainty. The inputs are a matrix of factor returns and a matrix of test asset returns over common periods. Testing candidates one at a time inflates false discoveries and ignores correlation between factors; a joint posterior avoids both failures. Several thousand MCMC draws are quick to run for a dozen factors, so a sensible prior sensitivity analysis is affordable.

## What a Linear SDF Does Not Do

The model describes prices with a linear function of the chosen factors, and it cannot find a factor that is not in the candidate list. Non-linear pricing kernels are out of scope. A high inclusion probability means the data support the factor in the cross-section of those test assets, under that prior, and it is not a causal claim. Inclusion probabilities also spread across highly correlated factors, so several factors with moderate probabilities may represent one underlying risk. The output describes average pricing, not a timing signal for portfolio decisions.

## References

<a id="ref-BHJ2023a"></a>Bryzgalova, S., Huang, J. and Julliard, C. (2023). Bayesian Solutions for the Factor Zoo: We Just Ran Two Quadrillion Models. *Journal of Finance* 78(1), 487–557. [doi:10.1111/jofi.13197](https://doi.org/10.1111/jofi.13197)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
