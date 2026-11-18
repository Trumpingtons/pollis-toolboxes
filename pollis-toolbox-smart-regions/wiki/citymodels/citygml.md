# CityGML

## What Is CityGML?

CityGML is an open data model and XML-based format for the storage and exchange of virtual 3D city models, adopted by the Open Geospatial Consortium; version 2.0.0 of the standard dates from 2012 ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). It is an application schema of the Geography Markup Language 3.1.1, GML3, the standard for spatial data exchange of the Open Geospatial Consortium and ISO TC211. Its aim is a common definition of the basic entities, attributes and relations of a 3D city model, so that a model can be maintained once and reused in different fields of application ([Gröger and Plümer (2012)](#ref-GP2012a)). CityGML was first developed by the Special Interest Group 3D of the German spatial data infrastructure, from 2002 ([Open Geospatial Consortium (2012)](#ref-OGC2012a)).

## The Structure of a CityGML File

A CityGML file is a CityModel element holding city objects, each inside a cityObjectMember element, and usually a boundedBy element with the envelope of the whole model and its coordinate system ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). Each city object, such as a Building, has a gml:id, its attributes as child elements, and geometry properties named after their level of detail, such as lod1Solid, lod2Solid or lod2MultiSurface. Thematic modules define the classes: the building module defines Building, BuildingPart, the boundary surfaces and BuildingInstallation. The CityGML tab of the City Model Files panel reads the objects of the class the Class input names.

## The Building Model of CityGML

The building model is one of the most detailed thematic concepts of CityGML 2.0 ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). An abstract building is either a Building or a BuildingPart, and since a building consists of building parts, which are themselves abstract buildings, parts can nest to any depth. Both carry the attributes class, function, usage, year of construction and of demolition, roof type, measured height, and the number and heights of storeys. From LoD2, the outer shell is divided into boundary surfaces, wall, roof, ground, outer floor, outer ceiling and closure surfaces, and building installations such as balconies, chimneys and dormers. The CityGML tab reads a building's parts and boundary surfaces with the building, so its footprint and height cover them all.

## How the CityGML Tab Reads a File

The CityGML tab of the City Model Files panel parses the file with EzXML.jl, which reads XML and HTML documents into a tree, searches them with XPath and handles namespaces ([Sato (2026)](#ref-Sat2026a)). The tab matches elements by their local names, without namespace prefixes, so files of CityGML 1.0, 2.0 and 3.0, whose namespaces differ, are read by the same code. For each object, it collects every gml:Polygon and gml:Triangle under a geometry property whose name starts with lod and a digit, their exterior and interior rings from gml:posList or gml:pos, and groups them by level. DuckDB's spatial extension then builds a MultiPolygon Z from them ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## CityGML 3.0

CityGML 3.0 comes with a new space concept, a revised level-of-detail concept, time-dependent properties and versions of cities, the representation of city objects by point clouds, an improved modelling of constructions, building units and storeys, and a better representation of traffic infrastructure ([Kutzner, Chaturvedi and Kolbe (2020)](#ref-KCK2020a)). It separates the conceptual model from the data encodings, so that encodings other than GML can be specified for it. The paper of Kutzner, Chaturvedi and Kolbe gives an overview of these new and revised concepts and illustrates them with use cases; the revised levels of detail are described in Levels of Detail.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GP2012a"></a>Gröger, G. and Plümer, L. (2012). CityGML – interoperable semantic 3D city models. *ISPRS Journal of Photogrammetry and Remote Sensing*, 71, 12–33. [doi:10.1016/j.isprsjprs.2012.04.004](https://doi.org/10.1016/j.isprsjprs.2012.04.004)

<a id="ref-KCK2020a"></a>Kutzner, T., Chaturvedi, K. and Kolbe, T. H. (2020). CityGML 3.0: new functions open up new applications. *PFG – Journal of Photogrammetry, Remote Sensing and Geoinformation Science*, 88(1), 43–61. [doi:10.1007/s41064-020-00095-z](https://doi.org/10.1007/s41064-020-00095-z)

<a id="ref-OGC2012a"></a>Open Geospatial Consortium (2012). OGC City Geography Markup Language (CityGML) Encoding Standard, Version 2.0.0 (OGC 12-019). [docs.ogc.org/is/12-019/12-019.pdf](https://docs.ogc.org/is/12-019/12-019.pdf)

<a id="ref-Sat2026a"></a>Sato, K. (2026). EzXML.jl: XML/HTML handling tools for primates. [github.com/JuliaIO/EzXML.jl](https://github.com/JuliaIO/EzXML.jl)

## See Also
- [CityJSON](cityjson.md) · [Levels of Detail](levels-of-detail.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
