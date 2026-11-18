# Raster and Point Cloud Files — Factsheet

**Rasters** hold values on a regular grid of cells, such as an elevation model or a satellite band. **Point clouds** hold measured points, each with its own coordinates, such as the returns of an airborne laser scan. The Raster and Point Cloud Files panel of the Smart Regions Toolbox reads GeoTIFF files with Rasters.jl and ArchGDAL.jl, which read through GDAL, and LAS and LAZ files with PointClouds.jl ([Schouten (2026)](#ref-Sch2026a); [Ng (2026)](#ref-Ng2026a); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a); [Schmid (2026)](#ref-Sch2026b)).

| Item | Raster and Point Cloud Files panel |
|---|---|
| **Purpose** | Read, check, summarise and convert raster and lidar files from Julia |
| **Input** | A GeoTIFF or Cloud-Optimised GeoTIFF file; a LAS or LAZ file |
| **Core packages** | [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl), [PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl) |
| **Tabs** | GeoTIFF; LAS and LAZ |
| **Output** | A Rasters.jl `Raster` named `grid`; a Tables.jl table of points named `pts` |
| **Key choices** | The band of a raster; for a point cloud, how many points to read, its coordinate system if the file records none, and the cell size of grids |

## How Does the Raster and Point Cloud Files Panel Read a GeoTIFF File?

The GeoTIFF tab of the Raster and Point Cloud Files panel opens the file with `Raster(path; lazy = true)`, which reads the header and leaves the cells on disk ([Schouten (2026)](#ref-Sch2026a)). When the file has several bands, the Band input picks one, and `read` then loads that band into memory as `grid`, with the cells the file marks as no data read as `missing`. ArchGDAL.jl gives the coordinate system as Well-Known Text, the geotransform that places the grid on the map, and the no-data value of the band ([Ng (2026)](#ref-Ng2026a)). The Next Steps work on `grid`, so they apply to any single-band raster GDAL reads.

## How Does the Raster and Point Cloud Files Panel Read a LAS or LAZ File?

The LAS and LAZ tab of the Raster and Point Cloud Files panel opens the file with `LAS(path)` of PointClouds.jl, which reads the header at once and the point records when they are used, decompressing them first when the file is LAZ ([Schmid (2026)](#ref-Sch2026b)). The Read Every input keeps every point, or every second or tenth point of a large file. The coordinates, classification, intensity and return numbers of the points kept become `pts`, a Tables.jl table with one row per point. The coordinate system comes from the file's variable-length records, or from the File Coordinate System input when the file records none.

## What the Next Steps of the GeoTIFF Tab Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Plot the Raster, Histogram of Values, Show on a Map | The band as a heat map, the spread of its values, its cells on a base map |
| Diagnose | File Metadata, Missing Cells and Range | Driver, bands, tiling, compression, overviews; no-data value and extreme values |
| Compare | Compression Side by Side | Size and read time with no compression, LZW, DEFLATE, ZSTD and as a Cloud-Optimised GeoTIFF |
| Interpret | Value Summary, Values at Points | Quantiles and area covered; the value under chosen points |
| Export | Save as Cloud-Optimised GeoTIFF, Reproject to Longitude and Latitude | Converted files next to the one read |

## What the Next Steps of the LAS and LAZ Tab Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Plot the Points, Cross-Section, Show on a Map | The cloud from above, a profile coloured by class, points on a base map |
| Diagnose | Header and Records, Classes and Returns, Point Density | The header, the classes and returns, points per square unit |
| Compare | Classes Side by Side | Height and intensity of each class |
| Interpret | Surface and Terrain Grids | Surface model, terrain model and height above ground |
| Export | Save Elevation Grids as GeoTIFF, Save as GeoParquet | Grids for the GeoTIFF tab; points for SQL with DuckDB |

## References

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Sch2026b"></a>Schmid, M. F. (2026). PointClouds.jl: fast and flexible processing of lidar point-cloud data. [github.com/efpl-columbia/PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [Coordinates and Georeferencing](georeferencing.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [GeoTIFF](geotiff.md) · [LAS](las.md)
