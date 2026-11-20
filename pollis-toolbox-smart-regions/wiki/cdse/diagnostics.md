# Diagnostics

## A Search of the Copernicus Data Space That Finds No Scenes

Find Scenes, Sentinel-2 Bands and Sentinel-1 Radar stop with a message when the STAC catalogue returns no scene of the collection over the Area between the From and To dates. The usual reasons are dates before the collection begins or after its latest product, a Most Cloud too low for the season, or an Area written in the wrong order: the Area is west, south, east and north, in degrees of longitude and latitude. The STAC catalogue matches a scene whose outline touches the area at all ([STAC Contributors (2023)](#ref-STACC2023a)), so How Scenes Cover the Area shows how much of it each tile and orbit covers.

## The Copernicus Data Space Refuses the Account

Sentinel-2 Bands and Sentinel-1 Radar stop with the answer of the identity service when it refuses the credentials: invalid_grant for a wrong username or password, which the key on the Powered by line can set again. An account with two-factor authentication needs a one-time code with each request for a token ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026b)), which the code does not send. An answer of HTTP 401 from the download service means a token it does not accept, such as one that expired during a long download; the code asks for a new token for each file.

## A Download From the Copernicus Data Space That Stops

The bands of a Sentinel-2 scene and the polarisations of a Sentinel-1 mosaic are files of a whole tile, tens to more than a hundred megabytes each. A download that stops leaves a file with the ending .part in the folder of the scene, which the next run does not read: it downloads the file again from the beginning. Files Downloaded lists the files of the scene in the folder with their sizes.

## Cells Without Data in a Sentinel Band

Each asset of the STAC catalogue records its no-data value, and the code leaves those cells out. A Sentinel-2 tile has cells without data where the satellite's swath ends inside the tile ([Drusch and 14 coauthors (2012)](#ref-DDCCF...2012a)); a Sentinel-1 monthly mosaic has them where the month brought no observation, and in radar shadows, which its compositing leaves out ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026c)). An area at the edge of a tile may be covered better by a scene of the neighbouring tile, which Find Scenes lists with its share of the area.

## References

<a id="ref-CDSE2026b"></a>Copernicus Data Space Ecosystem (2026). Access Token. [documentation.dataspace.copernicus.eu/APIs/Token.html](https://documentation.dataspace.copernicus.eu/APIs/Token.html)

<a id="ref-CDSE2026c"></a>Copernicus Data Space Ecosystem (2026). Sentinel-1 Mosaic Algorithm. [documentation.dataspace.copernicus.eu/Data/Others/Sentinel1_Mosaic_Algorithm.html](https://documentation.dataspace.copernicus.eu/Data/Others/Sentinel1_Mosaic_Algorithm.html)

<a id="ref-DDCCF...2012a"></a>Drusch, M., Del Bello, U., Carlier, S., Colin, O., Fernandez, V., Gascon, F., Hoersch, B., Isola, C., Laberinti, P., Martimort, P., Meygret, A., Spoto, F., Sy, O., Marchese, F. and Bargellini, P. (2012). Sentinel-2: ESA's Optical High-Resolution Mission for GMES Operational Services. *Remote Sensing of Environment*, 120, 25–36. [doi:10.1016/j.rse.2011.11.026](https://doi.org/10.1016/j.rse.2011.11.026)

<a id="ref-STACC2023a"></a>STAC Contributors (2023). STAC API Specification, version 1.0.0. [github.com/radiantearth/stac-api-spec](https://github.com/radiantearth/stac-api-spec)

## See Also
- [Authentication](authentication.md) · [Searching the STAC Catalogue](stac-search.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
