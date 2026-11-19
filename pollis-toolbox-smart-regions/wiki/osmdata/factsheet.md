# OpenStreetMap Data — Factsheet

**OpenStreetMap** is a collaborative project that provides user-generated street maps: many contributors edit one world map, and its data is free to use and editable ([Haklay and Weber (2008)](#ref-HW2008a)). The OpenStreetMap Data panel of the Smart Regions Toolbox reads its features in three ways: from an Overpass API instance, which answers queries on the OpenStreetMap database ([Olbricht (2026)](#ref-Olb2026a)), and from Geofabrik's download server, as the ready-made layers or the full extract of a region ([Geofabrik (2026)](#ref-Geo2026a)). It reads them with DuckDB.jl and DuckDB's spatial extension ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

| Item | OpenStreetMap Data panel |
|---|---|
| **Purpose** | Get the features of OpenStreetMap with a tag in an area, or the layers or features of a region, show them, check them, compare them with an earlier date, and save them |
| **Input** | Overpass API: an area, a tag, a server and an earlier date; Geofabrik Layers: a region, a layer and an earlier year; Geofabrik Full Extract: a region, a tag and an earlier year |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), with DuckDB's spatial extension and GDAL's OSM driver |
| **Tabs** | Overpass API; Geofabrik Layers; Geofabrik Full Extract |
| **Output** | The table `features`: one row per feature, with its OSM id, the value of the tag (or Geofabrik's class) as `value`, its name, its layer, its tags as JSON (or Geofabrik's columns) and its geometry as `geom` |
| **Key choices** | The source; the tag or layer; the area or region; the earlier date or year |

## How Does the OpenStreetMap Data Panel Get the Data?

The Overpass API tab sends a query in Overpass QL to the server given in Server, for the nodes, ways and relations with the tag in the area, and receives them as an OpenStreetMap XML file ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026b)). The Geofabrik tabs look up the region in Geofabrik's JSON index of downloads, which gives, for each region, its id, its parent and links to its latest .osm.pbf file and shape file ([Geofabrik (2026)](#ref-Geo2026a)); they download the region's GeoPackage of layers or its .osm.pbf once to the Folder, and read it from there afterwards.

## How Does the OpenStreetMap Data Panel Read OpenStreetMap Files?

OpenStreetMap files hold nodes, ways and relations, not geometries. GDAL's OSM driver reconstructs points, lines and polygons from them, in five layers: points, lines, multilinestrings, multipolygons and other_relations ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026b)). The Overpass API and Geofabrik Full Extract tabs read the five layers with DuckDB's spatial extension, which uses GDAL, and keep the features with the tag, each with all its tags as JSON. The Geofabrik Layers tab reads Geofabrik's GeoPackage, whose layers are already geometries with a fixed set of columns ([Reichert and Ramm (2026)](#ref-RR2026a)).

## What the Next Steps of the OpenStreetMap Data Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Show on a Map, Counts by Value | The features on a base map, coloured by value; the number of features of each value |
| Diagnose | Query and Date, Tag Completeness, Geometry Check | The query sent or the file read, and the date of its data; the tags or columns the features carry; geometries by layer and type, invalid and empty |
| Compare | Then and Now | The same features at an earlier date or year: kept, added and removed |
| Export | Save as GeoPackage, Save as GeoParquet | The features with their tags or columns, for any GIS or data tool |

## Attribution

OpenStreetMap's data is under the Open Database License, and its users must credit OpenStreetMap and make clear that the data is available under that licence ([OpenStreetMap Foundation (2026)](#ref-OSMF2026b)). The OpenStreetMap Data panel prints the notice © OpenStreetMap contributors, ODbL with the features it reads, the maps it draws and the files it saves.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026b"></a>GDAL/OGR Contributors (2026). OSM: OpenStreetMap XML and PBF. [gdal.org/en/stable/drivers/vector/osm.html](https://gdal.org/en/stable/drivers/vector/osm.html)

<a id="ref-Geo2026a"></a>Geofabrik (2026). Geofabrik Download Server: OpenStreetMap Data Extracts. [download.geofabrik.de](https://download.geofabrik.de/)

<a id="ref-HW2008a"></a>Haklay, M. and Weber, P. (2008). OpenStreetMap: user-generated street maps. *IEEE Pervasive Computing*, 7(4), 12–18. [doi:10.1109/MPRV.2008.80](https://doi.org/10.1109/MPRV.2008.80)

<a id="ref-Olb2026a"></a>Olbricht, R. (2026). Overpass API. Software, version 0.7.62, AGPL-3.0. [github.com/drolbr/Overpass-API](https://github.com/drolbr/Overpass-API)

<a id="ref-OSMF2026b"></a>OpenStreetMap Foundation (2026). Copyright and License. [openstreetmap.org/copyright](https://www.openstreetmap.org/copyright)

<a id="ref-OSMWC2026b"></a>OpenStreetMap Wiki contributors (2026). Overpass API/Overpass QL. [wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-RR2026a"></a>Reichert, M. and Ramm, F. (2026). OpenStreetMap Data in Layered GIS Format: Free Shapefiles and GeoPackages. Geofabrik, version of 2026-04-02. [download.geofabrik.de/osm-data-in-gis-formats-free.pdf](https://download.geofabrik.de/osm-data-in-gis-formats-free.pdf)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overpass API and Overpass QL](overpass-api-and-overpass-ql.md) · [Geofabrik Downloads](geofabrik-downloads.md) · [OpenStreetMap Tags](openstreetmap-tags.md) · [Licence and Attribution](licence-and-attribution.md)
