# Route and Network Analysis — Factsheet

**Route and Network Analysis** turns the streets of an area in OpenStreetMap into a graph, whose nodes are the points of the streets and whose edges are the segments between them, and finds paths and measures on it ([Haklay and Weber (2008)](#ref-HW2008a); [Porta, Crucitti and Latora (2006)](#ref-PCL2006a)). The panel of the Smart Regions Toolbox reads the streets from the Overpass API or from a PBF extract with DuckDB.jl and DuckDB's spatial extension, and computes fastest paths and betweenness with Graphs.jl ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [Fairbanks, Besançon, Schölly, Hoffimann, Eubank and Karpinski (2021)](#ref-FBSHE...2021a)).

| Item | Route and Network Analysis panel |
|---|---|
| **Purpose** | Travel times and routes on the streets of an area, the areas reached in given times, and the structure of the network |
| **Input** | An Example City (Cambridge, Oxford) or a Custom Area, Origin, Destination and Places; a Mode (walk, cycle, drive); where the network comes from |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), [Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl), with DuckDB's spatial extension |
| **Tabs** | Shortest Route; Service Areas; Travel-Time Matrix; Network Measures |
| **Account** | None |
| **Output** | `route`, `reach`, `matrix` or `nodes`, with `network`, the streets of the mode; the graph `net` |

## What Each Tab of Route and Network Analysis Computes

| Tab | Computation | Table |
|---|---|---|
| Shortest Route | Dijkstra's algorithm from the Origin, by travel time | `route`: the line, its minutes and kilometres |
| Service Areas | Dijkstra's algorithm from the Origin, up to the longest of the Time Bands | `reach`: one area for each band, its km², street km and nodes |
| Travel-Time Matrix | Dijkstra's algorithm from each of the Places | `matrix`: minutes, km and straight-line km of each pair |
| Network Measures | Degree, connected parts and betweenness of every node | `nodes`, and `network` with the betweenness of each segment |

## Files Kept in the Folder of Route and Network Analysis

With Network From set to Overpass API, the panel writes the answer of the Overpass API to the folder routes of the Folder, in a file named after the four edges of the Area, and a later run over the same Area reads it from there without a query. With PBF File at auto, it downloads the Geofabrik extract of Cambridgeshire or Oxfordshire to the Folder once. Save as GeoParquet and Save the Matrix as CSV write their files to the folder routes, named after the table and the Mode.

## What the Next Steps of Route and Network Analysis Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Route on a Map, Service Areas on a Map, Network on a Map, Betweenness on a Map, Travel Times as a Heat Map, Street Orientation | The route; the areas of each band; the streets by class; the streets by betweenness; the matrix; the bearings of the streets |
| Diagnose | Network Check, Snapping Distances, Unreachable Places | The streets of each class and the largest connected part; how far each point is from the network; the pairs without a path |
| Compare | Walk, Cycle and Drive, Route Against Straight Line | The same route or service areas by each mode; the route beside the straight line |
| Interpret | Detour Index, Most Central Streets, Reach Summary | How roundabout the paths are; the streets with the highest betweenness; the size of each service area |
| Export | Save as GeoParquet, Save the Matrix as CSV | The tables of the tab and the streets of the mode |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-FBSHE...2021a"></a>Fairbanks, J., Besançon, M., Schölly, S., Hoffimann, J., Eubank, N. and Karpinski, S. (2021). JuliaGraphs/Graphs.jl: an optimized graphs package for the Julia programming language. [github.com/JuliaGraphs/Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl)

<a id="ref-HW2008a"></a>Haklay, M. and Weber, P. (2008). OpenStreetMap: User-Generated Street Maps. *IEEE Pervasive Computing*, 7(4), 12–18. [doi:10.1109/MPRV.2008.80](https://doi.org/10.1109/MPRV.2008.80)

<a id="ref-PCL2006a"></a>Porta, S., Crucitti, P. and Latora, V. (2006). The Network Analysis of Urban Streets: A Primal Approach. *Environment and Planning B: Planning and Design*, 33(5), 705–725. [doi:10.1068/b32045](https://doi.org/10.1068/b32045)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: The DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Overview](overview.md) · [Building the Network](building-the-network.md) · [Shortest Paths](shortest-paths.md) · [Service Areas](service-areas.md) · [Network Measures](network-measures.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
