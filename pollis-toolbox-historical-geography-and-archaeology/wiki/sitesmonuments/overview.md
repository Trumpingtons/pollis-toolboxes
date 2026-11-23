# Sites and Monuments — Overview

## What Is a Register of Ancient Places?

A register of ancient places lists the places of the past, each with a name and a position, and often with what kind of place it was, when it was in use and what can still be seen there. Pleiades, the register of the Ancient World tab of Sites and Monuments, is a community-built gazetteer and graph of ancient places, which publishes information about them under an open licence for people, search engines and computational research ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)). The Ancient Near East site placemarks, the register of the Ancient Near East tab, mark a selection of the most important archaeological sites of the Ancient Near East for Google Earth, by their ancient and modern names ([Pedersen (2007)](#ref-Ped2007a)). Neither register is bound to the borders of one country, and both can be downloaded whole.

## What Does a Map of Sites and Monuments Show?

A map of Sites and Monuments shows the sites of the register within the Box, each a point or, where the register has one, an outline, coloured by a column: for Ancient World by the remains visible at the place, for Ancient Near East by whether the site has an ancient name. A click on a site shows its columns, among them the link to its page in Pleiades. The map shows where a register places a site, not the extent of the site on the ground: a point of Pleiades marked rough shows only where to look ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)). Read the map beside the register's own pages and the literature of the area.

## How Does Sites and Monuments Draw the Sites on Google Maps and Other Maps?

The Map input of Sites and Monuments chooses what the sites are drawn on. Google Roadmap, Google Satellite and Google Satellite with Labels draw them on Google's map types with the Maps JavaScript API, on a page of its own in Pollis's browser, with the user's Google Maps key ([Google (2026a)](#ref-Goo2026a)). In Google's Photorealistic 3D Maps, a Next Step, shows the sites near the Place in 3D with the same key ([Google (2026b)](#ref-Goo2026b)). Esri World Imagery draws them over Esri's imagery with the user's ArcGIS key ([Esri (2026)](#ref-Esr2026a)). Free Map draws them on OpenFreeMap's map of OpenStreetMap's data, with MapLibre GL JS, without a key ([Ero (2026)](#ref-Ero2026a); [MapLibre Contributors (2026)](#ref-MLC2026a)).

## How Do the Sites of Sites and Monuments Reach Google Earth and Other Software?

The Export actions of Sites and Monuments write the sites of the Box to the Folder in four formats. Save as KML writes each site with its name and, as its description, its details: Google Earth opens a KML file as it is or imports it into a project, and Google My Maps imports it into a layer of a map ([Google (2026h)](#ref-Goo2026h); [Google (2026i)](#ref-Goo2026i)). Save as GeoPackage writes a file that any GIS reads, and that the Known Sites of the detection panels of the toolbox take. Save as GeoJSON writes the format of web maps ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)), and Save as CSV a table with longitude and latitude for spreadsheets. DuckDB's spatial extension writes them through GDAL ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON Format. RFC 7946. [doi.org/10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-ETBBB...2025a"></a>Elliott, T., Talbert, R., Bagnall, R., Becker, J., Bond, S., Gillies, S., Holman, L., Horne, R., Moss, G., Rabinowitz, A., Robinson, E., Turner, B. and Institute for the Study of the Ancient World (NYU) (2025). Pleiades Datasets 4.1. Dataset, Zenodo. [doi:10.5281/zenodo.1193921](https://doi.org/10.5281/zenodo.1193921)

<a id="ref-Ero2026a"></a>Ero, Z. (2026). OpenFreeMap: free and open-source map hosting with OpenStreetMap data. [github.com/hyperknot/openfreemap](https://github.com/hyperknot/openfreemap)

<a id="ref-Esr2026a"></a>Esri (2026). ArcGIS REST APIs: map services and image services. [developers.arcgis.com/rest/services-reference/enterprise](https://developers.arcgis.com/rest/services-reference/enterprise/)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Goo2026a"></a>Google (2026a). Maps JavaScript API Documentation. [developers.google.com/maps/documentation/javascript](https://developers.google.com/maps/documentation/javascript)

<a id="ref-Goo2026b"></a>Google (2026b). 3D Maps in Maps JavaScript. [developers.google.com/maps/documentation/javascript/3d/overview](https://developers.google.com/maps/documentation/javascript/3d/overview)

<a id="ref-Goo2026h"></a>Google (2026h). Import Map Features from a File. My Maps Help. [support.google.com/mymaps/answer/3024836](https://support.google.com/mymaps/answer/3024836)

<a id="ref-Goo2026i"></a>Google (2026i). Import Data into Google Earth. Google Earth Help. [support.google.com/earth/answer/7365595](https://support.google.com/earth/answer/7365595)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-Ped2007a"></a>Pedersen, O. (2007). ANE Site Placemarks for Google Earth. Dataset, Zenodo. [doi:10.5281/zenodo.6384045](https://doi.org/10.5281/zenodo.6384045)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Pleiades](pleiades.md) · [Ancient Near East Placemarks](ane-placemarks.md)
