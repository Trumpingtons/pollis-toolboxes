# SEIR

## The SEIR Equations

SEIR adds an exposed compartment for those infected but not yet infectious:

- dS/dt = -beta S I / N
- dE/dt = beta S I / N - sigma E
- dI/dt = sigma E - gamma I
- dR/dt = gamma I

The mean latent period is 1 / sigma. Without births or other deaths, R0 is beta / gamma as in SIR, because latency delays transmission without reducing the number of people each case eventually infects.

## How a Latent Period Changes a Wave

A latent period slows a wave and flattens it. The early growth rate r solves (r + sigma)(r + gamma) = sigma beta, which is smaller than the SIR rate beta - gamma for the same R0. Peak height drops as infections spread over a longer time, and yet the final size does not change, since it depends only on R0. Model Comparison shows the effect side by side.

## Why the Same Growth Rate Implies a Different R0

Fitting early exponential growth with a model that has no latent period makes the generation time too short, and gives too low an R0. Adding the latent period raises the R0 implied by the same growth rate. This is one reason that [Roda, Varughese, Han and Li (2020)](#ref-RVHL2020a) found SIR and SEIR fits to differ so much in their forecasts. The generation time, the sum of the latent and infectious periods in the mean, is what must be right.

## When the Latent Period Can Be Left Out

Latency matters when it is comparable with or longer than the infectious period, and when timing is of interest, as with a measure introduced on a given day. If only the final size is wanted, and R0 is known independently, SIR gives the same answer. Note that latent is not incubation: infectiousness can begin before symptoms, and then the two periods differ.

## References

<a id="ref-RVHL2020a"></a>Roda, W. C., Varughese, M. B., Han, D. and Li, M. Y. (2020). Why is it difficult to accurately predict the COVID-19 epidemic?. *Infectious Disease Modelling* 5, 271–281. [doi:10.1016/j.idm.2020.03.001](https://doi.org/10.1016/j.idm.2020.03.001)

## See Also
- [SIR](sir.md) · [SEIRD](seird.md) · [Assumptions](assumptions.md) · [Interpretation](interpretation.md)
