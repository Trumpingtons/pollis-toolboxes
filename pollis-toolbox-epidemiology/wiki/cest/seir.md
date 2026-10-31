# SEIR Inference

## What the Exposed State Adds to an Individual-Level Model

An SEIR outbreak separates the moment a person is infected from the moment that person can infect others. An exposed person becomes infectious at a constant latency rate, then is removed at a constant removal rate. Compared with SIR Inference, the risk functions gain a rate, and the mean latent period is 1 / latency rate. Keeling and Rohani's textbook treats how the latent period changes the speed of a wave but not its threshold ([Keeling and Rohani (2008)](#ref-KR2008a)).

## Why Exposure Times Are the Hard Part

Exposure leaves no record, so that a person's exposure time is limited only by a long `EventExtents` window before onset. Every exposure time is sampled, and an exposure can only be attributed to someone infectious at that moment, which ties the latency rate and the transmission network closely together. The chain therefore mixes more slowly than in SIR Inference and usually needs more iterations and a longer Burn-in.

## How Latency Is Identified, and When It Is Not

The latency rate is informed by the gaps between the onset of a likely source and the onsets of those it infected. In an outbreak of few cases, or with sources that overlap in time, those gaps are ambiguous, so that latency and infectious period trade off: a longer latent period with shorter infectiousness can produce the same timing. A joint plot of the two rates shows the ridge. Prior knowledge of the incubation period, when available, is worth encoding in the prior.

## Comparing an SEIR Fit with an SIR Fit

Next Steps > Model Comparison fits the other model to the same data and compares the epidemic curves and parameters. A wider posterior for the removal rate is the common sign that latency is being confused with infectiousness. [Gelman, Carlin, Stern, Dunson, Vehtari and Rubin (2013)](#ref-GCSDV...2013a) give the general tools for such a comparison. Fit quality is not everything: the choice should also follow what is known of the disease.

## References

<a id="ref-GCSDV...2013a"></a>Gelman, A., Carlin, J. B., Stern, H. S., Dunson, D. B., Vehtari, A. and Rubin, D. B. (2013). *Bayesian Data Analysis*. Chapman and Hall / CRC (3rd ed.).

<a id="ref-KR2008a"></a>Keeling, M. J. and Rohani, P. (2008). *Modeling Infectious Diseases in Humans and Animals*. Princeton University Press. [doi:10.1515/9781400841035](https://doi.org/10.1515/9781400841035)

## See Also
- [SIR Inference](sir.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Decision Guide](decision-guide.md)
