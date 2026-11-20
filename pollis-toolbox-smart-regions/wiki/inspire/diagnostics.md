# Diagnostics

## A Service That Sends Nothing or Refuses the Request

A WFS Download or OGC API Features run that stops on the first request has usually met one of three things: an address that is not the service's, a layer or collection the service does not have, or a page larger than the service allows. WFS Download lists the layers the service names in its GetCapabilities document when the Layer given is not among them, and OGC API Features lists the identifiers of the collections the API has. A Web Feature Service may cap the number of features it returns to one request ([Open Geospatial Consortium (2014)](#ref-OGC2014a)); a smaller Page Size asks for fewer features at a time, in more requests.

## GML That DuckDB Cannot Read

The GML of INSPIRE follows the application schema of each theme, where a feature has nested properties, and its geometries may be multi-surfaces or curves ([INSPIRE Maintenance and Implementation Group (2024)](#ref-IMIG2024a)). DuckDB's spatial extension reads GML through GDAL, which flattens the nested properties into columns ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Two flattened properties may then share a name with the geometry, which DuckDB refuses, and a geometry type DuckDB does not support stops the read. The INSPIRE Data panel renames a property that has the geometry's name in the .gfs file GDAL writes beside the GML file; for a geometry DuckDB does not support, a WFS or an OGC API of the same dataset that sends GeoJSON is the alternative.

## A Column the Features Do Not Have

The columns of the features read depend on the service: a WFS or an OGC API may give its own names to INSPIRE's properties, in another spelling, and the columns GDAL makes from INSPIRE's GML take the name of the last element of each property's path. The WFS Download, Atom Download and OGC API Features tabs stop with the list of the columns the features have when the Name Column or Colour By is not among them; Download and Columns in the INSPIRE Data panel lists the columns with their types, and the most frequent values of Colour By.

## Coordinate Reference Systems of INSPIRE Data

INSPIRE data are published in the coordinate reference systems that the data specifications allow, ETRS89 among them for the territory of Europe ([INSPIRE Maintenance and Implementation Group (2024)](#ref-IMIG2024a)), and an Atom feed gives the system of each file it lists ([Initial Operating Capability Task Force (2013)](#ref-IOCTF2013a)). The core of OGC API Features returns coordinates in longitude and latitude on WGS 84 by default ([Open Geospatial Consortium (2022)](#ref-OGC2022a)). The tabs of the INSPIRE Data panel read the system of each file from DuckDB's geometry type and transform the units to longitude and latitude on WGS 84, for the map and for areas on the WGS 84 ellipsoid.

## Licences and Terms of Use of INSPIRE Data

Each dataset of INSPIRE comes with its own conditions of access and use, set by its publisher. The high-value datasets of administrative units are made available under the Creative Commons BY 4.0 licence or an equivalent or less restrictive open licence ([European Commission (2023)](#ref-EC2023b)). data.europa.eu records a licence for each distribution when its catalogue gives one ([Publications Office of the European Union (2026)](#ref-POEU2026a)); Licences of the Datasets in the INSPIRE Data panel counts them for the datasets found. GISCO's boundaries, in Beside GISCO's Units, have the terms of GISCO's own pages ([Eurostat (2026)](#ref-Eur2026a)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-EC2023b"></a>European Commission (2023). Commission Implementing Regulation (EU) 2023/138 of 21 December 2022 laying down a list of specific high-value datasets and the arrangements for their publication and re-use. *Official Journal of the European Union*, L 19, 43–75. [eur-lex.europa.eu/eli/reg_impl/2023/138/oj](https://eur-lex.europa.eu/eli/reg_impl/2023/138/oj)

<a id="ref-Eur2026a"></a>Eurostat (2026). GISCO: Geographic Information System of the Commission. [ec.europa.eu/eurostat/web/gisco](https://ec.europa.eu/eurostat/web/gisco)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-IOCTF2013a"></a>Initial Operating Capability Task Force (2013). Technical Guidance for the implementation of INSPIRE Download Services, version 3.1. [knowledge-base.inspire.ec.europa.eu](https://knowledge-base.inspire.ec.europa.eu/publications/technical-guidance-implementation-inspire-download-services_en)

<a id="ref-IMIG2024a"></a>INSPIRE Maintenance and Implementation Group (2024). INSPIRE Data Specification on Administrative Units – Technical Guidelines. [knowledge-base.inspire.ec.europa.eu](https://knowledge-base.inspire.ec.europa.eu/publications/inspire-data-specification-administrative-units-technical-guidelines_en)

<a id="ref-OGC2014a"></a>Open Geospatial Consortium (2014). OGC Web Feature Service 2.0 Interface Standard – With Corrigendum, Version 2.0.2 (OGC 09-025r2). [docs.ogc.org/is/09-025r2/09-025r2.html](https://docs.ogc.org/is/09-025r2/09-025r2.html)

<a id="ref-OGC2022a"></a>Open Geospatial Consortium (2022). OGC API - Features - Part 1: Core corrigendum, Version 1.0.1 (OGC 17-069r4). [docs.ogc.org/is/17-069r4/17-069r4.html](https://docs.ogc.org/is/17-069r4/17-069r4.html)

<a id="ref-POEU2026a"></a>Publications Office of the European Union (2026). data.europa.eu Search API. [data.europa.eu/api/hub/search](https://data.europa.eu/api/hub/search/)

## See Also
- [Web Feature Service](wfs.md) · [Atom Download Feeds](atom-feeds.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
