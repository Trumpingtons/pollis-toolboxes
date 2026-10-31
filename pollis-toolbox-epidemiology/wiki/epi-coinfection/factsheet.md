# Coinfection — Factsheet

Coinfection models follow several strains or pathogens in one host population, where carrying one changes the chance of catching another. The simulation is individual-based and stochastic, using CoinfectionSimulator.jl ([Pilowsky (2025)](#ref-Pil2025a)), so that each host has a state for each strain.

| | |
|---|---|
| **Purpose** | What interactions between strains change: peaks, persistence, coinfection levels, and what a survey can detect |
| **Input** | A disease model applied to every strain, rates, an interaction matrix, host births and deaths, and sampling settings |
| **Core packages** | CoinfectionSimulator.jl |
| **Models** | Two Strains, Strain Community, Detection |
| **Output** | Each host's state for each strain by time step, with counts infected and coinfected, and detections from a survey |
| **Key choice** | Whether one known interaction is at stake, or many unknown ones described by their strength and sign |

## When to Use a Coinfection Simulation

A coinfection simulation suits questions about mechanism: does facilitation raise coinfection above chance, does the order of arrival matter, how many strains persist under a given mix of competition and facilitation, and how much a survey with imperfect tests can tell. Interactions between parasites are often strong in natural populations, as field studies show ([Telfer, Lambin, Birtles, Beldomenico, Burthe, Paterson and Begon (2010)](#ref-TLBBB...2010a)).

## What a Coinfection Simulation Is Not

Coinfection simulations here do not estimate interactions from data. Doing so is hard, even with long time series ([Shrestha, King and Rohani (2011)](#ref-SKR2011a)). Hosts also mix evenly, with no space or contact structure, and strains do not evolve. Strains in this panel have the same disease model, while real interacting pathogens can differ in their natural history.

## References

<a id="ref-Pil2025a"></a>Pilowsky, J. (2025). CoinfectionSimulator.jl: A Julia package for multi-strain coinfection dynamics. *GitHub*. [github.com/japilo/CoinfectionSimulator.jl](https://github.com/japilo/CoinfectionSimulator.jl)

<a id="ref-SKR2011a"></a>Shrestha, S., King, A. A. and Rohani, P. (2011). Statistical Inference for Multi-Pathogen Systems. *PLoS Computational Biology* 7(8), e1002135. [doi:10.1371/journal.pcbi.1002135](https://doi.org/10.1371/journal.pcbi.1002135)

<a id="ref-TLBBB...2010a"></a>Telfer, S., Lambin, X., Birtles, R., Beldomenico, P., Burthe, S., Paterson, S. and Begon, M. (2010). Species Interactions in a Parasite Community Drive Infection Risk in a Wildlife Population. *Science* 330(6001), 243–246. [doi:10.1126/science.1190333](https://doi.org/10.1126/science.1190333)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
