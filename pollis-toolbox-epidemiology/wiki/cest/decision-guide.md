# Decision Guide

| Situation | Model |
|---|---|
| Daily case counts and a known serial interval | **Rt Estimation** |
| Dated individual records, lasting immunity, and short or no latency | **SIR Inference** |
| Dated individual records and a latent period that matters | **SEIR Inference** |
| Contacts known by name, with test results | The Inference on Contact Networks panel |
| Rates assumed, and the course of an epidemic wanted | The Compartmental Models panel |

## Choosing Between Counts and Individual Records

Counts are available early and scale to whole countries, and they answer questions about transmission over time. Individual records are expensive and need a small and well-observed population, such as a farm, a ward or a village, and in return they say who infected whom and how distance matters. The cost grows quickly with the number of people, so that the individual models suit up to a few hundred.

## Choosing Between SIR and SEIR Inference

A latent period moves infectiousness later and spreads out the time between generations. Leaving it out when it is real shifts the estimates of transmission and removal to make up for it. Next Steps > Model Comparison fits the other model to the same data, and is the direct way to see whether the choice changes any conclusion. SEIR Inference takes longer, because every exposure time is an extra unknown.

## Rules of Thumb for Epidemiological Fits

- **Delays**: remove reporting delays from counts before fitting Rt, or read the curve as lagging.
- **Serial interval**: report results for a plausible range, not for one mean.
- **Chains**: four chains, and R-hat and effective sample size checked before anything is read.
- **Priors**: compare with wider priors whenever an outbreak has few cases.
- **Claims of control**: read from the probability of Rt above 1, not from a median.

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md)
