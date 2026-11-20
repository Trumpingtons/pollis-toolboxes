# Overview

## USGS EarthExplorer and Its Machine-to-Machine API

EarthExplorer is the search and download site of the Earth Resources Observation and Science (EROS) Center of the U.S. Geological Survey, for satellite images, aerial photographs, elevation models and other datasets. Its Machine-to-Machine (M2M) API is a JSON API with the same datasets and functions, to search datasets and scenes by area, time and metadata, list the download options of scenes and request their downloads, for a user whose account has been given access to it ([U.S. Geological Survey (2026)](#ref-USGS2026a)). The USGS EarthExplorer panel works through the M2M API only, never through the pages of the site.

## The Landsat Missions and Collection 2

The Landsat programme of NASA and the U.S. Geological Survey has observed the land since Landsat 1 in 1972, and Landsat 9, which carries the Operational Land Imager-2 (OLI-2) and the Thermal Infrared Sensor-2 (TIRS-2), continues the record of Landsat 8, of which it is in many respects a copy ([Masek and 6 coauthors (2020)](#ref-MWMMC...2020a)). The U.S. Geological Survey processed the whole Landsat archive again as Collection 2 in 2020, for data processed consistently across the series ([Crawford and 34 coauthors (2023)](#ref-CRABV...2023a)). Landsat Download reads the Level-2 products of Landsat 8 and Landsat 9 in Collection 2: surface reflectance and surface temperature ([Earth Resources Observation and Science (EROS) Center (2020)](#ref-EROSC2020a)).

## The Shuttle Radar Topography Mission

The Shuttle Radar Topography Mission (SRTM), flown in February 2000 by NASA, the National Geospatial-Intelligence Agency and the German and Italian space agencies, acquired interferometric radar data with two antennas, processed into a digital elevation model at a resolution of 1 arc-second ([Farr and 17 coauthors (2007)](#ref-FRCCD...2007a)). The EROS Center distributes it through EarthExplorer as tiles of 1 by 1 degree for the land between 60 degrees north and 56 degrees south ([Earth Resources Observation and Science (EROS) Center (2017)](#ref-EROSC2017a)). Elevation downloads these tiles over the Area.

## What the USGS EarthExplorer Panel Does

The USGS EarthExplorer panel has three tabs. Find Scenes searches a dataset of EarthExplorer for the scenes over the Area between the From and To dates with at most the Most Cloud, and lists the least cloudy with the share of the Area each covers. Landsat Download downloads the Bands of a Landsat 8-9 Collection 2 Level-2 scene, the one named in Scene or else the least cloudy of those covering the most of the Area, and turns them into surface reflectance and temperature over the Area. Elevation downloads the SRTM tiles over the Area, joins them and cuts them to it. The Next Steps map, check, compare, interpret and save the results.

## The Terms of Use of USGS Landsat and SRTM Data

The Landsat Collection 2 products and the SRTM elevation data are distributed by the EROS Center, each with a digital object identifier by which it is cited ([Earth Resources Observation and Science (EROS) Center (2020)](#ref-EROSC2020a); [Earth Resources Observation and Science (EROS) Center (2017)](#ref-EROSC2017a)). Downloading them through the M2M API needs an account of the EROS Registration System with access to the API, which is requested from the account's profile ([U.S. Geological Survey (2026)](#ref-USGS2026a)). The Authentication page describes how the USGS EarthExplorer panel uses the account.

## References

<a id="ref-CRABV...2023a"></a>Crawford, C. J., Roy, D. P., Arab, S., Barnes, C., Vermote, E., Hulley, G., Gerace, A., Choate, M., Engebretson, C., Micijevic, E., Schmidt, G., Anderson, C., Anderson, M., Bouchard, M., Cook, B., Dittmeier, R., Howard, D., Jenkerson, C., Kim, M., Kleyians, T., Maiersperger, T., Mueller, C., Neigh, C., Owen, L., Page, B., Pahlevan, N., Rengarajan, R., Roger, J.-C., Sayler, K., Scaramuzza, P., Skakun, S., Yan, L., Zhang, H. K., Zhu, Z. and Zahn, S. (2023). The 50-year Landsat collection 2 archive. *Science of Remote Sensing*, 8, 100103. [doi:10.1016/j.srs.2023.100103](https://doi.org/10.1016/j.srs.2023.100103)

<a id="ref-EROSC2017a"></a>Earth Resources Observation and Science (EROS) Center (2017). Shuttle Radar Topography Mission (SRTM) 1 Arc-Second Global. [doi:10.5066/F7PR7TFT](https://doi.org/10.5066/F7PR7TFT)

<a id="ref-EROSC2020a"></a>Earth Resources Observation and Science (EROS) Center (2020). Landsat 8-9 Operational Land Imager / Thermal Infrared Sensor Level-2, Collection 2. [doi:10.5066/P9OGBGM6](https://doi.org/10.5066/P9OGBGM6)

<a id="ref-FRCCD...2007a"></a>Farr, T. G., Rosen, P. A., Caro, E., Crippen, R., Duren, R., Hensley, S., Kobrick, M., Paller, M., Rodriguez, E., Roth, L., Seal, D., Shaffer, S., Shimada, J., Umland, J., Werner, M., Oskin, M., Burbank, D. and Alsdorf, D. (2007). The Shuttle Radar Topography Mission. *Reviews of Geophysics*, 45(2). [doi:10.1029/2005RG000183](https://doi.org/10.1029/2005RG000183)

<a id="ref-MWMMC...2020a"></a>Masek, J. G., Wulder, M. A., Markham, B., McCorkel, J., Crawford, C. J., Storey, J. and Jenstrom, D. T. (2020). Landsat 9: Empowering open science and applications through continuity. *Remote Sensing of Environment*, 248, 111968. [doi:10.1016/j.rse.2020.111968](https://doi.org/10.1016/j.rse.2020.111968)

<a id="ref-USGS2026a"></a>U.S. Geological Survey (2026). Machine-to-Machine (M2M) API. [m2m.cr.usgs.gov](https://m2m.cr.usgs.gov/)

## See Also
- [Factsheet](factsheet.md) · [Authentication](authentication.md) · [The M2M API](m2m-api.md) · [Landsat Collection 2 Level-2](landsat.md) · [SRTM Elevation](srtm.md)
