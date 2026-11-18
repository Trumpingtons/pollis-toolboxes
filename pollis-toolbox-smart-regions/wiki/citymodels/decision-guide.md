# Decision Guide

## Which Tab of the City Model Files Panel to Use

| File | Tab | Read with |
|---|---|---|
| .gml or .xml whose root is a CityModel, CityGML 1.0, 2.0 or 3.0 | CityGML | EzXML.jl, then DuckDB |
| .city.json or .json whose type is CityJSON | CityJSON | DuckDB's JSON reader |
| .city.jsonl, a sequence of CityJSONFeature objects | Neither, as it is | Join the features into a CityJSON object first |

Both tabs give the same table, `features`, with one row per city object, its attributes as JSON and its geometry as a MultiPolygon Z, so the Next Steps work alike on either ([Ledoux and Dukai (2024)](#ref-LD2024a); [Open Geospatial Consortium (2012)](#ref-OGC2012a)).

## Should a City Model Be Kept in CityGML or CityJSON?

CityJSON and CityGML carry the same data model, so a model can move between them; software exists to convert between the JSON and GML encodings automatically ([Ledoux, Arroyo Ohori, Kumar, Dukai, Labetski and Vitalis (2019)](#ref-LAKDL...2019a)). CityJSON files are around six times smaller on real-world datasets, and simpler to read and write, which suits web applications and programs. CityGML is the encoding the Open Geospatial Consortium standardised ([Open Geospatial Consortium (2012)](#ref-OGC2012a)), and its data model is used by several cities, companies and governments. CityJSON 2.0 implements a subset of the CityGML 3.0 data model, not every extension module ([Ledoux and Dukai (2024)](#ref-LD2024a)), so a model using a module CityJSON lacks stays in CityGML.

## Which Level of Detail to Keep

The level of detail to keep is the one that holds what the work measures. LoD1, the blocks model of prisms with flat roofs, gives footprints and one height per building; LoD2 adds roof structures and boundary surfaces; LoD3 adds doors and windows ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). The CityGML 2.0 standard proposes accuracies of 5 m in LoD1, 2 m in LoD2 and 0.5 m in LoD3, so coarser levels also carry larger errors. Keeping the lowest level of each object gives the same level across a model whose objects reach different highest levels; keeping the highest gives each object its full detail. The Level of Detail input sets which.

## What to Save for Other Tools

Save Footprints as GeoPackage writes each object's footprint in 2D, with its height and area, as a GeoPackage layer through GDAL, which any GIS and the Geospatial Vector Files panel read ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Footprints with heights are enough for maps of building heights and densities. Save as GeoParquet writes the objects with their attributes and 3D geometries as MultiPolygon Z, for SQL with DuckDB, which queries GeoParquet files directly ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Neither keeps the semantics of boundary surfaces or the appearance of the model, so the CityGML or CityJSON file stays the source.

## Choosing a Coordinate System for Measures

Areas and volumes come out in the units of the coordinate system of the file, so a projected system in metres gives square and cubic metres. CityGML geometries are in a 3D coordinate system, often given as the srsName of the model's envelope, and a CityJSON file gives one for all its objects in metadata.referenceSystem, which should be three-dimensional ([Open Geospatial Consortium (2012)](#ref-OGC2012a); [Ledoux and Dukai (2024)](#ref-LD2024a)). A file in longitude and latitude would give areas in square degrees, which are not comparable across a model; such a model should be transformed to a projected system before measuring.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-LAKDL...2019a"></a>Ledoux, H., Arroyo Ohori, K., Kumar, K., Dukai, B., Labetski, A. and Vitalis, S. (2019). CityJSON: a compact and easy-to-use encoding of the CityGML data model. *Open Geospatial Data, Software and Standards*, 4(1), 4. [doi:10.1186/s40965-019-0064-0](https://doi.org/10.1186/s40965-019-0064-0)

<a id="ref-LD2024a"></a>Ledoux, H. and Dukai, B. (2024). CityJSON Specifications 2.0.1. [cityjson.org/specs/2.0.1](https://www.cityjson.org/specs/2.0.1/)

<a id="ref-OGC2012a"></a>Open Geospatial Consortium (2012). OGC City Geography Markup Language (CityGML) Encoding Standard, Version 2.0.0 (OGC 12-019). [docs.ogc.org/is/12-019/12-019.pdf](https://docs.ogc.org/is/12-019/12-019.pdf)

## See Also
- [Factsheet](factsheet.md) · [CityGML](citygml.md) · [CityJSON](cityjson.md) · [Levels of Detail](levels-of-detail.md) · [Measuring Buildings](measuring-buildings.md)
