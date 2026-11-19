# Raster Files — Factsheet

**Rasters** hold values on a regular grid of cells, such as an elevation model or a satellite band. The Raster Files panel of the Smart Regions Toolbox reads GeoTIFF and Cloud-Optimised GeoTIFF files with Rasters.jl and ArchGDAL.jl, which read through GDAL ([Schouten (2026)](#ref-Sch2026a); [Ng (2026)](#ref-Ng2026a); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

| Item | Raster Files panel |
|---|---|
| **Purpose** | Read, check, summarise and convert raster files from Julia |
| **Input** | A GeoTIFF or Cloud-Optimised GeoTIFF file |
| **Core packages** | [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl) |
| **Tabs** | GeoTIFF |
| **Output** | A Rasters.jl `Raster` named `grid` |
| **Key choices** | The file and the band of a multiband raster |

## How Does the Raster Files Panel Read a GeoTIFF File?

The GeoTIFF tab of the Raster Files panel opens the file with `Raster(path; lazy = true)`, which reads the header and leaves the cells on disk ([Schouten (2026)](#ref-Sch2026a)). When the file has several bands, the Band input picks one, and `read` then loads that band into memory as `grid`, with the cells the file marks as no data read as `missing`. ArchGDAL.jl gives the coordinate system as Well-Known Text, the geotransform that places the grid on the map, and the no-data value of the band ([Ng (2026)](#ref-Ng2026a)). The Next Steps work on `grid`, so they apply to any single-band raster GDAL reads.

## What the Next Steps of the Raster Files Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Plot the Raster, Histogram of Values, Show on a Map | The band as a heat map, the spread of its values, its cells on a base map |
| Diagnose | File Metadata, Missing Cells and Range | Driver, bands, tiling, compression, overviews; no-data value and extreme values |
| Compare | Compression Side by Side | Size and read time with no compression, LZW, DEFLATE, ZSTD and as a Cloud-Optimised GeoTIFF |
| Interpret | Value Summary, Values at Points | Quantiles and area covered; the value under chosen points |
| Export | Save as Cloud-Optimised GeoTIFF, Reproject to Longitude and Latitude | Converted files next to the one read |

## References

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [Coordinates and Georeferencing](georeferencing.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [GeoTIFF](geotiff.md) · [Cloud-Optimised GeoTIFF](cloud-optimised-geotiff.md)
