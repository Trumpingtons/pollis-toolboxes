# CityJSON

## What Is CityJSON?

CityJSON is a JSON-based exchange format for the CityGML data model, designed with programmers in mind so that software supporting it can be built quickly ([Ledoux, Arroyo Ohori, Kumar, Dukai, Labetski and Vitalis (2019)](#ref-LAKDL...2019a)). Its authors argue that the XML encoding of CityGML makes parsers hard to write, and designed CityJSON to be compact, with a compression factor of around six on real-world datasets, and friendly for web and mobile development. The CityJSON Specifications 2.0.1 of 2024 implement a subset of the CityGML 3.0 data model, with an extension mechanism of their own ([Ledoux and Dukai (2024)](#ref-LD2024a)). A file holding one CityJSON object may have the extension .city.json.

## Vertices and the Transform

A CityJSON object stores every vertex of the model once, in the array vertices, and geometries point to vertices by their position in it, counted from 0, as in the Wavefront OBJ format ([Ledoux and Dukai (2024)](#ref-LD2024a)). To keep files small and coordinates to a fixed number of digits, vertices are integers, and the mandatory transform gives a scale and a translate for each axis: the real coordinate is the integer times the scale plus the translate. A scale of 0.001 keeps three digits, millimetres when the coordinate system is in metres. The CityJSON tab of the City Model Files panel applies the transform in SQL, with `list_transform`, before building any geometry.

## City Objects, Parents and Children

The CityObjects member of a CityJSON object maps each object's identifier to the object, which must have a type and may have a geometry, attributes, a geographical extent, children and parents ([Ledoux and Dukai (2024)](#ref-LD2024a)). First-level objects, such as Building, can exist by themselves; second-level objects, such as BuildingPart or BuildingInstallation, need a parent, because the CityGML schema has been flattened. A parent lists its direct children by identifier, and each child its parents. The CityJSON tab reads every object with geometry, first-level or not, and File Contents shows on which types of object a file puts its geometry; the Object Type input then keeps one type, such as BuildingPart.

## Geometry Objects and Their Boundaries

A CityJSON geometry object has a type, MultiPoint, MultiLineString, MultiSurface, CompositeSurface, Solid, MultiSolid, CompositeSolid or GeometryInstance, a level of detail written as a string, and boundaries: a hierarchy of arrays of vertex indices whose depth depends on the type ([Ledoux and Dukai (2024)](#ref-LD2024a)). A surface is an array of rings, the exterior first; a solid is an array of shells, each an array of surfaces. Only linear and planar primitives are allowed, no curves. The CityJSON tab reads the surface and solid types, flattens a solid's shells into their surfaces, and writes one polygon per surface into a MultiPolygon Z with `ST_GeomFromText` ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## How the CityJSON Tab Reads a File

The CityJSON tab of the City Model Files panel reads a file with DuckDB's `read_json`, as a single record whose columns are the version, metadata, transform, the CityObjects as a map from identifier to JSON, and the vertices as a list of integer triples ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)). SQL then unnests the map into one row per object and one per geometry, keeps the geometry of the highest or the lowest level of detail of each object, and builds the polygons from the vertex indices. The whole file is read at once, up to 1 GB, and a gzipped file, ending in `.gz`, is read as it is, without unpacking it first. The coordinate system is the EPSG code at the end of metadata.referenceSystem.

## Large Files and CityJSON Features

The CityJSON specifications advise keeping files small, as files of several hundred megabytes are hard to visualise and process ([Ledoux and Dukai (2024)](#ref-LD2024a)). A large area can be divided into tiles or regions, each a CityJSON file of reasonable size. Another way is a JSON text sequence of CityJSONFeature objects, one per line, each holding a single first-level object with its children and its own local vertices. The CityJSON tab reads files holding one CityJSON object; a tile of a tiled dataset is such a file.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-LAKDL...2019a"></a>Ledoux, H., Arroyo Ohori, K., Kumar, K., Dukai, B., Labetski, A. and Vitalis, S. (2019). CityJSON: a compact and easy-to-use encoding of the CityGML data model. *Open Geospatial Data, Software and Standards*, 4(1), 4. [doi:10.1186/s40965-019-0064-0](https://doi.org/10.1186/s40965-019-0064-0)

<a id="ref-LD2024a"></a>Ledoux, H. and Dukai, B. (2024). CityJSON Specifications 2.0.1. [cityjson.org/specs/2.0.1](https://www.cityjson.org/specs/2.0.1/)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [CityGML](citygml.md) · [Levels of Detail](levels-of-detail.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
