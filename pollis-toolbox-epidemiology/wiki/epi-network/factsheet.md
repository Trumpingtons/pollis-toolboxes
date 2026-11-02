# Epidemics on Networks — Factsheet

Network epidemic models make each person a node and each contact an edge, and pass infection along edges with chance deciding each step. The result shows what the structure of contacts changes, and what a well-mixed model cannot say.

| | |
|---|---|
| **Purpose** | What a contact network does to an epidemic: threshold, size, who is infected and which targeted measures work |
| **Input** | A network type, People, Mean Contacts, Basic R and the daily rates of each model |
| **Core packages** | GraphEpidemics.jl, Graphs.jl, Distributions.jl |
| **Models** | SIR, SEIR, SIS and SIRS, Continuous Time |
| **Output** | Each person's state over time, with epidemic curves, final sizes, the network's own reproduction number and who infected whom |
| **Key choice** | The shape of the network, and above all how unequal contact numbers are |

## When to Use a Network Epidemic Model

A network model suits questions where who meets whom is the point: vaccination aimed at people with many contacts, the effect of hubs on the threshold, or a difference between random and clustered contacts. Reviews of the field are in [Keeling and Eames (2005)](#ref-KE2005a) and [Pastor-Satorras, Castellano, Van Mieghem and Vespignani (2015)](#ref-PCMV2015a), and the textbook treatment is [Kiss, Miller and Simon (2017)](#ref-KMS2017a).

## What a Network Epidemic Model Is Not

A network model here is a simulation on an assumed graph, and does not estimate anything from data. The graph stays fixed through the run, whereas real contacts change from day to day. For inference from contacts and tests, use the Inference on Contact Networks panel. The panel's four network types are stylised; they show effects of structure rather than describe any actual population.

## References

<a id="ref-KE2005a"></a>Keeling, M. J. and Eames, K. T. D. (2005). Networks and epidemic models. *Journal of the Royal Society Interface* 2(4), 295–307. [doi:10.1098/rsif.2005.0051](https://doi.org/10.1098/rsif.2005.0051)

<a id="ref-KMS2017a"></a>Kiss, I. Z., Miller, J. C. and Simon, P. L. (2017). *Mathematics of Epidemics on Networks: From Exact to Approximate Models*. Springer. [doi:10.1007/978-3-319-50806-1](https://doi.org/10.1007/978-3-319-50806-1)

<a id="ref-PCMV2015a"></a>Pastor-Satorras, R., Castellano, C., Van Mieghem, P. and Vespignani, A. (2015). Epidemic processes in complex networks. *Reviews of Modern Physics* 87(3), 925–979. [doi:10.1103/RevModPhys.87.925](https://doi.org/10.1103/RevModPhys.87.925)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
