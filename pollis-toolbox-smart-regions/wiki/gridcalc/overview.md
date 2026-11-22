# Grid Calculations — Overview

## What Is Map Algebra?

Map algebra treats each raster as a layer of values over the same area and builds new layers from old ones by operations that work the same way on every cell ([Tomlin (1990)](#ref-Tom1990a)). A slope map from an elevation model, a land cover map reclassified into fewer classes, the mean elevation of each district: each is one operation, or a short chain of them, applied to whole layers at once. Tomlin's cartographic modelling groups the operations by where a cell's new value comes from: from the same place in other layers, from the places around it, or from all the places in the same zone. That grouping is the one the Grid Calculations panel follows in its Local, Focal and Zonal tabs.

## Local, Focal and Zonal Operations

A local operation gives each cell a value computed only from the values at that cell, in one layer or several: reclassifying elevation into bands, or testing whether a land cover cell is of one class ([Tomlin (1990)](#ref-Tom1990a)). A focal operation gives each cell a value computed from its neighbourhood, a window of cells centred on it, such as the mean or the range of the heights around it. A zonal operation gives each zone, a set of cells that share a zone, one value computed from all of them, such as the mean elevation of an administrative area. Local and focal operations return a grid like their input; a zonal operation returns one value per zone, which can be written back onto the zone's cells or kept as a table.

## Moving Values Between Grids: Resampling and Rasterizing

Map algebra assumes that the layers combined share one grid. Two rasters from different sources rarely do: their cells differ in size, their origins are offset, or they are in different coordinate systems. Resampling computes a raster's values on another grid, and aggregation computes a coarser grid from blocks of cells ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Polygons, such as census areas, hold values that are not on any grid at all; rasterizing writes them onto one, so that they can enter a local operation with other layers. The Resample and Rasterize tabs of the Grid Calculations panel do both.

## How Julia Computes Map Algebra: Rasters.jl and Stencils.jl

Rasters.jl holds a raster as an array whose dimensions, X and Y, carry the coordinates of the cells, so that broadcasting a function over a `Raster` is a local operation and keeps the grid ([Schouten (2026a)](#ref-Sch2026a)). Rasters.jl also provides `zonal`, `aggregate`, `resample`, `rasterize` and `coverage`, the last two for polygons. Stencils.jl applies a function to a window around every cell of an array with `mapstencil`, for focal operations; its stencils include square windows and circles of a given radius ([Schouten (2026c)](#ref-Sch2026c)). Both read and write files through ArchGDAL.jl and GDAL ([Ng (2026)](#ref-Ng2026a)).

## Where DuckDB Fits in Grid Calculations

The Zonal and Rasterize tabs of the Grid Calculations panel read their areas with DuckDB's spatial extension, which reads GeoPackage, Shapefile, GeoJSON and the other vector formats of GDAL with `ST_Read` ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). `ST_Transform` puts the areas into the coordinate system of the rasters, and a filter on their envelope keeps only the areas that reach the grid. The areas then pass to Rasters.jl as GDAL geometries through DuckDB.jl ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)). The results of the Zonal tab go back into a DuckDB table, from which the map of the areas and the GeoParquet export are made.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026a). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Sch2026c"></a>Schouten, R. (2026c). Stencils.jl: static stencil mapping for Julia. [github.com/rafaqz/Stencils.jl](https://github.com/rafaqz/Stencils.jl)

<a id="ref-Tom1990a"></a>Tomlin, C. D. (1990). *Geographic information systems and cartographic modeling*. Prentice Hall.

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Local Operations](local.md) · [Focal Operations](focal.md) · [Zonal Operations](zonal.md) · [Resampling and Aggregation](resampling.md) · [Rasterizing](rasterizing.md)
