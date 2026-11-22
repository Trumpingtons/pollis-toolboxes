# Grid Calculations — Decision Guide

## Which Tab of the Grid Calculations Panel Answers My Question?

| Question | Tab | Why |
|---|---|---|
| How is the land split between ranges of a value, such as height bands? | Local | Each cell is classified on its own value |
| How does a land cover class vary with height? | Local | Two rasters compared cell by cell on one grid |
| How rough or varied is the ground around each place? | Focal | A statistic of the window around each cell |
| How can a noisy raster be smoothed? | Focal | A mean or median of the window |
| What is the mean value, or the share of a class, in each district? | Zonal | One value per area from the cells inside it |
| How can a fine raster be made coarser, or put onto the grid of another? | Resample | Aggregation and resampling |
| How can values of areas be combined with rasters? | Rasterize | The areas written onto a grid |

## Continuous Values and Classes Need Different Methods

A raster holds either continuous values, such as elevation or temperature, or classes, such as land cover codes, and the choice of statistic or resampling method depends on which ([Tomlin (1990)](#ref-Tom1990a)).

| Operation | Continuous values | Classes |
|---|---|---|
| Resample onto coarser cells | Mean, Median, Maximum or Minimum of the block | Most Common Class |
| Resample onto finer or shifted cells | Bilinear interpolation | Nearest Cell |
| Zonal statistic | Mean, Median, Maximum, Minimum, Standard Deviation | The share of each class |
| Focal statistic | Mean, Median, Standard Deviation, Relief | The most common class in the window |

The Grid Calculations panel's Focal tab offers the statistics for continuous values only.

## Choosing a Window and an Edge Rule for the Focal Tab

The Window input of the Focal tab chooses a Square window, 3 by 3 cells at a Radius in Cells of 1, or a Circle, the cells whose centres lie within the radius of the centre cell ([Schouten (2026)](#ref-Sch2026a)). A circle treats every direction alike; a square counts the corner cells, which lie farther away. The radius sets the scale of the result: the cell size times the radius is the distance over which the statistic looks. The Edges input decides what happens where the window crosses the edge of the grid: Cells Inside keeps a value computed from fewer cells, and Missing leaves the edge cells without a value, which suits statistics such as relief that grow with the number of cells.

## Choosing Between Value at the Cell Centre and Share Covered

The Method input of the Rasterize tab decides what a cell records. Value at the Cell Centre writes the value of the area in which the cell's centre lies, which keeps the values of the areas and suits a later local operation with other rasters, such as weighting a raster by the value of its area. Share Covered writes the share of each cell that the areas cover, from 0 to 1, whatever their values ([Schouten (2026)](#ref-Sch2026a)). The share says how much of a cell belongs to the areas at all, which matters along coasts and at the edge of a study region, where a cell can be only partly inside.

## References

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Tom1990a"></a>Tomlin, C. D. (1990). *Geographic information systems and cartographic modeling*. Prentice Hall.

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Focal Operations](focal.md) · [Resampling and Aggregation](resampling.md) · [Rasterizing](rasterizing.md)
