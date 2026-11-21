# Map and Viewer

## What Map and Viewer Does

Map and Viewer looks for the images within the Search Radius of the point, as Nearest Image does, and opens the nearest or the newest in the street-level viewer, with a map of the coverage of Mapillary to its right. The map draws the computed coverage tiles of Mapillary over an OpenStreetMap base map, with MapLibre GL JS: the sequences as lines and the images as dots ([Mapillary (2026)](#ref-Map2026a); [MapLibre Contributors (2026)](#ref-MLC2026a)). It opens at zoom 17 on the image, where the dots of the images show, and it is titled with the Place Name.

## Moving Between the Map and the Viewer

The map and the viewer are kept in step. A click on a dot of the map opens that image in the viewer, and a click on a line opens the image the tiles give for that sequence. When the viewer moves, by its arrows, its keys or a click on the map, the map follows it and a red arrow marks the image and points the way the viewer looks ([Mapillary (2023)](#ref-Map2023a)). Walking a street in the viewer thus traces it on the map, and a street with no line on the map has no images to walk.

## Reading the Coverage Map

The lines of the map are the sequences of the coverage tiles, drawn from zoom 6, and the dots are the images, drawn from zoom 14, the zoom of the image layer of the tiles ([Mapillary (2026)](#ref-Map2026a)). Zooming out past 14 leaves only the lines, and past 6 only the base map. The positions are the computed ones, those the viewer uses too, so the red arrow sits on the dot of its image. Images Around the Point, among the Next Steps, maps instead the images the search kept, coloured by the year they were captured.

## References

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-Map2023a"></a>Mapillary (2023). MapillaryJS: Interactive, Extendable Street Imagery Map Experiences in the Browser. Version 4.1.2. [github.com/mapillary/mapillary-js](https://github.com/mapillary/mapillary-js)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

## See Also
- [Factsheet](factsheet.md) · [Using the Viewer](viewer.md) · [Nearest Image](nearest.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
