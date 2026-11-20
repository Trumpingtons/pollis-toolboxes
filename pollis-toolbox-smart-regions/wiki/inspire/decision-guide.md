# Decision Guide

## Which Tab of the INSPIRE Data Panel Reads a Dataset

| What the dataset offers | Tab | What the tab downloads |
|---|---|---|
| Nothing known yet | Find Datasets | The datasets of the theme in the country, with the addresses of their download services |
| A Web Feature Service | WFS Download | The features of one layer, in pages, as GeoJSON or GML |
| An INSPIRE Atom feed | Atom Download | One ready-made file of the dataset, unpacked when it is a .zip |
| An OGC API | OGC API Features | The features of one collection, in pages, as GeoJSON |
| A file to download | The Geospatial Vector Files panel | A GeoPackage, GeoJSON, Shapefile or another file it reads |

## WFS, Atom Feed or OGC API for the Same Dataset

A dataset of INSPIRE often has several download services. An Atom feed offers pre-defined files of the whole dataset, while a WFS gives direct access to its spatial objects through queries ([Initial Operating Capability Task Force (2013)](#ref-IOCTF2013a)). An OGC API serves the features of each collection in pages, with GeoJSON as its recommended encoding ([Open Geospatial Consortium (2022)](#ref-OGC2022a)). The INSPIRE Data panel reads GeoJSON with no conversion, so a WFS that offers GeoJSON, or an OGC API, avoids the limits of DuckDB on INSPIRE's GML; an Atom feed downloads the whole dataset in one file, often faster than many pages. The services of one dataset need not hold the same units: Beside GISCO's Units or Units by Level shows their numbers.

## Page Size in WFS Download and OGC API Features

The Page Size of the INSPIRE Data panel is the number of features each request of WFS Download and OGC API Features asks for: the count of a WFS GetFeature request, or the limit of an OGC API items request ([Open Geospatial Consortium (2014)](#ref-OGC2014a); [Open Geospatial Consortium (2022)](#ref-OGC2022a)). A larger page means fewer requests, but each request takes longer, and a service may refuse a count above its own maximum or return fewer features than asked. WFS Download stops at the first page with fewer features than the Page Size; OGC API Features follows the link to the next page until there is none.

## Name Column and Colour By

The Name Column of the INSPIRE Data panel is the column with each unit's name, which the map shows on a click and Beside GISCO's Units matches with GISCO's names. Colour By is the column the map colours by, and by which Units by Level counts; in INSPIRE's administrative units, the national name of each unit's level, such as municipality or province, is the column that separates the levels ([INSPIRE Maintenance and Implementation Group (2024)](#ref-IMIG2024a)). The column names differ from one service to another: Download and Columns lists them.

## References

<a id="ref-IOCTF2013a"></a>Initial Operating Capability Task Force (2013). Technical Guidance for the implementation of INSPIRE Download Services, version 3.1. [knowledge-base.inspire.ec.europa.eu](https://knowledge-base.inspire.ec.europa.eu/publications/technical-guidance-implementation-inspire-download-services_en)

<a id="ref-IMIG2024a"></a>INSPIRE Maintenance and Implementation Group (2024). INSPIRE Data Specification on Administrative Units – Technical Guidelines. [knowledge-base.inspire.ec.europa.eu](https://knowledge-base.inspire.ec.europa.eu/publications/inspire-data-specification-administrative-units-technical-guidelines_en)

<a id="ref-OGC2014a"></a>Open Geospatial Consortium (2014). OGC Web Feature Service 2.0 Interface Standard – With Corrigendum, Version 2.0.2 (OGC 09-025r2). [docs.ogc.org/is/09-025r2/09-025r2.html](https://docs.ogc.org/is/09-025r2/09-025r2.html)

<a id="ref-OGC2022a"></a>Open Geospatial Consortium (2022). OGC API - Features - Part 1: Core corrigendum, Version 1.0.1 (OGC 17-069r4). [docs.ogc.org/is/17-069r4/17-069r4.html](https://docs.ogc.org/is/17-069r4/17-069r4.html)

## See Also
- [Factsheet](factsheet.md) · [Web Feature Service](wfs.md) · [Atom Download Feeds](atom-feeds.md) · [OGC API Features](ogc-api-features.md) · [Diagnostics](diagnostics.md)
