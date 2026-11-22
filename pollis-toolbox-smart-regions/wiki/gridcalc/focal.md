# Focal Operations

## What a Focal Operation Does

A focal operation computes the new value of each cell from the cells in its neighbourhood, a window centred on it ([Tomlin (1990)](#ref-Tom1990a)). The window moves over the grid one cell at a time, which is why focal operations are also called moving-window or neighbourhood operations. Smoothing a noisy raster, measuring how much the ground varies around each place, and detecting edges between regions of different values are all focal operations. The result has the grid of the input, but each of its values summarises an area larger than one cell, so neighbouring cells of the result share most of their inputs and vary less from one to the next than the input does.

## Square and Circular Windows

The Window input of the Focal tab chooses the shape of the neighbourhood. A Square window of Radius in Cells r holds the cells within r rows and r columns of the centre, so a radius of 1 gives 3 by 3 cells and a radius of 2 gives 5 by 5. A Circle of radius r holds the cells whose centres lie within r cells of the centre cell ([Schouten (2026c)](#ref-Sch2026c)). Window Sizes Compared computes the statistic in square windows of radius 1, 2 and 3 and prints how its spread across the grid changes: a mean spreads less as the window grows, while a relief or a standard deviation grows.

## Statistics of a Window

The Statistic input of the Focal tab chooses what is computed from the cells of each window. Mean and Median smooth the raster; the median keeps sharp steps between flat areas where the mean blurs them, and is not pulled by a single extreme cell. Maximum and Minimum spread high or low values outwards by the radius of the window. Standard Deviation measures how much the values vary around each cell, and Relief (Maximum Minus Minimum) the range they span, which for an elevation model is the local relief of the terrain, a simple measure of how rugged it is.

## What Happens at the Edges of the Grid

Near the edge of the grid, part of the window lies outside it. The Edges input of the Focal tab decides what the statistic is then computed from. Cells Inside computes it from the cells of the window that lie in the grid, as terra's `focal` does with `na.rm = TRUE` ([Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)); the edge cells then rest on fewer values. Missing gives a missing value wherever the window reaches past the edge, so a band of cells as wide as the radius is left without a value. The same two rules apply around missing cells inside the grid. Edges Compared counts the cells whose value differs between the two rules.

## Focal Operations in Julia with Stencils.jl

Stencils.jl applies a function to the neighbourhood of every cell of an array with `mapstencil(f, stencil, A)`, where the stencil is a `Window(r)`, a `Circle(r)` or another shape, and `f` receives the values of the neighbourhood ([Schouten (2026c)](#ref-Sch2026c)). The `boundary` keyword says what lies beyond the edge: `Remove(missing)` pads the array with `missing`, which a function wrapped in `skipmissing` then ignores. The Focal tab runs `mapstencil` on the matrix of the elevation's cells and puts the result back onto the elevation's grid with `rebuild` of Rasters.jl ([Schouten (2026a)](#ref-Sch2026a)).

## References

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-Sch2026a"></a>Schouten, R. (2026a). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Sch2026c"></a>Schouten, R. (2026c). Stencils.jl: static stencil mapping for Julia. [github.com/rafaqz/Stencils.jl](https://github.com/rafaqz/Stencils.jl)

<a id="ref-Tom1990a"></a>Tomlin, C. D. (1990). *Geographic information systems and cartographic modeling*. Prentice Hall.

## See Also
- [Overview](overview.md) · [Local Operations](local.md) · [Zonal Operations](zonal.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
