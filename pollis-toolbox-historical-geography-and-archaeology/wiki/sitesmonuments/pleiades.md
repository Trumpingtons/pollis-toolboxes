# Sites and Monuments — Pleiades

## What Is Pleiades?

Pleiades is a community-built gazetteer and graph of ancient places. It publishes authoritative information about ancient places and spaces under an open licence, for individual readers, for search engines and for computational research and visualisation, as a continuously published scholarly reference work to which any knowledgeable person may contribute under peer review ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)). Its content is distributed under a Creative Commons Attribution licence, and its numbered releases, archived on Zenodo, are the ones to cite for work published in static form. The Ancient World tab of Sites and Monuments reads the data of Pleiades for GIS, which is updated several times each week.

## What Are Places, Locations and Representative Points in Pleiades?

A place of Pleiades is an ancient place, with its names and its locations. A location is a geometry of the place, a point, a line or a polygon, with its own years, its remains and its precision. The representative point of a place stands for all its locations, and is what the Ancient World tab of Sites and Monuments draws. Each location and each place is precise, when its geometry gives a specific position, or rough, when it gives only the bounds within which the place should be sought or might lie. The data for GIS warns that the representative point of a rough place may be just the centre of a large bounding box ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)).

## What Do the Kinds of Place of Pleiades Mean?

Pleiades gives each place one or more kinds from its vocabulary of place types, such as settlement, villa, temple, tomb, fort, theatre, road or river, each with a key and a definition ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)). Some keys carry a number, such as temple-2 or church-2, where a later term of the vocabulary replaced an earlier one of the same name. The Kinds input of the Ancient World tab takes the keys, separated by commas, and keeps the places with at least one of them. The kinds include places of the landscape, regions and peoples as well as sites, and the kind unlocated marks a place without a known position.

## How Does Pleiades Date a Place?

Pleiades dates a location by the year after which and the year before which it flourished, was in use or otherwise obtained: a terminus post quem and a terminus ante quem. The years are signed integers of the proleptic Julian calendar, negative before Christ, without a year zero ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)). The Ancient World tab of Sites and Monuments gives each place the earliest year after which and the latest year before which any of its points and polygons are dated, as `starts` and `ends`. A place whose locations have no years has no years in the tab.

## What Do the Remains of Pleiades Record?

Pleiades records for each location whether archaeological remains are known to be visible there and, if so, how substantive they are: substantive, restored, traces, not visible, none, not applicable or unknown ([Elliott and 12 coauthors (2025)](#ref-ETBBB...2025a)). The Ancient World tab of Sites and Monuments keeps for each place the most visible remains among its locations, substantive first, then restored, traces, not visible and none, as `remains`, and colours its map by them. The Remains input keeps all places, those with visible remains, substantive, restored or traces, or those with substantive remains only. Unknown is the commonest value: it says that the remains are not recorded, not that there are none.

## How Does Sites and Monuments Read Pleiades?

The first run of the Ancient World tab of Sites and Monuments downloads the data of Pleiades for GIS, a ZIP file of CSV tables, into the Folder. DuckDB's spatial extension reads the tables of places, of their kinds and of their point and polygon locations from inside the ZIP file through GDAL, and joins them into one table of places, which it saves in the Folder as `pleiades-places.parquet` ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Later runs read the Parquet file only. Places without a representative point are left out. Deleting the Parquet file and the ZIP file builds the table again from a new download.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-ETBBB...2025a"></a>Elliott, T., Talbert, R., Bagnall, R., Becker, J., Bond, S., Gillies, S., Holman, L., Horne, R., Moss, G., Rabinowitz, A., Robinson, E., Turner, B. and Institute for the Study of the Ancient World (NYU) (2025). Pleiades Datasets 4.1. Dataset, Zenodo. [doi:10.5281/zenodo.1193921](https://doi.org/10.5281/zenodo.1193921)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Ancient Near East Placemarks](ane-placemarks.md)
