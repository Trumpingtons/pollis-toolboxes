# Raster Files — Overview

## What Is Raster Data?

Raster data cover an area with a regular grid of cells, each holding a value: the elevation of the ground, the reflectance of a satellite band, a land cover class, a temperature. The grid is a matrix of rows and columns, and a georeference ties it to the map: where the grid starts, how large a cell is and in which coordinate system ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). A raster may have several bands over the same grid, one per spectral band of an image or one per date. Raster data suit quantities that vary continuously over space, and images, where vector data suit discrete features with boundaries, such as roads and parcels.

## How Julia Reads Rasters: Rasters.jl and ArchGDAL.jl

Rasters.jl represents a raster as an array with named dimensions, X, Y and, for a multiband file, Band, whose lookups hold the coordinates of the cells ([Schouten (2026)](#ref-Sch2026a)). It reads GeoTIFF and the other formats of GDAL through ArchGDAL.jl, and can read a file lazily, loading cells only when an operation needs them. Rasters.jl also crops, aggregates, extracts values at points and warps a raster to another coordinate system with GDAL. ArchGDAL.jl gives direct access to GDAL's data model: the driver, the bands, their data types and no-data values, the block size, the overviews and the metadata of a dataset ([Ng (2026)](#ref-Ng2026a)). The Raster Files panel uses Rasters.jl for the cells and ArchGDAL.jl for the metadata.

## Where DuckDB Fits With Rasters

DuckDB's spatial extension, which the Smart Regions Toolbox installs, reads vector files through GDAL but has no raster type ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The Raster Files panel uses DuckDB.jl where SQL is the shorter way: transforming cells to longitude and latitude with `ST_Transform` for the map view ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Factsheet](factsheet.md) · [Coordinates and Georeferencing](georeferencing.md) · [GeoTIFF](geotiff.md) · [Cloud-Optimised GeoTIFF](cloud-optimised-geotiff.md)
