# Sites and Monuments — Decision Guide

## Which Register of Sites and Monuments Should I Use?

| Question | Tab of Sites and Monuments |
|---|---|
| Which ancient places of the Greek and Roman world lie in an area, of which kinds and when? | Ancient World |
| Which places of an area have visible remains? | Ancient World, with Remains |
| Which sites of Mesopotamia, the Levant or their neighbours lie in an area, by ancient or modern name? | Ancient Near East |
| Which tells or tepes of an area are marked? | Ancient Near East, with Name Contains |

Pleiades covers the ancient world well beyond the Mediterranean, with kinds, years and remains for each place ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)). The Ancient Near East site placemarks are a selection of the most important sites of the Ancient Near East, most of them identified on satellite images, with names but no kinds or years ([Pedersen (2007)](#ref-Ped2007a)). Where the two cover the same area, run both tabs and set their sites side by side.

## Which Map Should I Choose for Sites and Monuments?

Google Satellite and Esri World Imagery show the ground at each site, where a mound, a wall or a crop mark may be seen. Google Satellite with Labels adds Google's place names, which help to find a site among modern towns, and Google Roadmap shows roads and towns alone ([Google (2026a)](#ref-Goo2026a); [Esri (2026)](#ref-Esr2026a)). Free Map needs no key, and suits a first look or a map without imagery ([Ero (2026)](#ref-Ero2026a)). Roadmap and Satellite sets two of Google's map types side by side, moving together, and In Google's Photorealistic 3D Maps shows the relief around the Place ([Google (2026b)](#ref-Goo2026b)). Each Google map loads counts against the use of the Google Maps key, and each tile of Esri's imagery against the ArcGIS key.

## Which File Should I Save from Sites and Monuments?

| Goal | Export action |
|---|---|
| Open the sites in Google Earth | Save as KML, or Save as GeoJSON |
| Import the sites into a map of Google My Maps | Save as KML, or Save as CSV |
| Use the sites in QGIS, ArcGIS or another GIS | Save as GeoPackage |
| Give the detection panels their Known Sites | Save as GeoPackage |
| Read the sites in a spreadsheet | Save as CSV |

Google My Maps imports CSV, KML, KMZ and other files into a layer, but takes at most 2,000 rows a file and 5 MB of unzipped KML ([Google (2026h)](#ref-Goo2026h)). Google Earth imports KML, KMZ and GeoJSON into a project, as editable features up to 10,000 of them, or as a data layer beyond that ([Google (2026i)](#ref-Goo2026i)).

## How Do I Choose the Kinds, Remains and Years of the Ancient World Tab?

Kinds keeps the places of Pleiades that have at least one of the kinds named, as the keys of Pleiades' vocabulary of place types, such as settlement, villa, temple-2, tomb, fort or theatre: Sites by Kind lists the kinds of the Box, and so the keys to write. Remains keeps the places where Pleiades records visible remains at one of their locations, substantive, restored or traces, or substantive remains only ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)). From and Until keep the places whose years meet them; places without years are always kept, since a place without years may be of any period. Places by Century shows how the places of the Box spread over time before narrower years are chosen.

## References

<a id="ref-ETBBB...2025a"></a>Elliott, T., Talbert, R., Bagnall, R., Becker, J., Bond, S., Gillies, S., Holman, L., Horne, R., Moss, G., Rabinowitz, A., Robinson, E., Turner, B. and Institute for the Study of the Ancient World (NYU) (2025). Pleiades Datasets 4.1. Dataset, Zenodo. [doi:10.5281/zenodo.1193921](https://doi.org/10.5281/zenodo.1193921)

<a id="ref-Ero2026a"></a>Ero, Z. (2026). OpenFreeMap: free and open-source map hosting with OpenStreetMap data. [github.com/hyperknot/openfreemap](https://github.com/hyperknot/openfreemap)

<a id="ref-Esr2026a"></a>Esri (2026). ArcGIS REST APIs: map services and image services. [developers.arcgis.com/rest/services-reference/enterprise](https://developers.arcgis.com/rest/services-reference/enterprise/)

<a id="ref-Goo2026a"></a>Google (2026a). Maps JavaScript API Documentation. [developers.google.com/maps/documentation/javascript](https://developers.google.com/maps/documentation/javascript)

<a id="ref-Goo2026b"></a>Google (2026b). 3D Maps in Maps JavaScript. [developers.google.com/maps/documentation/javascript/3d/overview](https://developers.google.com/maps/documentation/javascript/3d/overview)

<a id="ref-Goo2026h"></a>Google (2026h). Import Map Features from a File. My Maps Help. [support.google.com/mymaps/answer/3024836](https://support.google.com/mymaps/answer/3024836)

<a id="ref-Goo2026i"></a>Google (2026i). Import Data into Google Earth. Google Earth Help. [support.google.com/earth/answer/7365595](https://support.google.com/earth/answer/7365595)

<a id="ref-Ped2007a"></a>Pedersen, O. (2007). ANE Site Placemarks for Google Earth. Dataset, Zenodo. [doi:10.5281/zenodo.6384045](https://doi.org/10.5281/zenodo.6384045)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Pleiades](pleiades.md) · [Ancient Near East Placemarks](ane-placemarks.md)
