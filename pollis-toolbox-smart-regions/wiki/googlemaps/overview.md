# Google Maps — Overview

## Google's Maps of a Place in Pollis

Google Maps Platform publishes the maps of Google Maps for other applications to show, through the Maps JavaScript API, a library that a web page loads with an API key ([Google (2026a)](#ref-Goo2026a)). The Google Maps panel of the Smart Regions Toolbox uses it to show a place on Google's road, satellite and terrain maps, and in 3D. Each map opens on a page of its own in Pollis's browser, which the Julia code of the panel writes: Pollis adds nothing to the map but the title, and, in the Next Steps, the user's own features. The user zooms, pans and clicks on the page as on any Google map, and the code can open several maps of the same place, each in its tab.

## What the Maps JavaScript API Draws

A 2D map of the Maps JavaScript API has a map type, which decides what the map shows: streets and places, satellite and aerial images, the same images with labels, or relief ([Google (2026a)](#ref-Goo2026a)). Its Data layer draws points, lines and polygons given as GeoJSON over the map, with colours that can follow the properties of each feature, and reports clicks on them. The 3D map is a separate element, `gmp-map-3d`, which renders photorealistic 3D imagery of cities, terrain and landmarks in its satellite and hybrid modes, and is seen from a camera with a range, a tilt and a heading ([Google (2026b)](#ref-Goo2026b)). The camera can fly to another view or orbit a centre.

## What the Maps Demo Key Allows

The panel needs a Maps Demo Key, a key Google gives at no cost, without billing information, for prototyping with Google Maps Platform ([Google (2026c)](#ref-Goo2026c)). It covers a limited set of features, among them 2D and 3D maps with satellite and terrain views in the Maps JavaScript API, markers and events, and drawing on the map. Street View is not among them, and the panel does not show it. Usage is limited each day, and Google states that the key is for testing and prototyping, not for production use. The Demo Key wiki gives the details: who can get one, the daily limit, and where Pollis keeps it.

## Google Maps Beside the Other Maps of the Smart Regions Toolbox

The Google Maps Platform Terms of Service forbid using Google's maps with or near a non-Google map in an application ([Google (2026e)](#ref-Goo2026e)). The panel therefore never draws a Google map on the same page as the OpenStreetMap base maps, the Copernicus imagery or Mapillary's coverage of the other panels, and never links a Google map to them: each Google map has its page. The terms also forbid caching Google's maps and creating content from them, such as tracing buildings from satellite images. For work that measures, traces or saves, the toolbox's OpenStreetMap Base Maps, Copernicus Imagery Layers and file panels serve; Google Maps serves for looking.

## References

<a id="ref-Goo2026a"></a>Google (2026a). Maps JavaScript API Documentation. [developers.google.com/maps/documentation/javascript](https://developers.google.com/maps/documentation/javascript)

<a id="ref-Goo2026b"></a>Google (2026b). 3D Maps in Maps JavaScript. [developers.google.com/maps/documentation/javascript/3d/overview](https://developers.google.com/maps/documentation/javascript/3d/overview)

<a id="ref-Goo2026c"></a>Google (2026c). Get a Maps Demo Key and Use It with Google Maps Platform. [developers.google.com/maps/demo-key](https://developers.google.com/maps/demo-key)

<a id="ref-Goo2026e"></a>Google (2026e). Google Maps Platform Terms of Service. [cloud.google.com/maps-platform/terms](https://cloud.google.com/maps-platform/terms)

## See Also
- [Factsheet](factsheet.md) · [Terms of Use](terms.md) · [The Demo Key](demo-key.md) · [Decision Guide](decision-guide.md)
