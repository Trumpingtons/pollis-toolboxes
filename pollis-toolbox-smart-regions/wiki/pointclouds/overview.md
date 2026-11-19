# Point Cloud Files — Overview

## What Is a Point Cloud?

A point cloud is a set of points measured in three dimensions, each with its x, y and z coordinates and attributes of the measurement. Airborne laser scanning, or lidar, produces point clouds by sending laser pulses from an aircraft and recording the returns: a pulse can return several times, from the top of a tree, a branch and the ground ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). Each point of a LAS file records its return number and the number of returns of its pulse, its intensity, and a classification such as ground, vegetation or building. Unlike a raster, a point cloud has no grid: points fall wherever the pulses hit, densely in some places and sparsely in others.

## How Julia Reads Point Clouds: PointClouds.jl

PointClouds.jl reads and writes LAS files of versions 1.0 to 1.4, and reads LAZ files, the compressed form ([Schmid (2026)](#ref-Sch2026b)). `LAS(path)` reads the header and the variable-length records at once and the point records when they are used, so a file larger than memory can still be opened. Accessor functions such as `coordinates`, `classification`, `intensity`, `return_number` and `return_count` return an attribute for a range of points, with the scale and offset of the header applied to the coordinates. PointClouds.jl also parses the coordinate system of the file, stored either as GeoTIFF keys or as Well-Known Text.

## Where DuckDB Fits With Point Clouds

DuckDB's spatial extension, which the Smart Regions Toolbox installs, reads vector files through GDAL but has no point cloud type ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The Point Cloud Files panel uses DuckDB.jl for two tasks where SQL is the shorter way: transforming points to longitude and latitude with `ST_Transform` for the map view, and writing points to GeoParquet, a format DuckDB queries directly ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)). A point cloud saved as GeoParquet can then be filtered, joined with vector layers and summarised by area in SQL.

## References

<a id="ref-ASPRS2025a"></a>American Society for Photogrammetry and Remote Sensing (2025). LAS Specification 1.4, Revision 16. [github.com/ASPRSorg/LAS/releases/tag/1.4.R16](https://github.com/ASPRSorg/LAS/releases/tag/1.4.R16)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Sch2026b"></a>Schmid, M. F. (2026). PointClouds.jl: fast and flexible processing of lidar point-cloud data. [github.com/efpl-columbia/PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl)

## See Also
- [Factsheet](factsheet.md) · [Coordinates and Georeferencing](georeferencing.md) · [LAS](las.md) · [LAZ](laz.md) · [Elevation Models From Point Clouds](elevation-models.md)
