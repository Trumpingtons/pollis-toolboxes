# Local Operations

## What a Local Operation Does

A local operation computes the new value of each cell from the values at the same cell, and nothing else ([Tomlin (1990)](#ref-Tom1990a)). With one input layer it transforms or reclassifies: converting units, taking a logarithm, grouping values into classes. With several layers it combines them: the difference between two dates, a weighted sum of factors in a suitability map, a test of whether one layer is above a threshold where another is of a given class. Because no cell looks at its neighbours, a local operation can run on the cells in any order, or in parallel, and the result has the grid of its inputs.

## Reclassifying a Raster into Bands

Reclassifying replaces ranges of values with class numbers. The Breaks input of the Local tab lists the limits of the bands in increasing order, and each cell takes the number of the band its value falls in: band 1 runs from the first limit up to, but not including, the second, and so on. A cell below the first limit or at or above the last lies outside the breaks and takes 0. terra's `classify` does the same with a matrix of limits ([Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)). Bands of equal width suit values spread evenly; wider bands at the top suit values, such as elevation in lowland regions, whose high values are rare.

## Combining Two Rasters Cell by Cell

Two rasters can be combined cell by cell only when their cells coincide. The Local tab puts the elevation onto the grid of the land cover, whose cells are smaller, by bilinear interpolation, so that each land cover cell has an elevation; the land cover itself is never interpolated, as its values are classes. The tab then tests each land cover cell against the Land Cover Class chosen and, within each elevation band, takes the share of cells of that class. The result says how the class is spread over the bands, a cross-tabulation of two layers computed from their cells ([Tomlin (1990)](#ref-Tom1990a)).

## Local Operations in Julia: Broadcasting over a Raster

A Rasters.jl `Raster` is an array, so a function applied with Julia's dot syntax, such as `band_of.(dem)` or `cover .== 50`, runs on every cell and returns a `Raster` on the same grid ([Schouten (2026)](#ref-Sch2026a)). A missing cell passes through most functions as `missing`, so a no-data cell of an input stays a no-data cell of the result. Two rasters broadcast together, such as `a .- b`, are paired cell by cell along their dimensions. The cells of a band or a class are found with a Boolean raster of the same grid, which selects the matching cells of any other raster on that grid.

## References

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Tom1990a"></a>Tomlin, C. D. (1990). *Geographic information systems and cartographic modeling*. Prentice Hall.

## See Also
- [Overview](overview.md) · [Focal Operations](focal.md) · [Zonal Operations](zonal.md) · [Resampling and Aggregation](resampling.md) · [Diagnostics](diagnostics.md)
