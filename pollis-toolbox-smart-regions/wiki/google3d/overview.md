# Google Photorealistic 3D Maps — Overview

## Google's Photorealistic 3D Map of a Place in Pollis

Google's 3D maps in the Maps JavaScript API render photorealistic 3D imagery of cities, terrain and landmarks, in which buildings stand at their heights and the land has its relief ([Google (2026b)](#ref-Goo2026b)). The Google Photorealistic 3D Maps panel of the Smart Regions Toolbox opens that map of a place on a page of its own in Pollis's browser, written by the Julia code of the panel. The map is seen from a camera with a range, a tilt and a heading, which the user turns and tilts with the controls on the page, and which the Next Step Orbit the Place sends once around the place. The panel sits beside Google Maps, which shows the same places on Google's road, satellite and terrain maps from above.

## Data of One's Own in 3D Among Google's Buildings

Three tabs of Google Photorealistic 3D Maps put data of the user's own on the 3D map, as 3D polygons, polylines and markers of the library `maps3d` ([Google (2026b)](#ref-Goo2026b)). Your Features raises polygons to the heights of a column, Values as Columns draws a value on a grid of square cells as columns, and Flights in 3D draws lines at the altitude of each point, above sea level. The examples read the buildings and places of Overture Maps around the place, and the tracks of the aircraft flying near it now from the OpenSky Network ([Overture Maps Foundation (2026)](#ref-OMF2026a); [The OpenSky Network (2026)](#ref-OSN2026a)). Each tab writes its data as GeoJSON, so any table of DuckDB with a geometry can take the place of the example.

## The Key and the Terms of Google Photorealistic 3D Maps

The panel uses the Maps Demo Key, which covers the 2D and 3D maps of the Maps JavaScript API, markers and events, and drawing shapes and polylines, without billing information ([Google (2026c)](#ref-Goo2026c)). It is the key of Google Maps, kept once by Pollis for both panels. Google's photorealistic 3D imagery is also sold as a separate product, the Photorealistic 3D Tiles of the Map Tiles API, which a Maps Demo Key does not cover ([Google (2026c)](#ref-Goo2026c)); the panel does not use it. The Google Maps Platform Terms of Service apply to the 3D map as to Google's other maps: it opens on pages of its own, beside no other base map, and nothing is measured, traced or saved from its imagery ([Google (2026e)](#ref-Goo2026e)).

## References

<a id="ref-Goo2026b"></a>Google (2026b). 3D Maps in Maps JavaScript. [developers.google.com/maps/documentation/javascript/3d/overview](https://developers.google.com/maps/documentation/javascript/3d/overview)

<a id="ref-Goo2026c"></a>Google (2026c). Get a Maps Demo Key and Use It with Google Maps Platform. [developers.google.com/maps/demo-key](https://developers.google.com/maps/demo-key)

<a id="ref-Goo2026e"></a>Google (2026e). Google Maps Platform Terms of Service. [cloud.google.com/maps-platform/terms](https://cloud.google.com/maps-platform/terms)

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

## See Also
- [Factsheet](factsheet.md) · [3D Maps and the Camera](camera.md) · [3D Features](features3d.md) · [Decision Guide](decision-guide.md)
