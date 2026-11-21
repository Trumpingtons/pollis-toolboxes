# Google Maps — Factsheet

The **Google Maps** panel of the Smart Regions Toolbox opens Google's maps of a place on pages of their own in Pollis's browser: a road map, a satellite map or a terrain map. The Maps JavaScript API of Google Maps Platform draws them, with the user's Maps Demo Key ([Google (2026a)](#ref-Goo2026a); [Google (2026c)](#ref-Goo2026c)). The Next Steps add the places of the example, or features of the user's own, on Google's Data layer.

| Item | Google Maps panel |
|---|---|
| **Purpose** | Look at a place on Google's maps, from above |
| **Input** | Sydney Harbour, Midtown Manhattan, or a place given by name, longitude and latitude |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| **Tabs** | Roadmap, Satellite, Terrain |
| **Service** | The Maps JavaScript API, with a Maps Demo Key |
| **Output** | A page in Pollis's browser with a Google map and nothing else |
| **Key choices** | The place, the zoom, and the labels over the imagery |

## What Each Tab of the Google Maps Panel Opens

| Tab | Map | Inputs it reads |
|---|---|---|
| Roadmap | Google's road map, map type `roadmap` | Zoom |
| Satellite | Satellite and aerial images, map type `satellite`, or `hybrid` with labels | Zoom, Labels |
| Terrain | Relief with roads and names, map type `terrain` | Zoom |

The Place input picks one of two example places, each with eight named places for the Next Steps, or Your Own Place, which shows the Place Name, Longitude and Latitude inputs. Each tab centres the map on the place at the Zoom given. Google's 3D map of a place is in the panel Google Photorealistic 3D Maps.

## The Pages the Google Maps Panel Writes

The Example Code writes each map as an HTML page and opens it with `Pollis.browse`, so the page holds Google's map and the user's own features, and nothing else. `map2d(title, types; features, column, note)` writes a page with one 2D map, or two side by side that move together. A page is named after its title, so a map with the same title opens again in its tab. The page loads the Maps JavaScript API with the key in its address, as Google's documentation gives, so the pages are written in a temporary folder that Julia removes when it exits ([Google (2026a)](#ref-Goo2026a)). Each page also says in text, for screen readers, which map it shows and where it is centred, taken from the inputs alone.

## Next Steps of the Google Maps Panel

| Group | Next Step | Tabs | What it shows |
|---|---|---|---|
| Visualise | Every Map Type | All | The place in the four map types, a page each |
| Visualise | Features on the Map | All | The places of the query `places` on the Data layer |
| Visualise | Coloured by a Column | All | The area within 300 m of each place, coloured by Colour By |
| Diagnose | Layer Size | All | The features, vertices and kilobytes of the layer |
| Compare | Two Map Types Side by Side | All | Two map types on one page, moving together |

The places of the Next Steps come from the SQL query `places` of the Example Code, which reads them from a list of names and coordinates; replacing the list with `SELECT * FROM ST_Read('file.gpkg')` puts the features of a file of the user's own on the map ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Each map a page opens is one map load ([Google (2026g)](#ref-Goo2026g)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Goo2026a"></a>Google (2026a). Maps JavaScript API Documentation. [developers.google.com/maps/documentation/javascript](https://developers.google.com/maps/documentation/javascript)

<a id="ref-Goo2026c"></a>Google (2026c). Get a Maps Demo Key and Use It with Google Maps Platform. [developers.google.com/maps/demo-key](https://developers.google.com/maps/demo-key)

<a id="ref-Goo2026g"></a>Google (2026g). Maps JavaScript API Usage and Billing. [developers.google.com/maps/documentation/javascript/usage-and-billing](https://developers.google.com/maps/documentation/javascript/usage-and-billing)

## See Also
- [Overview](overview.md) · [The Demo Key](demo-key.md) · [Map Types](map-types.md) · [Terms of Use](terms.md)
