# Copernicus Data Space — Factsheet

The **Copernicus Data Space Ecosystem** distributes the data of the Copernicus Sentinel missions, with a STAC catalogue to search them and a download service for their files ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026a)). The Copernicus Data Space panel of the Smart Regions Toolbox searches the catalogue with DuckDB.jl and DuckDB's spatial extension, downloads the bands of a Sentinel-2 scene or of a Sentinel-1 monthly mosaic with the user's account, and cuts them to an area with Rasters.jl and ArchGDAL.jl ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [Schouten (2026)](#ref-Sch2026a); [Ng (2026)](#ref-Ng2026a)).

| Item | Copernicus Data Space panel |
|---|---|
| **Purpose** | Find the Sentinel scenes over an area between two dates, download the bands of one, and look at them, check them and save them |
| **Input** | An Area as west, south, east and north in degrees; the From and To dates; a Collection and the Most Cloud; a Scene, the Bands or the Polarisations |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl), with DuckDB's spatial extension |
| **Tabs** | Find Scenes; Sentinel-2 Bands; Sentinel-1 Radar |
| **Account** | None for Find Scenes; a free account of the Copernicus Data Space Ecosystem for the two download tabs, kept by Pollis with the key on the Powered by line |
| **Output** | Find Scenes: the table `scenes`, one row per scene with its date, cloud cover, satellite, tile, outline and assets. The download tabs: `bands`, each band cut to the area, and `grid`, the first of them |

## What Each Tab of the Copernicus Data Space Panel Reads

| Tab | Collection | Files downloaded |
|---|---|---|
| Find Scenes | The Collection chosen: Sentinel-2, Sentinel-1, Sentinel-3 or Sentinel-5P | None: the pages of the search only |
| Sentinel-2 Bands | Sentinel-2 Level-2A | One JPEG 2000 file of the whole tile for each of the Bands |
| Sentinel-1 Radar | Sentinel-1 monthly mosaics of IW | One cloud-optimised GeoTIFF of the whole tile for each of the Polarisations |

## Downloads Kept in the Folder of the Copernicus Data Space Panel

Sentinel-2 Bands and Sentinel-1 Radar write each file they download to a folder named after the scene, inside a folder cdse of the Folder, and read it from there on later runs, so the download service is asked for a file once. A file is written under a temporary name until it is complete, so a download that stops leaves no partial band behind. Deleting the folder of a scene makes the tab download its files again.

## What the Next Steps of the Copernicus Data Space Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Scene Outlines on a Map, Scenes over Time, Show the Band on a Map, Plot the Band | The scenes' outlines over the area; their dates and cloud cover; the first band on a base map or as a heat map |
| Diagnose | How Scenes Cover the Area, Scene Classes over the Area, Files Downloaded | The tiles and orbits of the scenes; the classes of the scene classification over the area; the files and their cells |
| Compare | Collections Side by Side, Satellites Side by Side, VV Beside VH | The scenes of four collections; the scenes of each satellite; the two polarisations in decibels |
| Interpret | NDVI over the Area, Backscatter in Decibels | The vegetation index from red and near infrared; the backscatter in decibels |
| Export | Save as Cloud-Optimised GeoTIFF, Save the Scenes | The bands cut to the area; the scenes found as GeoParquet |

## References

<a id="ref-CDSE2026a"></a>Copernicus Data Space Ecosystem (2026). STAC Product Catalogue. [documentation.dataspace.copernicus.eu/APIs/STAC.html](https://documentation.dataspace.copernicus.eu/APIs/STAC.html)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: A high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: The DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: Raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [Authentication](authentication.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Searching the STAC Catalogue](stac-search.md) · [Sentinel-2 Bands](sentinel-2.md) · [Sentinel-1 Monthly Mosaics](sentinel-1.md)
