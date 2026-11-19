# Diagnostics

## A Busy Overpass Server

The public Overpass API instances are shared by many users and defend themselves against overuse: each request occupies one of the slots of its user for its run time plus a cool-down time, waits up to 15 seconds on the server for a free slot, and is answered with HTTP status 429 when it is refused by the rate limit ([Olbricht (2026)](#ref-Olb2026b)). Independently, the server admits a request only if its declared run time and memory, set by [timeout:...] and [maxsize:...], take at most half of the resources still available, and answers 504 otherwise. The Overpass API tab of the OpenStreetMap Data panel declares a timeout of 180 seconds, and retries a refused query up to five times, waiting twice as long each time, on the statuses 429, 502, 503 and 504.

## A Slow Geofabrik Server

Geofabrik updates its extracts once a day, around 21:00 CET, from the latest OpenStreetMap data ([Geofabrik (2026)](#ref-Geo2026a)). Its older files are kept on the same server, timestamped in the file name, and may take a while to start downloading. The Geofabrik tabs of the OpenStreetMap Data panel download each file once into the Folder, first under a name ending in .part so that an interrupted download is never read as a complete file, and retry when the server answers that it is busy.

## Areas and Lines

GDAL's OSM driver puts nodes with significant tags in its points layer, ways it recognises as non-areas in lines, route and multilinestring relations in multilinestrings, multipolygon and boundary relations and the ways it recognises as areas in multipolygons, and every other relation in other_relations ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026b)). Its configuration file, osmconf.ini, lists the keys, or key=value pairs, that make a closed way an area, among them amenity, building, landuse, leisure, natural, shop and tourism. A closed way with none of them, such as a roundabout, is a line. The OpenStreetMap Data panel reads OpenStreetMap files with GDAL's osmconf.ini, and Geometry Check counts the features of each layer and geometry type.

## Features Missing From Larger Files

GDAL warns that the default reading mode of its OSM driver, which reads one layer at a time, might not work correctly, because too many features accumulate in the layers before they are read, and recommends interleaved reading for large files ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026b)). GDAL also says that reconstructing geometries can be very slow for large files, and that the driver suits interactive reading of extracts of a few megabytes at most. The Overpass API and Geofabrik Full Extract tabs of the OpenStreetMap Data panel read with the open option INTERLEAVED_READING=YES; a large region takes minutes.

## Features Beyond the Area or Region

The bounding box of an Overpass QL query limits the elements selected, but the ways and relations selected may extend beyond it, and so may the elements found by recursing down to their members ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026b)). Geofabrik cuts its extracts with polygons that follow country borders with a buffer, and keeps the ways and multipolygon relations that cross the border complete, so an extract can contain more than expected ([Geofabrik (2026)](#ref-Geo2026a)). Features of the OpenStreetMap Data panel may therefore reach outside the area or region chosen.

## The Date of the Data

The Overpass API tab of the OpenStreetMap Data panel prints the time of the OpenStreetMap data the server holds, which the server gives as osm_base in the meta element of its answer; Query and Date prints it again with the query sent. Geofabrik's extracts are normally updated every day ([Geofabrik (2026)](#ref-Geo2026a)), and the Geofabrik tabs keep a downloaded file in the Folder until it is deleted: Query and Date prints when the file was downloaded and the date of Geofabrik's current file.

## Kept, Added and Removed Features

Each type of OpenStreetMap element has its own id space, so a node and a way may share an id ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026d)). Then and Now in the Overpass API and Geofabrik Full Extract tabs matches features by their type and id: a shop that was a node and is now a building outline counts as one removed and one added. In Geofabrik's layers, osm_id is the id of the node, way or relation, and is not necessarily unique, because one OpenStreetMap object can result in several geometries ([Reichert and Ramm (2026)](#ref-RR2026a)); Then and Now in the Geofabrik Layers tab matches by layer and osm_id.

## Empty Names and Population 0

In Geofabrik's layers, the name of a feature is empty when the name in OpenStreetMap contains obviously wrong data such as fixme or none, and the population of a place is set to 0 where it is not available, as it is for many places, and always for islands ([Reichert and Ramm (2026)](#ref-RR2026a)). Tag Completeness in the Geofabrik Layers tab of the OpenStreetMap Data panel counts the features with a value in each column, and an empty name or a population of 0 does not mean that the place has none.

## Invalid Geometries

Geometry Check in the OpenStreetMap Data panel tests the features read with the functions of DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)): it counts, for each layer and geometry type, the features and those whose geometry is invalid or empty.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026b"></a>GDAL/OGR Contributors (2026). OSM: OpenStreetMap XML and PBF. [gdal.org/en/stable/drivers/vector/osm.html](https://gdal.org/en/stable/drivers/vector/osm.html)

<a id="ref-Geo2026a"></a>Geofabrik (2026). Geofabrik Download Server: OpenStreetMap Data Extracts. [download.geofabrik.de](https://download.geofabrik.de/)

<a id="ref-Olb2026b"></a>Olbricht, R. (2026). Overpass API User's Manual. [dev.overpass-api.de/overpass-doc/en](https://dev.overpass-api.de/overpass-doc/en/)

<a id="ref-OSMWC2026b"></a>OpenStreetMap Wiki contributors (2026). Overpass API/Overpass QL. [wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL)

<a id="ref-OSMWC2026d"></a>OpenStreetMap Wiki contributors (2026). Elements. [wiki.openstreetmap.org/wiki/Elements](https://wiki.openstreetmap.org/wiki/Elements)

<a id="ref-RR2026a"></a>Reichert, M. and Ramm, F. (2026). OpenStreetMap Data in Layered GIS Format: Free Shapefiles and GeoPackages. Geofabrik, version of 2026-04-02. [download.geofabrik.de/osm-data-in-gis-formats-free.pdf](https://download.geofabrik.de/osm-data-in-gis-formats-free.pdf)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Overpass API and Overpass QL](overpass-api-and-overpass-ql.md) · [Geofabrik Downloads](geofabrik-downloads.md) · [OpenStreetMap Tags](openstreetmap-tags.md) · [Licence and Attribution](licence-and-attribution.md)
