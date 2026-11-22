# Decision Guide

## Choosing a Tab of Google Photorealistic 3D Maps

| Question | Tab | Why |
|---|---|---|
| How tall are the buildings, and how do they stand together? | 3D View | Google's photorealistic 3D imagery seen at an angle ([Google (2026b)](#ref-Goo2026b)) |
| How do areas of my own compare in height, or in a value given as a height? | Your Features | Polygons raised to a column, among Google's buildings |
| Where across a place is a count or a measurement highest? | Values as Columns | A column for each cell of a grid |
| Where do flights, drones or cable cars pass, and how high? | Flights in 3D | Lines at the altitude of each point |

All four tabs share the Next Step Orbit the Place, which turns the camera once around the centre and keeps what the tab drew. Each of the three tabs with data has a Next Step that lists what it drew, from the tables its Example Code made.

## Google Photorealistic 3D Maps, Google Maps or the 3D Data of the Toolbox

Google Photorealistic 3D Maps and Google Maps show the same places: the first in 3D from a camera at an angle, the second from above, on road, satellite and terrain maps. The Google Maps Platform Terms of Service forbid measuring, tracing or saving Google's imagery and showing it beside a non-Google map ([Google (2026e)](#ref-Goo2026e)), so both panels serve for looking. Heights drawn in Your Features come from the data drawn, not from Google's imagery. Work that measures buildings, terrain or point clouds, or combines layers on one map, belongs to the open data panels of the toolbox, such as City Objects and 3D, Lidar and 3D Scans, and OpenStreetMap Base Map.

## How Many Map Loads Each Step of Google Photorealistic 3D Maps Uses

Each page of the panel opens one 3D map, which the Maps JavaScript API counts as one map load, however many shapes it draws ([Google (2026g)](#ref-Goo2026g)). Running a tab opens one map, and so does Orbit the Place; opening a page again in Pollis's browser loads its map again. Tallest Buildings, Places by Category and Flights Drawn open none, as they only read the tables of their tabs. The requests to Overture Maps and the OpenSky Network are not map loads: Overture's files are open, and the OpenSky Network counts its own credits for anonymous users ([The OpenSky Network (2026)](#ref-OSN2026a)).

## References

<a id="ref-Goo2026b"></a>Google (2026b). 3D Maps in Maps JavaScript. [developers.google.com/maps/documentation/javascript/3d/overview](https://developers.google.com/maps/documentation/javascript/3d/overview)

<a id="ref-Goo2026e"></a>Google (2026e). Google Maps Platform Terms of Service. [cloud.google.com/maps-platform/terms](https://cloud.google.com/maps-platform/terms)

<a id="ref-Goo2026g"></a>Google (2026g). Maps JavaScript API Usage and Billing. [developers.google.com/maps/documentation/javascript/usage-and-billing](https://developers.google.com/maps/documentation/javascript/usage-and-billing)

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

## See Also
- [Overview](overview.md) · [3D Features](features3d.md) · [3D Maps and the Camera](camera.md) · [Factsheet](factsheet.md)
