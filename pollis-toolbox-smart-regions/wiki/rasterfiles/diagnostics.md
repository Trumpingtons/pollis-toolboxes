# Diagnostics

## No-Data Values in a Raster

A raster marks the cells without a measurement with a no-data value, a number outside the range of real values such as -9999 or -32768, recorded in the file for each band ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Rasters.jl reads those cells as `missing`, so that `skipmissing` leaves them out of sums, means and quantiles ([Schouten (2026)](#ref-Sch2026a)). Missing Cells and Range prints the no-data value recorded, the number and share of missing cells, and the five smallest and largest values. When a file records no no-data value, the sentinel is read as a number: a minimum of -9999 far below the next value is such a sentinel, and the cells holding it should be set to missing before any statistic.

## Checking the Structure of a GeoTIFF

File Metadata prints what GDAL finds in a GeoTIFF: the driver, the size, the number of bands, and for each band its data type, no-data value, block size and number of overviews ([Ng (2026)](#ref-Ng2026a)). The IMAGE_STRUCTURE metadata gives the compression, the interleaving of bands and, for a Cloud-Optimised GeoTIFF, the layout COG. Blocks as wide as the raster and a few rows high mean a striped file, read row by row; square blocks such as 256 by 256 or 512 by 512 mean a tiled one, which a reader can fetch by area. A large raster without overviews is slow to display at small scales, as every cell has to be read.

## A Coordinate System That Is Missing or Wrong

A raster whose file records no coordinate system can still be read, but it cannot be placed on a map or combined with other layers. File Metadata prints the name of the coordinate system found, or none recorded; the publisher's documentation then gives the system. A file whose coordinates do not match its declared system, such as eastings of hundreds of thousands of metres labelled as longitude and latitude, shows itself on Show on a Map, where the data land far from where they belong.

## Reading Part of a Large File

A satellite scene can hold billions of cells. The Raster Files panel opens a raster lazily and reads one band, so the cells of other bands are never read ([Schouten (2026)](#ref-Sch2026a)). For a raster larger than memory, `crop` on the lazy raster before `read` loads only the area wanted.

## References

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Coordinates and Georeferencing](georeferencing.md) · [GeoTIFF](geotiff.md) · [Cloud-Optimised GeoTIFF](cloud-optimised-geotiff.md) · [Decision Guide](decision-guide.md)
