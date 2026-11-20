# Diagnostics

## Mapillary Refuses the Access Token

The tabs stop with the message of the Mapillary API when it refuses a request, with its HTTP status: a token it cannot read or does not accept is refused for every tile and search. The key on the Powered by line sets the token again. When an application exceeds its rate limit, the API throttles it and answers with the message "Application request limit reached" ([Mapillary (2026)](#ref-Map2026a)), and counts requests a minute, or for tiles a day, as the next section shows.

## The Rate Limits of the Mapillary API

The Mapillary API limits the requests of each application, at three tiers ([Mapillary (2026)](#ref-Map2026a)).

| Requests | Limit |
|---|---|
| Entity endpoints, such as one image | 60,000 a minute |
| Searches, such as images in a bounding box | 10,000 a minute |
| Vector tiles | 50,000 a day |

Coverage reads each tile once a day, keeping it in the folder of the day, so running it again over the same Area that day makes no request.

## An Area Too Large for the Mapillary Panel

Coverage stops before downloading when the Area needs more than 400 tiles of zoom 14, an area about the size of a city, keeping each run well within the daily limit of tiles. Images and Map Features stop when the Area is larger than one square degree, which would take more than a hundred searches; the API itself refuses a search box of 0.01 square degrees or more ([Mapillary (2026)](#ref-Map2026a)), which the tabs avoid by splitting the Area. Each message gives the size of the Area and the limit, so the Area can be made smaller.

## No Images over the Area

When Mapillary has no images over the Area, or none that match the filters of Images, the tab stops with a message saying so. Crowdsourced coverage is uneven: contributions concentrate along local roads and in populated areas, and vary from one place to another ([Mahabir, Schuchard, Crooks, Croitoru and Stefanidis (2020)](#ref-MSCCS2020a)). Widening the Area, removing the filters of Captured From, Captured To and Panoramas, or reading Coverage, which has no filters, shows whether the Area has images at all.

## Images Without a Quality Score

The quality score of an image is the visual quality Mapillary predicts for it, from 0 to 1, and may be absent ([Mapillary (2026)](#ref-Map2026a)). Image Quality counts the images with a score, gives the quantiles of the score and the share of the images in each tenth of the scale; Panoramas and Others gives the median score of each. The images without a score are kept in the tables, and left out only of these summaries.

## References

<a id="ref-MSCCS2020a"></a>Mahabir, R., Schuchard, R., Crooks, A., Croitoru, A. and Stefanidis, A. (2020). Crowdsourcing Street View Imagery: A Comparison of Mapillary and OpenStreetCam. *ISPRS International Journal of Geo-Information*, 9(6), 341. [doi:10.3390/ijgi9060341](https://doi.org/10.3390/ijgi9060341)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Authentication](authentication.md) · [Coverage Tiles](coverage-tiles.md) · [Image Search](image-search.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
