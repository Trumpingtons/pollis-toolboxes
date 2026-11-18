# Geospatial Vector Files — Overview

## What Is Geospatial Vector Data?

Geospatial vector data describes the world as features. A feature is one thing on the map, such as a school, a road or a watershed, with a geometry that says where it is and attributes that say what it is. The geometry is a point, a line, a polygon, or a collection of them, given by coordinates in a coordinate reference system. GeoJSON names the same seven geometry types that most vector formats share: Point, MultiPoint, LineString, MultiLineString, Polygon, MultiPolygon and GeometryCollection ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). Vector data differs from raster data, such as satellite images and elevation grids, which divide the ground into cells with one value each.

## What Is a Layer in a Geospatial Vector File?

A layer is a table of features that share the same attribute columns, and usually the same geometry type and coordinate system. A GeoJSON, Shapefile, GeoParquet or FlatGeobuf file holds one layer. A GeoPackage holds as many layers as the user puts in it, each with its own coordinate system, in one SQLite file ([Open Geospatial Consortium (2026)](#ref-OGC2026a)). A KML file can have one layer per folder of placemarks, and GDAL reads a GPX file as five layers: waypoints, routes, tracks, route points and track points ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). The Layers and Coordinate System action of the Geospatial Vector Files panel lists the layers of a file before one is read.

## How DuckDB's Spatial Extension Reads Vector Files

DuckDB's spatial extension adds a `GEOMETRY` column type and the `ST_` functions of spatial SQL to DuckDB, the embeddable analytical database ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [Raasveldt and Mühleisen (2019)](#ref-RM2019a)). Its `ST_Read` table function reads a file through GDAL, the Geospatial Data Abstraction Library, which has a driver for each format ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)); `ST_Read_Meta` returns what GDAL finds in a file without reading the features. `COPY ... (FORMAT GDAL, DRIVER '...')` writes a table to any format whose GDAL driver can write. `ST_Drivers()` lists the drivers the extension has. GeoParquet is read by DuckDB's own Parquet reader, which turns a column described in the file's geo metadata into a `GEOMETRY` column.

## Why Read Geospatial Vector Files With SQL?

With the features in a DuckDB table, a question about them becomes a query: how many fall inside an area, which are within a distance of a road, what is the total area by district. A filter in the query reads only the features needed. DuckDB joins the features to other tables, such as a CSV of counts by municipality or a Parquet file of sensor readings, on a shared code or on their geometries with `ST_Intersects` or `ST_Contains`. The result reaches Julia through DuckDB.jl as a table that any package accepting Tables.jl tables can use ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [Quinn (2023)](#ref-Qui2023c)).

## The Spatial Extension in the Smart Regions Toolbox

The spatial extension is not part of DuckDB itself: it is downloaded for each version of DuckDB and each platform, and holds GDAL, PROJ for coordinate transformations and GEOS for geometry operations ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Pollis downloads it when the Smart Regions Toolbox is installed, into the folder where DuckDB keeps its extensions, and keeps it when the toolbox is uninstalled, as other code may use it. The Example Code of the Geospatial Vector Files panel only has to `LOAD spatial`. After a Pollis update that brings a new version of DuckDB, the extension for that version is downloaded at the next start.

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON format. RFC 7946, Internet Engineering Task Force. [doi:10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OGC2026a"></a>Open Geospatial Consortium (2026). OGC GeoPackage Encoding Standard. [github.com/opengeospatial/geopackage](https://github.com/opengeospatial/geopackage)

<a id="ref-Qui2023c"></a>Quinn, J. (2023). Tables.jl: an interface for tables in Julia. [github.com/JuliaData/Tables.jl](https://github.com/JuliaData/Tables.jl)

<a id="ref-RM2019a"></a>Raasveldt, M. and Mühleisen, H. (2019). DuckDB: an embeddable analytical database. *Proceedings of the 2019 International Conference on Management of Data (SIGMOD)*, 1981–1984. [doi:10.1145/3299869.3320212](https://doi.org/10.1145/3299869.3320212)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Factsheet](factsheet.md) · [File Formats](file-formats.md) · [Coordinate Reference Systems](coordinate-reference-systems.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
