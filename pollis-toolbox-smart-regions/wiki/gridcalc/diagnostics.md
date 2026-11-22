# Grid Calculations — Diagnostics

## Checking That Two Rasters Share a Grid

Two rasters share a grid when they have the same coordinate system, the same cell size, the same origin and the same number of rows and columns. Grids Side by Side prints each of these for every raster of a tab, with the extent in the raster's own coordinates and the sampling of its cells. A local operation on rasters whose grids differ pairs cells that lie in different places, so one raster has to be resampled onto the grid of the other first ([Tomlin (1990)](#ref-Tom1990a)). A Rasters.jl `Raster` carries the coordinates of its cells in its X and Y dimensions, from which Grids Side by Side reads the cell size and extent ([Schouten (2026)](#ref-Sch2026a)).

## Cells as Points and Cells as Areas

A GeoTIFF records whether its values stand for areas, each value covering a cell, or for points at the cells' corners or centres; elevation models are often recorded as points ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). The Grid Calculations panel sets GDAL's configuration option `GTIFF_POINT_GEO_IGNORE` before reading, so that GDAL gives the coordinates of the points themselves, and then treats each point as the centre of a cell, as GDAL's own tools and terra do ([Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)). A grid read in the other way is shifted by half a cell, which changes every value interpolated from it. Grids Side by Side prints the sampling as Intervals for cells taken as areas.

## Missing Cells in a Result

A cell of a result is missing when an input cell it depends on is missing: a no-data cell of a file, a cell outside the land cover, a focal window that reaches past the edge of the grid with the Missing edge rule, or, for Rasterize with Value at the Cell Centre, a cell whose centre lies in no area. Missing Cells prints the number and share of missing cells of each raster of a tab. Rasters.jl reads no-data cells as `missing`, and `skipmissing` leaves them out of statistics ([Schouten (2026)](#ref-Sch2026a)). A share of missing cells far above what the inputs explain points to grids that only partly overlap.

## Areas of Cells in Longitude and Latitude

A cell of a grid in longitude and latitude spans a fixed angle, so the ground it covers narrows from the equator towards the poles. A count of cells is then not an area, and a mean over cells gives more weight to the cells nearer the equator. `cellarea` of Rasters.jl returns the area of each cell on the sphere, in square metres, which the Local tab sums within each elevation band ([Schouten (2026)](#ref-Sch2026a)). Over a small region the cells differ little in area; over a continent they differ a great deal. A grid in a projected coordinate system, in metres, has cells of one size.

## Areas That Hold Few Cells

A zonal statistic of an area rests on the cells the area holds. An area smaller than a few cells holds few of them, and its statistic swings with the position of the cell centres; an area smaller than one cell can hold none. Cells per Area prints how many cells of each raster each area holds, and lists the areas with the fewest. A raster of finer cells, or a statistic over every cell the area touches, gives such areas more cells to rest on.

## References

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Tom1990a"></a>Tomlin, C. D. (1990). *Geographic information systems and cartographic modeling*. Prentice Hall.

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Resampling and Aggregation](resampling.md) · [Zonal Operations](zonal.md) · [Focal Operations](focal.md)
