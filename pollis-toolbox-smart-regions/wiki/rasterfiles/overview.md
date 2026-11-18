# Raster and Point Cloud Files — Overview

## What Is Raster Data?

Raster data cover an area with a regular grid of cells, each holding a value: the elevation of the ground, the reflectance of a satellite band, a land cover class, a temperature. The grid is a matrix of rows and columns, and a georeference ties it to the map: where the grid starts, how large a cell is and in which coordinate system ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). A raster may have several bands over the same grid, one per spectral band of an image or one per date. Raster data suit quantities that vary continuously over space, and images, where vector data suit discrete features with boundaries, such as roads and parcels.

## What Is a Point Cloud?

A point cloud is a set of points measured in three dimensions, each with its x, y and z coordinates and attributes of the measurement. Airborne laser scanning, or lidar, produces point clouds by sending laser pulses from an aircraft and recording the returns: a pulse can return several times, from the top of a tree, a branch and the ground ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). Each point of a LAS file records its return number and the number of returns of its pulse, its intensity, and a classification such as ground, vegetation or building. Unlike a raster, a point cloud has no grid: points fall wherever the pulses hit, densely in some places and sparsely in others.

## How Julia Reads Rasters: Rasters.jl and ArchGDAL.jl

Rasters.jl represents a raster as an array with named dimensions, X, Y and, for a multiband file, Band, whose lookups hold the coordinates of the cells ([Schouten (2026)](#ref-Sch2026a)). It reads GeoTIFF and the other formats of GDAL through ArchGDAL.jl, and can read a file lazily, loading cells only when an operation needs them. Rasters.jl also crops, aggregates, extracts values at points and warps a raster to another coordinate system with GDAL. ArchGDAL.jl gives direct access to GDAL's data model: the driver, the bands, their data types and no-data values, the block size, the overviews and the metadata of a dataset ([Ng (2026)](#ref-Ng2026a)). The GeoTIFF tab of the Raster and Point Cloud Files panel uses Rasters.jl for the cells and ArchGDAL.jl for the metadata.

## How Julia Reads Point Clouds: PointClouds.jl

PointClouds.jl reads and writes LAS files of versions 1.0 to 1.4, and reads LAZ files, the compressed form ([Schmid (2026)](#ref-Sch2026b)). `LAS(path)` reads the header and the variable-length records at once and the point records when they are used, so a file larger than memory can still be opened. Accessor functions such as `coordinates`, `classification`, `intensity`, `return_number` and `return_count` return an attribute for a range of points, with the scale and offset of the header applied to the coordinates. PointClouds.jl also parses the coordinate system of the file, stored either as GeoTIFF keys or as Well-Known Text.

## Where DuckDB Fits With Rasters and Point Clouds

DuckDB's spatial extension, which the Smart Regions Toolbox installs, reads vector files through GDAL but has no raster or point cloud type ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The Raster and Point Cloud Files panel uses DuckDB.jl for two tasks where SQL is the shorter way: transforming cells and points to longitude and latitude with `ST_Transform` for the map view, and writing points to GeoParquet, a format DuckDB queries directly ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)). A point cloud saved as GeoParquet can then be filtered, joined with vector layers and summarised by area in SQL.

## References

<a id="ref-ASPRS2025a"></a>American Society for Photogrammetry and Remote Sensing (2025). LAS Specification 1.4, Revision 16. [github.com/ASPRSorg/LAS/releases/tag/1.4.R16](https://github.com/ASPRSorg/LAS/releases/tag/1.4.R16)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Sch2026b"></a>Schmid, M. F. (2026). PointClouds.jl: fast and flexible processing of lidar point-cloud data. [github.com/efpl-columbia/PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Factsheet](factsheet.md) · [Coordinates and Georeferencing](georeferencing.md) · [GeoTIFF](geotiff.md) · [LAS](las.md) · [Elevation Models From Point Clouds](elevation-models.md)
