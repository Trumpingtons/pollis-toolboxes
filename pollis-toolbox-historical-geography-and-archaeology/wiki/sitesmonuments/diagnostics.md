# Sites and Monuments — Diagnostics

## Why Do Many Places of Pleiades Sit on the Same Point?

Pleiades gives each place a representative point, and marks each place precise or rough. A rough place has only the bounds within which it should be sought or might lie, and its representative point may be no more than the centre of a large box: Pleiades' own guidance is not to assume that the point of a rough place is accurate ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)). Places of a city known only from texts, such as districts, gardens or lost temples, are often rough within the bounds of the city, and their points fall together. Precise and Rough Places colours the two apart, and Sites Near the Place lists such places at the same distance.

## Why Does the Ancient World Tab Keep Places Outside From and Until?

The Ancient World tab of Sites and Monuments keeps every place without years, whatever From and Until are, since a place without years in Pleiades may be of any period. The years of a place are those of its locations: the earliest year after which and the latest year before which a location is dated ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)). A place with a modern location, such as the hill on which a city stood, may have years up to 2100 beside its ancient ones. Places by Century counts only the places with years, and says how many those are.

## Why Is the Map of Sites and Monuments Empty or Grey?

When the Example Code prints no sites, the Box holds none of the register's sites with the filters chosen: check that the Box is west, south, east, north in degrees, and widen the Box, Kinds, Remains, From and Until, or Name Contains. When Google's map stays grey or shows an error of authentication, the Google Maps key is missing or not accepted for the Maps JavaScript API ([Google (2026a)](#ref-Goo2026a)); when Esri's imagery stays blank, the ArcGIS key is missing or lacks the basemap privilege ([Esri (2026)](#ref-Esr2026a)). Set both with the keys on the Powered by line. Free Map needs a version of Pollis whose Julia REPL has `Pollis.webmap`.

## Why Does Google My Maps Refuse the KML File of Sites and Monuments?

Google My Maps imports at most 2,000 rows a file, and unzipped KML and KMZ files of up to 5 MB ([Google (2026h)](#ref-Goo2026h)). Save as KML says when the Box holds more than 2,000 sites. Narrow the Box or the filters and save again, or split the area into several Boxes and import each file as a layer of its own. Google Earth takes larger files: as editable features up to 10,000 of them, and as a data layer beyond that ([Google (2026i)](#ref-Goo2026i)).

## Why Do Names of the Ancient Near East Tab Have Parentheses or Codes?

The Ancient Near East site placemarks write ancient names without parentheses and modern names within them, so that a name such as an ancient name followed by a modern one in parentheses gives both, and a name in parentheses alone is a site known only by its modern name ([Pedersen (2007)](#ref-Ped2007a)). A question mark marks an uncertain identification. The sites of the folder No names carry a code of their region in place of a name, and the Ancient Near East tab gives them the kind no name.

## References

<a id="ref-ETBBB...2025a"></a>Elliott, T., Talbert, R., Bagnall, R., Becker, J., Bond, S., Gillies, S., Holman, L., Horne, R., Moss, G., Rabinowitz, A., Robinson, E., Turner, B. and Institute for the Study of the Ancient World (NYU) (2025). Pleiades Datasets 4.1. Dataset, Zenodo. [doi:10.5281/zenodo.1193921](https://doi.org/10.5281/zenodo.1193921)

<a id="ref-Esr2026a"></a>Esri (2026). ArcGIS REST APIs: map services and image services. [developers.arcgis.com/rest/services-reference/enterprise](https://developers.arcgis.com/rest/services-reference/enterprise/)

<a id="ref-Goo2026a"></a>Google (2026a). Maps JavaScript API Documentation. [developers.google.com/maps/documentation/javascript](https://developers.google.com/maps/documentation/javascript)

<a id="ref-Goo2026h"></a>Google (2026h). Import Map Features from a File. My Maps Help. [support.google.com/mymaps/answer/3024836](https://support.google.com/mymaps/answer/3024836)

<a id="ref-Goo2026i"></a>Google (2026i). Import Data into Google Earth. Google Earth Help. [support.google.com/earth/answer/7365595](https://support.google.com/earth/answer/7365595)

<a id="ref-Ped2007a"></a>Pedersen, O. (2007). ANE Site Placemarks for Google Earth. Dataset, Zenodo. [doi:10.5281/zenodo.6384045](https://doi.org/10.5281/zenodo.6384045)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Pleiades](pleiades.md) · [Ancient Near East Placemarks](ane-placemarks.md)
