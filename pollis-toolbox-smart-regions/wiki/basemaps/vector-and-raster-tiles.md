# Vector Tiles and Raster Tiles

## Why Web Maps Are Cut Into Tiles

A web map of the whole world, down to single streets, is far too large to send at once. Web maps therefore cut it into square tiles at a series of zoom levels: at zoom 0 one tile shows the whole world, and each level up splits every tile into four, so a tile covers half the width of the one before ([Battersby, Finn, Usery and Yamamoto (2014)](#ref-BFUY2014a)). A tile is named by its zoom and its column and row, and the browser fetches only the tiles of the area and zoom on screen. Tiles that do not change can be made once and served as plain files, which is what lets a service such as OpenFreeMap serve maps for free ([Ero (2026)](#ref-Ero2026a)).

## What Is a Raster Tile?

A raster tile is a picture: an image, usually PNG, drawn on the server from the map data in one fixed style. The standard map of openstreetmap.org is served this way, as PNG tiles from tile.openstreetmap.org ([OpenStreetMap Foundation (2026)](#ref-OSMF2026a)). A browser only has to place raster tiles side by side, so any map library shows them. The style, the language of the labels and the size of the text are fixed in the pictures: another style needs another set of tiles, drawn and stored for every zoom level. Labels can be cut where tiles meet, and the pictures turn blurred when the map is shown between two zoom levels.

## What Is a Vector Tile?

A vector tile holds the features that fall in its square, not a picture of them: named layers, each with features whose geometry is a point, a line or a polygon, and their attributes ([Mapbox (2016)](#ref-M2016a)). The Mapbox Vector Tile Specification encodes a tile with Protocol Buffers; coordinates are integers on a grid whose size each layer gives as its extent, starting at the top-left corner of the tile, and geometries are written as commands (move to, line to, close path) with small, zigzag-encoded offsets. Attributes are pairs of indices into lists of keys and values shared by the layer. The files take the extension `.mvt`. The browser draws the features following a style, so one set of vector tiles serves any style ([MapLibre Contributors (2026)](#ref-MLC2026a)).

## The OpenMapTiles Schema of Vector Tiles

A schema says which layers vector tiles have and what is in each. The OpenMapTiles schema, whose tiles OpenFreeMap serves, sorts OpenStreetMap data into sixteen layers ([OpenMapTiles Contributors (2026)](#ref-OMTC2026a); [Ero (2026)](#ref-Ero2026a)):

| Layers | What they hold |
|---|---|
| `water`, `waterway`, `water_name` | Seas, lakes and rivers, and their names |
| `landcover`, `landuse`, `park` | Woods, grass and sand; residential and industrial areas; parks and reserves |
| `transportation`, `transportation_name` | Roads, railways and ferries, and their names |
| `building`, `housenumber` | Buildings with their heights, and house numbers |
| `place`, `boundary` | Countries, cities, towns and villages; administrative borders |
| `poi`, `aeroway`, `aerodrome_label`, `mountain_peak` | Points of interest, airports and peaks |

The schema is open under CC-BY and must be credited when built upon.

## References

<a id="ref-BFUY2014a"></a>Battersby, S. E., Finn, M. P., Usery, E. L. and Yamamoto, K. H. (2014). Implications of Web Mercator and its use in online mapping. *Cartographica*, 49(2), 85–101. [doi:10.3138/carto.49.2.2313](https://doi.org/10.3138/carto.49.2.2313)

<a id="ref-Ero2026a"></a>Ero, Z. (2026). OpenFreeMap: free and open-source map hosting with OpenStreetMap data. [github.com/hyperknot/openfreemap](https://github.com/hyperknot/openfreemap)

<a id="ref-M2016a"></a>Mapbox (2016). Mapbox vector tile specification, version 2.1. [github.com/mapbox/vector-tile-spec](https://github.com/mapbox/vector-tile-spec)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-OMTC2026a"></a>OpenMapTiles Contributors (2026). OpenMapTiles: vector tile schema implementation. [github.com/openmaptiles/openmaptiles](https://github.com/openmaptiles/openmaptiles)

<a id="ref-OSMF2026a"></a>OpenStreetMap Foundation (2026). Tile usage policy. [operations.osmfoundation.org/policies/tiles](https://operations.osmfoundation.org/policies/tiles/)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Base Map Styles](base-map-styles.md) · [Tile Usage and Attribution](tile-usage-and-attribution.md) · [Web Mercator](web-mercator.md)
