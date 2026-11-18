# Decision Guide

## Which Tab of the Raster and Point Cloud Files Panel to Use

| File | Tab | Read with |
|---|---|---|
| .tif or .tiff, an elevation model, an image band or a map of values | GeoTIFF | Rasters.jl and ArchGDAL.jl |
| .tif published as a Cloud-Optimised GeoTIFF | GeoTIFF | Rasters.jl and ArchGDAL.jl |
| .las, a lidar point cloud | LAS and LAZ | PointClouds.jl |
| .laz, a compressed lidar point cloud | LAS and LAZ | PointClouds.jl |

Rasters.jl also reads the other raster formats of GDAL, such as NetCDF or JPEG 2000, so the GeoTIFF tab works for them with the File input changed ([Schouten (2026)](#ref-Sch2026a)).

## Should a Raster Be Read Lazily or Into Memory?

A lazy raster, `Raster(path; lazy = true)`, reads cells from disk when an operation needs them, block by block ([Schouten (2026)](#ref-Sch2026a)). Lazy reading suits a raster larger than memory, a crop of a small area of a large file, or a Cloud-Optimised GeoTIFF on a web server, where only the tiles of the area are downloaded ([Open Geospatial Consortium (2023)](#ref-OGC2023a)). Reading into memory with `read` suits a raster that fits, used by several operations in turn, as each cell is then read once. The GeoTIFF tab of the Raster and Point Cloud Files panel opens lazily, picks the band and then reads it.

## Which Compression to Use for a GeoTIFF

LZW, DEFLATE and ZSTD are lossless: the values read back are the values written. DEFLATE and LZW are read by nearly all GeoTIFF software; ZSTD is newer, so older software may not read it. The predictor option, set to 2 for integers and continuous surfaces, stores differences between neighbouring cells, which compress better than the values ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Which compresses best depends on the data: Compression Side by Side writes the band read in each way and reports the size and read time, so the choice can be made on the data at hand.

## When to Publish a Cloud-Optimised GeoTIFF

A Cloud-Optimised GeoTIFF is the format to choose for a raster that others will read over the web, or that a map will display at many scales: its tiles and overviews let a reader fetch only the part and resolution it needs ([Open Geospatial Consortium (2023)](#ref-OGC2023a)). A Cloud-Optimised GeoTIFF is still a valid GeoTIFF, read by any GeoTIFF reader, so there is little cost in writing every new raster that way. Save as Cloud-Optimised GeoTIFF writes one with GDAL's COG driver.

## Should Point Clouds Be Kept as LAS, LAZ or GeoParquet?

LAZ keeps every bit of a LAS file in a fraction of the space, which is why national lidar surveys publish in LAZ ([Isenburg (2013)](#ref-Ise2013a)). LAS reads faster, as nothing has to be decompressed, at the cost of disk space. GeoParquet suits analysis in SQL: Save as GeoParquet writes the points with their attributes, and DuckDB then filters them by class or area and joins them with vector layers ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). A GeoParquet file drops the LAS header and its variable-length records, so the LAS or LAZ file stays the archive.

## When to Turn a Point Cloud Into a Grid

A grid of elevations is what most analyses need: slopes, flood models, volumes and the heights of buildings and trees are computed on regular cells. Surface and Terrain Grids computes a surface model, a terrain model and the height above ground at the Cell Size input, and Save Elevation Grids as GeoTIFF writes them for the GeoTIFF tab. The point cloud stays the source for anything a grid cannot hold, such as several returns over the same spot, the vertical structure of vegetation, or the classes of single points.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Ise2013a"></a>Isenburg, M. (2013). LASzip. *Photogrammetric Engineering and Remote Sensing*, 79(2), 209–217. [doi:10.14358/PERS.79.2.209](https://doi.org/10.14358/PERS.79.2.209)

<a id="ref-OGC2023a"></a>Open Geospatial Consortium (2023). OGC Cloud Optimized GeoTIFF Standard, Version 1.0 (OGC 21-026). [docs.ogc.org/is/21-026/21-026.html](https://docs.ogc.org/is/21-026/21-026.html)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Factsheet](factsheet.md) · [GeoTIFF](geotiff.md) · [Cloud-Optimised GeoTIFF](cloud-optimised-geotiff.md) · [LAZ](laz.md) · [Elevation Models From Point Clouds](elevation-models.md)
