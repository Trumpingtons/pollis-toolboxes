# OGC API Features

## What OGC API Features Is

OGC API - Features is an OGC standard for web APIs that give access to features: its first part, the core, organises the data into one or more collections, and returns the features of a collection by HTTP GET ([Open Geospatial Consortium (2022)](#ref-OGC2022a)). It recommends GeoJSON for encoding the features where the data can be represented in it. The OGC API Features tab of the INSPIRE Data panel reads the features of one collection of such an API as GeoJSON, with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Collections and Items of an OGC API

An API of OGC API - Features has a landing page, a list of its collections at the path collections, each collection with an identifier, and the features of each collection at the path items under it ([Open Geospatial Consortium (2022)](#ref-OGC2022a)). The API Address input of the OGC API Features tab is the landing page; the tab reads the list of collections with DuckDB's JSON functions, and stops with their identifiers when the Collection input is not among them ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)).

## Pages Linked to the Next in OGC API Features

When more features are selected than one response holds, the API returns them in pages, each with a link to the next ([Open Geospatial Consortium (2022)](#ref-OGC2022a)). The OGC API Features tab asks for the items with the limit of the Page Size, reads each page's links, and follows the link whose relation is next, preferring one in JSON, until a page has no such link or no features. It joins the pages by the names of their columns, adds each unit's area, and writes the whole as one GeoParquet file in the Folder.

## OGC API Features Beside a Web Feature Service

A Web Feature Service describes itself in an XML document and pages its features by count and startIndex, with GML as its default encoding ([Open Geospatial Consortium (2014)](#ref-OGC2014a)); an API of OGC API - Features describes its collections in JSON, pages its features by links, and recommends GeoJSON ([Open Geospatial Consortium (2022)](#ref-OGC2022a)). A dataset of INSPIRE may have both, from the same data, and the two may give the same properties different names. The WFS Download and OGC API Features tabs of the INSPIRE Data panel end in the same table `features`, so the Next Steps work on either.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-OGC2014a"></a>Open Geospatial Consortium (2014). OGC Web Feature Service 2.0 Interface Standard – With Corrigendum, Version 2.0.2 (OGC 09-025r2). [docs.ogc.org/is/09-025r2/09-025r2.html](https://docs.ogc.org/is/09-025r2/09-025r2.html)

<a id="ref-OGC2022a"></a>Open Geospatial Consortium (2022). OGC API - Features - Part 1: Core corrigendum, Version 1.0.1 (OGC 17-069r4). [docs.ogc.org/is/17-069r4/17-069r4.html](https://docs.ogc.org/is/17-069r4/17-069r4.html)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Web Feature Service](wfs.md) · [Atom Download Feeds](atom-feeds.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
