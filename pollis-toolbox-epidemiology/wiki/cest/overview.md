# Overview

The Contagion Models panel fits three models with Markov chain Monte Carlo. One works from daily case totals; two work from dated events of each person.

## Estimating the Reproduction Number from Daily Cases

The Rt Estimation model uses the renewal equation, in which expected cases today equal the reproduction number times the recent cases weighted by the serial interval ([Cori, Ferguson, Fraser and Cauchemez (2013)](#ref-CFFC2013a)). The log of Rt follows a random walk, fitted with the No-U-Turn Sampler of Turing.jl.

**Inputs**: T (days), Rt Before, Rt After, Change Day, Serial Interval Mean (days), Serial Interval SD (days), NUTS Samples, Chains and Seed. The first three set the simulated data; replacing `cases` with real counts leaves the rest of the code unchanged.

## Fitting an Individual-Level SIR Outbreak

The SIR Inference model tracks each person through susceptible, infectious and removed. The chance of infection depends on a constant background pressure called sparks, and on a distance kernel, a power law that falls as people are further apart. Pathogen.jl alternates between updating the parameters, the true event times and the transmission network ([Angevaare, Feng and Deardon (2022)](#ref-AFD2022a)).

**Inputs**: T (days), N (individuals), MCMC Iterations, Burn-in, Chains and Seed.

## Fitting an Individual-Level SEIR Outbreak

The SEIR Inference model adds a latent state between exposure and infectiousness. Exposure times are never observed, so that each person's exposure is inferred along with the latency rate, the removal rate, the distance kernel and the transmission network. The inputs are those of SIR Inference.

## Common Workflow for an Epidemiological Fit

1. **Run the Example Code** to get a fit on simulated data with a known truth.
2. **Visualise**: Epidemic Curve and Reproduction Number show the fit against what was simulated.
3. **Diagnose**: Trace Plots and R-hat and ESS show whether the chains can be trusted.
4. **Predict**: Forecast continues the outbreak, and Counterfactual asks what a different course would have given.
5. **Compare**: Model Comparison and Sensitivity show how much the conclusions depend on the model and the priors.
6. **Interpret**: Parameter Posteriors and Growth and Transmission turn draws into statements.

## References

<a id="ref-AFD2022a"></a>Angevaare, J., Feng, Z. and Deardon, R. (2022). Pathogen.jl: Infectious Disease Transmission Network Modeling with Julia. *Journal of Statistical Software* 104(4). [doi:10.18637/jss.v104.i04](https://doi.org/10.18637/jss.v104.i04)

<a id="ref-CFFC2013a"></a>Cori, A., Ferguson, N. M., Fraser, C. and Cauchemez, S. (2013). A New Framework and Software to Estimate Time-Varying Reproduction Numbers During Epidemics. *American Journal of Epidemiology* 178(9), 1505–1512. [doi:10.1093/aje/kwt133](https://doi.org/10.1093/aje/kwt133)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Rt Estimation](rt.md) · [SIR Inference](sir.md) · [SEIR Inference](seir.md)
