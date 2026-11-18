# Decision Guide

## Which Tab of the Transport Network Files Panel to Use

| File | Tab | Read with |
|---|---|---|
| A .zip of .txt files with agency.txt, routes.txt, trips.txt, stop_times.txt and stops.txt | GTFS | ZipArchives.jl and DuckDB's `read_csv` |
| A folder with the same .txt files, unpacked | GTFS | DuckDB's `read_csv` |
| An .osm.pbf extract of a country, region or city | OpenStreetMap PBF | `ST_ReadOSM` of DuckDB's spatial extension |
| An .osm XML file | Neither, as it is | Convert to .osm.pbf with an OpenStreetMap tool first |

The GTFS tab loads every .txt file of a feed as a table, the optional ones such as fares and transfers included, and analyses the files of the schedule: stops, routes, trips, stop times and calendars ([MobilityData (2026)](#ref-Mob2026a)).

## Which Service Date to Analyse

The busiest date of a feed, the default of the Service Date input, is the date with the most trips, and the day to take for the fullest service a network offers. A weekend or holiday date, given as YYYY-MM-DD, shows the reduced service; Service Calendar lists the trips of each weekday and the dates without service, from calendar.txt and calendar_dates.txt ([MobilityData (2026)](#ref-Mob2026a)). Comparing two feeds of the same area, such as two years, needs the same weekday in both, since each feed has its own dates.

## Which Network Key to Use

The Network Key of the OpenStreetMap PBF tab chooses what network is built: highway gives every street, road, path, footway and set of steps; railway gives tracks, including abandoned and disused ones; waterway gives rivers, streams and canals. The classes of a highway network include ways for pedestrians only, so a network for cars keeps the classes for motor traffic, which the saved network allows in SQL by filtering on `class`. OpenStreetMap stores keys and values as strings, with no tags hard-coded, so the classes are those the contributors of the area used ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026a)).

## What to Save for Other Tools

Save Stops as GeoPackage writes the stops of a feed with the departures of the service day, and Save Network as GeoPackage the lines of a network with class, name and length, both through GDAL, for the Geospatial Vector Files panel and any GIS ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Save Feed as DuckDB Database writes every file of the feed as a table, with the stops as points and the service dates, so the feed can be queried in SQL without reading the .zip again ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)). Save Network as DuckDB Database keeps each way with all its tags.

## Analysing a Network Here or With OSMnx

The OpenStreetMap PBF tab measures a network as mapped, from a local file and in SQL: length by class, tags, intersections, dead ends and density. Boeing's OSMnx goes further, with the algorithmic correction of network topology, routing, and advanced measures of the structure of a network, for networks it downloads from OpenStreetMap ([Boeing (2017)](#ref-Boe2017a)). For routes, travel times or the topology of a network as a graph, a tool built for graphs suits better; for a first look at an extract and its tags, the tab's Next Steps suffice.

## References

<a id="ref-Boe2017a"></a>Boeing, G. (2017). OSMnx: new methods for acquiring, constructing, analyzing, and visualizing complex street networks. *Computers, Environment and Urban Systems*, 65, 126–139. [doi:10.1016/j.compenvurbsys.2017.05.004](https://doi.org/10.1016/j.compenvurbsys.2017.05.004)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Mob2026a"></a>MobilityData (2026). GTFS Schedule Reference. Revised April 27, 2026. [gtfs.org/documentation/schedule/reference](https://gtfs.org/documentation/schedule/reference/)

<a id="ref-OSMWC2026a"></a>OpenStreetMap Wiki contributors (2026). PBF Format. [wiki.openstreetmap.org/wiki/PBF_Format](https://wiki.openstreetmap.org/wiki/PBF_Format)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Factsheet](factsheet.md) · [GTFS](gtfs.md) · [OpenStreetMap PBF](osm-pbf.md) · [Service Frequency](service-frequency.md) · [Street Networks](street-networks.md)
