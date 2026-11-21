# Terms of Use

## Google's Maps Only with Google's Maps

The Google Maps Platform Terms of Service forbid using the Google Maps Core Services with or near a non-Google map in an application, to avoid quality issues and brand confusion ([Google (2026e)](#ref-Goo2026e)). Their examples are displaying Places content on a non-Google map, displaying Street View imagery and non-Google maps on the same screen, and linking a Google map to non-Google maps content or a non-Google map. The Google Maps panel follows this by opening each Google map on a page of its own, with no other map on it and no link from it to one. The OpenStreetMap base maps, Copernicus imagery and Mapillary viewers of the other panels of the Smart Regions Toolbox open on pages of their own. The user's own data, drawn on Google's Data layer, is not a map.

## No Scraping, Caching or Downloading of Google's Maps

The terms forbid exporting, extracting or scraping Google Maps Content for use outside the services ([Google (2026e)](#ref-Goo2026e)). Among their examples are pre-fetching, indexing, storing, resharing or rehosting the content, and bulk downloading Google's map tiles, Street View images, geocodes, directions and elevation values. Caching is forbidden except where the service specific terms allow it. The Google Maps panel saves nothing of Google's maps: its pages hold the code that asks the Maps JavaScript API for the map, and the browser loads the map from Google each time a page opens. Its Next Steps write only the user's own places and areas, as GeoJSON in temporary files.

## No Content Made from Google's Maps

The terms forbid creating content based on Google Maps Content ([Google (2026e)](#ref-Goo2026e)). Their examples include tracing or digitising roads, building outlines, utility posts or electrical lines from the satellite map type of the Maps JavaScript API, building terrain models from elevation values, and using Google Maps Content to improve machine learning and artificial intelligence models, including training, testing, validating or fine-tuning them. The text each page of the panel carries describes only what the inputs asked for, the place, the centre and the map type, and nothing that Google's map shows. Measurements, traced features and images for analysis belong to the open data of the toolbox's other panels.

## Attribution on Google's Maps

The terms require the attribution Google provides through the services to stay on the map, including its branding, logos and copyright and trademark notices, unmodified and unobscured ([Google (2026e)](#ref-Goo2026e)). The pages of the Google Maps panel add only two things to the map the Maps JavaScript API draws: the title, in a box at the top left of the page, and, in Coloured by a Column, a legend, which the page hands to the map as a custom control at the bottom left, so that the map places it among its own controls ([Google (2026a)](#ref-Goo2026a)). The map type and Street View controls are turned off, since the tab chooses the map type and the Maps Demo Key does not cover Street View ([Google (2026c)](#ref-Goo2026c)).

## The Terms of the Maps Demo Project

A Maps Demo Key belongs to a Maps Demo Project, which has terms of its own on top of the Google Maps Platform Terms of Service ([Google (2026f)](#ref-Goo2026f)). They limit the project to a subset of the APIs, let Google enforce, adjust or remove its usage limits without notice, and state that the project is intended solely for evaluation and testing, with production use strictly prohibited. Google may suspend or end access to the project at any time, and its creator is responsible for any activity under it, including that of anyone the creator lets use it. A Maps Demo Key is therefore the user's own, for trying the maps, and not one to share with others or to build a service on.

## References

<a id="ref-Goo2026a"></a>Google (2026a). Maps JavaScript API Documentation. [developers.google.com/maps/documentation/javascript](https://developers.google.com/maps/documentation/javascript)

<a id="ref-Goo2026c"></a>Google (2026c). Get a Maps Demo Key and Use It with Google Maps Platform. [developers.google.com/maps/demo-key](https://developers.google.com/maps/demo-key)

<a id="ref-Goo2026e"></a>Google (2026e). Google Maps Platform Terms of Service. [cloud.google.com/maps-platform/terms](https://cloud.google.com/maps-platform/terms)

<a id="ref-Goo2026f"></a>Google (2026f). Maps Demo Project Terms of Service. [cloud.google.com/terms/maps-platform/demo-project-terms](https://cloud.google.com/terms/maps-platform/demo-project-terms)

## See Also
- [The Demo Key](demo-key.md) · [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
