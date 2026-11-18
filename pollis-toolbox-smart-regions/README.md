# Smart Regions Toolbox

**Smart Regions: Spatiotemporal Infrastructure, Pollution and Climate.** Tools for municipalities and regional authorities that manage physical infrastructure and environmental systems, in Smart Cities (dense transit networks, metropolitan air quality) and Smart Rural Areas (low-density municipalities, watersheds, aquifers, regional supply grids), where human activity, infrastructure and climate interact across scales.

Installing it adds the **Smart Regions** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code you can send to the Julia REPL or a notebook, reference wikis and notebook tutorials.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Geospatial Vector Files, in Access Files | GeoJSON, GeoPackage, Shapefile, GeoParquet and FlatGeobuf, KML and KMZ, and GPX files, read, checked, measured and converted with SQL | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| Raster and Point Cloud Files, in Access Files | GeoTIFF and Cloud-Optimised GeoTIFF rasters, and LAS and LAZ lidar point clouds, read, checked and converted, with surface and terrain grids made from a point cloud | [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl), [PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl) |
| OpenStreetMap Base Maps, in Map Visualisation | A place, or the features of a file, on an OpenStreetMap base map in the plot pane, in one colour or coloured by a column | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| Spatial Autocorrelation | Moran's I and Geary's c for a whole map, and Local Moran (LISA) clusters for each area, with neighbours by queen or rook contiguity or k nearest centroids, found with SQL | [SpatialDependence.jl](https://github.com/javierbarbero/SpatialDependence.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| Kriging | The variogram, ordinary and universal kriging, inverse distance weighting and conditional Gaussian simulation of a value measured at stations, mapped over a grid of cells, with leave-one-out cross-validation | [GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |

Access Files has Geospatial Vector Files and Raster and Point Cloud Files, Map Visualisation has Base Map, and Spatial Statistics and Kriging has Spatial Autocorrelation and Kriging: one menu item per panel, which opens on its first tab. The base maps come from OpenFreeMap's vector tiles of OpenStreetMap data, free and without an API key, and need the internet.

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones. The panels read vector files through DuckDB's spatial extension, which Pollis downloads from DuckDB's repository when the toolbox is installed, and keeps if the toolbox is uninstalled.

## License

AGPL-3.0
