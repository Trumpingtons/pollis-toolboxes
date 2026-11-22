# Overview

## Flows between Places as an Origin-Destination Table

A flow is a number of people, vehicles or flights going from one place, the origin, to another, the destination, over a period. Mobility and Flows keeps the flows of a city as a table `flows` with one row for each pair of zones that has a flow, with the columns `origin`, `destination` and `flow`, and the zones as a table `zones` with their codes, names, boundaries and centroids. Arranged with one row for each origin and one column for each destination, the same numbers form the origin-destination matrix of spatial interaction modelling, whose row totals are the flows leaving each zone and whose column totals are the flows arriving ([Wilson (1971)](#ref-Wil1971a); [Dennett (2012)](#ref-Den2012a)).

## Five Kinds of Mobility Data in Mobility and Flows

Each tab of Mobility and Flows reads one kind of open data. **Commuting Flows** reads censuses and registers of jobs, which count the people who live in one zone and work in another at a given date. **Trips** reads records of individual journeys over a month, from bike sharing, taxis or tap-ins on buses, and counts them between zones and by hour. **Spatial Interaction** fits gravity models to commuting flows or bus trips. **Traffic Counts** reads the vehicles counted at points on the roads, which say how busy a road is but not where its traffic comes from or goes. **Air Routes** reads the flights seen by the receivers of the OpenSky Network between airports ([Strohmeier, Olive, Lübbe, Schäfer and Lenders (2021)](#ref-SOLSL2021a)).

## Zones, Centroids and Distances in Mobility and Flows

The zones of Mobility and Flows are the areas each source counts its flows in: middle layer super output areas in England, municipalities in the Netherlands and Tokyo, communes and arrondissements around Paris, districts around Frankfurt and in Hong Kong, neighbourhood tabulation areas or taxi zones in New York, and planning areas in Singapore. The distance between two zones is measured between their centroids, on the ellipsoid, with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). A centroid stands for the whole zone, so distances between neighbouring zones are rough, and a flow within a zone has no distance of its own.

## Gravity Models in Mobility and Flows

A gravity model explains the flow between two places by their sizes and by the distance between them, the flow falling as the distance grows. Wilson (1971) set out a family of such models that differ in which totals they keep: those of the origins, those of the destinations, both, or neither ([Wilson (1971)](#ref-Wil1971a)). Flowerdew and Aitkin (1982) fitted the model as a Poisson regression of the counts, which handles flows of zero and keeps the totals of the constraint ([Flowerdew and Aitkin (1982)](#ref-FA1982a)). Spatial Interaction and Air Routes fit the models in that way, with fixed effects for the constrained totals. Spatial Interaction Models describes them.

## Running Mobility and Flows on Your Own Files

With Example City set to Custom, Commuting Flows, Trips and Spatial Interaction read a CSV file of flows, with the columns `origin`, `destination` and `flow`, and a vector file of zones with a column `zone` that the origins and destinations name, and optionally `name`. The zones may be in any format DuckDB's spatial extension reads, such as GeoPackage, GeoJSON or Shapefile, in longitude and latitude. Traffic Counts reads a CSV file of counts with the columns `site`, `lon`, `lat`, `year` and `flow`, and optionally `name`. Flows to or from a zone the zones file lacks are counted as flows outside the zones.

## References

<a id="ref-Den2012a"></a>Dennett, A. (2012). Estimating flows between geographical locations: get me started in spatial interaction modelling. CASA Working Paper 181, University College London. [ucl.ac.uk/bartlett/casa](https://www.ucl.ac.uk/bartlett/casa/publications/2012/mar/casa-working-paper-181)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-FA1982a"></a>Flowerdew, R. and Aitkin, M. (1982). A method of fitting the gravity model based on the Poisson distribution. *Journal of Regional Science*, 22(2), 191–202. [doi:10.1111/j.1467-9787.1982.tb00744.x](https://doi.org/10.1111/j.1467-9787.1982.tb00744.x)

<a id="ref-SOLSL2021a"></a>Strohmeier, M., Olive, X., Lübbe, J., Schäfer, M. and Lenders, V. (2021). Crowdsourced air traffic data from the OpenSky Network 2019–2020. *Earth System Science Data*, 13(2), 357–366. [doi:10.5194/essd-13-357-2021](https://doi.org/10.5194/essd-13-357-2021)

<a id="ref-Wil1971a"></a>Wilson, A. G. (1971). A family of spatial interaction models, and associated developments. *Environment and Planning A*, 3(1), 1–32. [doi:10.1068/a030001](https://doi.org/10.1068/a030001)

## See Also
- [Factsheet](factsheet.md) · [Commuting Data](commuting-data.md) · [Trip Data](trips-data.md) · [Spatial Interaction Models](spatial-interaction.md) · [Traffic Counts](traffic-counts.md) · [Air Route Data](air-traffic.md) · [Decision Guide](decision-guide.md)
