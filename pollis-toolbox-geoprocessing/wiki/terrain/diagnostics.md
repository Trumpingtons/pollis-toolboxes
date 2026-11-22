# Terrain and Elevation Analysis — Diagnostics

## Heights and Distances in the Same Unit

Slope divides a rise by a distance, so heights and cell sizes must be in the same unit, usually metres. A grid in a projected coordinate system has cells measured in metres; a grid in longitude and latitude has cells measured in degrees, whose width on the ground shrinks away from the equator. Geomorphometry.jl converts the cells of a grid in degrees to metres from the latitude of the grid's centre, an approximation that worsens over large areas ([Pronk and Schouten (2026)](#ref-PS2026a)). Grid and Cell Size prints the coordinate system and the cell size in metres, and says when the grid is in longitude and latitude. `resample` of Rasters.jl, with a projected coordinate system and a cell size in metres, reprojects such a grid first ([Schouten (2026)](#ref-Sch2026a)).

## The Sea, Missing Cells and the Edge of the Grid

An elevation model of a coast records the sea in its own way: the Copernicus DEM gives the sea a height of 0 ([European Space Agency and Airbus (2022)](#ref-ESAA2022a)). The Sea at or Below input of the Terrain and Elevation Analysis panel leaves such cells out of the results, which would otherwise count the flat sea among the land. Cells on the edge of the grid are left out too, since the three by three cells around them reach past the grid, as terra also leaves them without a value ([Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)). Land, Sea and Missing Cells prints how many cells of each kind there are.

## Noise of a Surface Model

A digital surface model, such as a model from radar or photogrammetry, contains buildings, trees and errors of measurement. Second derivatives, and so curvature, amplify such noise most, then slope, while the upslope area depends on whole paths and can be diverted by a single wrong cell across a valley. A larger window for the curvature, Horn's method for the slope, or smoothing the elevation before the analysis all reduce the effect of noise ([Hengl and Reuter (2009)](#ref-HR2009a)). Window Sizes Compared shows how much the spread of the curvature narrows as the window grows.

## Depressions and Flat Ground

A depression is a cell or group of cells lower than all its neighbours, from which water cannot flow out. Most depressions in an elevation model are errors, and the Flow and Wetness tab fills them before following the water ([Barnes, Lehman and Mulla (2014)](#ref-BLM2014a)). Depressions Filled prints how many cells the filling raised, the largest rise, and the difference from `filldepressions` of Geomorphometry.jl. On a flat cell, slope is 0, aspect has no direction, and the wetness and stream power indices, which divide or multiply by the slope, are undefined; Flat Cells counts them.

## References

<a id="ref-BLM2014a"></a>Barnes, R., Lehman, C. and Mulla, D. (2014). Priority-flood: an optimal depression-filling and watershed-labeling algorithm for digital elevation models. *Computers & Geosciences* 62, 117–127. [doi:10.1016/j.cageo.2013.04.024](https://doi.org/10.1016/j.cageo.2013.04.024)

<a id="ref-ESAA2022a"></a>European Space Agency and Airbus (2022). Copernicus DEM. [doi:10.5270/ESA-c5d3d65](https://doi.org/10.5270/ESA-c5d3d65)

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-HR2009a"></a>Hengl, T. and Reuter, H. I. (eds.) (2009). *Geomorphometry: concepts, software, applications*. Developments in Soil Science 33. Elsevier. [doi:10.1016/S0166-2481(08)X0001-7](https://doi.org/10.1016/S0166-2481(08)X0001-7)

<a id="ref-PS2026a"></a>Pronk, M. and Schouten, R. (2026). Geomorphometry.jl: analyzing and visualizing the shape of the Earth in Julia. *Journal of Open Source Software* 11(122), 10395. [doi:10.21105/joss.10395](https://doi.org/10.21105/joss.10395)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Flow and Wetness](flow-wetness.md) · [Curvature](curvature.md)
