# Building the Network

## Where the Street Network Comes From

With Network From set to Overpass API, the panel asks the public Overpass API, a database engine that queries OpenStreetMap data ([Olbricht (2026)](#ref-Olb2026a)), for the ways with a `highway` tag in the bounding box of the Area and the nodes they are made of, in Overpass QL ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026b)). With PBF File, it reads an OpenStreetMap extract instead; at auto, the Geofabrik extract of the county of the Example City, which Geofabrik normally updates every day ([Geofabrik (2026)](#ref-Geo2026a)). Both give the same ways and nodes; the extract also serves an Area when the Overpass API is busy.

## From OpenStreetMap Ways to a Graph

An OpenStreetMap way is a list of nodes, with tags describing it: a tag is a key and a value, such as `highway=residential` ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026c)). The panel cuts each way into segments between consecutive nodes, keeps the segments whose two nodes lie inside the Area, and measures each segment's length in metres on the WGS 84 ellipsoid with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The segments a Mode may use become the edges of a directed graph of Graphs.jl ([Fairbanks, Besançon, Schölly, Hoffimann, Eubank and Karpinski (2021)](#ref-FBSHE...2021a)), one edge for each direction of travel, weighted by its travel time in seconds. Every node of the ways stays a node of the graph, so a node may be a bend in a street as well as an intersection.

## Which Streets Each Mode Uses

| Mode | Classes of `highway` used | Left out |
|---|---|---|
| Walk | Roads other than motorways, with footways, paths, pedestrian streets, steps, tracks, cycleways and bridleways | Ways tagged `foot=no` or `foot=private`, and private ways not open to walkers |
| Cycle | Roads other than motorways and trunk roads, with cycleways, paths, tracks and bridleways; footways and pedestrian streets where `bicycle` allows it | Ways closed to cycles, or where cyclists must dismount |
| Drive | Roads, from motorways to living streets and service roads | Ways tagged private or closed to motor vehicles |

The rules are the panel's reading of the tags of OpenStreetMap ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026c)); a way tagged wrongly or incompletely is used or left out as its tags say.

## One-Way Streets and Speeds

Walk uses every segment in both directions, at 4.8 km/h. Cycle and Drive use a segment in one direction only when its way is tagged `oneway=yes` (or `-1`, the opposite way), is a roundabout or, for Drive, a motorway; Cycle uses it in both directions when `oneway:bicycle=no`. Cycle travels at 15 km/h. Drive travels at the speed limit of the way, from its `maxspeed` tag in km/h or mph, and, without one, at a speed set for the class: 30 km/h on residential and unclassified roads, 50 on secondary, 60 on primary, 90 on trunk and 110 on motorways, among others. The travel times ignore junctions, traffic lights and congestion.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-FBSHE...2021a"></a>Fairbanks, J., Besançon, M., Schölly, S., Hoffimann, J., Eubank, N. and Karpinski, S. (2021). JuliaGraphs/Graphs.jl: an optimized graphs package for the Julia programming language. [github.com/JuliaGraphs/Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl)

<a id="ref-Geo2026a"></a>Geofabrik (2026). Geofabrik Download Server: OpenStreetMap Data Extracts. [download.geofabrik.de](https://download.geofabrik.de/)

<a id="ref-Olb2026a"></a>Olbricht, R. (2026). Overpass API. [github.com/drolbr/Overpass-API](https://github.com/drolbr/Overpass-API)

<a id="ref-OSMWC2026b"></a>OpenStreetMap Wiki contributors (2026). Overpass API/Overpass QL. [wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL)

<a id="ref-OSMWC2026c"></a>OpenStreetMap Wiki contributors (2026). Tags. [wiki.openstreetmap.org/wiki/Tags](https://wiki.openstreetmap.org/wiki/Tags)

## See Also
- [Overview](overview.md) · [Shortest Paths](shortest-paths.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
