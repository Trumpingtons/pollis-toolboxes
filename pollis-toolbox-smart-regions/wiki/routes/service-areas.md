# Service Areas

## What a Service Area Is

A service area is the part of a network reachable from a point within a given travel time: the streets one can walk, cycle or drive to from a station, a school or a clinic in five, ten or fifteen minutes. Service Areas computes one for each of the Time Bands, from the travel times of Dijkstra's algorithm run from the Origin ([Dijkstra (1959)](#ref-Dij1959a)) and stopped at the longest band. Each band contains the shorter ones.

## How Service Areas Draws the Areas

For each band, Service Areas gathers the nodes reached within its minutes and draws around them a concave hull, with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)): a polygon that follows the nodes more closely than their convex hull, set with a ratio of 0.3. The street length of a band is the sum of the segments whose two ends are both reached within it. The table `reach` holds, for each band, its polygon, its area in square kilometres on the ellipsoid, its kilometres of street and the number of nodes reached.

## Reading the Size of a Service Area

The area of a service area depends on how its polygon is drawn; its kilometres of street depend only on the network and the travel times. The network stops at the edges of the Area, so a band that reaches them is cut there: Reach Summary gives the share of the Area each band covers, and a share near the whole Area means the Area is too small for the band. Walk, Cycle and Drive gives the square kilometres of each band by each mode from the same Origin.

## References

<a id="ref-Dij1959a"></a>Dijkstra, E. W. (1959). A Note on Two Problems in Connexion with Graphs. *Numerische Mathematik*, 1(1), 269–271. [doi:10.1007/BF01386390](https://doi.org/10.1007/BF01386390)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

## See Also
- [Shortest Paths](shortest-paths.md) · [Building the Network](building-the-network.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
