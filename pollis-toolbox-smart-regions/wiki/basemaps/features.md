# Features

## What the Features Tab of the OpenStreetMap Base Maps Panel Shows

The Features tab of the OpenStreetMap Base Maps panel shows the features of a file on a base map that fits them: points as circles, lines as lines, polygons filled with their outlines, all in one colour. The file is read with `ST_Read` of DuckDB's spatial extension, which reads GeoJSON, GeoPackage (its first layer), Shapefile, FlatGeobuf, KML and GPX (its waypoints) through GDAL ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The Filter input, a SQL condition, keeps only some of the features as the file is read. A click on a feature shows a table of its attributes; the pointer turns into a hand over features that can be clicked ([MapLibre Contributors (2026)](#ref-MLC2026a)).

## Moving Features Into Longitude and Latitude for a Web Map

A web map takes its layers in longitude and latitude on WGS 84, the coordinates GeoJSON requires ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). Files in a projected system, such as a national grid in metres, are moved there with `ST_Transform(geom, 'EPSG:xxxx', 'EPSG:4326')`, the first code given by the File Coordinate System input ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The Example Code sets `geometry_always_xy`, so longitude comes first whatever the axis order of EPSG:4326. When the File Coordinate System input does not match the file, the features land in the wrong place, or get coordinates beyond longitude and latitude; Coordinates in Range counts them.

## How the Map Fits the Features

Without a centre and a zoom, `Pollis.webmap` fits the map to its layers: it finds the smallest and largest longitude and latitude of every coordinate of every layer, and MapLibre GL JS zooms and pans so that rectangle fills the map, with a margin ([MapLibre Contributors (2026)](#ref-MLC2026a)). The fit stops at zoom 15, so a single point, or features at one place, are shown with the neighbourhood around them rather than infinitely close. One stray feature, such as a point at longitude 0 and latitude 0 from a missing coordinate, makes the map fit half the world. Bounding Box draws the rectangle of the features on the map, and Distance from the Centre lists the features nearest its centre, so a stray feature stands out.

## The Size of a Map Layer

The page of a map holds each of its layers as GeoJSON text, every coordinate written out in decimal degrees ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). A few thousand points make a small layer; boundaries surveyed in detail, with many vertices each, can make one of many megabytes, slow to send and to draw. Layer Size prints the kilobytes of the layer and its features and vertices by geometry type, and Simplified and Original shows the effect of `ST_SimplifyPreserveTopology` on the vertices, the size and the shapes ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Save the Map Layer writes the layer as map-layer.geojson, for use in other software.

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON format. RFC 7946, Internet Engineering Task Force. [doi:10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

## See Also
- [Factsheet](factsheet.md) · [Place](place.md) · [Colour by Column](colour-by-column.md) · [Decision Guide](decision-guide.md) · [Web Mercator](web-mercator.md)
