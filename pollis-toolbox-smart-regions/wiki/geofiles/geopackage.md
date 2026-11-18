# GeoPackage

## What Is a GeoPackage?

A GeoPackage is a single SQLite database file, ending in `.gpkg`, laid out by the OGC GeoPackage Encoding Standard of the Open Geospatial Consortium ([Open Geospatial Consortium (2026)](#ref-OGC2026a)). It can hold vector feature layers, tile pyramids of raster maps and images, and attribute tables without geometry, side by side. Being SQLite, it is read and written by any SQLite library, updated in place, and works offline on any platform. The standard defines the tables a GeoPackage must have, how geometries are stored, and extensions such as spatial indexes. It is a common format for delivering the layers of a project together.

## Layers and Coordinate Systems in a GeoPackage

Each layer of a GeoPackage is a table, listed in the `gpkg_contents` table with its name, kind and extent ([Open Geospatial Consortium (2026)](#ref-OGC2026a)). A feature layer is described in `gpkg_geometry_columns`, which names its geometry column, geometry type and coordinate system, and the systems themselves are defined in `gpkg_spatial_ref_sys`. So each layer can be in its own coordinate system. Geometries are stored as binary: a short GeoPackage header, with the system and an optional envelope, followed by Well-Known Binary. The Layer input of the GeoPackage tab of the Geospatial Vector Files panel names the layer to read, and Layers and Coordinate System lists them all.

## Reading a GeoPackage With DuckDB

`ST_Read('file.gpkg', layer = 'name')` of DuckDB's spatial extension reads one layer of a GeoPackage through GDAL's GPKG driver ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Without `layer`, the first layer is read. The geometry comes back in the layer's own coordinate system, which the File Coordinate System input of the Geospatial Vector Files panel must match for Extent and Measures and Save as GeoJSON to transform it rightly. `COPY ... (FORMAT GDAL, DRIVER 'GPKG', LAYER_NAME 'name', SRS 'EPSG:...')` writes a table as a GeoPackage layer with its coordinate system recorded.

## Spatial Indexes and Size of a GeoPackage

The GeoPackage standard defines an extension that keeps an R-tree index of a feature layer's envelopes in SQLite's R-tree virtual tables, kept up to date by triggers as features change ([Open Geospatial Consortium (2026)](#ref-OGC2026a)). GIS software uses it to draw or query a small area of a large layer without reading every feature. A GeoPackage is larger than the same features in GeoParquet, which compresses its columns, but it can be edited feature by feature, which a Parquet file cannot.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OGC2026a"></a>Open Geospatial Consortium (2026). OGC GeoPackage Encoding Standard. [github.com/opengeospatial/geopackage](https://github.com/opengeospatial/geopackage)

## See Also
- [File Formats](file-formats.md) · [Shapefile](shapefile.md) · [Coordinate Reference Systems](coordinate-reference-systems.md) · [Decision Guide](decision-guide.md)
