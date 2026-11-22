# Terrain and Elevation Analysis — Overview

## What a Digital Elevation Model Records

A digital elevation model stores the height of the land surface at the cells of a regular grid. Global models such as the Copernicus DEM give the height of the surface the satellite sees, with buildings and trees, in cells of about 30 metres ([European Space Agency and Airbus (2022)](#ref-ESAA2022a)); national lidar surveys give the bare ground in cells of a metre or less. Every measure of the Terrain and Elevation Analysis panel is computed from these heights alone, so the cell size of the model sets the smallest form a measure can see: a 30 metre grid shows hills and valleys, not a kerb or a ditch.

## Land Surface Parameters

Geomorphometry calls the measures derived from an elevation model land surface parameters ([Hengl and Reuter (2009)](#ref-HR2009a)). Local parameters, such as slope, aspect and curvature, describe a cell from the cells right around it. Regional parameters, such as the upslope area, depend on cells far away: the area that drains through a valley floor can stretch to a ridge several kilometres off. Indices combine parameters to rank places by a process they stand for, as the Topographic Wetness Index ranks them by their tendency to be wet. The Slope and Aspect, Hillshade, Curvature and Relief Indices tabs compute local parameters; the Flow and Wetness tab follows the water across the whole grid.

## Derivatives of the Surface

Slope and aspect come from the first derivatives of the surface, its rates of rise to the east and to the north; curvature comes from the second derivatives, the rates at which those rises change ([Minár, Evans and Jenčo (2020)](#ref-MEJ2020a)). On a grid the derivatives are estimated from the heights of a cell and its neighbours, either by finite differences, as Horn's and Zevenbergen and Thorne's methods do, or by fitting a smooth surface to a window of cells and taking the derivatives of that surface ([Horn (1981)](#ref-Hor1981a); [Zevenbergen and Thorne (1987)](#ref-ZT1987a)). A larger window gives derivatives of broader forms and less noise.

## Measures of the Land Surface in Julia

Geomorphometry.jl computes slope, aspect, hillshade, curvatures, relief indices and hydrological measures on a matrix of heights or on a Rasters.jl `Raster`, from which it takes the cell size ([Pronk and Schouten (2026)](#ref-PS2026a); [Schouten (2026a)](#ref-Sch2026a)). Stencils.jl applies any function to the window of cells around every cell with `mapstencil`, which the Curvature tab uses to fit a quadratic surface in a window of any size ([Schouten (2026c)](#ref-Sch2026c)). The Flow and Wetness tab writes its filling and D-infinity routing in the Example Code, in plain Julia, so that each step of the routing can be read and changed.

## References

<a id="ref-ESAA2022a"></a>European Space Agency and Airbus (2022). Copernicus DEM. [doi:10.5270/ESA-c5d3d65](https://doi.org/10.5270/ESA-c5d3d65)

<a id="ref-HR2009a"></a>Hengl, T. and Reuter, H. I. (eds.) (2009). *Geomorphometry: concepts, software, applications*. Developments in Soil Science 33. Elsevier. [doi:10.1016/S0166-2481(08)X0001-7](https://doi.org/10.1016/S0166-2481(08)X0001-7)

<a id="ref-Hor1981a"></a>Horn, B. K. P. (1981). Hill shading and the reflectance map. *Proceedings of the IEEE* 69(1), 14–47. [doi:10.1109/PROC.1981.11918](https://doi.org/10.1109/PROC.1981.11918)

<a id="ref-MEJ2020a"></a>Minár, J., Evans, I. S. and Jenčo, M. (2020). A comprehensive system of definitions of land surface (topographic) curvatures, with implications for their application in geoscience modelling and prediction. *Earth-Science Reviews* 211, 103414. [doi:10.1016/j.earscirev.2020.103414](https://doi.org/10.1016/j.earscirev.2020.103414)

<a id="ref-PS2026a"></a>Pronk, M. and Schouten, R. (2026). Geomorphometry.jl: analyzing and visualizing the shape of the Earth in Julia. *Journal of Open Source Software* 11(122), 10395. [doi:10.21105/joss.10395](https://doi.org/10.21105/joss.10395)

<a id="ref-Sch2026a"></a>Schouten, R. (2026a). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Sch2026c"></a>Schouten, R. (2026c). Stencils.jl: static stencil mapping for Julia. [github.com/rafaqz/Stencils.jl](https://github.com/rafaqz/Stencils.jl)

<a id="ref-ZT1987a"></a>Zevenbergen, L. W. and Thorne, C. R. (1987). Quantitative analysis of land surface topography. *Earth Surface Processes and Landforms* 12(1), 47–56. [doi:10.1002/esp.3290120107](https://doi.org/10.1002/esp.3290120107)

## See Also
- [Factsheet](factsheet.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Slope and Aspect](slope-aspect.md) · [Flow and Wetness](flow-wetness.md)
