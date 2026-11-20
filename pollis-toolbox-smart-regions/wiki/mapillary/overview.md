# Overview

## Mapillary and Its Street-Level Images

Mapillary is a Web 2.0 application to which users contribute crowdsourced street-level photographs from all over the world, from any mobile device equipped with a camera ([Juhász and Hochmair (2016)](#ref-JH2016a)). Juhász and Hochmair reviewed the growth of its data by continent and country and the behaviour of individual contributors, and assessed its completeness against a reference road network. In four metropolitan areas of the United States, Mahabir and coauthors found that its coverage varied across sites, with most contributions along local roads and in populated areas, and that a few users contributed most of the data ([Mahabir, Schuchard, Crooks, Croitoru and Stefanidis (2020)](#ref-MSCCS2020a)).

## Street-Level Imagery in Research

Biljecki and Ito screened more than 600 papers on how street-level imagery is used in studies of the built environment, and found it an entrenched component of urban analytics and GIScience, used in domains from vegetation and transportation to health and socio-economic studies, with most research relying on Google Street View ([Biljecki and Ito (2021)](#ref-BI2021a)). They noted a trend towards crowdsourced street view imagery, from services such as Mapillary and KartaView, which in some cases extends the geographical coverage and the temporal granularity of the images, under a permissive licence.

## Images, Sequences and Map Features in Mapillary

The Mapillary API describes its data as entities ([Mapillary (2026)](#ref-Map2026a)). An image carries its capture time, its position and compass angle as recorded and as computed by processing the images together, its camera, whether it is a panorama, and a predicted quality score. A sequence is the series of images captured in succession, ordered by capture time. A map feature is an object with a location, such as a traffic sign, derived from detections of it in several images, and a detection is an object found in a single image.

## What the Mapillary Street-Level Imagery Panel Does

The Mapillary Street-Level Imagery panel has three tabs. Coverage reads the coverage tiles over the Area, up to a city, and lists every image with its date, heading, sequence and quality score, and every sequence as a line. Images searches a smaller Area for the images with their cameras and computed positions, filtered by the days of capture and by panorama, and downloads thumbnails to look at. Map Features lists the traffic signs and other objects located from the images, with when each was first and last seen. The Next Steps map, check, compare, summarise and save the results.

## References

<a id="ref-BI2021a"></a>Biljecki, F. and Ito, K. (2021). Street view imagery in urban analytics and GIS: A review. *Landscape and Urban Planning*, 215, 104217. [doi:10.1016/j.landurbplan.2021.104217](https://doi.org/10.1016/j.landurbplan.2021.104217)

<a id="ref-JH2016a"></a>Juhász, L. and Hochmair, H. H. (2016). User Contribution Patterns and Completeness Evaluation of Mapillary, a Crowdsourced Street Level Photo Service. *Transactions in GIS*, 20(6), 925–947. [doi:10.1111/tgis.12190](https://doi.org/10.1111/tgis.12190)

<a id="ref-MSCCS2020a"></a>Mahabir, R., Schuchard, R., Crooks, A., Croitoru, A. and Stefanidis, A. (2020). Crowdsourcing Street View Imagery: A Comparison of Mapillary and OpenStreetCam. *ISPRS International Journal of Geo-Information*, 9(6), 341. [doi:10.3390/ijgi9060341](https://doi.org/10.3390/ijgi9060341)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Factsheet](factsheet.md) · [Authentication](authentication.md) · [Coverage Tiles](coverage-tiles.md) · [Image Search](image-search.md) · [Map Features](map-features.md) · [Decision Guide](decision-guide.md)
