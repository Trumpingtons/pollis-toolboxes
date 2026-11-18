# City Model Files — Factsheet

A **semantic 3D city model** describes buildings, roads, vegetation and terrain as city objects, each with a 3D geometry, attributes and a meaning. **CityGML** is the Open Geospatial Consortium's XML encoding of such models, and **CityJSON** encodes the CityGML data model in JSON ([Open Geospatial Consortium (2012)](#ref-OGC2012a); [Ledoux and Dukai (2024)](#ref-LD2024a)). The City Model Files panel of the Smart Regions Toolbox reads CityGML with EzXML.jl and CityJSON with DuckDB's JSON reader, and measures both with DuckDB's spatial extension ([Sato (2026)](#ref-Sat2026a); [Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

| Item | City Model Files panel |
|---|---|
| **Purpose** | Read, check, measure and convert 3D city models from Julia |
| **Input** | A CityGML file (.gml); a CityJSON file (.city.json) |
| **Core packages** | [EzXML.jl](https://github.com/JuliaIO/EzXML.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), with DuckDB's spatial extension |
| **Tabs** | CityGML; CityJSON |
| **Output** | A DuckDB table `features`: one row per city object, with its attributes as JSON and its geometry as a MultiPolygon Z |
| **Key choices** | The class of objects read from a CityGML file; the level of detail kept; the coordinate system when the file records none |

## How Does the City Model Files Panel Read a CityGML File?

The CityGML tab of the City Model Files panel reads the XML tree of the file with EzXML.jl and finds elements with XPath, by their names without namespace prefixes, so CityGML 1.0, 2.0 and 3.0 files read alike ([Sato (2026)](#ref-Sat2026a)). For each top-level city object of the class the Class input names, Building by default, it collects the polygons under the geometry properties whose names start with a level of detail, lod1Solid or lod2MultiSurface, including those of boundary surfaces and building parts. The Level of Detail input keeps the highest or the lowest level. DuckDB.jl's appender then loads the objects, and `ST_GeomFromText` makes each geometry a MultiPolygon Z ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)).

## How Does the City Model Files Panel Read a CityJSON File?

The CityJSON tab of the City Model Files panel reads the file with DuckDB's JSON reader as one record: its version, metadata, transform, city objects and vertices ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)). SQL then applies the transform to the integer vertices, which gives the real coordinates, and turns each geometry's boundaries, lists of indices into the vertices, into a MultiPolygon Z ([Ledoux and Dukai (2024)](#ref-LD2024a)). When an object has geometries at several levels of detail, the Level of Detail input keeps the highest or the lowest. The coordinate system comes from the referenceSystem of the file's metadata.

## What the Next Steps of the City Model Files Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Show on a Map, Heights of the Objects | Footprints on a base map coloured by height; a histogram of heights |
| Diagnose | File Contents, Geometry Check | Classes, types and levels of detail; objects without geometry, walls and faces in plan |
| Compare | Heights Side by Side | measuredHeight beside the height of the geometry |
| Interpret | Building Measures, Attribute Summary | Footprint area, height and prism volume; the attributes and how often each is given |
| Export | Save Footprints as GeoPackage, Save as GeoParquet | 2D footprints for any GIS; 3D objects for SQL with DuckDB |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-LD2024a"></a>Ledoux, H. and Dukai, B. (2024). CityJSON Specifications 2.0.1. [cityjson.org/specs/2.0.1](https://www.cityjson.org/specs/2.0.1/)

<a id="ref-OGC2012a"></a>Open Geospatial Consortium (2012). OGC City Geography Markup Language (CityGML) Encoding Standard, Version 2.0.0 (OGC 12-019). [docs.ogc.org/is/12-019/12-019.pdf](https://docs.ogc.org/is/12-019/12-019.pdf)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Sat2026a"></a>Sato, K. (2026). EzXML.jl: XML/HTML handling tools for primates. [github.com/JuliaIO/EzXML.jl](https://github.com/JuliaIO/EzXML.jl)

## See Also
- [Overview](overview.md) · [Levels of Detail](levels-of-detail.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [CityGML](citygml.md) · [CityJSON](cityjson.md) · [Measuring Buildings](measuring-buildings.md)
