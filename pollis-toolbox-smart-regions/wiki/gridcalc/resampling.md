# Resampling and Aggregation

## Two Ways to Change the Grid of a Raster

Aggregation and resampling both give a raster a new grid. Aggregation joins blocks of cells, such as 10 by 10, into one larger cell, so the new grid is a coarser version of the old one, aligned with it. Resampling computes the raster's values on any other grid, with cells of another size, an offset origin or another coordinate system, by taking for each new cell the old cells around it ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Aggregation is the simpler choice when only coarser cells are wanted; resampling is needed to put one raster onto the grid of another before a local operation combines them.

## Aggregating Blocks of Cells

The Block of Cells input of the Resample tab sets how many cells along each side form one new cell, and the Elevation Method input the statistic of the block: Mean, Median, Maximum or Minimum. A mean keeps the average of the raster and smooths it; a maximum or minimum keeps the extremes, such as the highest point of each block. When the rows or columns of the raster are not a multiple of the block, the cells left over at the edge form a partial block. `aggregate` of Rasters.jl leaves the partial block out, and terra's `aggregate` keeps it as a smaller block ([Schouten (2026)](#ref-Sch2026a); [Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)).

## Resampling a Raster of Classes

The values of a raster of classes are codes, and an average of two codes is not a class. The Land Cover Method input of the Resample tab offers the two methods that return one of the raster's own classes. Most Common Class gives each new cell the class that covers most of it, the mode of the old cells inside it, which keeps the dominant class and lets rare classes disappear from coarse cells. Nearest Cell gives each new cell the class of the old cell nearest its centre, which keeps the shares of the classes on average, since each cell is a sample, but makes the result depend on where the centres fall. Methods Compared prints the shares of the classes after each method.

## Resampling Continuous Values

For continuous values, such as elevation, the methods of GDAL's warper include nearest neighbour, bilinear and cubic interpolation, and the statistics of the old cells inside each new one, such as the average ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Bilinear interpolation weights the four old cells around each new centre by their distance, and suits new cells smaller than the old ones, as when the Local tab puts the elevation onto a finer grid. When the new cells are much larger, interpolation reads only the cells near each new centre and ignores the rest, so an average of all the old cells inside each new cell represents them better.

## Resampling in Julia: resample and aggregate of Rasters.jl

`resample(raster; to = other, method = :bilinear)` of Rasters.jl puts a raster onto the grid of another raster, with the coordinate system, cell size and extent of `other`, and `method` names one of GDAL's resampling methods, such as `:near`, `:bilinear`, `:average` or `:mode` ([Schouten (2026)](#ref-Sch2026a)). The warping itself is done by GDAL through ArchGDAL.jl ([Ng (2026)](#ref-Ng2026a)), as terra's `resample` also does through GDAL. `Rasters.aggregate(f, raster, n)` applies `f` to blocks of `n` by `n` cells, with `skipmissingval = true` to leave missing cells out of each block.

## References

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [Local Operations](local.md) · [Rasterizing](rasterizing.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
