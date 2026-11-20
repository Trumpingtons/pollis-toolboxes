# Shortest Paths

## Dijkstra's Algorithm

Dijkstra described, in 1959, a method to find the path of minimum total length between two given nodes of a graph whose branches have non-negative lengths ([Dijkstra (1959)](#ref-Dij1959a)). Graphs.jl implements it as `dijkstra_shortest_paths`, which from a source node gives the distance to every node and the predecessor of each on its shortest path, from which `enumerate_paths` recovers the path itself ([Fairbanks, Besançon, Schölly, Hoffimann, Eubank and Karpinski (2021)](#ref-FBSHE...2021a)). Route and Network Analysis uses the travel time in seconds of each edge as its length, so the paths found are the fastest, not the shortest in metres.

## How Shortest Route Finds the Fastest Path

Shortest Route snaps the Origin and the Destination to their nearest nodes, runs Dijkstra's algorithm from the first, and follows the predecessors back from the second. The table `route` holds the path as a line, its minutes, and its kilometres, the sum of the lengths of its segments. The fastest path is not always the shortest: for Drive, a faster road may be longer. Walk, Cycle and Drive runs the same route by each mode, building the network of the other two from the same segments.

## Snapping Points to the Network

A point given as longitude and latitude rarely lies on a node, so the panel snaps it to the nearest node of the largest strongly connected part of the network: the largest set of nodes each reachable from every other by the Mode. Snapping to that part ensures a path exists between any two points snapped. The time between a point and its node is not counted. Snapping Distances gives the metres from each point to its node; a long distance shows a point away from the streets of the Mode, such as inside a park or a building.

## The Travel-Time Matrix

Travel-Time Matrix runs Dijkstra's algorithm once from each of the Places and reads the minutes to every other, with the kilometres of each fastest path. The table `matrix` has one row for each ordered pair, with its minutes, kilometres and straight-line kilometres on the ellipsoid. For Walk the matrix is symmetric; for Cycle and Drive, one-way streets may make the time from one place to another differ from the time back. A pair without a path has no minutes.

## The Detour Index of a Path

The detour index of a path is its length over the straight-line distance between its ends: 1 for a straight path, more for a roundabout one. Route Against Straight Line gives it for the route and draws both on a map; Detour Index gives it for every pair of the matrix, with its mean. Boeing measured a related indicator, the average circuity of street networks, in 100 cities, and found it related to the order of their street orientations ([Boeing (2019)](#ref-Boe2019a)).

## References

<a id="ref-Boe2019a"></a>Boeing, G. (2019). Urban Spatial Order: Street Network Orientation, Configuration, and Entropy. *Applied Network Science*, 4(1), 67. [doi:10.1007/s41109-019-0189-1](https://doi.org/10.1007/s41109-019-0189-1)

<a id="ref-Dij1959a"></a>Dijkstra, E. W. (1959). A Note on Two Problems in Connexion with Graphs. *Numerische Mathematik*, 1(1), 269–271. [doi:10.1007/BF01386390](https://doi.org/10.1007/BF01386390)

<a id="ref-FBSHE...2021a"></a>Fairbanks, J., Besançon, M., Schölly, S., Hoffimann, J., Eubank, N. and Karpinski, S. (2021). JuliaGraphs/Graphs.jl: an optimized graphs package for the Julia programming language. [github.com/JuliaGraphs/Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl)

## See Also
- [Building the Network](building-the-network.md) · [Service Areas](service-areas.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
