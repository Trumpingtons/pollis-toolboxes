# Sources and Licences

## The Sources Column

Every Overture feature has a column sources, a list of the datasets it comes from: for each, the dataset, its licence, the record's identifier in it, when it was updated, and the property it gave ([Overture Maps Foundation (2026)](#ref-OMF2026a)). A source whose property is empty gave the feature itself; a source with a property such as /properties/confidence gave only that property. The Overture Maps panel takes the source of the feature itself as its main dataset and licence, and keeps the full list in the table `features`.

## Licences by Theme

The licence of Overture data depends on the theme ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Buildings, transportation, divisions and the base theme contain OpenStreetMap data and are under the Open Database License (ODbL), which asks for the attribution © OpenStreetMap contributors and carries share-alike obligations. Places contain no OpenStreetMap data: most of their sources, Meta and Microsoft among them, are under CDLA Permissive 2.0, Foursquare's under Apache 2.0 and AllThePlaces' under CC0. Addresses come from address registers and other sources under permissive open licences, some with their own terms or attribution.

## Attribution

Overture suggests citing its data as Overture Maps Foundation, overturemaps.org, with the date the data were accessed, and asks users to meet the attribution requirements of the upstream sources ([Overture Maps Foundation (2026)](#ref-OMF2026a)). For data that are wholly or partly from OpenStreetMap, Overture itself writes © OpenStreetMap contributors, Overture Maps Foundation. Sources and Licences in the Overture Maps panel lists the datasets and licences of the features read, so the attributions they need can be found.

## Sources of Places

Overture's places come from Meta, Microsoft, Foursquare, AllThePlaces, BrightQuery, PinMeTo, Uberall and other providers, conflated by Overture, which matches records that describe the same place ([Overture Maps Foundation (2026)](#ref-OMF2026a)). The providers' records differ in the properties they give, such as websites, phones and operating status, and their confidence scores are not calibrated to be comparable. Sources Side by Side in the Places tab shows, for each provider, its places in the area, their mean confidence and the share with a website and a phone.

## Sources of Buildings and Roads

OpenStreetMap is the primary source of Overture's buildings, with the highest priority in conflation, so that community knowledge and manual edits are preferred; Esri Community Maps, national and municipal data, and machine-learned footprints from Microsoft and Google fill in ([Overture Maps Foundation (2026)](#ref-OMF2026a)). The transportation theme is built from OpenStreetMap and enhanced with data from TomTom and other authoritative sources. Sources Side by Side in the Buildings and Transportation tabs compares what each source gives in an area: median footprint, height and floors for buildings, kilometres and names for segments.

## References

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

## See Also
- [Overture and OpenStreetMap](overture-and-openstreetmap.md) · [Themes and Types](themes-and-types.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
