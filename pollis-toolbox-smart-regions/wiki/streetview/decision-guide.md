# Decision Guide

## Which Tab of the Mapillary Street-Level Viewer

| Tab | When | Opens |
|---|---|---|
| Nearest Image | A place to see from the street | The image nearest the point, or the newest near it |
| Image by ID | An image already found, in a link or a table | That image, wherever it is |
| Nearest Panorama | The whole view round a point | The nearest or the newest panorama |
| Map and Viewer | The streets around a point, walked with a map | The image beside a map of the coverage |

Each tab leaves the table `images` and the id `image` for the Next Steps, so a view opened in one tab can be checked, compared and saved in the same way. Viewer and Map adds the coverage map to the image of the other three tabs.

## How Large a Search Radius

A small Search Radius keeps the image close to the point but may find none; a larger one finds more images, some farther away, and over a box holding more than 2,000 images the search returns only part of them ([Mapillary (2026)](#ref-Map2026a)). Images by Distance shows how the images found spread out from the point, which helps choose the radius of the next run. Nearest Panorama may need a larger radius than Nearest Image, as it keeps only panoramas. Image by ID uses the radius only when its Image ID or Link is nearest.

## The Nearest or the Newest Image, and When Each Fits

The Nearest shows the point as closely as Mapillary has it, which suits seeing what stands there. The Newest shows the place as it was last photographed, which suits checking whether something has changed, at the cost of a view from farther away. Coverage by Year shows how many years the images within the Search Radius span, and Oldest and Newest opens the first and the last of them side by side. In either case, the coverage reflects where contributors went, not a survey designed for the place ([Juhász and Hochmair (2016)](#ref-JH2016a)).

## When to Use Mapillary Street-Level Imagery Instead

The Mapillary Street-Level Viewer looks at one place at a time. To count, map or download the images of a whole neighbourhood or city, with their dates, sequences, quality scores and thumbnails, or the traffic signs and other objects located from them, Mapillary Street-Level Imagery reads the coverage tiles and the image search over an area. Its tables carry the same image ids as this panel, so an image found there opens here with Image by ID, and the coverage map of Map and Viewer shows the same sequences its Coverage tab reads.

## References

<a id="ref-JH2016a"></a>Juhász, L. and Hochmair, H. H. (2016). User Contribution Patterns and Completeness Evaluation of Mapillary, a Crowdsourced Street Level Photo Service. *Transactions in GIS*, 20(6), 925–947. [doi:10.1111/tgis.12190](https://doi.org/10.1111/tgis.12190)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Factsheet](factsheet.md) · [Finding an Image](finding-an-image.md) · [Nearest Image](nearest.md) · [Image by ID](byid.md) · [Nearest Panorama](pano.md) · [Map and Viewer](mapview.md)
