# GeoParquet and FlatGeobuf

## What Is GeoParquet?

GeoParquet is a specification of the Open Geospatial Consortium for storing geospatial vector data in Apache Parquet files ([Open Geospatial Consortium (2026)](#ref-OGC2026b)). A Parquet file stores a table column by column, compressed, with its schema and statistics in the file ([Apache Software Foundation (2026)](#ref-ASF2026a)). GeoParquet adds one or more geometry columns, stored as Well-Known Binary or, from version 1.1, in native encodings of points, lines and polygons, and a `geo` key in the file's metadata that describes them. Because it is Parquet, any Parquet reader can open a GeoParquet file and read its attributes; a reader that knows GeoParquet also reads the geometries and their coordinate system.

## The Geo Metadata of a GeoParquet File

The `geo` metadata of a GeoParquet file is a JSON object with the specification's `version`, the `primary_column` holding the main geometry, and a `columns` object with an entry for each geometry column ([Open Geospatial Consortium (2026)](#ref-OGC2026b)). Each entry gives the `encoding`, the `geometry_types` found, and optionally the `crs` as PROJJSON, the `bbox` of the column, the `orientation` of polygon rings and whether `edges` are planar or spherical. A column without `crs` is in `OGC:CRS84`, longitude and latitude on WGS 84. The File Metadata action of the GeoParquet tab of the Geospatial Vector Files panel prints this object, which names the column to give in the Geometry Column input.

## Reading and Writing GeoParquet With DuckDB

`read_parquet('file.parquet')` reads a GeoParquet file with DuckDB's own Parquet reader; with the spatial extension loaded, a column described in the `geo` metadata comes back as DuckDB's `GEOMETRY` type, carrying its coordinate system ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The GeoParquet tab of the Geospatial Vector Files panel renames the column of the Geometry Column input to `geom`, so the Next Steps find it under one name. `COPY ... TO 'file.parquet' (FORMAT parquet)` writes a table with a `GEOMETRY` column as GeoParquet, with the `geo` metadata. As with any Parquet file, DuckDB reads only the columns a query names, and skips row groups whose statistics rule them out ([Raasveldt and Mühleisen (2019)](#ref-RM2019a)).

## What Is FlatGeobuf?

FlatGeobuf is a binary encoding of geographic features based on flatbuffers, which can hold a collection of Simple Features ([FlatGeobuf Contributors (2026)](#ref-FGC2026a)). A FlatGeobuf file has a header with the geometry type, the attribute columns and the coordinate system, an optional spatial index, a packed Hilbert R-tree of the features' boxes, and then the features one after another. A reader can start using features before the whole file arrives, and with the index, fetch only those in an area, also from a web server through HTTP range requests. FlatGeobuf is meant for large amounts of static data: it deliberately does not support random writes, so a changed file is written anew.

## Reading FlatGeobuf With DuckDB

`ST_Read('file.fgb')` of DuckDB's spatial extension reads a FlatGeobuf file through GDAL's FlatGeobuf driver ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). The GeoParquet tab of the Geospatial Vector Files panel reads it when its Format input is FlatGeobuf, and its File Metadata action then prints the layer, feature count, geometry type and coordinate system that GDAL finds in the header. `COPY ... (FORMAT GDAL, DRIVER 'FlatGeobuf', SRS 'EPSG:...')` writes one, with the spatial index. GeoParquet and FlatGeobuf are both binary and compact; GeoParquet suits analysis of many features by column, FlatGeobuf the reading of features by area.

## References

<a id="ref-ASF2026a"></a>Apache Software Foundation (2026). Apache Parquet Format. [github.com/apache/parquet-format](https://github.com/apache/parquet-format)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-FGC2026a"></a>FlatGeobuf Contributors (2026). FlatGeobuf: a performant binary encoding for geographic data based on flatbuffers. [github.com/flatgeobuf/flatgeobuf](https://github.com/flatgeobuf/flatgeobuf)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OGC2026b"></a>Open Geospatial Consortium (2026). GeoParquet: specification for storing geospatial vector data in Parquet. [github.com/opengeospatial/geoparquet](https://github.com/opengeospatial/geoparquet)

<a id="ref-RM2019a"></a>Raasveldt, M. and Mühleisen, H. (2019). DuckDB: an embeddable analytical database. *Proceedings of the 2019 International Conference on Management of Data (SIGMOD)*, 1981–1984. [doi:10.1145/3299869.3320212](https://doi.org/10.1145/3299869.3320212)

## See Also
- [File Formats](file-formats.md) · [GeoJSON](geojson.md) · [Coordinate Reference Systems](coordinate-reference-systems.md) · [Decision Guide](decision-guide.md)
