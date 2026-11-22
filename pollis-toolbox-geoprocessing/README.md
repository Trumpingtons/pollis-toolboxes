# Geoprocessing Toolbox

**Geoprocessing: Calculations on Rasters and Elevation Models.** Map algebra on grids of cells, and the measures of the land surface that come from an elevation model, written in Julia and each checked against R. For analysts who compute with rasters, in geography, hydrology, ecology, planning and regional science.

Installing it adds the **Geoprocessing** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code you can send to the Julia REPL or a notebook, reference wikis, and Next Steps that replicate its results against R.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Grid Calculations | Map algebra on rasters: local operations cell by cell (elevation bands, and the share of a land cover class in each), focal operations in a square or circular window (moving mean, median, maximum, minimum, standard deviation or relief), zonal statistics of the cells inside each area of a polygon layer, rasters resampled onto coarser cells (blocks of a statistic, classes by the most common or the nearest), and polygons put onto a grid (the value at each cell centre, or the share of each cell covered), on the Copernicus DEM, ESA WorldCover and the MSOAs of London or files of the user's own, each replicated with R's terra | [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [Stencils.jl](https://github.com/rafaqz/Stencils.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl) |
| Terrain and Elevation Analysis | The land surface from an elevation model: slope and aspect by Horn's or Zevenbergen and Thorne's method, with the land in classes of slope; hillshade from one direction or several; profile and tangential curvature from a quadratic fitted in a window of any size; the Terrain Ruggedness Index, the Topographic Position Index and roughness; and the upslope area by D-infinity after the depressions are filled, with the Topographic Wetness and Stream Power indices and the streams. On the Copernicus DEM over Hong Kong or a file of the user's own, replicated with R's terra, MultiscaleDTM and WhiteboxTools | [Geomorphometry.jl](https://github.com/Deltares/Geomorphometry.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [Stencils.jl](https://github.com/rafaqz/Stencils.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl) |

The menu has Grid Calculations and Terrain and Elevation Analysis; then the submenus Satellite Indicators and Lidar and 3D Scans, whose items are greyed; then Coordinate Transformations and Projections and Spatial Indexing, greyed. One menu item per panel, which opens on its first tab.

The [Smart Regions Toolbox](../pollis-toolbox-smart-regions/README.md) reads raster and vector files and downloads elevation models and satellite images; the [Spatial Econometrics Toolbox](../pollis-toolbox-spatial-econometrics/README.md) models data on areas.

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones. Grid Calculations reads area files through DuckDB's spatial extension, which Pollis downloads from DuckDB's repository when the toolbox is installed, and keeps if the toolbox is uninstalled. The panels need the internet only for their example files, which they keep in their Folder.

## License

AGPL-3.0
