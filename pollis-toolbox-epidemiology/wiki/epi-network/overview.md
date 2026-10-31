# Overview

The Epidemics on Networks panel runs each model on a network built with Graphs.jl, and uses GraphEpidemics.jl for the simulation. All tabs share the network inputs.

## What the Network Inputs Mean

**Network** chooses the type: Random (Erdős–Rényi), Scale-Free ([Barabási and Albert (1999)](#ref-BA1999a)), Small-World ([Watts and Strogatz (1998)](#ref-WS1998a)) or Regular. **People** is the number of nodes. **Mean Contacts** is the mean number of edges per person. **Basic R** sets the infection rate as R x recovery / mean contacts, which ignores the shape of the network. **Recovery per Day** is the daily chance of recovering, and its inverse the mean infectious period. **First Cases** are chosen at random.

## The Four Tabs of the Network Panel

| Tab | Added inputs | What it adds |
|---|---|---|
| SIR | None | Lasting immunity; final size and vaccination |
| SEIR | End of Latency per Day, Infectiousness, Gamma Shape | A latent period, and people unequally infectious |
| SIS and SIRS | Immunity, Loss of Immunity per Day, Days | Reinfection and an endemic level |
| Continuous Time | None | Event-by-event simulation with rates |

## Common Workflow for a Network Epidemic

1. **Pick a network** and run SIR with Basic R as a first look.
2. **Check the network**: Contacts per Person and Reproduction Number of the Network.
3. **Diagnose**: Against Theory and Effective R Over Time.
4. **Repeat the simulation**: Many Epidemics shows what chance alone changes.
5. **Compare**: networks, vaccination strategies, latency and infectiousness.
6. **Interpret**: Who Gets Infected and Secondary Cases.

## References

<a id="ref-BA1999a"></a>Barabási, A.-L. and Albert, R. (1999). Emergence of Scaling in Random Networks. *Science* 286(5439), 509–512. [doi:10.1126/science.286.5439.509](https://doi.org/10.1126/science.286.5439.509)

<a id="ref-WS1998a"></a>Watts, D. J. and Strogatz, S. H. (1998). Collective dynamics of small-world networks. *Nature* 393(6684), 440–442. [doi:10.1038/30918](https://doi.org/10.1038/30918)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [SIR](sir.md) · [SEIR](seir.md) · [SIS and SIRS](recurring.md) · [Continuous Time](continuous.md)
