# Decision Guide

## Choosing a Tab of the Google Maps Panel

| Question | Tab | Why |
|---|---|---|
| Where is it, and what is around it? | Roadmap | Streets, transit and the names of places ([Google (2026a)](#ref-Goo2026a)) |
| What does the ground look like? | Satellite | Aerial imagery: roofs, green space, water |
| Where are the streets on the imagery? | Satellite, With Labels | The hybrid map: imagery with labels |
| How does the land rise and fall? | Terrain | A physical map from terrain information |

The three tabs share their Next Steps: features on the Data layer, a colour by column, a size check, and two map types side by side. A first look at an unfamiliar place usually starts with Every Map Type, which opens all four 2D maps of it at once. For the heights of buildings and the shape of the land seen at an angle, Google Photorealistic 3D Maps shows Google's photorealistic 3D imagery of the place, on pages of its own.

## Google Maps, OpenStreetMap Base Maps or Copernicus Imagery Layers

The three panels of Maps and Layers that show base maps serve different work. The Google Maps Platform Terms of Service forbid caching, scraping and downloading Google's maps, creating content from them, such as traced buildings or roads, and using them with or near a non-Google map ([Google (2026e)](#ref-Goo2026e)). The Google Maps panel therefore serves for looking at a place, on its own pages. OpenStreetMap Base Maps draws open map data that can be combined with other layers on one map, and Copernicus Imagery Layers draws open satellite products whose values the toolbox's Next Steps read. Work that measures, traces, combines layers or saves images belongs to those panels and to the files of the toolbox.

## The Maps Demo Key or a Standard Key

The Maps Demo Key is meant for evaluation and testing, and its terms strictly prohibit production use ([Google (2026f)](#ref-Goo2026f)). It suits trying Google's maps of a place in Pollis, within its daily limit of 100 calls per API ([Google (2026d)](#ref-Goo2026d)). A map that goes into a published work, a service others use, or daily work beyond that limit needs a standard API key on a project with billing, which Google charges by map loads ([Google (2026g)](#ref-Goo2026g)). Either key goes into the same place in Pollis, the key on the Powered by line, and the panel works the same with both. The Demo Key wiki describes how to move from one to the other.

## How Many Map Loads Each Step Uses

Each map that a page of the Google Maps panel opens is one map load of the Maps JavaScript API ([Google (2026g)](#ref-Goo2026g)). Running a tab opens one map, and opening its page again in Pollis's browser loads the map again. Features on the Map and Coloured by a Column open one map each. Every Map Type opens four, one for each map type, and Two Map Types Side by Side opens two on one page. Layer Size opens none, as it only reads the query `places`. Within the Demo Key's daily limit, the tabs and single-map steps leave room for many looks at a place in a day.

## References

<a id="ref-Goo2026a"></a>Google (2026a). Maps JavaScript API Documentation. [developers.google.com/maps/documentation/javascript](https://developers.google.com/maps/documentation/javascript)

<a id="ref-Goo2026d"></a>Google (2026d). Google Maps Platform in AI Studio. [developers.google.com/maps/ai/ai-studio](https://developers.google.com/maps/ai/ai-studio)

<a id="ref-Goo2026e"></a>Google (2026e). Google Maps Platform Terms of Service. [cloud.google.com/maps-platform/terms](https://cloud.google.com/maps-platform/terms)

<a id="ref-Goo2026f"></a>Google (2026f). Maps Demo Project Terms of Service. [cloud.google.com/terms/maps-platform/demo-project-terms](https://cloud.google.com/terms/maps-platform/demo-project-terms)

<a id="ref-Goo2026g"></a>Google (2026g). Maps JavaScript API Usage and Billing. [developers.google.com/maps/documentation/javascript/usage-and-billing](https://developers.google.com/maps/documentation/javascript/usage-and-billing)

## See Also
- [Overview](overview.md) · [Terms of Use](terms.md) · [The Demo Key](demo-key.md) · [Map Types](map-types.md)
