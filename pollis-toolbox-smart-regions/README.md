# Smart Regions Toolbox

**Smart Regions: Spatiotemporal Infrastructure, Pollution and Climate.** Tools for municipalities and regional authorities that manage physical infrastructure and environmental systems, in Smart Cities (dense transit networks, metropolitan air quality) and Smart Rural Areas (low-density municipalities, watersheds, aquifers, regional supply grids), where human activity, infrastructure and climate interact across scales.

Installing it adds the **Smart Regions** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code you can send to the Julia REPL or a notebook, reference wikis and notebook tutorials.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Geospatial Vector Files, in Access Files | GeoJSON, GeoPackage, Shapefile, GeoParquet and FlatGeobuf, KML and KMZ, and GPX files, read, checked, measured and converted with SQL | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| OpenStreetMap Base Maps, in Map Visualisation | A place, or the features of a file, on an OpenStreetMap base map in the plot pane, in one colour or coloured by a column | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| Spatial Autocorrelation | Moran's I and Geary's c for a whole map, and Local Moran (LISA) clusters for each area, with neighbours by queen or rook contiguity or k nearest centroids, found with SQL | [SpatialDependence.jl](https://github.com/javierbarbero/SpatialDependence.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |

Access Files has one menu item per format, and Map Visualisation one per tab of the base map panel, each opening the panel on its tab. Spatial Autocorrelation is straight in the Smart Regions menu, as Global Moran's I and Local Moran (LISA). The base maps come from OpenFreeMap's vector tiles of OpenStreetMap data, free and without an API key, and need the internet.

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones. The panels read files through DuckDB's spatial extension, which Pollis downloads from DuckDB's repository when the toolbox is installed, and keeps if the toolbox is uninstalled.

## Icon

The icon's map, of Porto and the Douro, is drawn by MapLibre GL JS from OpenFreeMap's vector tiles, in the colours of a paper map (OpenFreeMap © OpenMapTiles, data from OpenStreetMap, © OpenStreetMap contributors, ODbL), with the Pollis logo added in its upper left corner.

## License

AGPL-3.0
