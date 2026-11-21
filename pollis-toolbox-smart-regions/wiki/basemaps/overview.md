# OpenStreetMap Base Maps — Overview

## What Is OpenStreetMap?

OpenStreetMap is a map of the world that volunteers make together, following the peer production model of Wikipedia: anyone can edit it, and its data is free to use ([Haklay and Weber (2008)](#ref-HW2008a)). Contributors add roads, buildings, rivers, land use, place names and points of interest, each as features with tags that say what they are. A core group of volunteers runs the servers and writes the software that handles the edits and draws the maps, and a wider community of developers writes tools that bring the data to other software and devices. Base maps made from OpenStreetMap data must credit OpenStreetMap; the Tile Usage and Attribution page of the OpenStreetMap Base Maps panel gives the wording.

## What Is a Base Map?

A base map is the background of a map: streets, place names, water, parks, borders and land, on which the data of interest is drawn. It gives the data a place: a point becomes a corner of a known street, a polygon a part of a known town. A base map for data is drawn quietly, so the data stands out on it; a base map for finding the way is drawn in full colour, with every road class and label. The OpenStreetMap Base Maps panel offers five styles of base map, from the light grey Positron to the full-colour Bright and Liberty, all made from the same OpenStreetMap data ([Ero (2026)](#ref-Ero2026a)).

## How Pollis Draws Base Maps With MapLibre GL JS

MapLibre GL JS is an open-source JavaScript library that draws interactive maps in web pages and webviews from vector tiles, using the graphics processor ([MapLibre Contributors (2026)](#ref-MLC2026a)). Pollis bundles it: `Pollis.webmap` writes a map's layers and style, as JSON, into a page that opens in Pollis's browser, or into the output of a notebook cell, and MapLibre GL JS fetches the tiles of the base map, draws them following the style, and draws the layers on top. The map can be zoomed with the mouse wheel or the buttons, panned by dragging, and turned with the right mouse button; a click on a feature shows its attributes. Polygon fills sit under the names of the base map, so places stay readable.

## Where the Tiles Come From: OpenFreeMap and OpenMapTiles

The base maps of the OpenStreetMap Base Maps panel come from OpenFreeMap, an open-source project that serves vector tiles of OpenStreetMap data from a public instance, free and without registration or API keys ([Ero (2026)](#ref-Ero2026a)). Its tiles follow the OpenMapTiles schema, which sorts OpenStreetMap data into layers such as water, transportation, building, place, landuse and boundary, each with its own attributes and the zoom levels at which it appears ([OpenMapTiles Contributors (2026)](#ref-OMTC2026a)). A style says how to draw each of those layers, so OpenFreeMap's five styles share one set of tiles. The whole of OpenFreeMap, including its production setup, is open source, so the tiles can also be served from one's own server.

## Features From Files on a Base Map

The Features and Colour by Column tabs of the OpenStreetMap Base Maps panel read a file with `ST_Read` of DuckDB's spatial extension, which reads GeoJSON, GeoPackage, Shapefile, FlatGeobuf, KML and GPX through GDAL ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). A Filter input in SQL keeps only some features as the file is read. Web maps take coordinates as longitude and latitude on WGS 84, as GeoJSON does, so `ST_Transform` moves the features there from the File Coordinate System input before they are written as the map's GeoJSON layer ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). The Geospatial Vector Files panel reads the same formats with a tab for each, and its Show on a Map Next Step opens the features on a base map.

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON format. RFC 7946, Internet Engineering Task Force. [doi:10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ero2026a"></a>Ero, Z. (2026). OpenFreeMap: free and open-source map hosting with OpenStreetMap data. [github.com/hyperknot/openfreemap](https://github.com/hyperknot/openfreemap)

<a id="ref-HW2008a"></a>Haklay, M. and Weber, P. (2008). OpenStreetMap: user-generated street maps. *IEEE Pervasive Computing*, 7(4), 12–18. [doi:10.1109/MPRV.2008.80](https://doi.org/10.1109/MPRV.2008.80)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-OMTC2026a"></a>OpenMapTiles Contributors (2026). OpenMapTiles: vector tile schema implementation. [github.com/openmaptiles/openmaptiles](https://github.com/openmaptiles/openmaptiles)

## See Also
- [Factsheet](factsheet.md) · [Base Map Styles](base-map-styles.md) · [Vector Tiles and Raster Tiles](vector-and-raster-tiles.md) · [Tile Usage and Attribution](tile-usage-and-attribution.md) · [Web Mercator](web-mercator.md) · [Decision Guide](decision-guide.md)
