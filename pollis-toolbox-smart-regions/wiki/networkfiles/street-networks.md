# Street Networks

## Building a Network From Ways

The OpenStreetMap PBF tab of the Transport Network Files panel builds a network from the ways that carry the tag key of the Network Key input: highway for streets, paths and steps, railway for tracks, waterway for rivers and canals. Each way becomes a line through its nodes in order, made with `ST_MakeLine` of DuckDB's spatial extension, and its length is computed in metres on the WGS 84 ellipsoid with `ST_Length_Spheroid` ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The value of the key is the class of each way, so a highway network has classes such as primary, residential, footway and steps, and Kilometres by Class and Classes Side by Side compare them.

## Intersections and Dead Ends

Network Measures counts, for each node of the network, the line segments that meet there: one for a node at either end of a way, two for a node inside a way, summed over all the ways that use it. A node where three or more segments meet is counted as an intersection, and a node with one as a dead end; nodes with two lie along a street or join two ways end to end. Two ways meet only at a node they share, so streets that cross on a bridge or in a tunnel, without a shared node, do not form an intersection. The mean number of segments per node is printed too.

## Density of a Network

Network Measures divides the length of the network and its number of intersections by the area of the network's convex hull, the smallest convex polygon around it, computed on the WGS 84 ellipsoid with `ST_Area_Spheroid` ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The convex hull includes any water, parks or empty land inside it, and its edge follows the outermost ways, so densities from different extracts compare well only over areas of similar shape. A density over a chosen boundary, such as a parish, follows from the saved network joined with that boundary in the Geospatial Vector Files panel.

## Street Network Analysis

Boeing presented OSMnx to make the collection, construction and analysis of street networks from OpenStreetMap simple, consistent and automatable, sound from the perspectives of graph theory, transportation and urban design ([Boeing (2017)](#ref-Boe2017a)). OSMnx corrects the topology of a network algorithmically and calculates metric and topological measures common in urban design and transportation studies, and more advanced measures of the structure of a network. The OpenStreetMap PBF tab does not correct topology: a way is a line from node to node as mapped, and a street drawn as several ways counts as several, which Names of the Network shows by adding up the ways of each name.

## References

<a id="ref-Boe2017a"></a>Boeing, G. (2017). OSMnx: new methods for acquiring, constructing, analyzing, and visualizing complex street networks. *Computers, Environment and Urban Systems*, 65, 126–139. [doi:10.1016/j.compenvurbsys.2017.05.004](https://doi.org/10.1016/j.compenvurbsys.2017.05.004)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

## See Also
- [OpenStreetMap PBF](osm-pbf.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
