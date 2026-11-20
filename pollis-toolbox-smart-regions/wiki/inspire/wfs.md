# Web Feature Service

## What a Web Feature Service Is

The Web Feature Service, an OGC standard that is also ISO 19142, defines operations to discover the feature types a server offers and to query and retrieve their features, and, optionally, to create, update and delete them ([Open Geospatial Consortium (2014)](#ref-OGC2014a)). The technical guidance for INSPIRE download services builds the direct access download service on WFS 2.0 and the Filter Encoding standard ([Initial Operating Capability Task Force (2013)](#ref-IOCTF2013a)). The WFS Download tab of the INSPIRE Data panel uses two of the operations, GetCapabilities and GetFeature.

## GetCapabilities and the Layers of a WFS

GetCapabilities returns an XML document that describes the service: its operations, the feature types it serves, each with its name, and the output formats of GetFeature ([Open Geospatial Consortium (2014)](#ref-OGC2014a)). WFS Download reads that document with EzXML.jl, finding the elements by their local names whatever prefixes the service gives its namespaces ([Sato (2026)](#ref-Sat2026a)). The Layer input is a feature type's name, usually with a namespace prefix such as au; WFS Download stops with the list of the names when the Layer is not among them.

## Paging Through a WFS With count and startIndex

GetFeature in WFS 2.0 can return the features in pages: count sets the most features a response holds, and startIndex the position of the first ([Open Geospatial Consortium (2014)](#ref-OGC2014a)). WFS Download asks for pages of the Page Size, from startIndex 0, and stops at the first page with fewer features than it asked for. It reads each page with DuckDB's spatial extension, joins the pages by the names of their columns, adds each unit's area, and writes the whole as one GeoParquet file in the Folder ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## GeoJSON or GML From a WFS

WFS 2.0 encodes features in GML by default, and a server may list other output formats for GetFeature in its GetCapabilities document ([Open Geospatial Consortium (2014)](#ref-OGC2014a)). WFS Download asks for the first output format whose name contains json when the service lists one, and reads GML otherwise. GeoJSON from a WFS is a flat set of properties that DuckDB reads like any file; INSPIRE's GML has nested properties and geometries that DuckDB may not read, as the Diagnostics page of the INSPIRE Data panel describes ([INSPIRE Maintenance and Implementation Group (2024)](#ref-IMIG2024a)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-IOCTF2013a"></a>Initial Operating Capability Task Force (2013). Technical Guidance for the implementation of INSPIRE Download Services, version 3.1. [knowledge-base.inspire.ec.europa.eu](https://knowledge-base.inspire.ec.europa.eu/publications/technical-guidance-implementation-inspire-download-services_en)

<a id="ref-IMIG2024a"></a>INSPIRE Maintenance and Implementation Group (2024). INSPIRE Data Specification on Administrative Units – Technical Guidelines. [knowledge-base.inspire.ec.europa.eu](https://knowledge-base.inspire.ec.europa.eu/publications/inspire-data-specification-administrative-units-technical-guidelines_en)

<a id="ref-OGC2014a"></a>Open Geospatial Consortium (2014). OGC Web Feature Service 2.0 Interface Standard – With Corrigendum, Version 2.0.2 (OGC 09-025r2). [docs.ogc.org/is/09-025r2/09-025r2.html](https://docs.ogc.org/is/09-025r2/09-025r2.html)

<a id="ref-Sat2026a"></a>Sato, K. (2026). EzXML.jl: XML/HTML handling tools for primates. [github.com/JuliaIO/EzXML.jl](https://github.com/JuliaIO/EzXML.jl)

## See Also
- [OGC API Features](ogc-api-features.md) · [Atom Download Feeds](atom-feeds.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
