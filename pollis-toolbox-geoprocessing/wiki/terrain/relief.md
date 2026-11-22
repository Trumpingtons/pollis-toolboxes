# Relief Indices

## What Relief Indices Measure

A relief index summarises how much the heights of a cell's neighbours differ from its own, in metres. Unlike slope, which measures the steepness in one direction, a relief index measures the unevenness of the ground in every direction at once, and a cell on a sharp ridge or in a narrow gully scores high even when its own gradient is small. Ecologists use relief indices to describe habitats, from mountain slopes to the sea floor, and planners to describe how accessible ground is ([Riley, DeGloria and Elliot (1999)](#ref-RDE1999a); [Wilson, O'Connell, Brown, Guinan and Grehan (2007)](#ref-WOBGG2007a)).

## Terrain Ruggedness Index

The Terrain Ruggedness Index of Riley, DeGloria and Elliot is the square root of the sum of the squared differences in height between a cell and its eight neighbours ([Riley, DeGloria and Elliot (1999)](#ref-RDE1999a)). The index is near 0 on level ground and grows with the relief around the cell, and its squares give large differences more weight than small ones. `terrain_ruggedness_index` of Geomorphometry.jl computes it ([Pronk and Schouten (2026)](#ref-PS2026a)), as terra's `terrain` with `"TRIriley"` does ([Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)). The index tracks slope closely on regular hillsides; it departs from slope where the ground is broken.

## Topographic Position Index

The Topographic Position Index is the height of a cell less the mean height of its eight neighbours ([Wilson, O'Connell, Brown, Guinan and Grehan (2007)](#ref-WOBGG2007a)). The index is positive where the cell stands above its surroundings, on a crest or a ridge, negative where the cell lies below them, in a valley or a hollow, and near 0 both on flat ground and on an even slope. `topographic_position_index` of Geomorphometry.jl and terra's `terrain` with `"TPI"` compute it. The window of eight neighbours finds small ridges and gullies; ridges and valleys a kilometre wide need the mean of a larger window.

## Roughness

Roughness of Geomorphometry.jl is the largest difference in height between a cell and any of its eight neighbours ([Pronk and Schouten (2026)](#ref-PS2026a)). terra's `terrain` with `"roughness"` measures the range of the window instead, its highest cell less its lowest, after Wilson, O'Connell, Brown, Guinan and Grehan ([Wilson, O'Connell, Brown, Guinan and Grehan (2007)](#ref-WOBGG2007a)); Replicate with terra of the Relief Indices tab computes that range with `mapstencil` of Stencils.jl and sets it beside terra's ([Schouten (2026)](#ref-Sch2026c)). Indices Compared prints the correlations of the three indices and slope over the land.

## References

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-PS2026a"></a>Pronk, M. and Schouten, R. (2026). Geomorphometry.jl: analyzing and visualizing the shape of the Earth in Julia. *Journal of Open Source Software* 11(122), 10395. [doi:10.21105/joss.10395](https://doi.org/10.21105/joss.10395)

<a id="ref-RDE1999a"></a>Riley, S. J., DeGloria, S. D. and Elliot, R. (1999). A terrain ruggedness index that quantifies topographic heterogeneity. *Intermountain Journal of Sciences* 5(1–4), 23–27.

<a id="ref-Sch2026c"></a>Schouten, R. (2026). Stencils.jl: static stencil mapping for Julia. [github.com/rafaqz/Stencils.jl](https://github.com/rafaqz/Stencils.jl)

<a id="ref-WOBGG2007a"></a>Wilson, M. F. J., O'Connell, B., Brown, C., Guinan, J. C. and Grehan, A. J. (2007). Multiscale terrain analysis of multibeam bathymetry data for habitat mapping on the continental slope. *Marine Geodesy* 30(1–2), 3–35. [doi:10.1080/01490410701295962](https://doi.org/10.1080/01490410701295962)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Slope and Aspect](slope-aspect.md) · [Curvature](curvature.md)
