# Google Photorealistic 3D Maps — Factsheet

The **Google Photorealistic 3D Maps** panel of the Smart Regions Toolbox opens Google's photorealistic 3D map of a place on a page of its own in Pollis's browser, seen from a camera that turns, tilts and orbits, and draws data of the user's own in 3D on it. The Maps JavaScript API draws the map and the shapes, with the user's Maps Demo Key, the same key as the Google Maps panel ([Google (2026b)](#ref-Goo2026b); [Google (2026c)](#ref-Goo2026c)).

| Item | Google Photorealistic 3D Maps panel |
|---|---|
| **Purpose** | Look at a place in 3D, and at data of one's own in 3D on it |
| **Input** | Sydney Harbour, Midtown Manhattan, or a place given by name, longitude and latitude |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl) |
| **Tabs** | 3D View, Your Features, Values as Columns, Routes at Height |
| **Service** | The Maps JavaScript API with a Maps Demo Key; Overture Maps and the OpenSky Network for the example data |
| **Output** | A page in Pollis's browser with Google's 3D map and the user's shapes, and nothing else |
| **Key choices** | The place, the camera, the labels, and the data drawn |

## What Each Tab of Google Photorealistic 3D Maps Draws

| Tab | Drawn on the 3D map | Inputs it reads |
|---|---|---|
| 3D View | Nothing: Google's buildings and landscape alone | Range (m), Tilt (degrees), Heading (degrees), Labels |
| Your Features | Polygons raised to the heights of a column: the buildings of Overture Maps | Range (m), Tilt (degrees), Heading (degrees), Labels, Radius (m) |
| Values as Columns | A column for each square cell of a grid: the places of Overture Maps counted | Range (m), Tilt (degrees), Heading (degrees), Labels, Radius (m), Cell Size (m), Tallest Column (m) |
| Routes at Height | Lines at their altitudes: the tracks of aircraft from the OpenSky Network | Labels, Box Side (km), Aircraft, Curtain |

The example data come from Overture Maps and the OpenSky Network ([Overture Maps Foundation (2026)](#ref-OMF2026a); [The OpenSky Network (2026)](#ref-OSN2026a)); the 3D Features wiki describes them and how to put a table of one's own in their place.

## The Pages Google Photorealistic 3D Maps Writes

The Example Code writes each map as an HTML page and opens it with `Pollis.browse`. `map3d(title; orbit, features, height, column, curtain, note)` writes the page: the element `gmp-map-3d` with the camera of the tab, and, when given a GeoJSON file, its polygons, lines and points as the 3D shapes of the library `maps3d`, coloured by `column`, with a legend and a popover of the columns on a click. The key is in the address of the API on the page, so the pages go to a temporary folder that Julia removes when it exits. A hidden text on each page says what the map shows, for screen readers.

## Next Steps of Google Photorealistic 3D Maps

| Group | Next Step | Tabs | What it shows |
|---|---|---|---|
| Visualise | Orbit the Place | All | One turn of the camera around the centre, with what the tab drew |
| Diagnose | Tallest Buildings | Your Features | The ten tallest buildings, and where their heights come from |
| Diagnose | Places by Category | Values as Columns | The categories with the most places, and the fullest cell |
| Diagnose | Flights Drawn | Routes at Height | Each aircraft with its waypoints and altitudes |

## References

<a id="ref-Goo2026b"></a>Google (2026b). 3D Maps in Maps JavaScript. [developers.google.com/maps/documentation/javascript/3d/overview](https://developers.google.com/maps/documentation/javascript/3d/overview)

<a id="ref-Goo2026c"></a>Google (2026c). Get a Maps Demo Key and Use It with Google Maps Platform. [developers.google.com/maps/demo-key](https://developers.google.com/maps/demo-key)

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

## See Also
- [Overview](overview.md) · [3D Maps and the Camera](camera.md) · [3D Features](features3d.md) · [Decision Guide](decision-guide.md)
