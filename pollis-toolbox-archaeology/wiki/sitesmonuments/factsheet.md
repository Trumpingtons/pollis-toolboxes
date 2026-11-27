# Sites and Monuments — Factsheet

**Sites and monuments** are the places where people of the past lived, built, worshipped and were buried, as registers of ancient places record them. The Sites and Monuments panel of the Archaeology Toolbox reads two registers that are not bound to one country, Pleiades and the Ancient Near East site placemarks, with DuckDB's spatial extension, draws the sites of an area on Google's maps, Esri's imagery or a free map, and saves them for Google Earth, Google My Maps and any GIS ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a); [Pedersen (2007)](#ref-Ped2007a); [Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

| Item | Sites and Monuments panel |
|---|---|
| **Purpose** | Find the ancient places of an area, see them on Google Maps and other maps, and save them |
| **Tabs** | Ancient World (Pleiades); Ancient Near East (the Ancient Near East site placemarks) |
| **Inputs** | Folder; Box; Kinds, Remains, From and Until (Ancient World); Name Contains (Ancient Near East); Map; Place; Distance (km) |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [SmartRegions.jl](https://github.com/Trumpingtons/SmartRegions.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), with DuckDB's spatial extension |
| **Output** | A map of the sites, and the table `sites`: one row per site, with `name`, its kind or kinds, `lon`, `lat` and `geom` |
| **Needs** | An Internet connection for the first download and for the maps; a Google Maps key for Google's maps, an ArcGIS key for Esri's imagery |

## What Do the Inputs of Sites and Monuments Set?

| Input | What the input sets |
|---|---|
| Folder | Where the register is kept once downloaded, and where Export saves |
| Box | The area, as west, south, east and north in degrees |
| Kinds | For Ancient World, Pleiades' kinds of place to keep, separated by commas; empty keeps every kind |
| Remains | For Ancient World, all places, those with visible remains, or those with substantive remains |
| From, Until | For Ancient World, the years a place's years must meet; years before Christ are negative |
| Name Contains | For Ancient Near East, a text the name of a site must contain, in any case |
| Map | Free Map, Google Roadmap, Google Satellite, Google Satellite with Labels or Esri World Imagery |
| Place | A point as longitude and latitude, for Sites Near the Place and the 3D map |
| Distance (km) | How far from the Place the two look |

## What Is in the Table of Sites of Sites and Monuments?

| Column | Ancient World | Ancient Near East |
|---|---|---|
| `name` | The title of the place in Pleiades | The name of the placemark |
| `kinds` or `kind` | `kinds`: Pleiades' kinds of the place, separated by commas | `kind`: ancient name, modern name only, no name or outline |
| `starts`, `ends` | The year after which and the year before which the place's locations are dated | — |
| `remains` | The most visible remains recorded at the place's locations | — |
| `precision`, `link` | Precise or rough, and the place's page in Pleiades | — |
| `lon`, `lat`, `geom` | The representative point of the place | The point, or the centre of the outline, and the geometry |

## Which Maps Can Sites and Monuments Draw On?

| Map | Drawn by | Key |
|---|---|---|
| Free Map | `Pollis.webmap`, with OpenFreeMap's map of OpenStreetMap's data, drawn by MapLibre GL JS | None |
| Google Roadmap, Google Satellite, Google Satellite with Labels | `googlemap` of SmartRegions.jl, with the Maps JavaScript API, on a page in Pollis's browser | Google Maps key |
| Esri World Imagery | `Pollis.webmap`, with Esri's World Imagery as tiles under the sites | ArcGIS key |

The keys are set with the keys on the Powered by line ([Ero (2026)](#ref-Ero2026a); [MapLibre Contributors (2026)](#ref-MLC2026a); [Google (2026a)](#ref-Goo2026a); [Esri (2026)](#ref-Esr2026a)). On every map, a click on a site shows its columns.

## What Do the Next Steps of Sites and Monuments Do?

Visualise draws the places of Pleiades coloured by precise or rough, the sites on Google's roadmap and satellite map side by side, and the sites within the Distance of the Place in Google's Photorealistic 3D Maps ([Google (2026b)](#ref-Goo2026b)). Interpret counts the sites by kind, counts the places of Pleiades in use in each century, and lists the sites within the Distance of the Place, the nearest first. Export saves the sites of the Box as KML, for Google Earth and Google My Maps; as a GeoPackage, for any GIS and for the Known Sites of the detection panels; as GeoJSON; and as CSV with longitude and latitude ([Google (2026h)](#ref-Goo2026h); [Google (2026i)](#ref-Goo2026i); [Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

## Where Does the Example Data of Sites and Monuments Come From?

For Ancient World, the default Box is the centre of Rome, and the Place the Forum: the places come from the data of Pleiades for GIS, downloaded once into the Folder and kept there as `pleiades-places.parquet` ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)). For Ancient Near East, the default Box is the Khabur basin around Tell Brak, in north-eastern Syria, and the Place Tell Brak, ancient Nagar: the sites come from `ANE.kmz`, downloaded once from Zenodo into the Folder ([Pedersen (2007)](#ref-Ped2007a)).

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

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Pleiades](pleiades.md) · [Ancient Near East Placemarks](ane-placemarks.md)
