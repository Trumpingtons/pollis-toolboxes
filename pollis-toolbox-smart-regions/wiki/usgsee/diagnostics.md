# Diagnostics

## The M2M API Refuses the Login

All three tabs of the USGS EarthExplorer panel stop with the error code and message of the M2M API when the endpoint login-token refuses the credentials ([U.S. Geological Survey (2026)](#ref-USGS2026a)). The usual reasons are a password typed where the application token belongs, since the login with a password was deprecated in February 2025 ([U.S. Geological Survey (2025)](#ref-USGS2025a)); a token revoked in the profile of the EROS Registration System; and an account that has not been given access to the M2M API, which is requested from the same profile. The key on the Powered by line sets the username and the token again.

## A Search of EarthExplorer That Finds No Scenes

Find Scenes and Landsat Download stop with a message when `scene-search` returns no scene of the dataset over the Area between the From and To dates with at most the Most Cloud. The usual reasons are dates outside the record of the dataset, a Most Cloud too low for the season, or an Area written in the wrong order: the Area is west, south, east and north, in degrees of longitude and latitude. A Dataset name the M2M API does not know is answered with an error code ([U.S. Geological Survey (2026)](#ref-USGS2026a)). Datasets Side by Side counts the scenes of three Landsat datasets over the same Area and dates.

## Landsat Download or Elevation Stops Before Every File Is Downloaded

When the files of a download request are still being prepared after ten minutes, the tab says how many it has and stops; running it again later asks only for those not yet in the Folder. A band that the scene does not offer stops Landsat Download with the endings of the files it does offer: the Bands must be endings of a Level-2 scene, such as SR_B4 or ST_B10 ([U.S. Geological Survey (2024)](#ref-USGS2024a)). Files Downloaded lists the files in the folder of the scene or the product, with their sizes and the cells of each band over the Area.

## Cells Without Data in a Landsat Band or an SRTM Grid

A Landsat band has fill cells, value 0, outside the scene's footprint, so an Area at the edge of a scene is only partly covered ([U.S. Geological Survey (2024)](#ref-USGS2024a)); How Scenes Cover the Area shows the share of the Area each path and row covers. Clouds do not make cells empty, but QA_PIXEL marks them, and Cloud Mask over the Area gives their share. An SRTM grid has cells without data where the Area reaches beyond the land the mission covered, north of 60 degrees north or south of 56 degrees south ([Earth Resources Observation and Science (EROS) Center (2017)](#ref-EROSC2017a)), or where a tile was not downloaded.

## References

<a id="ref-EROSC2017a"></a>Earth Resources Observation and Science (EROS) Center (2017). Shuttle Radar Topography Mission (SRTM) 1 Arc-Second Global. [doi:10.5066/F7PR7TFT](https://doi.org/10.5066/F7PR7TFT)

<a id="ref-USGS2024a"></a>U.S. Geological Survey (2024). Landsat 8-9 Collection 2 (C2) Level 2 Science Product (L2SP) Guide, version 6.0, LSDS-1619. [www.usgs.gov/media/files/landsat-8-collection-2-level-2-science-product-guide](https://www.usgs.gov/media/files/landsat-8-collection-2-level-2-science-product-guide)

<a id="ref-USGS2025a"></a>U.S. Geological Survey (2025). M2M Application Token Documentation. [www.usgs.gov/media/files/m2m-application-token-documentation](https://www.usgs.gov/media/files/m2m-application-token-documentation)

<a id="ref-USGS2026a"></a>U.S. Geological Survey (2026). Machine-to-Machine (M2M) API. [m2m.cr.usgs.gov](https://m2m.cr.usgs.gov/)

## See Also
- [Authentication](authentication.md) · [The M2M API](m2m-api.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
