# USGS EarthExplorer — Factsheet

**USGS EarthExplorer** is the catalogue through which the Earth Resources Observation and Science (EROS) Center of the U.S. Geological Survey distributes its satellite, aerial and elevation datasets, and its Machine-to-Machine (M2M) API offers the same datasets and functions to programs ([U.S. Geological Survey (2026)](#ref-USGS2026a)). The USGS EarthExplorer panel of the Smart Regions Toolbox searches a dataset through the M2M API with DuckDB.jl and DuckDB's spatial extension, downloads the bands of a Landsat scene or the SRTM elevation tiles of an area with the user's account, and cuts them to the area with Rasters.jl and ArchGDAL.jl ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [Schouten (2026)](#ref-Sch2026a); [Ng (2026)](#ref-Ng2026a)).

| Item | USGS EarthExplorer panel |
|---|---|
| **Purpose** | Find the scenes of a dataset over an area between two dates, download the bands of a Landsat scene or the elevation of the area, and look at them, check them and save them |
| **Input** | An Area as west, south, east and north in degrees; the From and To dates; a Dataset and the Most Cloud; a Scene and the Bands; an Elevation Product |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl), with DuckDB's spatial extension |
| **Tabs** | Find Scenes; Landsat Download; Elevation |
| **Account** | An account of the EROS Registration System with access to the M2M API and an application token, for every tab, kept by Pollis with the key on the Powered by line |
| **Output** | Find Scenes: the table `scenes`, one row per scene with its identifiers, date, cloud cover and outline. Landsat Download and Elevation: `bands`, each band cut to the area, and `grid`, the first of them |

## What Each Tab of the USGS EarthExplorer Panel Reads

| Tab | Dataset | Files downloaded |
|---|---|---|
| Find Scenes | The Dataset named, Landsat 8-9 Collection 2 Level-2 by default | None: the pages of the search only |
| Landsat Download | Landsat 8-9 Collection 2 Level-2 | One GeoTIFF of the whole scene for each of the Bands |
| Elevation | The Elevation Product: SRTM 1 Arc-Second Global or SRTM Void Filled | One GeoTIFF for each tile of 1 by 1 degree over the Area |

## Downloads Kept in the Folder of the USGS EarthExplorer Panel

Landsat Download writes the bands of a scene to a folder named after the scene's display identifier, and Elevation writes each tile to a folder named after the tile, both inside a folder usgs of the Folder. Later runs read the files from there and ask the M2M API only for those missing, so a band or a tile is downloaded once. A file is written under a temporary name until it is complete. Deleting the folder of a scene or of a tile makes the tab download it again.

## What the Next Steps of the USGS EarthExplorer Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Scene Outlines on a Map, Scenes over Time, Show the Band on a Map, Plot the Band, Elevation Profile | The scenes' outlines over the area; their dates and cloud cover; the first band or the elevation on a base map or as a heat map; the elevation from west to east |
| Diagnose | How Scenes Cover the Area, Cloud Mask over the Area, Files Downloaded | The paths and rows of the scenes; the bits of QA_PIXEL over the area; the files and their cells |
| Compare | Datasets Side by Side, Satellites Side by Side, Bands Side by Side | The scenes of three Landsat datasets; the scenes of Landsat 8 and Landsat 9; the quantiles of each band |
| Interpret | NDVI over the Area, Surface Temperature, Elevation Summary | The vegetation index from red and near infrared; the surface temperature in degrees Celsius; the quantiles and extremes of the elevation |
| Export | Save as Cloud-Optimised GeoTIFF, Save the Scenes | The bands or the elevation cut to the area; the scenes found as GeoParquet |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: A high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: The DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: Raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-USGS2026a"></a>U.S. Geological Survey (2026). Machine-to-Machine (M2M) API. [m2m.cr.usgs.gov](https://m2m.cr.usgs.gov/)

## See Also
- [Overview](overview.md) · [Authentication](authentication.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [The M2M API](m2m-api.md) · [Landsat Collection 2 Level-2](landsat.md) · [SRTM Elevation](srtm.md)
