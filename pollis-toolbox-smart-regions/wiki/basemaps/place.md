# Place

## What the Place Tab of the OpenStreetMap Base Maps Panel Shows

The Place tab of the OpenStreetMap Base Maps panel shows a base map centred on a place, at a chosen zoom, with the place marked by a point that shows its name when clicked. The Longitude and Latitude inputs give the centre in degrees on WGS 84, longitude first, negative west of Greenwich and south of the equator, as GeoJSON orders them ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). The place is a one-row DuckDB table named `features`, made with `ST_Point`, so the Next Steps that work on features, such as Coordinates in Range and Save the Map Layer, work on it too ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The Place tab is a starting point: a look at an area before data is added to it.

## Zoom Levels of a Web Map

The Zoom input of the Place tab runs from 0, where the whole world fits in one tile, upwards: each level up shows half the width of the level before, so three levels show an eighth of the width ([Battersby, Finn, Usery and Yamamoto (2014)](#ref-BFUY2014a)). Zoom 12 shows a city, 15 a neighbourhood and 18 a few streets. The OpenMapTiles schema adds layers and detail as the zoom grows: at low zooms only rivers among waterways, borders from Natural Earth, and the main places; by zoom 14 every point of interest and house number ([OpenMapTiles Contributors (2026)](#ref-OMTC2026a)). Zoom need not be a whole number: the mouse wheel moves it smoothly. Three Zoom Levels shows the place three levels out, at the zoom given, and three levels in.

## The Scale of a Web Map at a Given Zoom

At a given zoom, the ground that a pixel of a web map covers depends on latitude: Web Mercator enlarges the map away from the equator, so a pixel covers fewer metres in Oslo than in Lisbon at the same zoom ([Battersby, Finn, Usery and Yamamoto (2014)](#ref-BFUY2014a)). MapLibre GL JS draws the whole world 512 pixels wide at zoom 0, and twice as wide at each level up ([MapLibre Contributors (2026)](#ref-MLC2026a)). The Map Scale action of the Place tab prints the metres a pixel covers at the place's latitude and zoom, and the width of 1,000 pixels on the ground. The scale bar at the bottom left of the map shows the same at the latitude of the middle of the map, and changes as the map moves north or south.

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON format. RFC 7946, Internet Engineering Task Force. [doi:10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-BFUY2014a"></a>Battersby, S. E., Finn, M. P., Usery, E. L. and Yamamoto, K. H. (2014). Implications of Web Mercator and its use in online mapping. *Cartographica*, 49(2), 85–101. [doi:10.3138/carto.49.2.2313](https://doi.org/10.3138/carto.49.2.2313)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-OMTC2026a"></a>OpenMapTiles Contributors (2026). OpenMapTiles: vector tile schema implementation. [github.com/openmaptiles/openmaptiles](https://github.com/openmaptiles/openmaptiles)

## See Also
- [Factsheet](factsheet.md) · [Features](features.md) · [Colour by Column](colour-by-column.md) · [Web Mercator](web-mercator.md) · [Vector Tiles and Raster Tiles](vector-and-raster-tiles.md)
