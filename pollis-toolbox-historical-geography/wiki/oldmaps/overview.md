# Historical Maps — Overview

The Historical Maps panel of the Historical Geography and Archaeology Toolbox sets an old map beside today's map of the same place. An old map that is georeferenced, with each point of the image tied to coordinates, can be drawn on today's coordinates and compared with today's map point by point; an old map that is not georeferenced can be read beside today's map of its region ([International Image Interoperability Framework Consortium (2023)](#ref-IIIFC2023a)).

## How Do I Read the Swipe of Historical Maps?

The Maps of France and Georeferenced Maps tabs of the Historical Maps panel draw the old map on the left of a line across the map, and today's map on its right. Dragging the line, or moving it with the arrow keys once it has the focus, uncovers more of one map and less of the other. The two sides are two maps that move and zoom together, so a street, a bridge or a bend of a river stays under the line while the line passes over it. The legend names the layer of each side, marked left or right ([MapLibre Contributors (2026)](#ref-MLC2026a)). Old Map Over Today draws the old map half transparent over today's map instead, without the line.

## Why Is a Famous Map Shown Beside Today's Map Rather Than Over It?

The Famous Maps tab of the Historical Maps panel shows maps that are not georeferenced: the image has no coordinates, so it cannot be laid on today's map. Georeferencing ties points of an image to geographic coordinates with ground control points, from which a transformation maps every pixel to coordinates ([International Image Interoperability Framework Consortium (2023)](#ref-IIIFC2023a)). The tab therefore shows the image on the left, where it moves and enlarges on its own, and today's map on the right, opened on the region the map shows, outlined in red.

## What Does Each Tab of Historical Maps Show?

| Tab | Old map | Today's map |
|---|---|---|
| Maps of France | The map of Cassini, the map of the état-major, IGN's map of 1950 or aerial photographs of 1950 to 1995, as tiles of IGN | IGN's aerial photographs, Plan IGN or OpenStreetMap |
| Georeferenced Maps | A map of a library, warped onto today's coordinates by the Allmaps Tile Server | OpenStreetMap |
| Famous Maps | The image of a famous map, as its library or Wikimedia Commons publishes it | OpenStreetMap, on the map's region |

The tiles of IGN and of Allmaps are drawn as the services send them ([Institut national de l'information géographique et forestière (2026)](#ref-IGN2026a); [Allmaps (2026)](#ref-All2026a)).

## Where Do the Maps of the Historical Maps Panel Come From?

The old maps of the Historical Maps panel stay on the servers of those who publish them, and the panel reads them as it draws. IGN's Géoplateforme serves the maps of France as tiles of the WMTS standard ([Institut national de l'information géographique et forestière (2026)](#ref-IGN2026a)). Allmaps keeps the ground control points of maps that libraries, archives and museums share through IIIF, and its tile server warps each map onto web map tiles ([Allmaps (2026)](#ref-All2026a)). The images of the famous maps come from the IIIF image servers of three libraries, which return an image of the size asked for, and from Wikimedia Commons for the others ([Appleby, Crane, Sanderson, Stroop and Warner (2020)](#ref-ACSSW2020b)).

## References

<a id="ref-All2026a"></a>Allmaps (2026). Allmaps: curating, georeferencing and exploring IIIF maps. [allmaps.org](https://allmaps.org)

<a id="ref-ACSSW2020b"></a>Appleby, M., Crane, T., Sanderson, R., Stroop, J. and Warner, S. (2020). IIIF Image API 3.0. IIIF Consortium. [iiif.io/api/image/3.0](https://iiif.io/api/image/3.0/)

<a id="ref-IGN2026a"></a>Institut national de l'information géographique et forestière (2026). API Géoplateforme – Diffusion d'images tuilées WMTS. [data.geopf.fr/wmts](https://data.geopf.fr/wmts?SERVICE=WMTS&REQUEST=GetCapabilities)

<a id="ref-IIIFC2023a"></a>International Image Interoperability Framework Consortium (2023). Georeference Extension. [iiif.io/api/extension/georef](https://iiif.io/api/extension/georef/)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

## See Also
- [Factsheet](factsheet.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Maps of France](maps-of-france.md) · [Georeferenced Maps](georeferenced-maps.md) · [Famous Maps](famous-maps.md)
