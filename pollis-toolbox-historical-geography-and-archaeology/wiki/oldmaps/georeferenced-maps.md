# Old Maps — Georeferenced Maps

Georeferenced Maps is the tab of the Old Maps panel that finds the old maps of a place among the maps that Allmaps holds georeferenced, and draws one of them, warped onto today's coordinates, beside today's map ([Allmaps (2026)](#ref-All2026a)).

## What Is Allmaps?

Allmaps is a set of open-source tools for curating, georeferencing and exploring the digitized maps that libraries, archives and museums share through IIIF. With Allmaps Editor any map from an institution that supports IIIF can be georeferenced, and its ground control points and mask are saved as a Georeference Annotation. The Allmaps API lists the georeferenced maps that cover a point or a box, and the Allmaps Tile Server warps each map onto web map tiles ([Allmaps (2026)](#ref-All2026a)). A Georeference Annotation ties pixels of the image to longitude and latitude with ground control points, and may name the transformation, such as a polynomial, that maps every pixel ([International Image Interoperability Framework Consortium (2023)](#ref-IIIFC2023a)).

## How Does the Georeferenced Maps Tab Find the Maps of a Place?

The Georeferenced Maps tab of the Old Maps panel asks the Allmaps API, through `allmaps` of HistoricalGeography.jl, for the georeferenced maps that cover the Place, at most 100, each with the outline of its mask and its area. Largest keeps the maps that cover at most that many km²: maps of a region, a country or a continent also cover the Place, and Largest leaves them out ([Allmaps (2026)](#ref-All2026a)). The list runs from the oldest map with a year, and Map Number chooses the map drawn on the left of the line. The tab writes the list to the Folder and the table `maps`.

## Where Do the Titles and Years of Georeferenced Maps Come From?

The title of a map in the Georeferenced Maps tab is the label of the IIIF manifest the map belongs to: the short text a person reads to tell one object from another ([Appleby, Crane, Sanderson, Stroop and Warner (2020)](#ref-ACSSW2020a)). A map in several manifests takes the label least shared with the other maps found. The year is read from the manifest, once, into the Folder: the year of its `navDate`, a date for navigation in a timeline, or else the first year in a metadata entry whose label names a date. Metadata are for display, with no defined meaning, so the year found is the one the manifest gives, which may not be the year of the map itself. A manifest without a date, or one that cannot be read, leaves the year missing.

## How Is a Map of Allmaps Drawn on Today's Map?

The Georeferenced Maps tab of the Old Maps panel draws a map from the Allmaps Tile Server, which warps the image, through its ground control points, onto the tiles of a web map, and leaves the area outside the mask transparent ([Allmaps (2026)](#ref-All2026a)). The tiles are made on request, so the first view of a map can be slow. Map Outlines draws the outline of every map found, coloured by year, and the page of a map in Allmaps Editor, printed by the Example Code, shows its ground control points.

## References

<a id="ref-All2026a"></a>Allmaps (2026). Allmaps: curating, georeferencing and exploring IIIF maps. [allmaps.org](https://allmaps.org)

<a id="ref-ACSSW2020a"></a>Appleby, M., Crane, T., Sanderson, R., Stroop, J. and Warner, S. (2020). IIIF Presentation API 3.0. IIIF Consortium. [iiif.io/api/presentation/3.0](https://iiif.io/api/presentation/3.0/)

<a id="ref-IIIFC2023a"></a>International Image Interoperability Framework Consortium (2023). Georeference Extension. [iiif.io/api/extension/georef](https://iiif.io/api/extension/georef/)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Maps of France](maps-of-france.md) · [Famous Maps](famous-maps.md)
