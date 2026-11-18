# Fama-MacBeth Regression — Assumptions

Two-pass inference rests on a linear pricing model and on betas strong enough to identify the premia. The second condition is the one most often overlooked.

## Linear Factor Pricing and Constant Betas

The model states that expected excess returns are linear in betas, with the same premium for all assets, and that the betas stay constant over the sample. Time-varying exposures, which are common for portfolios whose composition changes, leave a misspecification that a high R2 can hide. Rolling first-pass estimates are one remedy, but they are outside this panel. A systematic non-zero average pricing error suggests that the factor set is incomplete. Non-linear payoffs, such as those of options, do not fit a linear beta representation and would need a different model.

## Identification and Useless Factors

A factor's premium can only be identified if assets differ in their exposure to it. [Kan and Zhang (1999)](#ref-KZ1999a) showed that a factor uncorrelated with the test assets, a useless factor, can appear strongly significant in a two-pass regression, and that the problem gets worse as the sample grows. That failure is not a small-sample issue: the t-statistic diverges and a conventional test will falsely reject. Weak factors, with small but non-zero betas, behave similarly. The Bayesian tab addresses that failure by reporting a diffuse posterior, which is why the **Weak Factor Check** should precede any reading of the premia.

## Errors in Variables and Return Distributions

Estimated betas enter the second pass as if observed, so standard errors need adjustment. The correction of [Shanken (1992)](#ref-Sha1992a) takes residuals as homoskedastic and serially uncorrelated given the factors, and it scales the variance by a term depending on the squared Sharpe ratio of the factors. Fat tails and conditional heteroskedasticity, both typical of monthly returns, weaken those conditions, though the correction stays useful in practice. The Bayesian posterior assumes Gaussian returns. Its treatment of beta uncertainty does not need the first-order approximation, but it still inherits that distributional assumption.

## Number of Assets, Factors and Periods

The sample must have more periods than test assets for the residual covariance to be invertible, which GLS needs. When N is close to T the estimated covariance is noisy and GLS results become unstable, so a large panel of assets with a short sample calls for OLS. There must also be more assets than factors for the cross-sectional regression to be estimated at all, and at least a few more for pricing errors to carry any meaning. Sorted portfolios serve as test assets partly for that reason, since they reduce noise and keep N small.

## References

<a id="ref-KZ1999a"></a>Kan, R. and Zhang, C. (1999). Two-Pass Tests of Asset Pricing Models with Useless Factors. *Journal of Finance* 54(1), 203–235. [doi:10.1111/0022-1082.00102](https://doi.org/10.1111/0022-1082.00102)

<a id="ref-Sha1992a"></a>Shanken, J. (1992). On the Estimation of Beta-Pricing Models. *Review of Financial Studies* 5(1), 1–33. [doi:10.1093/rfs/5.1.1](https://doi.org/10.1093/rfs/5.1.1)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
