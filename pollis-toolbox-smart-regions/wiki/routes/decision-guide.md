# Decision Guide

## Which Tab of Route and Network Analysis

| Need | Tab |
|---|---|
| How long a trip takes between two points, and which streets it follows | Shortest Route |
| How far one can get from a place in a given time | Service Areas |
| The times between every pair of several places | Travel-Time Matrix |
| How connected and dense a network is, and which streets the fastest paths use most | Network Measures |

Every tab works on the same network of the Mode, so the Next Steps of one tab can be read beside those of another for the same Area.

## Which Mode of Travel

Walk uses footways, paths and steps as well as roads, in both directions, at 4.8 km/h, and suits the access to places on foot. Cycle uses cycleways and roads, respects one-way streets unless they are open to cycles, and travels at 15 km/h. Drive uses the roads open to motor vehicles at their speed limits, and suits longer trips; its travel times ignore traffic and junctions. Walk, Cycle and Drive, on Shortest Route and Service Areas, sets the three side by side for the same points.

## Which Source of the Network

The Overpass API gives the streets of the Area as they are now in OpenStreetMap, with no file to download beforehand, but a public server may be busy ([Olbricht (2026)](#ref-Olb2026a)). A PBF extract, such as the Geofabrik extracts of Cambridgeshire and Oxfordshire that auto downloads, holds a whole region, updated normally every day ([Geofabrik (2026)](#ref-Geo2026a)), and serves any Area inside it without a query; it is the choice for many runs, or when the Overpass API is busy. Both give the same network for the same Area.

## How Large an Area to Choose

The Area should extend beyond the places of interest, so that the paths between them do not run along its edges, where the network is cut. The Example Cities cover the centres of Cambridge and Oxford, about 8.5 and 4.6 square kilometres, with their stations, and each tab runs on them in under a minute; a much larger Area takes longer to download, and the betweenness of Network Measures, a search from each node sampled, longer to compute.

## References

<a id="ref-Geo2026a"></a>Geofabrik (2026). Geofabrik Download Server: OpenStreetMap Data Extracts. [download.geofabrik.de](https://download.geofabrik.de/)

<a id="ref-Olb2026a"></a>Olbricht, R. (2026). Overpass API. [github.com/drolbr/Overpass-API](https://github.com/drolbr/Overpass-API)

## See Also
- [Overview](overview.md) · [Building the Network](building-the-network.md) · [Service Areas](service-areas.md) · [Network Measures](network-measures.md) · [Factsheet](factsheet.md)
