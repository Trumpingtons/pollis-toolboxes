# Mapillary Street-Level Imagery — Factsheet

**Mapillary** is a service to which anyone can contribute street-level photographs from all over the world, taken with any mobile device that has a camera ([Juhász and Hochmair (2016)](#ref-JH2016a)). Its API serves the coverage of these images as vector tiles, and their metadata, thumbnails and the map features located from them through entity endpoints ([Mapillary (2026)](#ref-Map2026a)). The Mapillary Street-Level Imagery panel of the Smart Regions Toolbox reads both with the user's access token, and keeps what it reads in tables of DuckDB.jl with DuckDB's spatial extension, which reads the tiles through GDAL ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

| Item | Mapillary Street-Level Imagery panel |
|---|---|
| **Purpose** | Find the street-level images of an area, when and how they were captured, look at them, and list the objects located from them |
| **Input** | An Area as west, south, east and north in degrees; for Images, the days of capture, Panoramas and Thumbnails; for Map Features, the Kind and Values |
| **Core packages** | [SmartRegions.jl](https://github.com/Trumpingtons/SmartRegions.jl) (`mapillary_coverage`, `mapillary_images`, `mapillary_thumbnails`, `mapillary_features`), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), with DuckDB's spatial extension |
| **Tabs** | Coverage; Images; Map Features |
| **Account** | A Mapillary client access token for every tab, kept by Pollis with the key on the Powered by line |
| **Output** | Coverage: the tables `images` and `sequences`. Images: the table `images`, with thumbnails in the folder. Map Features: the table `features` |

## What Each Tab of the Mapillary Panel Reads

| Tab | Source in the Mapillary API | Files kept |
|---|---|---|
| Coverage | The computed coverage tiles, at zoom 14 | The tiles of the day, in the folder mapillary |
| Images | The image search, `/images`, over boxes of the Area | The thumbnails downloaded |
| Map Features | The map feature search, `/map_features`, over boxes of the Area | None |

The sources and their parameters are those of the documentation of the Mapillary API ([Mapillary (2026)](#ref-Map2026a)).

## Files Kept in the Folder of the Mapillary Panel

Coverage writes each tile it downloads to a folder named after the day, inside the folder mapillary of the Folder, and reads it from there for the rest of that day; the next day downloads it again, so that new images appear. Images writes the thumbnails to the folder thumbnails, named after each image, and does not download one that is already there. A file is written under a temporary name until it is complete, so a download that stops leaves no partial file behind.

## What the Next Steps of the Mapillary Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Images on a Map, Images over Time, Look at the Images, Sequences on a Map, Map Features on a Map | The images by year; the images captured each month; the thumbnails on a page; the sequences as lines; the map features by family |
| Diagnose | Image Quality, Cells Without Images, Files Downloaded | The spread of the quality score; the cells of about 100 m with and without images; the tiles and thumbnails kept |
| Compare | Two Periods Side by Side, Panoramas and Others, Traffic Signs and Points | The cells photographed before and from the Split Year; panoramas beside the other images; the two kinds of map feature |
| Interpret | Newest Image per Cell, Contributors, Kinds of Map Features | How old the coverage is; who captured the images; the commonest kinds of map feature |
| Export | Save as GeoParquet | The tables of the tab |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-JH2016a"></a>Juhász, L. and Hochmair, H. H. (2016). User Contribution Patterns and Completeness Evaluation of Mapillary, a Crowdsourced Street Level Photo Service. *Transactions in GIS*, 20(6), 925–947. [doi:10.1111/tgis.12190](https://doi.org/10.1111/tgis.12190)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: The DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Overview](overview.md) · [Authentication](authentication.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Coverage Tiles](coverage-tiles.md) · [Image Search](image-search.md) · [Map Features](map-features.md)
