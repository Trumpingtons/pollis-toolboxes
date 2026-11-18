# Bayesian Linear Stochastic Discount Factor — Assumptions

A Bayesian linear SDF assumes a pricing structure and a prior, and both influence the conclusions. The prior is not a technicality here: its scale has a direct economic meaning.

## Linearity and the Absence of Arbitrage

The method requires a discount factor linear in the factors, which holds exactly under mean-variance spanning. Excess returns then have zero expected discounted value, so average returns line up with covariances between returns and factors. Time-varying risk prices are not modelled: the sample delivers one constant vector of prices. A model with conditioning information would need scaled factors or another approach. With **Intercept** set to false, the model imposes exact factor pricing with no zero-beta rate, which is the stricter option and usually the one that suits excess returns.

## The Prior on Risk Prices

Under the Normal prior, each risk price has a variance proportional to its factor's squared correlations with the test assets, as in [Bryzgalova, Huang and Julliard (2023)](#ref-BHJ2023a). The design shrinks a factor with little correlation most, which is what stops a useless factor from having an inflated price. A flat prior removes that protection, so its results need caution when a factor might be weak. The scale **psi0** matters: a value that is too small pushes all prices toward zero, and one that is too large implies an implausibly high Sharpe ratio. The package's `psi_to_priorSR` function translates a scale into its implied prior Sharpe ratio.

## Selection Priors

The Spike-and-Slab tabs assume each factor is either relevant or nearly irrelevant, independently, with an inclusion probability that has a Beta prior. Values of 1 for both parameters give a uniform prior on that probability and therefore a prior expecting about half of the factors to enter. Setting **Inclusion Prior (bw)** above **Inclusion Prior (aw)** encodes a belief in sparsity. The narrow spike must remain narrow, so **Spike Ratio (r)** stays close to zero: a value too large blurs the distinction between included and excluded factors and makes all inclusion probabilities tend toward the prior.

## Data Requirements for the Posterior

Factors and test assets must be matrices of excess returns over common periods, in consistent units, and the likelihood treats them as jointly Gaussian and independent over time. Fat tails and conditional heteroskedasticity are common in monthly returns, so the results are best read as a useful approximation rather than an exact posterior. Test assets should have a spread of exposures that can identify the prices; industry and characteristic portfolios used together give more spread than one sort alone. As in any Gaussian likelihood with covariances, the sample should comfortably exceed the number of assets.

## References

<a id="ref-BHJ2023a"></a>Bryzgalova, S., Huang, J. and Julliard, C. (2023). Bayesian Solutions for the Factor Zoo: We Just Ran Two Quadrillion Models. *Journal of Finance* 78(1), 487–557. [doi:10.1111/jofi.13197](https://doi.org/10.1111/jofi.13197)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
