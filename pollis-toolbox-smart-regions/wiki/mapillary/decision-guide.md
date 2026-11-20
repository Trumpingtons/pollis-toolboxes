# Decision Guide

## Which Tab of the Mapillary Panel

| Need | Tab |
|---|---|
| Where and when an area up to a city was photographed, image by image and sequence by sequence | Coverage |
| The images of a neighbourhood with their cameras, filtered by date or panorama, and thumbnails to look at | Images |
| The traffic signs and other objects located from the images | Map Features |

Coverage reads the vector tiles, which Mapillary recommends for spatial queries at scale ([Mapillary (2026)](#ref-Map2026a)), and is the quickest way to see what covers an Area. Images gives each image's camera, its contributor's name and its thumbnail, which the tiles do not carry.

## How Large an Area for Each Tab

Coverage reads at most 400 tiles of zoom 14, about the size of a city. Images and Map Features search an Area of at most one square degree, in boxes under the 0.01 square degrees the API allows, so a large Area takes many searches and a dense one more, as a box with 2,000 answers is split again ([Mapillary (2026)](#ref-Map2026a)). A neighbourhood, such as the default Area of the centre of Amsterdam, takes one search.

## Which Filters of the Images Tab

Captured From and Captured To keep the images captured between two days, which limits a search to a period of interest; Panoramas keeps the panoramas only or leaves them out ([Mapillary (2026)](#ref-Map2026a)). A panorama is a 360-degree image, while another image looks one way, given by its heading. Thumbnails at 20 Images or 100 Images downloads that many to look at, one from each sequence first; None downloads none, for a search that needs only the table.

## Reading Mapillary Coverage with Care

Mapillary images are contributed by volunteers, which shapes what they cover. Compared with Google Street View in selected areas of the United States and northern Europe, Mapillary's coverage was generally lower on almost all road categories, with exceptions for pedestrian and cycle paths in some cities ([Juhász and Hochmair (2016)](#ref-JH2016a)). In four metropolitan areas of the United States, a few users contributed most of the data ([Mahabir, Schuchard, Crooks, Croitoru and Stefanidis (2020)](#ref-MSCCS2020a)). Contributors shows how many people captured the images of the Area, and Newest Image per Cell how old the coverage of each part of it is.

## References

<a id="ref-JH2016a"></a>Juhász, L. and Hochmair, H. H. (2016). User Contribution Patterns and Completeness Evaluation of Mapillary, a Crowdsourced Street Level Photo Service. *Transactions in GIS*, 20(6), 925–947. [doi:10.1111/tgis.12190](https://doi.org/10.1111/tgis.12190)

<a id="ref-MSCCS2020a"></a>Mahabir, R., Schuchard, R., Crooks, A., Croitoru, A. and Stefanidis, A. (2020). Crowdsourcing Street View Imagery: A Comparison of Mapillary and OpenStreetCam. *ISPRS International Journal of Geo-Information*, 9(6), 341. [doi:10.3390/ijgi9060341](https://doi.org/10.3390/ijgi9060341)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Overview](overview.md) · [Coverage Tiles](coverage-tiles.md) · [Image Search](image-search.md) · [Map Features](map-features.md) · [Factsheet](factsheet.md)
