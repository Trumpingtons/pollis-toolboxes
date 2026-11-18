# Transport Network Files — Overview

## Transit Timetables as Data: GTFS

The General Transit Feed Specification, GTFS, describes a public transport service as files of a dataset: the agencies, the stops, the routes, the trips of each route, the times each trip arrives at and departs from each stop, and the calendars of the dates each service runs ([MobilityData (2026)](#ref-Mob2026a)). Since 2007 the transit industry has used GTFS as a widely adopted data standard, first for traveller information such as trip planners ([Wong (2013)](#ref-Won2013a)). Wong showed that GTFS feeds also serve transit analyses at the stop, route and system levels, and compared 50 large transit agencies of North America with scripts and database queries, which he found a highly efficient alternative to transcribing schedules by hand.

## Street Networks as Data: OpenStreetMap

OpenStreetMap is a knowledge collective that provides user-generated street maps, following the peer production model of Wikipedia: contributors edit a world map collaboratively, and the data are free to use and editable ([Haklay and Weber (2008)](#ref-HW2008a)). It is the only global, openly licensed source of road data, and Barrington-Leigh and Millard-Ball estimated in 2017 that its road data were about 83% complete worldwide, and fully mapped in more than 40% of countries ([Barrington-Leigh and Millard-Ball (2017)](#ref-BM2017a)). Extracts of countries, regions and cities are published in the PBF format, the binary format of OpenStreetMap ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026a)).

## Networks From OpenStreetMap

Street networks have been studied in many ways, but data availability and consistency have limited the analysis of street networks in urban planning ([Boeing (2017)](#ref-Boe2017a)). Boeing's OSMnx downloads street networks from OpenStreetMap, corrects their topology and computes metric and topological measures common in urban design and transportation studies. The OpenStreetMap PBF tab of the Transport Network Files panel builds a network from a local extract in SQL instead: the ways with a tag key become lines, and Network Measures counts intersections and dead ends from how the ways share nodes, and the density of the network over its extent.

## How the Two Tabs Fit Together

A GTFS feed says where and when public transport runs; an OpenStreetMap extract says where streets, paths and railways are. Both tabs of the Transport Network Files panel load their file into DuckDB, so the stops of a feed and the ways of a network can be saved to one GeoPackage or database each and joined in SQL, for example to find the streets within a walk of the busiest stops ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Both write geometries in longitude and latitude, WGS 84, the coordinates GTFS gives its stops and shapes in ([MobilityData (2026)](#ref-Mob2026a)).

## References

<a id="ref-BM2017a"></a>Barrington-Leigh, C. and Millard-Ball, A. (2017). The world's user-generated road map is more than 80% complete. *PLOS ONE*, 12(8), e0180698. [doi:10.1371/journal.pone.0180698](https://doi.org/10.1371/journal.pone.0180698)

<a id="ref-Boe2017a"></a>Boeing, G. (2017). OSMnx: new methods for acquiring, constructing, analyzing, and visualizing complex street networks. *Computers, Environment and Urban Systems*, 65, 126–139. [doi:10.1016/j.compenvurbsys.2017.05.004](https://doi.org/10.1016/j.compenvurbsys.2017.05.004)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-HW2008a"></a>Haklay, M. and Weber, P. (2008). OpenStreetMap: user-generated street maps. *IEEE Pervasive Computing*, 7(4), 12–18. [doi:10.1109/MPRV.2008.80](https://doi.org/10.1109/MPRV.2008.80)

<a id="ref-Mob2026a"></a>MobilityData (2026). GTFS Schedule Reference. Revised April 27, 2026. [gtfs.org/documentation/schedule/reference](https://gtfs.org/documentation/schedule/reference/)

<a id="ref-OSMWC2026a"></a>OpenStreetMap Wiki contributors (2026). PBF Format. [wiki.openstreetmap.org/wiki/PBF_Format](https://wiki.openstreetmap.org/wiki/PBF_Format)

<a id="ref-Won2013a"></a>Wong, J. (2013). Leveraging the General Transit Feed Specification for efficient transit analysis. *Transportation Research Record*, 2338(1), 11–19. [doi:10.3141/2338-02](https://doi.org/10.3141/2338-02)

## See Also
- [Factsheet](factsheet.md) · [GTFS](gtfs.md) · [OpenStreetMap PBF](osm-pbf.md) · [Service Frequency](service-frequency.md) · [Street Networks](street-networks.md)
