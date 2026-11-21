# Image by ID

## What Image by ID Does

Image by ID opens one image of Mapillary given by its id, wherever it is. It reads the fields of the image from the image entity of the Mapillary API, the same fields the image search gives, and keeps them as the one row of the table `images`, with the distance of the image from the point ([Mapillary (2026)](#ref-Map2026a)). The viewer then opens the image, titled with the Place Name. Image by ID suits an image found elsewhere: in a link someone sent, in the tables of Mapillary Street-Level Imagery, or in a study that names its images by id.

## The Image ID or Link Input

Image ID or Link takes the numeric id of a Mapillary image, or a link of mapillary.com that names an image with the parameter `pKey`, from which the tab reads the number. Anything else but the word nearest stops the tab with a message, before any request is made. An id that Mapillary does not know stops it with Mapillary's own message, before the viewer is drawn. The default is the id of one image, which shows the tab at work before an id of one's own is at hand; replacing it with another id, or pasting a link over it, opens that image instead.

## Image by ID with Nearest

With Image ID or Link set to nearest, Image by ID searches the images within the Search Radius of the point, as Nearest Image does, keeps them in the table `images`, and opens the nearest; the id it prints can then be typed in Image ID or Link to open that image again later ([Mapillary (2026)](#ref-Map2026a)). With an id, the table holds that image only, so the Next Steps that need several images, such as Oldest and Newest or Images by Distance, are not offered for this tab; Image Details, Is the Point in View? and the Export steps are.

## References

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Factsheet](factsheet.md) · [Finding an Image](finding-an-image.md) · [Nearest Image](nearest.md) · [Decision Guide](decision-guide.md)
