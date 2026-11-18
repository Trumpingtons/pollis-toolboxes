# OpenStreetMap Base Maps — Factsheet

**OpenStreetMap base maps** put data on a map of streets, places, water and land made from OpenStreetMap, the map of the world that volunteers edit together ([Haklay and Weber (2008)](#ref-HW2008a)). The OpenStreetMap Base Maps panel of the Smart Regions Toolbox shows a place, or the features of a file read with DuckDB, on such a map in the plot pane of the REPL, drawn by MapLibre GL JS from the vector tiles of OpenFreeMap ([MapLibre Contributors (2026)](#ref-MLC2026a); [Ero (2026)](#ref-Ero2026a)).

| Item | OpenStreetMap Base Maps panel |
|---|---|
| **Purpose** | See where places and features are, over streets and names, and how a value varies across them |
| **Input** | A centre and a zoom, or a GeoJSON, GeoPackage, Shapefile, FlatGeobuf, KML or GPX file |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| **Tabs** | Place, Features, Colour by Column |
| **Styles** | Positron, Bright, Liberty, Dark, Fiord |
| **Output** | An interactive map in the plot pane: zoom, pan, and a click on a feature for its attributes |
| **Key choices** | The style, the file's coordinate system, a SQL filter, and the column that colours the features |

## How Does the OpenStreetMap Base Maps Panel Draw a Map?

The Example Code of the OpenStreetMap Base Maps panel puts the features in a DuckDB table named `features`: the place as a point on the Place tab, or the features of a file read with `ST_Read` of DuckDB's spatial extension on the other two tabs ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). `ST_Transform` moves them from the File Coordinate System input into longitude and latitude on WGS 84, which GeoJSON and web maps use ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). The table is written as a GeoJSON layer, and `Pollis.webmap` sends the layer and the style to the plot pane, where MapLibre GL JS draws the base map and the layer on it ([MapLibre Contributors (2026)](#ref-MLC2026a)).

## Pollis.webmap and Pollis.layer

`Pollis.webmap(layers...; style, center, zoom, title)` makes a map that the plot pane of the REPL draws. Each layer is a `Pollis.layer(geojson; name, color, column, opacity)`, where `geojson` is a GeoJSON text or the path of a GeoJSON file in longitude and latitude. Without `color` a layer takes a colour of the map's palette; with `column` its features are coloured by that property. `style` names one of the five styles, or the address of any MapLibre style. Without `center`, the map fits every layer; `zoom` runs from 0, the whole world, to about 18, a few streets. Several layers are drawn in the order given, the first at the bottom, with a legend for each.

## What the Next Steps of the OpenStreetMap Base Maps Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Every Style | The same map in the five styles, one after another |
| Visualise | Bounding Box | The features with the rectangle that holds them |
| Diagnose | Coordinates in Range | Features without a geometry, outside longitude and latitude, or beyond 85.05 degrees |
| Diagnose | Layer Size | Kilobytes of GeoJSON, features and vertices by geometry type |
| Compare | Three Zoom Levels | The place three levels out, as given, and three levels in |
| Compare | All and Filtered Features | Every feature in grey and the filtered ones in colour |
| Compare | Simplified and Original | Vertices, size and shapes before and after simplification |
| Interpret | Map Scale | Metres a pixel covers at the place's latitude and zoom |
| Interpret | Distance from the Centre | The ten features nearest the centre, in km |
| Export | Save the Map Layer | The layer as map-layer.geojson in the folder |

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON format. RFC 7946, Internet Engineering Task Force. [doi:10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ero2026a"></a>Ero, Z. (2026). OpenFreeMap: free and open-source map hosting with OpenStreetMap data. [github.com/hyperknot/openfreemap](https://github.com/hyperknot/openfreemap)

<a id="ref-HW2008a"></a>Haklay, M. and Weber, P. (2008). OpenStreetMap: user-generated street maps. *IEEE Pervasive Computing*, 7(4), 12–18. [doi:10.1109/MPRV.2008.80](https://doi.org/10.1109/MPRV.2008.80)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

## See Also
- [Overview](overview.md) · [Base Map Styles](base-map-styles.md) · [Vector Tiles and Raster Tiles](vector-and-raster-tiles.md) · [Tile Usage and Attribution](tile-usage-and-attribution.md) · [Web Mercator](web-mercator.md) · [Decision Guide](decision-guide.md)
