# Fama-MacBeth Regression — Factsheet

The Fama-MacBeth Regression panel estimates how much each factor is rewarded in the cross-section of asset returns, in two steps: betas from time-series regressions, then risk premia from a cross-sectional regression of average returns on those betas. BayesianFactorZoo.jl provides both the classical estimator and a Bayesian version that stays honest about weak factors.

| | |
|---|---|
| **Purpose** | Estimate factor risk premia and the pricing errors of test assets |
| **Julia stack** | BayesianFactorZoo.jl, with Distributions.jl and FamaFrenchData.jl for inputs |
| **Models** | Bayesian (`BayesianFM`), Classical (`TwoPassRegression`) |
| **Output** | Risk premia with intervals, pricing errors, adjusted R2, implied expected returns |
| **Key choice** | Classical or Bayesian inference, and OLS or GLS in the cross-section |

## When to Use a Fama-MacBeth Regression

A two-pass regression answers a specific question: across a set of assets, do those with larger exposure to a factor earn higher average returns, and by how much per unit of exposure? It requires factor returns and returns on a set of test assets over the same periods, usually portfolios sorted on characteristics, because portfolios have more stable betas than single stocks. The method applies to monthly or annual data on many assets and few factors. Long samples are valuable, since average returns are estimated with considerable noise.

## What a Two-Pass Regression Does Not Tell You

A significant risk premium does not establish that a factor causes returns, and the factor could be proxying for something else. The result also depends heavily on the test assets: portfolios sorted on size and value have a strong factor structure, so almost any factor correlated with that structure can produce a high R2. A two-pass regression is not a tool for selecting among many candidate factors. For that purpose, the panel on Bayesian Linear Stochastic Discount Factor models handles a whole zoo of candidates with explicit inclusion probabilities.

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
