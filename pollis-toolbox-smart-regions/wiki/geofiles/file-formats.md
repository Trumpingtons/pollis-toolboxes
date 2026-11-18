# Geospatial Vector Files — File Formats

## The Six Geospatial Vector Formats Side by Side

| Format | Structure | Layers | Coordinate system | Specification |
|---|---|---|---|---|
| GeoJSON | JSON text | One | Always WGS 84 longitude and latitude | [Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a) |
| GeoPackage | SQLite database | Many | One per layer | [Open Geospatial Consortium (2026)](#ref-OGC2026a) |
| Shapefile | A .shp, .shx and .dbf file, and others beside them | One | In a .prj file, if there is one | [Environmental Systems Research Institute (1998)](#ref-ESRI1998a) |
| GeoParquet | Parquet columns, geometries as binary | One | In the file's geo metadata | [Open Geospatial Consortium (2026)](#ref-OGC2026b) |
| FlatGeobuf | Binary features with a spatial index | One | In the header | [FlatGeobuf Contributors (2026)](#ref-FGC2026a) |
| KML and KMZ | XML text, zipped in a KMZ | One per folder | Always WGS 84 longitude and latitude | [Wilson (2008)](#ref-Wil2008a) |
| GPX | XML text of GPS points | Waypoints, routes, tracks | Always WGS 84 latitude and longitude | [TopoGrafix (2004)](#ref-TG2004a) |

## Text Formats and Binary Formats for Geospatial Vector Data

GeoJSON, KML and GPX are text: a text editor opens them, and a version control system shows what changed. Each coordinate is written out in decimal digits, so text files grow large and are slow to read when the features are many. GeoJSON recommends six decimal places of a degree, about ten centimetres, as enough for most uses ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). GeoPackage, Shapefile, GeoParquet and FlatGeobuf store coordinates as binary numbers, which take less space and are read without parsing text. GeoParquet adds column-by-column compression, as any Parquet file does ([Apache Software Foundation (2026)](#ref-ASF2026a)). The File Formats Side by Side action of the Geospatial Vector Files panel writes the same features in each format and shows the size and read time of each.

## Spatial Indexes in Geospatial Vector Files

A spatial index lets a reader find the features in an area without reading them all. A GeoPackage keeps an R-tree index of each layer in SQLite tables, through the GeoPackage extension for R-tree indexes ([Open Geospatial Consortium (2026)](#ref-OGC2026a)). A FlatGeobuf file can start with a packed Hilbert R-tree, so a reader, even over HTTP with range requests, fetches only the features whose boxes meet the area asked for ([FlatGeobuf Contributors (2026)](#ref-FGC2026a)). GeoParquet 1.1 can add a bounding-box column per geometry column, which Parquet's row-group statistics use to skip rows ([Open Geospatial Consortium (2026)](#ref-OGC2026b)). A Shapefile may have a separate index file. GeoJSON, KML and GPX have none: every feature is read to find those in an area.

## Writing Geospatial Vector Files From DuckDB

DuckDB's spatial extension writes a table with `COPY ... TO 'file' (FORMAT GDAL, DRIVER '...')`, through GDAL's driver for the format ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). The driver names are `GeoJSON`, `GPKG`, `ESRI Shapefile`, `FlatGeobuf` and `KML`. The `SRS` option records the coordinate system, such as `SRS 'EPSG:4326'`, in formats that store one, and `LAYER_NAME` names the layer of a GeoPackage. GeoParquet is written with `COPY ... (FORMAT parquet)`, which adds the geo metadata for each `GEOMETRY` column. The Save as GeoParquet and Save as GeoJSON actions of the Geospatial Vector Files panel write the features read, next to the original file.

## References

<a id="ref-ASF2026a"></a>Apache Software Foundation (2026). Apache Parquet Format. [github.com/apache/parquet-format](https://github.com/apache/parquet-format)

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON format. RFC 7946, Internet Engineering Task Force. [doi:10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-ESRI1998a"></a>Environmental Systems Research Institute (1998). ESRI Shapefile Technical Description. [esri.com](https://www.esri.com/content/dam/esrisites/sitecore-archive/Files/Pdfs/library/whitepapers/pdfs/shapefile.pdf)

<a id="ref-FGC2026a"></a>FlatGeobuf Contributors (2026). FlatGeobuf: a performant binary encoding for geographic data based on flatbuffers. [github.com/flatgeobuf/flatgeobuf](https://github.com/flatgeobuf/flatgeobuf)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OGC2026a"></a>Open Geospatial Consortium (2026). OGC GeoPackage Encoding Standard. [github.com/opengeospatial/geopackage](https://github.com/opengeospatial/geopackage)

<a id="ref-OGC2026b"></a>Open Geospatial Consortium (2026). GeoParquet: specification for storing geospatial vector data in Parquet. [github.com/opengeospatial/geoparquet](https://github.com/opengeospatial/geoparquet)

<a id="ref-TG2004a"></a>TopoGrafix (2004). GPX 1.1: the GPS Exchange Format. [topografix.com/GPX/1/1](https://www.topografix.com/GPX/1/1/)

<a id="ref-Wil2008a"></a>Wilson, T. (2008). OGC KML. Open Geospatial Consortium. [ogc.org/standards/kml](https://www.ogc.org/standards/kml/)

## See Also
- [Overview](overview.md) · [Coordinate Reference Systems](coordinate-reference-systems.md) · [Decision Guide](decision-guide.md) · [GeoJSON](geojson.md) · [GeoPackage](geopackage.md) · [Shapefile](shapefile.md) · [GeoParquet and FlatGeobuf](geoparquet-flatgeobuf.md) · [KML and KMZ](kml-kmz.md) · [GPX](gpx.md)
