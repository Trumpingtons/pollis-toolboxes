# Overview

## Street Networks as Graphs

A street network can be represented as a graph in two ways. In the primal approach, intersections are the nodes and the streets between them the edges, with their lengths, so that distances are measured in metres; in the dual approach, of space syntax, streets are the nodes and their intersections the edges ([Porta, Crucitti and Latora (2006)](#ref-PCL2006a)). Porta, Crucitti and Latora compared the two and found that, in the primal approach, some centrality indices capture the skeleton of the urban structure. Route and Network Analysis builds a primal graph, whose edges carry the metres and the seconds of each segment of street.

## OpenStreetMap as a Source of Street Networks

OpenStreetMap is a collaborative project of user-generated street maps, whose contributors edit a map of the world that is free to use ([Haklay and Weber (2008)](#ref-HW2008a)). Its data are licensed under the Open Database License, which requires crediting OpenStreetMap and its contributors ([OpenStreetMap Foundation (2026)](#ref-OSMF2026b)). OSMnx, a Python tool, made the downloading and construction of street networks from OpenStreetMap automatic and consistent, from the perspectives of graph theory, transportation and urban design ([Boeing (2017)](#ref-Boe2017a)). Route and Network Analysis builds its network from the same data, with DuckDB and Graphs.jl.

## What the Route and Network Analysis Panel Does

The Route and Network Analysis panel has four tabs. Shortest Route finds the fastest route between an Origin and a Destination. Service Areas finds the areas reachable from an Origin within each of several travel times. Travel-Time Matrix gives the times and distances between every pair of a list of Places. Network Measures counts the intersections, dead ends and connected parts of the network and estimates the betweenness of each node and street. Each tab works on the streets a Mode can use, walking, cycling or driving, over Cambridge, Oxford or an Area of the user's own.

## Centrality of Places in a Street Network

Approaches to cities as networks, under names such as accessibility, proximity, integration or connectivity, share the idea that some places or streets are more important than others because they are more central ([Porta, Crucitti and Latora (2006)](#ref-PCL2006a)). Centrality was first studied in structural sociology: Freeman defined a family of measures based on how often a point lies on the shortest paths between others ([Freeman (1977)](#ref-Fre1977a)). Porta, Crucitti and Latora assessed several such indices on the primal graphs of four urban street systems of one square mile, and found that their distributions differed between self-organised and planned cities.

## References

<a id="ref-Boe2017a"></a>Boeing, G. (2017). OSMnx: New methods for acquiring, constructing, analyzing, and visualizing complex street networks. *Computers, Environment and Urban Systems*, 65, 126–139. [doi:10.1016/j.compenvurbsys.2017.05.004](https://doi.org/10.1016/j.compenvurbsys.2017.05.004)

<a id="ref-Fre1977a"></a>Freeman, L. C. (1977). A Set of Measures of Centrality Based on Betweenness. *Sociometry*, 40(1), 35–41. [doi:10.2307/3033543](https://doi.org/10.2307/3033543)

<a id="ref-HW2008a"></a>Haklay, M. and Weber, P. (2008). OpenStreetMap: User-Generated Street Maps. *IEEE Pervasive Computing*, 7(4), 12–18. [doi:10.1109/MPRV.2008.80](https://doi.org/10.1109/MPRV.2008.80)

<a id="ref-OSMF2026b"></a>OpenStreetMap Foundation (2026). Copyright and License. [www.openstreetmap.org/copyright](https://www.openstreetmap.org/copyright)

<a id="ref-PCL2006a"></a>Porta, S., Crucitti, P. and Latora, V. (2006). The Network Analysis of Urban Streets: A Primal Approach. *Environment and Planning B: Planning and Design*, 33(5), 705–725. [doi:10.1068/b32045](https://doi.org/10.1068/b32045)

## See Also
- [Factsheet](factsheet.md) · [Building the Network](building-the-network.md) · [Shortest Paths](shortest-paths.md) · [Network Measures](network-measures.md) · [Decision Guide](decision-guide.md)
