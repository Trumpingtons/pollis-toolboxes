# Network Measures

## Degree, Intersections and Dead Ends

The degree of a node is the number of other nodes it is linked to by a street, in either direction. Network Measures counts as intersections the nodes of degree three or more, and as dead ends those of degree one; a node of degree two lies along a street, at a bend or where two ways meet. It gives the intersections per square kilometre of the Area, the mean number of links per node, and the connected parts of the network, with the share of the nodes in the largest. Boeing used such measures, among them the average node degree and the proportions of four-way intersections and dead ends, to compare the street networks of 100 cities ([Boeing (2019)](#ref-Boe2019a)).

## Betweenness Centrality

Freeman defined the betweenness of a point as the degree to which it falls on the shortest paths between other points, and so has a potential for control of communication ([Freeman (1977)](#ref-Fre1977a)). Brandes gave faster algorithms to compute it on large and sparse networks, in time proportional to the number of nodes times the number of links, more for weighted networks ([Brandes (2001)](#ref-Bra2001a)). Graphs.jl follows Brandes, and normalises the betweenness of a node of a directed graph by the number of pairs of other nodes ([Fairbanks, Besançon, Schölly, Hoffimann, Eubank and Karpinski (2021)](#ref-FBSHE...2021a)). Network Measures computes it on the fastest paths of the Mode, and gives each segment the mean of the betweenness of its two ends.

## Estimating Betweenness from a Sample of Nodes

Betweenness from every node needs a shortest-path search from each, which is slow on the network of a city. Graphs.jl can compute it from a random subset of the nodes as sources ([Fairbanks, Besançon, Schölly, Hoffimann, Eubank and Karpinski (2021)](#ref-FBSHE...2021a)): Betweenness Sample sets 200 or 500 nodes, drawn with the seed 1 so that a second run gives the same values, or All Nodes for the exact betweenness. The sample gives an estimate of which nodes and streets carry the most fastest paths. Most Central Streets lists the named streets of 100 m or more with the highest betweenness, weighted by length.

## Street Orientation and Entropy

Boeing measured the order of street networks by the entropy of the compass bearings of their streets, in 36 bins of 10 degrees, weighted by length, and developed an indicator of orientation order that quantifies how closely a network follows the geometric logic of a single grid ([Boeing (2019)](#ref-Boe2019a)). Across 100 cities, United States and Canadian sites were on average far more grid-like than those elsewhere. Street Orientation draws the bearings of the streets of the Mode as a polar chart, counting each street in both directions, and gives the entropy and the orientation order, from 0 for no order to 1 for a single grid.

## References

<a id="ref-Boe2019a"></a>Boeing, G. (2019). Urban Spatial Order: Street Network Orientation, Configuration, and Entropy. *Applied Network Science*, 4(1), 67. [doi:10.1007/s41109-019-0189-1](https://doi.org/10.1007/s41109-019-0189-1)

<a id="ref-Bra2001a"></a>Brandes, U. (2001). A faster algorithm for betweenness centrality. *The Journal of Mathematical Sociology*, 25(2), 163–177. [doi:10.1080/0022250X.2001.9990249](https://doi.org/10.1080/0022250X.2001.9990249)

<a id="ref-FBSHE...2021a"></a>Fairbanks, J., Besançon, M., Schölly, S., Hoffimann, J., Eubank, N. and Karpinski, S. (2021). JuliaGraphs/Graphs.jl: an optimized graphs package for the Julia programming language. [github.com/JuliaGraphs/Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl)

<a id="ref-Fre1977a"></a>Freeman, L. C. (1977). A Set of Measures of Centrality Based on Betweenness. *Sociometry*, 40(1), 35–41. [doi:10.2307/3033543](https://doi.org/10.2307/3033543)

## See Also
- [Overview](overview.md) · [Shortest Paths](shortest-paths.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
