# SIR

## The SIR Model on a Network

In SIR on a network, a susceptible person is infected on a given day with probability 1 - (1 - p)^m, where m is the number of infectious contacts and p the daily chance over an edge. An infectious person recovers with daily probability gamma, and stays immune. The rate p is set from Basic R and Mean Contacts. The contrast with the well-mixed model is that a case can only reach its own neighbours, some of whom may no longer be susceptible.

## Transmissibility and Final Size

Over the whole infectious period, an infectious person passes infection over a given edge with probability T = p / (p + gamma - p gamma) when steps are daily. Each edge can then be treated as open with probability T, which maps the epidemic to bond percolation: the final size is the largest connected cluster of open edges ([Newman (2002)](#ref-New2002a)). With G0 and G1 the generating functions of contacts and excess contacts, u solves u = 1 - T + T G1(u), and the final share infected is 1 - G0(u).

## Why Network Structure Changes the Final Size

Hubs are soon infected and then removed, which disconnects the rest of the network, and this can keep a final size low even with a high reproduction number. Random graphs with the same mean contacts often reach a higher final size. Next Steps > Compare Networks sets the four network types side by side, with one infection and the same mean contacts. A higher reproduction number therefore does not necessarily mean more people infected in the end.

## Comparing Vaccination Strategies on a Network

Next Steps > Compare Vaccination Strategies removes one person in five, either at random or those with the most contacts first. The difference depends on how unequal contacts are: on a regular network there is none, and on a scale-free network it is large. Other measures of a person's importance, including how central in the network core they are, can give better targets than the number of contacts ([Kitsak, Gallos, Havlin, Liljeros, Muchnik, Stanley and Makse (2010)](#ref-KGHLM...2010a)).

## References

<a id="ref-KGHLM...2010a"></a>Kitsak, M., Gallos, L. K., Havlin, S., Liljeros, F., Muchnik, L., Stanley, H. E. and Makse, H. A. (2010). Identification of influential spreaders in complex networks. *Nature Physics* 6(11), 888–893. [doi:10.1038/nphys1746](https://doi.org/10.1038/nphys1746)

<a id="ref-New2002a"></a>Newman, M. E. J. (2002). Spread of epidemic disease on networks. *Physical Review E* 66(1), 016128. [doi:10.1103/PhysRevE.66.016128](https://doi.org/10.1103/PhysRevE.66.016128)

## See Also
- [SEIR](seir.md) · [Continuous Time](continuous.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
