# Diagnostics

## Reading R-hat and Effective Sample Size for an Epidemic Model

R-hat compares variation between chains with variation within them, and should be near 1. Values above about 1.01 mean that chains disagree ([Vehtari, Gelman, Simpson, Carpenter and Bürkner (2021)](#ref-VGSCB2021a)). Effective sample size counts how many independent draws the correlated chain is worth. In Rt Estimation, the random-walk step size and the first log Rt are the hard parameters to check; in the SIR and SEIR models, the sparks and the distance kernel mix slowly because each update also moves event times.

## What Divergent Transitions Mean in Rt Estimation

A divergence means that the No-U-Turn Sampler met curvature it could not follow, so that some region of the posterior may be missed. A few are a warning, and many invalidate the fit. In a random walk they usually appear when the step size is near zero, which is why the model is written with standardised steps multiplied by the step size. Raising the target acceptance in `NUTS(n_adapts, delta)` is the first remedy ([Hoffman and Gelman (2014)](#ref-HG2014a)).

## Reading Trace Plots in Individual-Level Fits

A healthy trace is a stationary band with no slow drift. In Pathogen.jl, the first iterations often travel far from the starting draw, so that Burn-in should end only after every chain has settled. Chains that sit at different levels mean that the sampler has not explored the event times, and more iterations are needed. A trace that stays flat for long stretches shows rejected proposals, which the tuning of the proposal distribution can correct.

## Checking the Fit Against the Data

A converged chain can still describe the wrong model. The Epidemic Curve action of Rt Estimation draws the observed cases against the band of the one-day-ahead predictions; roughly nine in ten counts should fall inside a 90% band. Counts beyond the band on many days point to overdispersion, which a Poisson likelihood ignores, as [Gabry, Simpson, Vehtari, Betancourt and Gelman (2019)](#ref-GSVBG2019a) discuss for such checks in general.

## Recovering the Truth on Simulated Data

Fitting data simulated from known values is the check that matters most for a new setting. Reproduction Number draws the estimated Rt against the true value, and the true parameters can be compared with the posterior in Parameter Posteriors. An interval that repeatedly misses the truth over several seeds shows a problem in the model or the sampler rather than bad luck.

## References

<a id="ref-GSVBG2019a"></a>Gabry, J., Simpson, D., Vehtari, A., Betancourt, M. and Gelman, A. (2019). Visualization in Bayesian Workflow. *Journal of the Royal Statistical Society Series A* 182(2), 389–402. [doi:10.1111/rssa.12378](https://doi.org/10.1111/rssa.12378)

<a id="ref-HG2014a"></a>Hoffman, M. D. and Gelman, A. (2014). The No-U-Turn Sampler: Adaptively Setting Path Lengths in Hamiltonian Monte Carlo. *Journal of Machine Learning Research* 15(47), 1593–1623. [jmlr.org/papers/v15/hoffman14a.html](https://jmlr.org/papers/v15/hoffman14a.html)

<a id="ref-VGSCB2021a"></a>Vehtari, A., Gelman, A., Simpson, D., Carpenter, B. and Bürkner, P.-C. (2021). Rank-Normalization, Folding, and Localization: An Improved R-hat for Assessing Convergence of MCMC (with Discussion). *Bayesian Analysis* 16(2), 667–718. [doi:10.1214/20-BA1221](https://doi.org/10.1214/20-BA1221)

## See Also
- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Overview](overview.md)
