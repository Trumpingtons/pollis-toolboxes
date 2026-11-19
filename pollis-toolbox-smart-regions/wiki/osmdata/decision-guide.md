# Decision Guide

## Which Tab of the OpenStreetMap Data Panel to Use

| Need | Tab | Source |
|---|---|---|
| The features with one tag in a city or district, with all their tags, up to date or at an earlier date | Overpass API | An Overpass API instance |
| One layer of a whole region, such as its roads, buildings or points of interest, with a class and a few columns | Geofabrik Layers | Geofabrik's GeoPackage of the region |
| Every feature of a region with a tag, with all its tags, read offline | Geofabrik Full Extract | Geofabrik's .osm.pbf of the region |

The Overpass API answers queries on the OpenStreetMap database ([Olbricht (2026)](#ref-Olb2026a)), and its public instances ask users to stay within about 10,000 requests and about 1 GB of downloads a day ([Olbricht (2026)](#ref-Olb2026b)). Geofabrik's .osm.pbf files are un-filtered OpenStreetMap data of a region, and its shape files and GeoPackages a selection of features and attributes, available for smaller regions only ([Geofabrik (2026)](#ref-Geo2026a)). Both Geofabrik tabs download the file once to the Folder and read it from there afterwards, without a connection.

## Which Tag to Read

A tag is a key and a value; the key describes a topic, category or type of feature, such as highway or amenity, and the value gives detail for it, such as highway=motorway ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026c)). The Tag input of the Overpass API and Geofabrik Full Extract tabs takes key=value for one kind of feature, or a key alone for every value of the key; Counts by Value then shows how many features have each value. There is no fixed dictionary of tags: the tags in common use are documented on the OpenStreetMap wiki, and Taginfo measures how often each is used.

## Which Geofabrik Layer to Read

Geofabrik's free layers are places, points of interest, places of worship, natural features, traffic, transport infrastructure, roads and paths, railways, waterways, administrative areas, buildings, land use and land cover, protected areas and bodies of water ([Reichert and Ramm (2026)](#ref-RR2026a)). Features drawn in OpenStreetMap as areas, such as a restaurant drawn as its building outline, go to the layer with the suffix _a, and those drawn as points or lines to the layer without it. The Layer input of the Geofabrik Layers tab reads both layers of a theme, when the GeoPackage has both.

## Which Geofabrik Region to Read

Geofabrik organises its extracts by continent, then country, and for some countries by their subdivisions, such as Germany's Bundesländer or England's counties ([Geofabrik (2026)](#ref-Geo2026a)). Its JSON index lists each region with its id, its parent and the files it has. The Region input of the Geofabrik tabs of the OpenStreetMap Data panel takes a region's id, such as monaco or hong-kong; a region without layers, such as a large country, is offered only as a .osm.pbf, and the Geofabrik Layers tab then lists its parts. GDAL's OSM driver, which reads the .osm.pbf, is slow for files of more than a few megabytes ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026b)): the smallest region that covers the area is the fastest to read.

## Which Earlier Date or Year to Compare With

The date setting of Overpass QL runs a query against the OpenStreetMap database as of a date, back to 2012-09-12T06:55:00Z ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026b)). Geofabrik keeps files of 1 January of each year, and when it has split a country into smaller regions, the older files may exist only for the whole country ([Ramm (2024)](#ref-Ram2024a)). Ramm advises against going back further than OpenStreetMap's licence change in 2012, which made some data be removed, and notes that the way some features are mapped has changed over the years, so a tag may need adapting to an earlier date. Then and Now in the OpenStreetMap Data panel compares the features read with those of the Earlier Date or Earlier Year.

## Which Format to Save In

The Export group of the OpenStreetMap Data panel saves the features as a GeoPackage, read by any GIS and by the Geospatial Vector Files panel, or as GeoParquet, read by DuckDB and other data tools ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The saved file is a database derived from OpenStreetMap, and if it is shared it is under the Open Database License, with credit to OpenStreetMap ([OpenStreetMap Foundation (2026)](#ref-OSMF2026b)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026b"></a>GDAL/OGR Contributors (2026). OSM: OpenStreetMap XML and PBF. [gdal.org/en/stable/drivers/vector/osm.html](https://gdal.org/en/stable/drivers/vector/osm.html)

<a id="ref-Geo2026a"></a>Geofabrik (2026). Geofabrik Download Server: OpenStreetMap Data Extracts. [download.geofabrik.de](https://download.geofabrik.de/)

<a id="ref-Olb2026a"></a>Olbricht, R. (2026). Overpass API. Software, version 0.7.62, AGPL-3.0. [github.com/drolbr/Overpass-API](https://github.com/drolbr/Overpass-API)

<a id="ref-Olb2026b"></a>Olbricht, R. (2026). Overpass API User's Manual. [dev.overpass-api.de/overpass-doc/en](https://dev.overpass-api.de/overpass-doc/en/)

<a id="ref-OSMF2026b"></a>OpenStreetMap Foundation (2026). Copyright and License. [openstreetmap.org/copyright](https://www.openstreetmap.org/copyright)

<a id="ref-OSMWC2026b"></a>OpenStreetMap Wiki contributors (2026). Overpass API/Overpass QL. [wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL)

<a id="ref-OSMWC2026c"></a>OpenStreetMap Wiki contributors (2026). Tags. [wiki.openstreetmap.org/wiki/Tags](https://wiki.openstreetmap.org/wiki/Tags)

<a id="ref-Ram2024a"></a>Ramm, F. (2024). Historic OpenStreetMap data. Geofabrik blog. [blog.geofabrik.de/index.php/2024/11/13/historic-openstreetmap-data](https://blog.geofabrik.de/index.php/2024/11/13/historic-openstreetmap-data/)

<a id="ref-RR2026a"></a>Reichert, M. and Ramm, F. (2026). OpenStreetMap Data in Layered GIS Format: Free Shapefiles and GeoPackages. Geofabrik, version of 2026-04-02. [download.geofabrik.de/osm-data-in-gis-formats-free.pdf](https://download.geofabrik.de/osm-data-in-gis-formats-free.pdf)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Overpass API and Overpass QL](overpass-api-and-overpass-ql.md) · [Geofabrik Downloads](geofabrik-downloads.md) · [OpenStreetMap Tags](openstreetmap-tags.md) · [Licence and Attribution](licence-and-attribution.md)
