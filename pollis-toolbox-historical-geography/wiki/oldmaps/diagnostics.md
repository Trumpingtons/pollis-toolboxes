# Historical Maps — Diagnostics

The Diagnose actions of the Historical Maps panel, Zooms of the Maps and Missing Titles and Years, check what a map can show before it is read: whether its tiles reach the zoom asked for, and whether the maps found have a title and a year.

## Why Does an Old Map of France Look Blurred at a High Zoom?

Each map of France that IGN serves has tiles from a first to a last zoom. Beyond its last zoom the Maps of France tab of the Historical Maps panel enlarges the tiles of the last zoom, which shows no more detail: the map of Cassini has tiles to zoom 14, the map of the état-major to zoom 15, the aerial photographs since 1950 to zoom 18 ([Institut national de l'information géographique et forestière (2026)](#ref-IGN2026a)). Below its first zoom a map is not drawn. Zooms of the Maps lists the zooms of every map, and says when Zoom lies outside those of Old Map.

## Why Is Part of an Old Map of France Missing?

An old map of France in the Maps of France tab of the Historical Maps panel covers only what its sheets covered. The map of Cassini shows France within its borders of the time, without Nice, Savoy and Corsica, and has gaps where sheets were lost or damaged ([Archives nationales and Institut national de l'information géographique et forestière (2025)](#ref-ANIGN2025a)). The map of the état-major of the surroundings of Paris covers only those surroundings. Where the old map has no tiles, the base map shows through on the left of the line.

## Why Do Some Maps of Georeferenced Maps Have No Title or No Year?

The title and year of a map in the Georeferenced Maps tab of the Historical Maps panel come from its IIIF manifest. A map whose image belongs to no manifest in Allmaps has no title, and a manifest with neither a `navDate` nor a metadata entry named as a date gives no year; a manifest whose server refuses the request gives none either ([Appleby, Crane, Sanderson, Stroop and Warner (2020)](#ref-ACSSW2020a)). Missing Titles and Years counts them library by library. The maps without a year come last in the list, and Map Outlines draws them in grey.

## Why Is the Year of a Map of Georeferenced Maps Sometimes Later Than the Map?

The Georeferenced Maps tab of the Historical Maps panel takes the first year it finds in the manifest: the year of `navDate`, or the first year in a metadata entry whose label names a date. Metadata are for display, with no meaning defined for machines, so an entry named Date may give the year the map was digitised rather than drawn ([Appleby, Crane, Sanderson, Stroop and Warner (2020)](#ref-ACSSW2020a)). Check the year of a map against its title, or against the page of its manifest, before reading the map as of that year.

## How Exact Is the Region of a Famous Map?

The region of a famous map in the Famous Maps tab of the Historical Maps panel is a box of longitudes and latitudes around what the map shows, to open today's map on it. The box is not a georeference, which would tie points of the image to coordinates with ground control points: none of the famous maps has them, and the image is not laid on today's map ([International Image Interoperability Framework Consortium (2023)](#ref-IIIFC2023a)). Today's map is drawn north up, whatever the orientation of the old map, so the two are read side by side rather than point by point.

## References

<a id="ref-ACSSW2020a"></a>Appleby, M., Crane, T., Sanderson, R., Stroop, J. and Warner, S. (2020). IIIF Presentation API 3.0. IIIF Consortium. [iiif.io/api/presentation/3.0](https://iiif.io/api/presentation/3.0/)

<a id="ref-ANIGN2025a"></a>Archives nationales and Institut national de l'information géographique et forestière (2025). Carte de Cassini – exemplaire du Roi. Dataset, Licence Ouverte / Open License. [cartes.gouv.fr](https://cartes.gouv.fr/rechercher-une-donnee/dataset/ARCHIVES-NATIONALES_CASSINI-ROI)

<a id="ref-IGN2026a"></a>Institut national de l'information géographique et forestière (2026). API Géoplateforme – Diffusion d'images tuilées WMTS. [data.geopf.fr/wmts](https://data.geopf.fr/wmts?SERVICE=WMTS&REQUEST=GetCapabilities)

<a id="ref-IIIFC2023a"></a>International Image Interoperability Framework Consortium (2023). Georeference Extension. [iiif.io/api/extension/georef](https://iiif.io/api/extension/georef/)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Maps of France](maps-of-france.md) · [Georeferenced Maps](georeferenced-maps.md) · [Famous Maps](famous-maps.md)
