# City Model Files — Overview

## What Is a Semantic 3D City Model?

A semantic 3D city model represents a city as objects with a meaning, a geometry and attributes: a building is a Building, with its walls, roof and year of construction, not a mesh of triangles. CityGML, the Open Geospatial Consortium's standard for such models, aims at a common definition of the basic entities, attributes and relations of a 3D city model, so that the same data can be reused in different fields of application ([Open Geospatial Consortium (2012)](#ref-OGC2012a); [Gröger and Plümer (2012)](#ref-GP2012a)). Its thematic modules cover buildings, bridges, tunnels, transportation, vegetation, water bodies, land use, city furniture and the relief of the terrain.

## City Objects and Their Attributes

Every feature of a CityGML model is a city object of a class, and each class has its attributes. In CityGML 2.0, a Building or BuildingPart can have a class, a function such as residential, public or industry, a usage, a year of construction and of demolition, a roof type, a measured height, and the number and heights of its storeys above and below ground ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). The standard notes that these parameters suffice to reconstruct the shape of a building roughly, and that cadastral systems can provide them. Attributes the standard does not name can be added as generic attributes. Attribute Summary in the City Model Files panel lists the attributes of a file and how many objects have each.

## The Geometry of City Objects

CityGML inherits the geometry of GML 3.1.1, the Geography Markup Language, and associates geometries with a 3D coordinate system ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). A building's outer shell is typically a solid, a closed set of planar faces, or a multi-surface, a set of faces that need not close. CityJSON allows the same linear and planar primitives, MultiSurface, CompositeSurface, Solid, MultiSolid and CompositeSolid among them, but no curves ([Ledoux and Dukai (2024)](#ref-LD2024a)). The City Model Files panel turns any of these into a MultiPolygon Z, one polygon per face, which DuckDB's spatial extension measures and transforms ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## What 3D City Models Are Used For

3D city models were long used mainly for visualisation, but they now serve many tasks beyond it. Biljecki, Stoter, Ledoux, Zlatanova and Çöltekin reviewed hundreds of research papers, technical reports and online resources and found 3D city models employed in at least 29 use cases, part of more than 100 applications ([Biljecki, Stoter, Ledoux, Zlatanova and Çöltekin (2015)](#ref-BSLZC2015a)). Their review organises the uses into spatial operations, use cases and applications. Many use cases need measures of buildings, such as footprints, heights and volumes, which Building Measures computes from the geometry of a model.

## CityGML 3.0

CityGML 3.0, the next major version of the standard, brings a new space concept, a revised level-of-detail concept, time-dependent properties and versions of cities, city objects represented by point clouds, an improved modelling of constructions, building units and storeys, and a better representation of traffic infrastructure ([Kutzner, Chaturvedi and Kolbe (2020)](#ref-KCK2020a)). It separates the conceptual model from its encodings, so that encodings other than GML can be specified. CityJSON 2.0 implements part of the CityGML 3.0 data model, though not all its extension modules ([Ledoux and Dukai (2024)](#ref-LD2024a)).

## References

<a id="ref-BSLZC2015a"></a>Biljecki, F., Stoter, J., Ledoux, H., Zlatanova, S. and Çöltekin, A. (2015). Applications of 3D city models: state of the art review. *ISPRS International Journal of Geo-Information*, 4(4), 2842–2889. [doi:10.3390/ijgi4042842](https://doi.org/10.3390/ijgi4042842)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GP2012a"></a>Gröger, G. and Plümer, L. (2012). CityGML – interoperable semantic 3D city models. *ISPRS Journal of Photogrammetry and Remote Sensing*, 71, 12–33. [doi:10.1016/j.isprsjprs.2012.04.004](https://doi.org/10.1016/j.isprsjprs.2012.04.004)

<a id="ref-KCK2020a"></a>Kutzner, T., Chaturvedi, K. and Kolbe, T. H. (2020). CityGML 3.0: new functions open up new applications. *PFG – Journal of Photogrammetry, Remote Sensing and Geoinformation Science*, 88(1), 43–61. [doi:10.1007/s41064-020-00095-z](https://doi.org/10.1007/s41064-020-00095-z)

<a id="ref-LD2024a"></a>Ledoux, H. and Dukai, B. (2024). CityJSON Specifications 2.0.1. [cityjson.org/specs/2.0.1](https://www.cityjson.org/specs/2.0.1/)

<a id="ref-OGC2012a"></a>Open Geospatial Consortium (2012). OGC City Geography Markup Language (CityGML) Encoding Standard, Version 2.0.0 (OGC 12-019). [docs.ogc.org/is/12-019/12-019.pdf](https://docs.ogc.org/is/12-019/12-019.pdf)

## See Also
- [Factsheet](factsheet.md) · [Levels of Detail](levels-of-detail.md) · [CityGML](citygml.md) · [CityJSON](cityjson.md) · [Measuring Buildings](measuring-buildings.md)
