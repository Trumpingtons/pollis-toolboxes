# 3D Features

## Drawing Your Own Data in 3D on Google's 3D Map

The 3D map of the Maps JavaScript API draws shapes of the page's own among Google's photorealistic buildings and terrain: 3D polygons, 3D polylines and 3D markers, the elements `Polygon3DElement`, `Polyline3DElement` and `Marker3DElement` of the library `maps3d` ([Google (2026b)](#ref-Goo2026b)). Their interactive versions also report a click. The Maps Demo Key covers 2D and 3D maps, markers and events, and drawing shapes and polylines, so the three tabs Your Features, Values as Columns and Routes at Height need no other key than 3D View ([Google (2026c)](#ref-Goo2026c)). The Julia code of each tab writes the user's data as a GeoJSON file, and `map3d(title; features, height, column, curtain, note)` puts it into the page: polygons become 3D polygons, lines 3D polylines and points 3D markers, coloured by the column `column`. A click on a shape opens a popover with its columns.

## Altitude Modes of the 3D Shapes

Each 3D shape has an altitude mode, which says how the altitude of its coordinates is read ([Google (2026b)](#ref-Goo2026b)):

| Altitude mode | The altitude of a point is | Used by Google Photorealistic 3D Maps for |
|---|---|---|
| `CLAMP_TO_GROUND` | Ignored: the shape lies on the ground | Points without an altitude |
| `RELATIVE_TO_GROUND` | Metres above the ground under it | Polygons of Your Features and Values as Columns |
| `ABSOLUTE` | Metres above mean sea level | Lines and points of Routes at Height |
| `RELATIVE_TO_MESH` | Metres above the highest of ground, buildings and water | Not used |

A shape is extruded, joined to the ground by walls, only in the modes `RELATIVE_TO_GROUND` and `ABSOLUTE`. An extruded polygon is a block as tall as its altitude; an extruded line hangs a curtain down to the ground.

## Your Features: Polygons Raised to a Height

The Your Features tab raises each polygon of a GeoJSON file to the height of the column `height`, in metres above the ground, and colours it by the same column. The example reads the buildings of Overture Maps whose centres lie within Radius (m) of the centre of the place, with Overture's `height` where it is known, or three metres for each floor of `num_floors` where only the floors are ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Buildings with neither are left out. With Sydney Harbour as the place, the tab is centred on Sydney's central business district around Martin Place, where more buildings have a height than by the harbour. Any table of polygons with a column of heights takes the place of the buildings: plots raised by their floor area ratio, zones by a population, or a 3D city model's footprints by their measured heights. Tallest Buildings lists the ten tallest and how many heights were given, taken from the floors or unknown.

## Values as Columns: a Value on a Grid of Square Cells

The Values as Columns tab counts points in the square cells of a grid and draws each cell as a column as tall as its count. The example counts the places of Overture Maps, its points of interest such as shops, restaurants and offices, within Radius (m) of the centre ([Overture Maps Foundation (2026)](#ref-OMF2026a)). The grid is laid out in metres in the UTM zone of the place, with cells of Cell Size (m), and each cell is drawn two metres inside its edges so that the columns stand apart. The column of the fullest cell is Tallest Column (m) high and the others are in proportion, since a count has no height of its own. Any value measured at points, such as the readings of sensors or the sales of shops, can take the place of the count by summing or averaging it in each cell. Places by Category lists the categories with the most places and the size of the fullest and the median cell.

## Routes at Height: Lines at an Altitude

The Routes at Height tab draws lines whose points each carry an altitude above sea level, as a third coordinate of GeoJSON. The example asks the REST API of the OpenSky Network, without an account, for the aircraft over a square of Box Side (km) around the place, keeps those flying above 1,000 metres, and asks for the track of the flight each of the nearest is on, up to Aircraft of them ([The OpenSky Network (2026)](#ref-OSN2026a)). The waypoints inside the square become one line for each aircraft, at their barometric altitudes in metres, none below sea level, coloured by the highest; a marker labelled with the callsign shows where each aircraft is now. With Curtain to the Ground, each line hangs a curtain to the ground, which shows its height over the land. The OpenSky Network collects the positions that aircraft broadcast by ADS-B with receivers run by volunteers ([Schäfer, Strohmeier, Lenders, Martinovic and Wilhelm (2014)](#ref-SSLMW2014a)). Flights Drawn lists each aircraft with its waypoints and altitudes.

## Limits of the Example Data of the 3D Tabs

Overture Maps publishes a release every month and keeps each for about two months; the code always reads the newest, so the buildings and places it draws change from release to release ([Overture Maps Foundation (2026)](#ref-OMF2026a)). The heights of Overture's buildings come from its sources and are missing or rough in many places. The OpenSky Network gives an anonymous user only the most recent positions and the track of a flight in progress, within a daily allowance of credits; when the credits are spent, it answers HTTP 429, and the code stops with a message ([The OpenSky Network (2026)](#ref-OSN2026a)). Where no aircraft flies near the place, or where no receiver covers it, the tab finds none. A track may have few waypoints, and its altitudes near an airport may differ from the ground of Google's 3D map by some metres.

## References

<a id="ref-Goo2026b"></a>Google (2026b). 3D Maps in Maps JavaScript. [developers.google.com/maps/documentation/javascript/3d/overview](https://developers.google.com/maps/documentation/javascript/3d/overview)

<a id="ref-Goo2026c"></a>Google (2026c). Get a Maps Demo Key and Use It with Google Maps Platform. [developers.google.com/maps/demo-key](https://developers.google.com/maps/demo-key)

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

<a id="ref-SSLMW2014a"></a>Schäfer, M., Strohmeier, M., Lenders, V., Martinovic, I. and Wilhelm, M. (2014). Bringing up OpenSky: a large-scale ADS-B sensor network for research. In *IPSN-14 Proceedings of the 13th International Symposium on Information Processing in Sensor Networks* (pp. 83–94). [doi:10.1109/IPSN.2014.6846743](https://doi.org/10.1109/IPSN.2014.6846743)

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

## See Also
- [3D Maps and the Camera](camera.md) · [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
