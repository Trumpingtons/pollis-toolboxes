# Bayesian Linear Stochastic Discount Factor — Overview

The discount factor has the form M(t) = 1 - b' (f(t) - E[f]), which implies that expected excess returns are linear in the covariances of returns with factors. Each tab estimates the coefficients, reported as risk prices lambda, under a different prior.

## The Bayesian SDF Tab

The **Bayesian SDF** tab calls `BayesianSDF` with a choice of **Prior**. The flat option leaves risk prices uninformed, and its posterior can be misleadingly tight on a weak factor. The Normal option shrinks each price toward zero, more strongly for a factor that correlates little with the test assets, and **psi0** sets the prior's scale, with higher values making it more diffuse. **Intercept** decides whether a common zero-beta rate enters the cross-sectional equation. The output includes the posterior of the cross-sectional R2, shown under **Factor Relevance**.

## The Spike-and-Slab Tab

The **Spike-and-Slab** tab calls `continuous_ss_sdf`, which adds a selection step for each factor. Each risk price comes either from a narrow spike around zero or from a wider slab, and **Spike Ratio (r)** sets the relative variance of the spike. **Inclusion Prior (aw)** and **Inclusion Prior (bw)** set a Beta prior on the probability of inclusion, with the value 1 for both giving a uniform prior. Here **psi0** is the slab scale, which maps to a prior belief about the Sharpe ratio that the factors can achieve. Posterior averaging over all factor combinations avoids picking one model.

## The Spike-and-Slab (Traded) Tab

The **Spike-and-Slab (Traded)** tab calls `continuous_ss_sdf_v2`. **Tradable factor indices (t_factors)** lists the columns of the factor matrix that are returns on traded portfolios. Those factors also act as test assets, so their own mean returns must be priced by the model. The extra restriction adds information and disciplines the estimates for traded factors. Non-traded factors, such as a consumption or an inflation shock, are left out of the list because their means are not returns that the model must explain.

## Common Workflow for a Bayesian SDF

1. Provide the factor and test asset matrices under **Data**, and set **MCMC draws** and **Burn-in**.
2. Check the chains with **Trace Plots** and **Effective Sample Size**.
3. See which factors matter with **Risk Price Posteriors**, **Factor Relevance** and **Which Factors Are Priced**.
4. Read the sizes in **Risk Price Table** and in **SDF Sharpe Ratio**.
5. Test the fit with **Fitted Sharpe Ratios**.
6. Vary the prior through **Against the Other Prior** and compare with **Against Two-Pass Regression**.

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
