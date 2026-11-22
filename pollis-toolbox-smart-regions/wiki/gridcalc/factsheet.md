# Grid Calculations — Factsheet

**Map algebra** computes new grids of cells from existing ones: cell by cell, over a window around each cell, or within areas ([Tomlin (1990)](#ref-Tom1990a)). The Grid Calculations panel of the Smart Regions Toolbox computes the three kinds of operation, and moves values between grids by resampling and rasterizing, with Rasters.jl and Stencils.jl ([Schouten (2026a)](#ref-Sch2026a); [Schouten (2026c)](#ref-Sch2026c)).

| Item | Grid Calculations panel |
|---|---|
| **Purpose** | Compute local, focal and zonal operations on rasters, resample them, and put polygons onto a grid |
| **Input** | A raster of continuous values, a raster of classes and a polygon layer, each in a file GDAL reads |
| **Core packages** | [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [Stencils.jl](https://github.com/rafaqz/Stencils.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl) |
| **Tabs** | Local, Focal, Zonal, Resample, Rasterize |
| **Output** | A Rasters.jl `Raster` named `result`; for Zonal, a table of the areas |
| **Key choices** | The statistic, the window, the method of resampling and the rule that decides which cells an area holds |

## What Each Tab of the Grid Calculations Panel Computes

| Tab | Kind of operation | Result |
|---|---|---|
| Local | Each cell from the same cell of one or more grids | Elevation bands, and the share of a land cover class in each band |
| Focal | Each cell from a window of cells around it | A moving mean, median, maximum, minimum, standard deviation or relief |
| Zonal | One value for each area from the cells inside it | An elevation statistic and the share of a land cover class for each area |
| Resample | A grid of coarser cells | Blocks of elevation, and the land cover put onto the same blocks |
| Rasterize | Polygons onto a grid | The value of the area at each cell centre, or the share of each cell the areas cover |

## What the Next Steps of the Grid Calculations Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Plot the Result, Show on a Map, Map of the Areas | The result as a heat map, its cells on a base map, the areas coloured by their statistic |
| Diagnose | Grids Side by Side, Missing Cells, Cells per Area, Edges Compared | Whether the grids match, where cells are missing, how many cells each area holds, what the edge rule changes |
| Compare | Replicate with terra, Window Sizes Compared, Methods Compared, Centres and Touching Cells, Value and Coverage | The result beside R's terra, and beside other choices of window, method or rule |
| Interpret | Summary of the Result, Highest and Lowest Areas | Quantiles of the result; the areas at both ends |
| Export | Save the Result as Cloud-Optimised GeoTIFF, Save the Areas as GeoParquet | Files written to the folder of the inputs |

## How the Grid Calculations Panel Was Checked Against terra

Every tab of the Grid Calculations panel has a Replicate with terra step, which recomputes the tab's result on the example files and prints it beside the values that R's terra package gives for the same operation: classify and zonal for Local, focal for Focal, extract for Zonal, aggregate and resample for Resample, and rasterize for Rasterize ([Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)). terra reads files through GDAL, as Rasters.jl does through ArchGDAL.jl, so the two start from the same cells ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a); [Ng (2026)](#ref-Ng2026a)). The step prints the version of terra its values come from, and appears only while the example files are the inputs.

## References

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026a). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Sch2026c"></a>Schouten, R. (2026c). Stencils.jl: static stencil mapping for Julia. [github.com/rafaqz/Stencils.jl](https://github.com/rafaqz/Stencils.jl)

<a id="ref-Tom1990a"></a>Tomlin, C. D. (1990). *Geographic information systems and cartographic modeling*. Prentice Hall.

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Local Operations](local.md) · [Focal Operations](focal.md) · [Zonal Operations](zonal.md) · [Resampling and Aggregation](resampling.md) · [Rasterizing](rasterizing.md)
