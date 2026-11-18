# Fama-MacBeth Regression — Overview

Both tabs share the same input matrices and the same pricing equation: the expected excess return of asset i equals its betas multiplied by the risk premia. The tabs differ in how they carry the uncertainty of the first step into the second.

## The Two Passes of the Classical Tab

The **Classical** tab calls `TwoPassRegression`, which follows [Fama and MacBeth (1973)](#ref-FM1973a) in spirit. The first pass regresses each column of **Test Asset Returns (R)** on **Factor Returns (f)** to obtain betas. The second pass regresses mean returns on those betas across assets to obtain risk premia. Because the betas are estimates, the second step has an errors-in-variables problem; the correction of [Shanken (1992)](#ref-Sha1992a) inflates the standard errors accordingly. The **Cross-Sectional Estimator** input picks OLS, with equal weights, or GLS, with weights from the inverse of the residual covariance.

## The Posterior of the Bayesian Tab

The **Bayesian** tab calls `BayesianFM`, the estimator of [Bryzgalova, Huang and Julliard (2023)](#ref-BHJ2023a). It places flat priors on the means and covariances of factors and test assets, draws those moments from their posterior, and re-runs the cross-sectional regression on each draw. **Posterior Draws** sets the number of draws. Each draw is independent, not part of a Markov chain, so no burn-in or convergence check is needed. Risk premia come out as a full distribution that reflects uncertainty about betas without any first-order approximation, and weak identification shows up directly as a wide posterior.

## Common Workflow for a Two-Pass Analysis

1. Supply **Factor Returns (f)** and **Test Asset Returns (R)** as matrices with the same rows, in percent.
2. Start with **Weak Factor Check**, which asks if any test asset loads on each factor at all.
3. See the premia with **Risk Premium Uncertainty** and **Interval Estimates**.
4. Judge fit with **Pricing Plot** and **Pricing Errors**.
5. Compare approaches with **Bayesian vs Classical** and **OLS vs GLS**.
6. Read the result in terms of assets through **Implied Expected Returns** and **Expected Return Bands**.

## References

<a id="ref-BHJ2023a"></a>Bryzgalova, S., Huang, J. and Julliard, C. (2023). Bayesian Solutions for the Factor Zoo: We Just Ran Two Quadrillion Models. *Journal of Finance* 78(1), 487–557. [doi:10.1111/jofi.13197](https://doi.org/10.1111/jofi.13197)

<a id="ref-FM1973a"></a>Fama, E. F. and MacBeth, J. D. (1973). Risk, Return, and Equilibrium: Empirical Tests. *Journal of Political Economy* 81(3), 607–636. [doi:10.1086/260061](https://doi.org/10.1086/260061)

<a id="ref-Sha1992a"></a>Shanken, J. (1992). On the Estimation of Beta-Pricing Models. *Review of Financial Studies* 5(1), 1–33. [doi:10.1093/rfs/5.1.1](https://doi.org/10.1093/rfs/5.1.1)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
