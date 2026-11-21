# Base Map Styles

## What Is a Map Style?

A map style says how a base map is drawn from its vector tiles: which layers of the tiles appear, at which zoom levels, in which colours, line widths and fonts, and in which order, from the land at the bottom to the labels at the top. MapLibre GL JS reads a style as a JSON document that names the sources of the tiles, the fonts and icons, and the list of layers that draw them ([MapLibre Contributors (2026)](#ref-MLC2026a)). Because the tiles hold data, not pictures, the same tiles can be drawn in any number of styles: OpenFreeMap's styles all draw tiles of the OpenMapTiles schema ([Ero (2026)](#ref-Ero2026a); [OpenMapTiles Contributors (2026)](#ref-OMTC2026a)).

## The Five Styles of the OpenStreetMap Base Maps Panel

The Style input of the OpenStreetMap Base Maps panel picks one of five styles from OpenFreeMap ([Ero (2026)](#ref-Ero2026a)):

| Style | Look | Suits |
|---|---|---|
| Positron | Light grey land, white roads, grey water, dark labels | Data on top, colour scales |
| Bright | Cream land, orange and yellow roads, green parks, blue water | A map read as a map |
| Liberty | Cream land, yellow roads, green parks, blue water, more colours of land use | A map read as a map |
| Dark | Near-black land and water, grey roads and labels | Bright data on top, dark screens |
| Fiord | Dark blue-grey land and water, lighter streets, blue labels | A dark map in blue tones |

`Pollis.webmap` also takes the address of any MapLibre style in place of a name. Every Style shows the same map in all five, each on a page of its own in Pollis's browser.

## Choosing a Base Map Style for Data

A base map for data should step back, so the data is what the eye finds first. Positron does this on a light ground and Dark on a dark one: their few, muted colours leave the colours of the data free, so a colour scale or a set of category colours is not confused with parks, water or roads. Bright and Liberty show the kinds of road, land use and water in their usual colours, which help a reader find the way or recognise a place, but compete with data drawn in similar colours. Polygons drawn with an Opacity below 1 let the base map show through, so streets and names stay visible under them; the names of the base map are drawn above the polygons.

## Labels and Languages of Base Map Styles

The names on a base map come from the tags of OpenStreetMap features, which volunteers enter ([Haklay and Weber (2008)](#ref-HW2008a)). The vector tiles carry those names with the features of the place, transportation_name, water_name and other labelled layers of the OpenMapTiles schema, and the style says which name field each label shows ([OpenMapTiles Contributors (2026)](#ref-OMTC2026a); [MapLibre Contributors (2026)](#ref-MLC2026a)). On a map of Rome, the styles of OpenFreeMap show "Rome" in English beside street names such as "Via del Corso" in Italian. A copy of a style, with its label fields changed, can show names in another language, and `Pollis.webmap` takes the address of such a style in place of a name.

## References

<a id="ref-Ero2026a"></a>Ero, Z. (2026). OpenFreeMap: free and open-source map hosting with OpenStreetMap data. [github.com/hyperknot/openfreemap](https://github.com/hyperknot/openfreemap)

<a id="ref-HW2008a"></a>Haklay, M. and Weber, P. (2008). OpenStreetMap: user-generated street maps. *IEEE Pervasive Computing*, 7(4), 12–18. [doi:10.1109/MPRV.2008.80](https://doi.org/10.1109/MPRV.2008.80)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-OMTC2026a"></a>OpenMapTiles Contributors (2026). OpenMapTiles: vector tile schema implementation. [github.com/openmaptiles/openmaptiles](https://github.com/openmaptiles/openmaptiles)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Vector Tiles and Raster Tiles](vector-and-raster-tiles.md) · [Colour by Column](colour-by-column.md) · [Decision Guide](decision-guide.md)
