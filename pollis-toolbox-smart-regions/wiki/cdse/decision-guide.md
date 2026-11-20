# Decision Guide

## Which Tab of the Copernicus Data Space Panel to Use

| Need | Tab | Why |
|---|---|---|
| What the archive holds for an area and a period | Find Scenes | Lists the scenes of any of its collections, without an account |
| Reflectance in visible and infrared bands | Sentinel-2 Bands | Level-2A surface reflectance at 10, 20 and 60 m |
| An image whatever the clouds | Sentinel-1 Radar | Radar observes through clouds and by night ([Torres and 20 coauthors (2012)](#ref-TSGBD...2012a)) |
| One image for a month | Sentinel-1 Radar | A monthly mosaic composites the month's observations ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026c)) |

## Choosing the Collection of Find Scenes

| Collection | What its scenes hold |
|---|---|
| Sentinel-2 Level-2A | Surface reflectance, corrected for the atmosphere, with a scene classification ([Main-Knorn, Pflug, Louis, Debaecker, Müller-Wilm and Gascon (2017)](#ref-MPLDM...2017a)) |
| Sentinel-2 Level-1C | Reflectance at the top of the atmosphere, before that correction |
| Sentinel-1 GRD | Radar scenes in the geometry of the radar, before terrain correction |
| Sentinel-1 Monthly Mosaics | Backscatter composited over a month, terrain-flattened and geocoded |
| Sentinel-3 OLCI Land | Land products of the ocean and land colour instrument |
| Sentinel-3 Land Surface Temperature | Land surface temperature of the radiometer SLSTR |
| Sentinel-5P Nitrogen Dioxide | Nitrogen dioxide of the atmosphere, as observed by TROPOMI |

## Choosing the Dates and the Most Cloud

The From and To dates bound the scenes searched, and the Most Cloud keeps the scenes of Sentinel-2 and Sentinel-3 whose cloud cover, over the whole scene, is at most that share. A longer period finds more clear scenes, and a season with fewer clouds more still; for a change between two dates, two searches each around one date keep the two apart. The cloud cover of a scene is that of its whole tile, so Scene Classes over the Area gives the cloud over the area itself.

## Choosing the Bands of Sentinel-2

| Bands | For |
|---|---|
| `B04_10m`, `B08_10m` | Red and near infrared, for NDVI over the Area ([Tucker (1979)](#ref-Tuc1979a)) |
| `B02_10m`, `B03_10m`, `B04_10m` | Blue, green and red, for a picture in natural colour |
| `B11_20m`, `B12_20m` | The two shortwave infrared bands, for telling snow, ice and cloud apart ([Drusch and 14 coauthors (2012)](#ref-DDCCF...2012a)) |
| `SCL_20m` | The scene classification, to leave clouds, their shadows and snow out |

Each band is a file of the whole tile, so every band added is another download.

## References

<a id="ref-CDSE2026c"></a>Copernicus Data Space Ecosystem (2026). Sentinel-1 Mosaic Algorithm. [documentation.dataspace.copernicus.eu/Data/Others/Sentinel1_Mosaic_Algorithm.html](https://documentation.dataspace.copernicus.eu/Data/Others/Sentinel1_Mosaic_Algorithm.html)

<a id="ref-DDCCF...2012a"></a>Drusch, M., Del Bello, U., Carlier, S., Colin, O., Fernandez, V., Gascon, F., Hoersch, B., Isola, C., Laberinti, P., Martimort, P., Meygret, A., Spoto, F., Sy, O., Marchese, F. and Bargellini, P. (2012). Sentinel-2: ESA's Optical High-Resolution Mission for GMES Operational Services. *Remote Sensing of Environment*, 120, 25–36. [doi:10.1016/j.rse.2011.11.026](https://doi.org/10.1016/j.rse.2011.11.026)

<a id="ref-MPLDM...2017a"></a>Main-Knorn, M., Pflug, B., Louis, J., Debaecker, V., Müller-Wilm, U. and Gascon, F. (2017). Sen2Cor for Sentinel-2. *Proceedings of SPIE, Image and Signal Processing for Remote Sensing XXIII*, 10427, 1042704. [doi:10.1117/12.2278218](https://doi.org/10.1117/12.2278218)

<a id="ref-TSGBD...2012a"></a>Torres, R., Snoeij, P., Geudtner, D., Bibby, D., Davidson, M., Attema, E., Potin, P., Rommen, B., Floury, N., Brown, M., Traver, I. N., Deghaye, P., Duesmann, B., Rosich, B., Miranda, N., Bruno, C., L'Abbate, M., Croci, R., Pietropaolo, A., Huchler, M. and Rostan, F. (2012). GMES Sentinel-1 mission. *Remote Sensing of Environment*, 120, 9–24. [doi:10.1016/j.rse.2011.05.028](https://doi.org/10.1016/j.rse.2011.05.028)

<a id="ref-Tuc1979a"></a>Tucker, C. J. (1979). Red and photographic infrared linear combinations for monitoring vegetation. *Remote Sensing of Environment*, 8(2), 127–150. [doi:10.1016/0034-4257(79)90013-0](https://doi.org/10.1016/0034-4257(79)90013-0)

## See Also
- [Sentinel-2 Bands](sentinel-2.md) · [Sentinel-1 Monthly Mosaics](sentinel-1.md) · [Searching the STAC Catalogue](stac-search.md) · [Factsheet](factsheet.md)
