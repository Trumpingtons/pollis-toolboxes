# Decision Guide

## Which Files the Point Cloud Files Panel Reads

| File | Tab | Read with |
|---|---|---|
| .las, a lidar point cloud | LAS and LAZ | PointClouds.jl |
| .laz, a compressed lidar point cloud | LAS and LAZ | PointClouds.jl |

PointClouds.jl reads LAS files of versions 1.0 to 1.4 and LAZ files with the same `LAS(path)` ([Schmid (2026)](#ref-Sch2026b)). Grids of values, such as elevation models in GeoTIFF files, are read by the Raster Files panel.

## Should Point Clouds Be Kept as LAS, LAZ or GeoParquet?

LAZ keeps every bit of a LAS file in a fraction of the space, which is why national lidar surveys publish in LAZ ([Isenburg (2013)](#ref-Ise2013a)). LAS reads faster, as nothing has to be decompressed, at the cost of disk space. GeoParquet suits analysis in SQL: Save as GeoParquet writes the points with their attributes, and DuckDB then filters them by class or area and joins them with vector layers ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). A GeoParquet file drops the LAS header and its variable-length records, so the LAS or LAZ file stays the archive.

## When to Turn a Point Cloud Into a Grid

A grid of elevations is what most analyses need: slopes, flood models, volumes and the heights of buildings and trees are computed on regular cells. Surface and Terrain Grids computes a surface model, a terrain model and the height above ground at the Cell Size input, and Save Elevation Grids as GeoTIFF writes them for the Raster Files panel. The point cloud stays the source for anything a grid cannot hold, such as several returns over the same spot, the vertical structure of vegetation, or the classes of single points.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ise2013a"></a>Isenburg, M. (2013). LASzip. *Photogrammetric Engineering and Remote Sensing*, 79(2), 209–217. [doi:10.14358/PERS.79.2.209](https://doi.org/10.14358/PERS.79.2.209)

<a id="ref-Sch2026b"></a>Schmid, M. F. (2026). PointClouds.jl: fast and flexible processing of lidar point-cloud data. [github.com/efpl-columbia/PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl)

## See Also
- [Factsheet](factsheet.md) · [LAS](las.md) · [LAZ](laz.md) · [Elevation Models From Point Clouds](elevation-models.md)
