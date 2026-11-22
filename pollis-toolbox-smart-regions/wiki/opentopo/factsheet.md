# OpenTopography — Factsheet

**OpenTopography** gives online access to high-resolution topography: lidar point clouds, digital elevation models and tools to process them ([Krishnan and 6 coauthors (2011)](#ref-KCNPC...2011a)). Its API serves global elevation models and the rasters of the 3D Elevation Program of the U.S. Geological Survey cut to a bounding box, and a catalogue of the datasets over an area ([OpenTopography (2026)](#ref-Ope2026a)). The OpenTopography panel of the Smart Regions Toolbox searches the catalogue with DuckDB.jl and DuckDB's spatial extension, downloads the elevation of an area with the user's API key, and reads it with Rasters.jl and ArchGDAL.jl ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [Schouten (2026)](#ref-Sch2026a); [Ng (2026)](#ref-Ng2026a)).

| Item | OpenTopography panel |
|---|---|
| **Purpose** | Find the lidar surveys and elevation models over an area, download the elevation of the area, and look at it, check it, compare it and save it |
| **Input** | An Area as west, south, east and north in degrees; the Data and Other Catalogues of Find Datasets; an Elevation Model or a Resolution; a model to Compare With |
| **Core packages** | [SmartRegions.jl](https://github.com/Trumpingtons/SmartRegions.jl) (`opentopography_catalog`, `opentopography_dem`), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl), with DuckDB's spatial extension |
| **Tabs** | Find Datasets; Global DEM; USGS 3DEP |
| **Account** | None for Find Datasets; an OpenTopography API key for Global DEM and USGS 3DEP, kept by Pollis with the key on the Powered by line |
| **Output** | Find Datasets: the table `datasets`, one row per dataset with its name, source, format, dates, DOI and outline. Global DEM and USGS 3DEP: `elevation`, the elevation of the area in metres, and `path`, its file |

## What Each Tab of the OpenTopography Panel Reads

| Tab | Endpoint of the API | Files downloaded |
|---|---|---|
| Find Datasets | `otCatalog`, without a key | None: one JSON answer |
| Global DEM | `globaldem`, with the Elevation Model as `demtype` | One GeoTIFF of the Area |
| USGS 3DEP | `usgsdem`, with the Resolution as `datasetName` | One GeoTIFF of the Area |

The endpoints and their parameters are those of the documentation of the OpenTopography API ([OpenTopography (2026)](#ref-Ope2026a)).

## Downloads Kept in the Folder of the OpenTopography Panel

Global DEM and USGS 3DEP write each file they download to a folder named after the model or the resolution, inside a folder opentopography of the Folder, with a name made of the model and the four edges of the Area. A later run with the same model and Area reads the file from there, without a request; a different Area downloads a new file. A file is written under a temporary name until it is complete, so a download that stops leaves no partial file behind.

## What the Next Steps of the OpenTopography Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Dataset Outlines on a Map, Datasets over Time, Show the Elevation on a Map, Plot the Elevation, Elevation Profile | The surveys' outlines over the area; their dates; the elevation on a base map or as a heat map; the elevation from west to east |
| Diagnose | How Datasets Cover the Area, Cells Without Data, Files Downloaded | The share of the area each survey covers; the cells with no elevation; the files of the model |
| Compare | Sources Side by Side, Two Models Side by Side | The datasets of each source; the difference between the elevation and a second model |
| Interpret | Elevation Summary, Area by Elevation | The quantiles and extremes of the elevation; the share of the area in each band of height |
| Export | Save as Cloud-Optimised GeoTIFF, Save the Datasets | The elevation of the area; the datasets found as GeoParquet |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-KCNPC...2011a"></a>Krishnan, S., Crosby, C., Nandigam, V., Phan, M., Cowart, C., Baru, C. and Arrowsmith, R. (2011). OpenTopography: a services oriented architecture for community access to LIDAR topography. *Proceedings of the 2nd International Conference on Computing for Geospatial Research and Applications (COM.Geo '11)*, 1–8. [doi:10.1145/1999320.1999327](https://doi.org/10.1145/1999320.1999327)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: A high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Ope2026a"></a>OpenTopography (2026). OpenTopography API. [portal.opentopography.org/apidocs](https://portal.opentopography.org/apidocs/)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: The DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: Raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [Authentication](authentication.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [The OpenTopography Catalogue](catalogue.md) · [The Global Elevation Models](global-dems.md) · [USGS 3D Elevation Program](usgs-3dep.md)
