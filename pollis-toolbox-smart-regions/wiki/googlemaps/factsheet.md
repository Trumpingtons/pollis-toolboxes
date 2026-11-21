# Google Maps — Factsheet

The **Google Maps** panel of the Smart Regions Toolbox opens Google's maps of a place on pages of their own in Pollis's browser: a road map, a satellite map, a terrain map, or a 3D map seen from a camera that turns and tilts. The Maps JavaScript API of Google Maps Platform draws them, with the user's Maps Demo Key ([Google (2026a)](#ref-Goo2026a); [Google (2026b)](#ref-Goo2026b); [Google (2026c)](#ref-Goo2026c)). The Next Steps add the places of the example, or features of the user's own, on Google's Data layer. Three more tabs draw the user's own data in 3D on the 3D map: polygons raised to a height, a value on a grid of cells as columns, and lines at an altitude.

| Item | Google Maps panel |
|---|---|
| **Purpose** | Look at a place on Google's maps, from above or in 3D, and at data of one's own in 3D on them |
| **Input** | Sydney Harbour, Midtown Manhattan, or a place given by name, longitude and latitude |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| **Tabs** | Roadmap, Satellite, Terrain, 3D Map, Your Features, Values as Columns, Routes at Height |
| **Service** | The Maps JavaScript API, with a Maps Demo Key; for the examples of the 3D tabs, Overture Maps and the OpenSky Network |
| **Output** | A page in Pollis's browser with a Google map and the user's own features, and nothing else |
| **Key choices** | The place, the zoom or the camera, and the labels over the imagery |

## What Each Tab of the Google Maps Panel Opens

| Tab | Map | Inputs it reads |
|---|---|---|
| Roadmap | Google's road map, map type `roadmap` | Zoom |
| Satellite | Satellite and aerial images, map type `satellite`, or `hybrid` with labels | Zoom, Labels |
| Terrain | Relief with roads and names, map type `terrain` | Zoom |
| 3D Map | The element `gmp-map-3d`, in the mode `satellite`, or `hybrid` with labels | Range (m), Tilt (degrees), Heading (degrees), Labels |
| Your Features | The 3D map with polygons raised to the heights of a column: the buildings of Overture Maps | Range (m), Tilt (degrees), Heading (degrees), Labels, Radius (m) |
| Values as Columns | The 3D map with a column for each square cell of a grid: the places of Overture Maps counted | Range (m), Tilt (degrees), Heading (degrees), Labels, Radius (m), Cell Size (m), Tallest Column (m) |
| Routes at Height | The 3D map with lines at their altitudes: the tracks of aircraft from the OpenSky Network | Labels, Box Side (km), Aircraft, Curtain |

The Place input picks one of two example places, each with eight named places for the Next Steps, or Your Own Place, which shows the Place Name, Longitude and Latitude inputs. The 2D tabs centre the map on the place at the Zoom given; the 3D Map points its camera at the place from the Range, Tilt and Heading given, and so do Your Features and Values as Columns. Routes at Height sets its camera far enough back to see the whole box. The example data of the three 3D tabs come from Overture Maps and the OpenSky Network ([Overture Maps Foundation (2026)](#ref-OMF2026a); [The OpenSky Network (2026)](#ref-OSN2026a)), and the 3D Features wiki describes them.

## The Pages the Google Maps Panel Writes

The Example Code writes each map as an HTML page and opens it with `Pollis.browse`, so the page holds Google's map and the user's own features, and nothing else. `map2d(title, types; features, column, note)` writes a page with one 2D map, or two side by side that move together; `map3d(title; orbit, features, height, column, curtain, note)` writes a page with the 3D map and, when given a GeoJSON file, its features in 3D. A page is named after its title, so a map with the same title opens again in its tab. The page loads the Maps JavaScript API with the key in its address, as Google's documentation gives, so the pages are written in a temporary folder that Julia removes when it exits ([Google (2026a)](#ref-Goo2026a)). Each page also says in text, for screen readers, which map it shows and where it is centred, taken from the inputs alone.

## Next Steps of the Google Maps Panel

| Group | Next Step | Tabs | What it shows |
|---|---|---|---|
| Visualise | Every Map Type | 2D | The place in the four map types, a page each |
| Visualise | Features on the Map | 2D | The places of the query `places` on the Data layer |
| Visualise | Coloured by a Column | 2D | The area within 300 m of each place, coloured by Colour By |
| Visualise | Orbit the Place | 3D tabs | One turn of the camera around the centre, with what the tab drew |
| Diagnose | Layer Size | 2D | The features, vertices and kilobytes of the layer |
| Diagnose | Tallest Buildings | Your Features | The ten tallest buildings, and where their heights come from |
| Diagnose | Places by Category | Values as Columns | The categories with the most places, and the fullest cell |
| Diagnose | Flights Drawn | Routes at Height | Each aircraft with its waypoints and altitudes |
| Compare | Two Map Types Side by Side | 2D | Two map types on one page, moving together |

The places of the Next Steps come from the SQL query `places` of the Example Code, which reads them from a list of names and coordinates; replacing the list with `SELECT * FROM ST_Read('file.gpkg')` puts the features of a file of the user's own on the map ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Each map a page opens is one map load ([Google (2026g)](#ref-Goo2026g)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Goo2026a"></a>Google (2026a). Maps JavaScript API Documentation. [developers.google.com/maps/documentation/javascript](https://developers.google.com/maps/documentation/javascript)

<a id="ref-Goo2026b"></a>Google (2026b). 3D Maps in Maps JavaScript. [developers.google.com/maps/documentation/javascript/3d/overview](https://developers.google.com/maps/documentation/javascript/3d/overview)

<a id="ref-Goo2026c"></a>Google (2026c). Get a Maps Demo Key and Use It with Google Maps Platform. [developers.google.com/maps/demo-key](https://developers.google.com/maps/demo-key)

<a id="ref-Goo2026g"></a>Google (2026g). Maps JavaScript API Usage and Billing. [developers.google.com/maps/documentation/javascript/usage-and-billing](https://developers.google.com/maps/documentation/javascript/usage-and-billing)

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

## See Also
- [Overview](overview.md) · [The Demo Key](demo-key.md) · [Map Types](map-types.md) · [3D Maps and the Camera](map3d.md) · [3D Features](features3d.md) · [Terms of Use](terms.md)
