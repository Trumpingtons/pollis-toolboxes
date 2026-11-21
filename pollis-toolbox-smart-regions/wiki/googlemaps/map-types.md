# Map Types

## The Four Map Types of a Google Map

A 2D map of the Maps JavaScript API shows one of four basic map types, set by its property `mapTypeId` ([Google (2026a)](#ref-Goo2026a)). The Roadmap, Satellite and Terrain tabs of the Google Maps panel each open one of them, and the Labels input of the Satellite tab chooses between the two that show imagery.

| Map type | What it shows | Tab of the panel |
|---|---|---|
| `roadmap` | The default road map, with the base map's labels | Roadmap |
| `satellite` | A photorealistic map made from aerial imagery | Satellite, Without Labels |
| `hybrid` | The satellite map with the base map's labels | Satellite, With Labels |
| `terrain` | A physical map made from terrain information | Terrain |

Every Map Type opens the place in all four, a page each, and Two Map Types Side by Side puts two of them on one page.

## Zoom Levels and Coordinates of a Google Map

The Maps JavaScript API takes latitude and longitude on the World Geodetic System WGS84, and projects them with the Mercator projection ([Google (2026a)](#ref-Goo2026a)). At zoom level 0 the whole world fits in a single tile; each zoom level above is twice as large as the one before in both directions, so the map shows half the width and half the height of the area, at four times the resolution. The Zoom input of the 2D tabs sets the level the map opens at: 12 shows a city, and 15 a neighbourhood. The user can zoom further on the page, as far as Google has imagery or map data for the place.

## Features on Google's Data Layer

The Data layer of the Maps JavaScript API holds geographic features, points, lines and polygons, and draws them over the map in the structure of GeoJSON ([Google (2026a)](#ref-Goo2026a); [Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). The pages of the Google Maps panel give it a GeoJSON feature collection with `addGeoJson`, fit the map to the features, and show the properties of a feature when it is clicked. GeoJSON coordinates are longitude and latitude on WGS 84, which the map expects. Features on the Map writes the query `places` of the Example Code as GeoJSON with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)), so any query that returns a geometry column in longitude and latitude can take its place.

## Colouring Features by a Column

The style of the Data layer is set with `setStyle`, either one style for every feature or a function that gives each feature its style from its properties ([Google (2026a)](#ref-Goo2026a)). Coloured by a Column passes such a function, which reads the column of the Colour By input. A column whose values are all numbers is split into five equal classes from its smallest to its largest value, coloured from dark purple through green to yellow; a text column gives each of its first eight values a colour of its own. Features without a value are grey, and a legend in the corner of the map gives the classes or the values. Points are drawn as circles, and polygons filled at half opacity, so that the map shows through.

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON Format. RFC 7946. [doi.org/10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Goo2026a"></a>Google (2026a). Maps JavaScript API Documentation. [developers.google.com/maps/documentation/javascript](https://developers.google.com/maps/documentation/javascript)

## See Also
- [3D Maps and the Camera](map3d.md) · [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
