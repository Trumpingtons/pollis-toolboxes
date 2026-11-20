# The OpenTopography Catalogue

## What the OpenTopography Catalogue Lists

The catalogue of OpenTopography lists the topography datasets it hosts whose extent meets a bounding box or a polygon, point clouds and rasters, and can include the datasets of other catalogues it searches, such as that of the USGS 3D Elevation Program ([OpenTopography (2026)](#ref-Ope2026a)). It needs no API key. The datasets OpenTopography hosts range from global elevation models to lidar surveys of a valley or a fault, collected for Earth science research ([Krishnan and 6 coauthors (2011)](#ref-KCNPC...2011a)).

## How Find Datasets Searches the Catalogue

Find Datasets asks the endpoint `otCatalog` for the datasets whose extent meets the Area, with their detailed metadata in JSON, for the Data chosen: point clouds, rasters or both. With Other Catalogues included, it also lists the datasets of the USGS 3D Elevation Program and of NOAA that OpenTopography finds over the Area. DuckDB reads the answer and keeps one row per dataset in the table `datasets`, with its outline read from the GeoJSON the catalogue returns, and adds the share of the Area inside the outline.

## The Columns of the Datasets Table

| Column of `datasets` | What it holds |
|---|---|
| `name` | The name of the dataset |
| `id`, `source` | Its identifier, and the catalogue it comes from: OpenTopography, USGS 3DEP or NOAA |
| `format` | Point cloud or raster |
| `short_name` | The short name of an OpenTopography model, such as COP30, the code Global DEM takes |
| `first_day`, `last_day` | The first and last days the data were collected |
| `doi` | The digital object identifier of an OpenTopography dataset, by which it is cited |
| `geom`, `covered` | The outline, and the share of the Area inside it, in per cent |

## Point Clouds in the OpenTopography Catalogue

A lidar survey is often listed twice: as a point cloud, the points the instrument measured, and as a raster, an elevation model made from them. Find Datasets lists point clouds with their dates, sources and outlines, but the catalogue does not give their files, so the panel downloads none; LAS and LAZ files downloaded from OpenTopography's portal or from the source of a survey are read with the Point Cloud Files panel. Dataset Outlines on a Map and How Datasets Cover the Area leave out the global models, whose outlines cover the Earth.

## References

<a id="ref-KCNPC...2011a"></a>Krishnan, S., Crosby, C., Nandigam, V., Phan, M., Cowart, C., Baru, C. and Arrowsmith, R. (2011). OpenTopography: a services oriented architecture for community access to LIDAR topography. *Proceedings of the 2nd International Conference on Computing for Geospatial Research and Applications (COM.Geo '11)*, 1–8. [doi:10.1145/1999320.1999327](https://doi.org/10.1145/1999320.1999327)

<a id="ref-Ope2026a"></a>OpenTopography (2026). OpenTopography API. [portal.opentopography.org/apidocs](https://portal.opentopography.org/apidocs/)

## See Also
- [Overview](overview.md) · [The Global Elevation Models](global-dems.md) · [USGS 3D Elevation Program](usgs-3dep.md) · [Factsheet](factsheet.md)
