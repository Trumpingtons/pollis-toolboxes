# Decision Guide

## Which Tab of the USGS EarthExplorer Panel

| Need | Tab |
|---|---|
| What scenes a dataset has over an area, and when | Find Scenes |
| Reflectance or surface temperature of an area at 30 m | Landsat Download |
| The height of the land over an area | Elevation |

Find Scenes downloads no file, only the pages of the search, so it is the place to choose the dates and the scene before Landsat Download. Its table `scenes` lists the display identifiers that the Scene input of Landsat Download takes.

## Which Dataset of Landsat Collection 2 to Search

| Dataset | What it holds |
|---|---|
| `landsat_ot_c2_l2` | Landsat 8 and Landsat 9, Level-2: surface reflectance and temperature |
| `landsat_ot_c2_l1` | Landsat 8 and Landsat 9, Level-1: calibrated, without atmospheric correction |
| `landsat_etm_c2_l2` | Landsat 7, Level-2 |
| `landsat_tm_c2_l2` | Landsat 4 and Landsat 5, Level-2 |

Collection 2 holds the whole Landsat archive processed consistently ([Crawford and 34 coauthors (2023)](#ref-CRABV...2023a)), so the older satellites extend a series back in time. The Dataset input of Find Scenes takes any dataset name of the M2M API ([U.S. Geological Survey (2026)](#ref-USGS2026a)); Landsat Download reads landsat_ot_c2_l2 only.

## Which Bands to Download From a Landsat Scene

| Purpose | Bands |
|---|---|
| Vegetation, with NDVI over the Area | SR_B4 and SR_B5, with QA_PIXEL to leave out clouds |
| Surface temperature | ST_B10, with QA_PIXEL |
| A true-colour view | SR_B4, SR_B3 and SR_B2 |
| Water, snow and bare soil | SR_B6 and SR_B7, the shortwave infrared |
| Clouds and their shadows | QA_PIXEL |

Each band of a scene is a file of its own, so downloading only the bands needed saves time. The bands and their contents are those of the Level-2 product guide ([U.S. Geological Survey (2024)](#ref-USGS2024a)).

## Which SRTM Elevation Product to Read

SRTM 1 Arc-Second Global gives the elevation at about 30 m between 60 degrees north and 56 degrees south ([Earth Resources Observation and Science (EROS) Center (2017)](#ref-EROSC2017a)), the finer of the two products. SRTM Void Filled has the gaps of the original data filled, at a coarser resolution outside the United States. Both measure the height of the surface that returns the radar's echo, including canopy and buildings, not the bare ground ([Farr and 17 coauthors (2007)](#ref-FRCCD...2007a)).

## The USGS EarthExplorer Panel Beside the Copernicus Data Space Panel

The Copernicus Data Space panel of the Smart Regions Toolbox reads Sentinel-2, with bands at 10 m and a scene classification, and Sentinel-1 radar, which sees through clouds. The USGS EarthExplorer panel reads Landsat, at 30 m, with a thermal band for surface temperature and a record going back to 1972 ([Masek and 6 coauthors (2020)](#ref-MWMMC...2020a)), and the SRTM elevation. An area can be studied with both panels.

## References

<a id="ref-CRABV...2023a"></a>Crawford, C. J., Roy, D. P., Arab, S., Barnes, C., Vermote, E., Hulley, G., Gerace, A., Choate, M., Engebretson, C., Micijevic, E., Schmidt, G., Anderson, C., Anderson, M., Bouchard, M., Cook, B., Dittmeier, R., Howard, D., Jenkerson, C., Kim, M., Kleyians, T., Maiersperger, T., Mueller, C., Neigh, C., Owen, L., Page, B., Pahlevan, N., Rengarajan, R., Roger, J.-C., Sayler, K., Scaramuzza, P., Skakun, S., Yan, L., Zhang, H. K., Zhu, Z. and Zahn, S. (2023). The 50-year Landsat collection 2 archive. *Science of Remote Sensing*, 8, 100103. [doi:10.1016/j.srs.2023.100103](https://doi.org/10.1016/j.srs.2023.100103)

<a id="ref-EROSC2017a"></a>Earth Resources Observation and Science (EROS) Center (2017). Shuttle Radar Topography Mission (SRTM) 1 Arc-Second Global. [doi:10.5066/F7PR7TFT](https://doi.org/10.5066/F7PR7TFT)

<a id="ref-FRCCD...2007a"></a>Farr, T. G., Rosen, P. A., Caro, E., Crippen, R., Duren, R., Hensley, S., Kobrick, M., Paller, M., Rodriguez, E., Roth, L., Seal, D., Shaffer, S., Shimada, J., Umland, J., Werner, M., Oskin, M., Burbank, D. and Alsdorf, D. (2007). The Shuttle Radar Topography Mission. *Reviews of Geophysics*, 45(2). [doi:10.1029/2005RG000183](https://doi.org/10.1029/2005RG000183)

<a id="ref-MWMMC...2020a"></a>Masek, J. G., Wulder, M. A., Markham, B., McCorkel, J., Crawford, C. J., Storey, J. and Jenstrom, D. T. (2020). Landsat 9: Empowering open science and applications through continuity. *Remote Sensing of Environment*, 248, 111968. [doi:10.1016/j.rse.2020.111968](https://doi.org/10.1016/j.rse.2020.111968)

<a id="ref-USGS2024a"></a>U.S. Geological Survey (2024). Landsat 8-9 Collection 2 (C2) Level 2 Science Product (L2SP) Guide, version 6.0, LSDS-1619. [www.usgs.gov/media/files/landsat-8-collection-2-level-2-science-product-guide](https://www.usgs.gov/media/files/landsat-8-collection-2-level-2-science-product-guide)

<a id="ref-USGS2026a"></a>U.S. Geological Survey (2026). Machine-to-Machine (M2M) API. [m2m.cr.usgs.gov](https://m2m.cr.usgs.gov/)

## See Also
- [Overview](overview.md) · [Landsat Collection 2 Level-2](landsat.md) · [SRTM Elevation](srtm.md) · [Factsheet](factsheet.md)
