# OpenStreetMap Base Maps — Decision Guide

## Which Tab of the OpenStreetMap Base Maps Panel to Use

| Question | Tab | Why |
|---|---|---|
| What is around a place? | Place | A centre and a zoom, with the place marked |
| Where do the features of a file fall? | Features | The map fits the features; a click shows each one's attributes |
| How does a value vary across the features? | Colour by Column | A colour scale for a number, a colour per value for text |
| Which features does a filter keep? | Features or Colour by Column, then All and Filtered Features | All in grey, the kept ones in colour |
| Is the file in the coordinate system I think? | Features, then Coordinates in Range | Coordinates outside longitude and latitude show a wrong system |

The Features and Colour by Column tabs read any file `ST_Read` reads: GeoJSON, GeoPackage, Shapefile, FlatGeobuf, KML and GPX ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). For a GeoPackage layer other than the first, a GPX layer other than the waypoints, or a GeoParquet file, the Geospatial Vector Files panel reads the file, and its Show on a Map Next Step opens it on a base map.

## A Web Map or a Chart?

A web map on a base map shows features among streets, names and land, at any zoom, which suits questions of where: which streets a route takes, which neighbourhoods a set of points falls in. It needs the internet for its tiles, draws in Web Mercator, and enlarges areas away from the equator ([Battersby, Finn, Usery and Yamamoto (2014)](#ref-BFUY2014a)). A chart of the features alone, such as the Plot the Features action of the Geospatial Vector Files panel, draws them without a base map, offline, in longitude and latitude, and suits questions of shape and pattern, or a figure for print. Neither is a place to measure from: areas and lengths are measured in a projected coordinate system.

## Which Base Map Style to Choose

For data on top, Positron, light grey, or Dark, near black: their muted colours keep the eye on the data and leave its colours free ([Ero (2026)](#ref-Ero2026a)). For a map that must be read as a map, with roads, parks and water in their usual colours, Bright or Liberty. For a dark map in blue tones, Fiord. Colour scales read best on Positron or Dark, as the colours of Bright and Liberty compete with them. Every Style shows the same map in all five styles, each on a page of its own, so the choice can be made by looking. The Base Map Styles page of the OpenStreetMap Base Maps panel describes each style.

## When to Simplify Features Before Showing Them on a Map

Every vertex of a layer goes into the page of the map as GeoJSON text, and MapLibre GL JS draws them all ([MapLibre Contributors (2026)](#ref-MLC2026a); [Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). Boundaries surveyed in detail, such as those of municipalities or parcels, hold many more vertices than a map of a region can show, and make the layer large and slow to draw. `ST_SimplifyPreserveTopology` of DuckDB's spatial extension drops vertices closer than a tolerance to the simplified line, without making polygons invalid ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Layer Size prints the size and vertices of the layer, and Simplified and Original shows both versions on one map, so the effect on the shapes can be judged before measuring or sharing.

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON format. RFC 7946, Internet Engineering Task Force. [doi:10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-BFUY2014a"></a>Battersby, S. E., Finn, M. P., Usery, E. L. and Yamamoto, K. H. (2014). Implications of Web Mercator and its use in online mapping. *Cartographica*, 49(2), 85–101. [doi:10.3138/carto.49.2.2313](https://doi.org/10.3138/carto.49.2.2313)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ero2026a"></a>Ero, Z. (2026). OpenFreeMap: free and open-source map hosting with OpenStreetMap data. [github.com/hyperknot/openfreemap](https://github.com/hyperknot/openfreemap)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Base Map Styles](base-map-styles.md) · [Web Mercator](web-mercator.md) · [Features](features.md) · [Colour by Column](colour-by-column.md)
