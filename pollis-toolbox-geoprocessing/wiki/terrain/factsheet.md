# Terrain and Elevation Analysis — Factsheet

**Geomorphometry** is the measurement of the land surface from a digital elevation model: how steep it is, which way it faces, how it bends, how rugged it is, and where water flows over it ([Hengl and Reuter (2009)](#ref-HR2009a)). The Terrain and Elevation Analysis panel of the Geoprocessing Toolbox computes these land surface parameters with Geomorphometry.jl and Stencils.jl, on a grid read by Rasters.jl ([Pronk and Schouten (2026)](#ref-PS2026a); [Schouten (2026c)](#ref-Sch2026c); [Schouten (2026a)](#ref-Sch2026a)).

| Item | Terrain and Elevation Analysis panel |
|---|---|
| **Purpose** | Compute slope, aspect, hillshade, curvature, relief indices, upslope area and wetness from an elevation model |
| **Input** | A GeoTIFF of elevation in metres, best in a projected coordinate system |
| **Core packages** | [Geomorphometry.jl](https://github.com/Deltares/Geomorphometry.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [Stencils.jl](https://github.com/rafaqz/Stencils.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl) |
| **Tabs** | Slope and Aspect, Hillshade, Curvature, Relief Indices, Flow and Wetness |
| **Output** | A Rasters.jl `Raster` named `result` on the grid of the elevation, missing off land and on the edge of the grid |
| **Key choices** | The slope method, the light, the window of the curvature, the index, and the threshold of a stream |

## What Each Tab of the Terrain and Elevation Analysis Panel Computes

| Tab | Function | Result |
|---|---|---|
| Slope and Aspect | `slope` and `aspect` of Geomorphometry.jl | Slope in degrees and aspect clockwise from north, with the land in classes of slope |
| Hillshade | `hillshade` and `multihillshade` | Brightness from 0 to 255 under a light from one or several directions |
| Curvature | A quadratic fitted with `mapstencil` of Stencils.jl | Profile and tangential curvature, in 1/m |
| Relief Indices | `terrain_ruggedness_index`, `topographic_position_index`, `roughness` | Ruggedness around each cell, in metres |
| Flow and Wetness | Priority-Flood filling and D-infinity, in the Example Code | Upslope area, Topographic Wetness Index, Stream Power Index |

## What the Next Steps of the Terrain and Elevation Analysis Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Plot the Result, Show on a Map, Streams on a Map | The result as a heat map, its cells on a base map, the cells draining enough area to be streams |
| Diagnose | Grid and Cell Size, Land, Sea and Missing Cells, Depressions Filled, Flat Cells | The units of the grid, the cells kept, the filling, the cells with no direction |
| Compare | Replicate with terra, MultiscaleDTM or WhiteboxTools, Slope Methods Compared, Light Directions Compared, Window Sizes Compared, Indices Compared, Thresholds Compared | The result beside R, and beside other methods, lights, windows, indices and thresholds |
| Interpret | Summary of the Result, Aspect by Direction, Convex and Concave Ground, Highest Values | Quantiles, the compass of the slopes, forms of the surface, the extreme cells |
| Export | Save the Result as Cloud-Optimised GeoTIFF | A file written to the folder of the elevation |

## How the Terrain and Elevation Analysis Panel Was Checked Against R

Each tab of the Terrain and Elevation Analysis panel has a Replicate step that recomputes its measures on the example elevation model and prints them beside the values of an R package for the same file. Slope, aspect, hillshade and the relief indices are set beside terra's `terrain` and `shade` ([Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)). Curvature is set beside `Qfit` of MultiscaleDTM, in windows of 3 by 3 and 5 by 5 cells ([Ilich, Misiuk, Lecours and Murawski (2023)](#ref-IMLM2023a)). The upslope area and the wetness index are set beside WhiteboxTools, run through the whitebox package on the same filled surface ([Lindsay (2016)](#ref-Lin2016a); [Wu and Brown (2019)](#ref-WB2019a)). Each step names the version its values come from, and appears only while the example file is the input.

## References

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-HR2009a"></a>Hengl, T. and Reuter, H. I. (eds.) (2009). *Geomorphometry: concepts, software, applications*. Developments in Soil Science 33. Elsevier. [doi:10.1016/S0166-2481(08)X0001-7](https://doi.org/10.1016/S0166-2481(08)X0001-7)

<a id="ref-IMLM2023a"></a>Ilich, A. R., Misiuk, B., Lecours, V. and Murawski, S. A. (2023). MultiscaleDTM: an open-source R package for multiscale geomorphometric analysis. *Transactions in GIS* 27(4), 1164–1204. [doi:10.1111/tgis.13067](https://doi.org/10.1111/tgis.13067)

<a id="ref-Lin2016a"></a>Lindsay, J. B. (2016). Whitebox GAT: a case study in geomorphometric analysis. *Computers & Geosciences* 95, 75–84. [doi:10.1016/j.cageo.2016.07.003](https://doi.org/10.1016/j.cageo.2016.07.003)

<a id="ref-PS2026a"></a>Pronk, M. and Schouten, R. (2026). Geomorphometry.jl: analyzing and visualizing the shape of the Earth in Julia. *Journal of Open Source Software* 11(122), 10395. [doi:10.21105/joss.10395](https://doi.org/10.21105/joss.10395)

<a id="ref-Sch2026a"></a>Schouten, R. (2026a). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Sch2026c"></a>Schouten, R. (2026c). Stencils.jl: static stencil mapping for Julia. [github.com/rafaqz/Stencils.jl](https://github.com/rafaqz/Stencils.jl)

<a id="ref-WB2019a"></a>Wu, Q. and Brown, A. (2019). whitebox: 'WhiteboxTools' R frontend. R package version 2.4.3. [doi:10.32614/cran.package.whitebox](https://doi.org/10.32614/cran.package.whitebox)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Slope and Aspect](slope-aspect.md) · [Hillshade](hillshade.md) · [Curvature](curvature.md) · [Relief Indices](relief.md) · [Flow and Wetness](flow-wetness.md)
