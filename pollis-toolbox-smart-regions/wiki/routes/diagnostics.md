# Diagnostics

## A Busy Overpass Server

The public Overpass API is shared by many users ([Olbricht (2026)](#ref-Olb2026a)). When it answers that it is busy, with HTTP status 429, 502, 503 or 504, the panel waits and asks again, up to five times, waiting twice as long each time: 5, 10, 20, 40 and 80 seconds. When it stays busy, the tab stops with a message; setting Network From to PBF File reads the same streets from an extract instead. Once an Area has been downloaded, its file in the folder routes serves every later run, so the Overpass API is asked only once for each Area.

## Points Far from a Street

Snapping Distances gives the metres between each point given, the Origin, the Destination or a place, and the node it was snapped to. A distance of more than 100 metres is marked: the point lies away from the streets the Mode can use, inside a park, a large building or a pedestrian area for Drive. The path then starts or ends at that node, and the time to reach it is not counted. Moving the point onto a street, or changing the Mode, brings the distance down.

## Places That Cannot Be Reached

The points are snapped to the largest part of the network in which every node reaches every other by the Mode, so a path exists between any two of them. Unreachable Places lists the pairs of the matrix without a path, which happens when two places snap to nodes the Mode cannot connect, for example when the network of a small Area falls into pieces. Network Check gives the share of the nodes in that largest part; the others cannot be reached from it, or cannot reach it, by the Mode.

## A Network in Pieces

The network stops at the edges of the Area: a street leaving it is cut at its last node inside, so some short pieces near the edges are joined to nothing else. For Cycle and Drive, one-way streets near the edges may lead out of the network with no way back in. Network Measures gives the number of connected parts and the share of the nodes in the largest. A larger Area, extending beyond the places of interest, keeps the paths between them away from the edges.

## Streets Missing or Tagged Wrongly

OpenStreetMap is edited by its contributors ([Haklay and Weber (2008)](#ref-HW2008a)), and each way is used or left out by a Mode according to its tags ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026c)). A footway without its `highway` tag, a street wrongly tagged private, or a missing `oneway` tag changes the paths found. Network Check gives the kilometres of street of each class open to the Mode and the segments without a name; Network on a Map shows the streets by class, so that a street missing from where it should be can be seen.

## References

<a id="ref-HW2008a"></a>Haklay, M. and Weber, P. (2008). OpenStreetMap: User-Generated Street Maps. *IEEE Pervasive Computing*, 7(4), 12–18. [doi:10.1109/MPRV.2008.80](https://doi.org/10.1109/MPRV.2008.80)

<a id="ref-Olb2026a"></a>Olbricht, R. (2026). Overpass API. [github.com/drolbr/Overpass-API](https://github.com/drolbr/Overpass-API)

<a id="ref-OSMWC2026c"></a>OpenStreetMap Wiki contributors (2026). Tags. [wiki.openstreetmap.org/wiki/Tags](https://wiki.openstreetmap.org/wiki/Tags)

## See Also
- [Building the Network](building-the-network.md) · [Shortest Paths](shortest-paths.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
