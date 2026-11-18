# Geospatial Vector Files — Factsheet

**Geospatial vector files** hold features: each a geometry (a point, a line or a polygon) with attributes such as a name or a count. The Geospatial Vector Files panel of the Smart Regions Toolbox reads six families of them from Julia with DuckDB and its spatial extension, which reads files through GDAL ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

| Item | Geospatial Vector Files panel |
|---|---|
| **Purpose** | Read, check, measure and convert vector files with SQL from Julia |
| **Input** | A GeoJSON, GeoPackage, Shapefile, GeoParquet, FlatGeobuf, KML, KMZ or GPX file |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| **Tabs** | GeoJSON, GeoPackage, Shapefile, GeoParquet (with FlatGeobuf), KML and KMZ, GPX |
| **Output** | A DuckDB table `features` with a `geom` column, and a Tables.jl table of its attributes |
| **Key choices** | The layer, a SQL filter, the coordinate system of the file and the one areas are measured in |

## How Does the Geospatial Vector Files Panel Read a File?

The Example Code of the Geospatial Vector Files panel opens an in-memory DuckDB database, loads the spatial extension and reads the file into a table named `features`. `ST_Read` reads every format through GDAL except GeoParquet, which `read_parquet` reads as Parquet, its geometry column coming back as DuckDB's `GEOMETRY` type ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The Filter input is a SQL condition applied as the file is read, so a large file can be cut down to one area or one kind of feature. The attributes then come to Julia through DuckDB.jl as a Tables.jl table, with each geometry as Well-Known Text ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [Quinn (2023)](#ref-Qui2023c)).

## What the Next Steps of the Geospatial Vector Files Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Preview Features | The first rows, with each geometry as text |
| Visualise | Plot the Features | Points, lines and polygon outlines in their coordinates |
| Diagnose | Layers and Coordinate System | GDAL's driver, the layers, feature counts, geometry types, coordinate systems and fields |
| Diagnose | File Metadata | The geo metadata of a GeoParquet file, or the header of a FlatGeobuf file |
| Diagnose | Geometry Check | Missing, empty and invalid geometries by type |
| Compare | File Formats Side by Side | Size and read time of the same features in six formats |
| Interpret | Extent and Measures | Bounding box, and area and length in a projected system |
| Interpret | Column Summary | Type, range, distinct values and missing share of each attribute |
| Export | Save as GeoParquet, Save as GeoJSON | A converted file next to the one read |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Qui2023c"></a>Quinn, J. (2023). Tables.jl: an interface for tables in Julia. [github.com/JuliaData/Tables.jl](https://github.com/JuliaData/Tables.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Overview](overview.md) · [File Formats](file-formats.md) · [Coordinate Reference Systems](coordinate-reference-systems.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
