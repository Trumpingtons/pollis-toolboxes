# Overview

## The Copernicus Data Space Ecosystem

The Copernicus Data Space Ecosystem is the platform through which the data of the Copernicus Sentinel missions are distributed, with catalogues to search them, a download service for their products and the files inside them, and further services for processing them. Its STAC catalogue lists the products of the Sentinel missions and other datasets as items with their assets, beside the OData catalogue, which it does not replace ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026a)). The Copernicus Data Space panel searches the STAC catalogue and downloads files through the download service.

## The Copernicus Sentinel Missions

Copernicus is the Earth observation programme of the European Union, and its Sentinel missions each observe the Earth for one family of uses. Sentinel-1 carries a C-band synthetic aperture radar, which images the surface by day and night and through clouds ([Torres and 20 coauthors (2012)](#ref-TSGBD...2012a)). Sentinel-2 carries a multispectral imager of 13 bands, from the visible to the shortwave infrared, at 10, 20 and 60 m, for land monitoring ([Drusch and 14 coauthors (2012)](#ref-DDCCF...2012a)). Sentinel-3 observes the colour and temperature of land and sea, and Sentinel-5P the trace gases of the atmosphere. The Collection input of Find Scenes chooses among collections of these four missions.

## The Terms of Use of Sentinel Data

The data of the Sentinel missions are made available on a full, open and free-of-charge basis under the data policy of the Copernicus programme, set by Commission Delegated Regulation (EU) No 1159/2013, for any lawful use, with registration where it is required ([European Commission (2013)](#ref-EC2013a)). The Copernicus Data Space Ecosystem asks for a free account to download files ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026b)); searching its STAC catalogue needs none. The Authentication page describes how the Copernicus Data Space panel uses the account.

## What the Copernicus Data Space Panel Does

The Copernicus Data Space panel has three tabs. Find Scenes searches the STAC catalogue for the scenes of one collection over the Area and between the From and To dates, with at most the Most Cloud for the collections whose scenes record a cloud cover. Sentinel-2 Bands downloads the Bands of a Sentinel-2 Level-2A scene, the one named in Scene or else the least cloudy, and turns them into surface reflectance over the area. Sentinel-1 Radar downloads the Polarisations of a Sentinel-1 monthly mosaic and cuts them to the area. The Next Steps map the scenes and bands, check them, compare collections, satellites and polarisations, compute NDVI and decibels, and save the results.

## References

<a id="ref-CDSE2026b"></a>Copernicus Data Space Ecosystem (2026). Access Token. [documentation.dataspace.copernicus.eu/APIs/Token.html](https://documentation.dataspace.copernicus.eu/APIs/Token.html)

<a id="ref-CDSE2026a"></a>Copernicus Data Space Ecosystem (2026). STAC Product Catalogue. [documentation.dataspace.copernicus.eu/APIs/STAC.html](https://documentation.dataspace.copernicus.eu/APIs/STAC.html)

<a id="ref-DDCCF...2012a"></a>Drusch, M., Del Bello, U., Carlier, S., Colin, O., Fernandez, V., Gascon, F., Hoersch, B., Isola, C., Laberinti, P., Martimort, P., Meygret, A., Spoto, F., Sy, O., Marchese, F. and Bargellini, P. (2012). Sentinel-2: ESA's Optical High-Resolution Mission for GMES Operational Services. *Remote Sensing of Environment*, 120, 25–36. [doi:10.1016/j.rse.2011.11.026](https://doi.org/10.1016/j.rse.2011.11.026)

<a id="ref-EC2013a"></a>European Commission (2013). Commission Delegated Regulation (EU) No 1159/2013 of 12 July 2013 supplementing Regulation (EU) No 911/2010 of the European Parliament and of the Council on the European Earth monitoring programme (GMES) by establishing registration and licensing conditions for GMES users and defining criteria for restricting access to GMES dedicated data and GMES service information. *Official Journal of the European Union*, L 309, 1–6. [eur-lex.europa.eu/eli/reg_del/2013/1159/oj](https://eur-lex.europa.eu/eli/reg_del/2013/1159/oj)

<a id="ref-TSGBD...2012a"></a>Torres, R., Snoeij, P., Geudtner, D., Bibby, D., Davidson, M., Attema, E., Potin, P., Rommen, B., Floury, N., Brown, M., Traver, I. N., Deghaye, P., Duesmann, B., Rosich, B., Miranda, N., Bruno, C., L'Abbate, M., Croci, R., Pietropaolo, A., Huchler, M. and Rostan, F. (2012). GMES Sentinel-1 mission. *Remote Sensing of Environment*, 120, 9–24. [doi:10.1016/j.rse.2011.05.028](https://doi.org/10.1016/j.rse.2011.05.028)

## See Also
- [Factsheet](factsheet.md) · [Authentication](authentication.md) · [Searching the STAC Catalogue](stac-search.md) · [Sentinel-2 Bands](sentinel-2.md) · [Sentinel-1 Monthly Mosaics](sentinel-1.md)
