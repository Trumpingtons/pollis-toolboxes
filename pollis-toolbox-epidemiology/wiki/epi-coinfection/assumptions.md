# Assumptions

## What Even Mixing Assumes in a Coinfection Model

Every host can catch a strain from any infected host, with no space or social structure. Coinfection then arises only from timing and from the interactions. In real populations, hosts differ in exposure and susceptibility, so that strains are found together more than chance would suggest with no interaction at all. Reading such a result as an interaction would be an error that this simulation cannot show, since its hosts do not differ.

## How an Interaction Enters the Chance of Infection

Each strain the host already carries multiplies the chance of catching the new strain by the matching entry of the interaction matrix. Effects of several carried strains therefore multiply together. The form is simple and stated, while real mechanisms act through resources or immunity ([Graham (2008)](#ref-Gra2008a)), and can depend on doses and timing, so that a single constant per pair of strains is an approximation.

## What Stays Unchanged in an Interaction

Interactions change susceptibility only, in the sense of who catches what. Recovery, mortality and infectiousness of a coinfected host are the same as those of a host with one strain. Many real coinfections change exactly those, as well as how long a host stays infectious. A separate model would be needed to study them, or a change to the panel's code where the package allows it.

## Which Two Forms of Transmission Are Offered

Transmission is frequency-dependent or density-dependent. Frequency-dependent gives each susceptible host a chance of transmission x infected / hosts, so what counts is the share of hosts infected. Density-dependent gives transmission x infected, so the chance also rises with the number of hosts, and the transmission is per infected host. The panel divides Transmission by the starting number of hosts under Density-Dependent, so the two kinds agree at the start and part only as births and deaths change the number of hosts.

## What the Host Population Assumes

Births add susceptible hosts from a set age of maturity, and deaths remove hosts from a background chance and from disease. New hosts are susceptible to every strain. Long runs then keep supplying susceptible hosts, whereas a short run hardly feels them. The host population is free to drift or even collapse, which is worth checking with Next Steps > Hosts Over Time before reading any strain's course.

## References

<a id="ref-Gra2008a"></a>Graham, A. L. (2008). Ecological rules governing helminth–microparasite coinfection. *Proceedings of the National Academy of Sciences* 105(2), 566–570. [doi:10.1073/pnas.0707221105](https://doi.org/10.1073/pnas.0707221105)

## See Also
- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
