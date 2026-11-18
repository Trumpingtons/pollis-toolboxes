# Diagnostics

## No-Data Values in a Raster

A raster marks the cells without a measurement with a no-data value, a number outside the range of real values such as -9999 or -32768, recorded in the file for each band ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Rasters.jl reads those cells as `missing`, so that `skipmissing` leaves them out of sums, means and quantiles ([Schouten (2026)](#ref-Sch2026a)). Missing Cells and Range prints the no-data value recorded, the number and share of missing cells, and the five smallest and largest values. When a file records no no-data value, the sentinel is read as a number: a minimum of -9999 far below the next value is such a sentinel, and the cells holding it should be set to missing before any statistic.

## Checking the Structure of a GeoTIFF

File Metadata prints what GDAL finds in a GeoTIFF: the driver, the size, the number of bands, and for each band its data type, no-data value, block size and number of overviews ([Ng (2026)](#ref-Ng2026a)). The IMAGE_STRUCTURE metadata gives the compression, the interleaving of bands and, for a Cloud-Optimised GeoTIFF, the layout COG. Blocks as wide as the raster and a few rows high mean a striped file, read row by row; square blocks such as 256 by 256 or 512 by 512 mean a tiled one, which a reader can fetch by area. A large raster without overviews is slow to display at small scales, as every cell has to be read.

## A Coordinate System That Is Missing or Wrong

A raster or point cloud whose file records no coordinate system can still be read, but it cannot be placed on a map or combined with other layers. File Metadata and Header and Records print the name of the coordinate system found, or none recorded. The publisher's documentation then gives the system, and the File Coordinate System input of the LAS and LAZ tab takes its EPSG code. A file whose coordinates do not match its declared system, such as eastings of hundreds of thousands of metres labelled as longitude and latitude, shows itself on Show on a Map, where the data land far from where they belong.

## Classes and Returns of a Point Cloud

Classes and Returns counts the points of each ASPRS class and of each pair of return number and number of returns ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). A file in which every point is class 0 or 1 has not been classified, so a terrain model needs a ground classification first. Classes 7 and 18, low and high noise, mark points that are errors of the measurement, such as returns from birds or multipath, and are usually left out of every analysis. Return numbers of 0, or pulses with more returns than the scanner records, point to a file whose return fields were not filled.

## Point Density and Gaps in Coverage

Point Density counts the points that fall in each cell of the Cell Size input and divides by the area of the cell, giving points per square unit ([Schmid (2026)](#ref-Sch2026b)). The mean density says how much detail the survey resolves, and the share of empty cells says where it does not: water absorbs most laser pulses, and flight lines that do not overlap leave strips without points. A cell size at which most cells are empty is too small for grids from that cloud: the Surface and Terrain Grids action reports the cells without points and without ground points at the same cell size.

## Reading Part of a Large File

A national lidar tile can hold tens of millions of points, and a satellite scene billions of cells. The Read Every input of the LAS and LAZ tab keeps every n-th point, a regular thinning that keeps the extent and the proportions of the classes for a first look. The GeoTIFF tab opens a raster lazily and reads one band, so the cells of other bands are never read ([Schouten (2026)](#ref-Sch2026a)). For a raster larger than memory, `crop` on the lazy raster before `read` loads only the area wanted.

## References

<a id="ref-ASPRS2025a"></a>American Society for Photogrammetry and Remote Sensing (2025). LAS Specification 1.4, Revision 16. [github.com/ASPRSorg/LAS/releases/tag/1.4.R16](https://github.com/ASPRSorg/LAS/releases/tag/1.4.R16)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Sch2026b"></a>Schmid, M. F. (2026). PointClouds.jl: fast and flexible processing of lidar point-cloud data. [github.com/efpl-columbia/PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Coordinates and Georeferencing](georeferencing.md) · [GeoTIFF](geotiff.md) · [LAS](las.md) · [Elevation Models From Point Clouds](elevation-models.md) · [Decision Guide](decision-guide.md)
