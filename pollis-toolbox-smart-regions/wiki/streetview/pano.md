# Nearest Panorama

## What Nearest Panorama Does

Nearest Panorama looks for the panoramas of Mapillary within the Search Radius of a point and opens the nearest, or the newest, in the street-level viewer. It asks the image search of the Mapillary API for panoramas only, with the filter `is_pano`, so that the API leaves the other images out ([Mapillary (2026)](#ref-Map2026a)). In the viewer, a panorama turns through the whole circle as it is dragged, and its arrows lead on to other images, panoramas or not ([Mapillary (2023)](#ref-Map2023a)). The tab suits looking all round a point from one place, as at a crossing or in a square.

## Why Nearest Panorama Finds Fewer Images

Panoramas are only a part of the images of Mapillary, so the panoramas within a Search Radius are fewer than the images, and the nearest panorama may lie farther from the point than the nearest image. When there is none, the tab stops and suggests a larger Search Radius or Nearest Image. Panoramas and Others, among the Next Steps of Nearest Image and Map and Viewer, counts both kinds within the Search Radius, with the nearest of each and their dates ([Mapillary (2026)](#ref-Map2026a)).

## Turning a Panorama Towards the Point

A panorama has a compass angle like any other image, but sees every direction ([Mapillary (2026)](#ref-Map2026a)). Is the Point in View? gives the compass direction from the panorama to the point, the direction to turn the viewer to, while the indicator of the viewer shows the direction it faces as it turns ([Mapillary (2023)](#ref-Map2023a)). Oldest and Newest opens the first and the last panorama within the Search Radius, each in its own viewer, to compare the place all round at two dates.

## References

<a id="ref-Map2023a"></a>Mapillary (2023). MapillaryJS: Interactive, Extendable Street Imagery Map Experiences in the Browser. Version 4.1.2. [github.com/mapillary/mapillary-js](https://github.com/mapillary/mapillary-js)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Factsheet](factsheet.md) · [Using the Viewer](viewer.md) · [Nearest Image](nearest.md) · [Finding an Image](finding-an-image.md) · [Diagnostics](diagnostics.md)
