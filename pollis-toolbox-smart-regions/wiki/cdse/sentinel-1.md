# Sentinel-1 Monthly Mosaics

## The Radar of Sentinel-1

Sentinel-1 carries a synthetic aperture radar in the C band, which sends its own microwave pulses and records their echo, so it images the surface by day and night and through clouds ([Torres and 20 coauthors (2012)](#ref-TSGBD...2012a)). Over land it works mostly in the Interferometric Wide swath mode, IW, with two polarisations: VV, sent and received vertically, and VH, sent vertically and received horizontally. Its Ground Range Detected products, GRD, are in the geometry of the radar, and need calibration and terrain correction before their cells can be set on a map.

## How the Sentinel-1 Monthly Mosaics Are Made

The monthly mosaics of the Copernicus Data Space Ecosystem start from the GRD products of a month: each is calibrated to the beta0 backscatter coefficient, radiometrically terrain-flattened by area integration and geocoded by Range-Doppler terrain correction with the Copernicus DEM ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026c)). The terrain flattening follows Small, so that backscatter is comparable across slopes and orbits ([Small (2011)](#ref-Sma2011a)). The observations of the month are then composited by a weighted sum in which those of the highest local resolution weigh most and radar shadows are left out ([Small (2012)](#ref-Sma2012a)). The IW mosaics hold VV and VH at 20 m, in UTM tiles of about 100 km.

## How Sentinel-1 Radar Picks and Downloads a Mosaic

With Scene empty, Sentinel-1 Radar searches the STAC catalogue for the IW monthly mosaics over the Area between the From and To dates and takes the latest of those that cover the most of the area; with an identifier in Scene, it takes that mosaic. It downloads each of the Polarisations, a cloud-optimised GeoTIFF of the whole tile, from the download service with an access token ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026b)), and keeps only the cells of the area, leaving out those of the no-data value the catalogue records.

## Backscatter in Decibels

Backscatter coefficients span several orders of magnitude, so they are usually shown in decibels, ten times their logarithm in base 10. Backscatter in Decibels gives the quantiles of each polarisation over the area in decibels, and the share of its cells below -20 dB; VV Beside VH sets the two polarisations side by side, with their quantiles, their correlation over the cells where both have a value, and the median difference of VH from VV.

## References

<a id="ref-CDSE2026b"></a>Copernicus Data Space Ecosystem (2026). Access Token. [documentation.dataspace.copernicus.eu/APIs/Token.html](https://documentation.dataspace.copernicus.eu/APIs/Token.html)

<a id="ref-CDSE2026c"></a>Copernicus Data Space Ecosystem (2026). Sentinel-1 Mosaic Algorithm. [documentation.dataspace.copernicus.eu/Data/Others/Sentinel1_Mosaic_Algorithm.html](https://documentation.dataspace.copernicus.eu/Data/Others/Sentinel1_Mosaic_Algorithm.html)

<a id="ref-Sma2011a"></a>Small, D. (2011). Flattening Gamma: Radiometric Terrain Correction for SAR Imagery. *IEEE Transactions on Geoscience and Remote Sensing*, 49(8), 3081–3093. [doi:10.1109/TGRS.2011.2120616](https://doi.org/10.1109/TGRS.2011.2120616)

<a id="ref-Sma2012a"></a>Small, D. (2012). SAR backscatter multitemporal compositing via local resolution weighting. *2012 IEEE International Geoscience and Remote Sensing Symposium*, 4521–4524. [doi:10.1109/IGARSS.2012.6350465](https://doi.org/10.1109/IGARSS.2012.6350465)

<a id="ref-TSGBD...2012a"></a>Torres, R., Snoeij, P., Geudtner, D., Bibby, D., Davidson, M., Attema, E., Potin, P., Rommen, B., Floury, N., Brown, M., Traver, I. N., Deghaye, P., Duesmann, B., Rosich, B., Miranda, N., Bruno, C., L'Abbate, M., Croci, R., Pietropaolo, A., Huchler, M. and Rostan, F. (2012). GMES Sentinel-1 mission. *Remote Sensing of Environment*, 120, 9–24. [doi:10.1016/j.rse.2011.05.028](https://doi.org/10.1016/j.rse.2011.05.028)

## See Also
- [Decision Guide](decision-guide.md) · [Searching the STAC Catalogue](stac-search.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
