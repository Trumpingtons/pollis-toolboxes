# 3D Maps and the Camera

## The 3D Map Element of the Maps JavaScript API

The 3D Map tab of the Google Maps panel shows Google's 3D map with the element `gmp-map-3d`, the Map3DElement of the library `maps3d` of the Maps JavaScript API ([Google (2026b)](#ref-Goo2026b)). It renders photorealistic 3D aerial imagery of cities, terrain and landmarks, in which buildings stand at their heights and the land has its relief. Unlike a 2D map, which looks straight down at a zoom level, the 3D map is seen from a camera placed in space, so the same place can be looked at from any side and at any angle. The page of the tab loads the API with the library `maps3d` and sets the element's attributes from the inputs.

## The Camera of the 3D Map: Centre, Range, Tilt and Heading

| Attribute | Input of the 3D Map tab | Meaning |
|---|---|---|
| `center` | The place | The latitude, longitude and altitude in metres of the point the camera looks at |
| `range` | Range (m) | The distance from the camera to the centre, in metres |
| `tilt` | Tilt (degrees) | The angle of the camera's view from straight down: 0 looks straight down |
| `heading` | Heading (degrees) | The compass direction of the view, with north at 0 |

The camera's own position follows from the centre, range, tilt and heading ([Google (2026b)](#ref-Goo2026b)). A small range with a large tilt looks along the streets at the buildings; a large range with a small tilt looks down on a whole district. The page sets the altitude of the centre to 0 metres above mean sea level.

## The Modes of the 3D Map

The element `gmp-map-3d` must be given a mode for the map to start rendering ([Google (2026b)](#ref-Goo2026b)). The SATELLITE mode shows satellite or photorealistic imagery where it is available, and the HYBRID mode adds a transparent layer of major streets and labels over it; a ROADMAP mode shows a styled 3D base map. The Labels input of the 3D Map tab chooses between the satellite and hybrid modes. The map mode control on the map switches between the road map and the photorealistic modes, so the user can change the mode on the page. Photorealistic imagery covers some places only: elsewhere the map shows what Google has for the place.

## Moving the Camera of the 3D Map

The 3D map carries exploration controls by default ([Google (2026b)](#ref-Goo2026b)). The zoom buttons, plus and minus, move the camera closer or farther; the move control's arrows shift the centre; the rotate controls change the heading; the tilt control changes the tilt; and the compass shows where north lies and turns the camera back to a northerly heading. Keyboard shortcuts for moving around the map remain when the controls are hidden. The element also has methods that move the camera along preset paths: `flyCameraTo` moves it to another view in a curve, and `flyCameraAround` orbits it around a centre.

## Orbiting the Place

Orbit the Place opens the 3D map and calls `flyCameraAround`, which turns the camera clockwise around the centre while the centre stays in the middle of the view ([Google (2026b)](#ref-Goo2026b)). The page passes the centre, the Range, Tilt and Heading of the inputs, a duration of 60,000 milliseconds for one turn, and a repeat count of 1, so the camera goes once around the place in a minute and stops. The method starts the animation only once the map has loaded enough, and the heading of the map changes as the camera goes round. A repeat count of `Number.Infinity` would turn it for as long as the page is open.

## References

<a id="ref-Goo2026b"></a>Google (2026b). 3D Maps in Maps JavaScript. [developers.google.com/maps/documentation/javascript/3d/overview](https://developers.google.com/maps/documentation/javascript/3d/overview)

## See Also
- [Map Types](map-types.md) · [Factsheet](factsheet.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
