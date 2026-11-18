# Geospatial Vector Files — Diagnostics

## What to Check Before Using a Geospatial Vector File

Four checks catch most problems of a vector file before an analysis rests on it. First, the layers: a GeoPackage or KML file may hold several, and the one read by default may not be the one wanted. Second, the coordinate system: a file without one, or with the wrong one, puts features in the wrong place and makes every measure wrong. Third, the geometries: missing, empty or invalid geometries make spatial functions fail or return wrong answers. Fourth, the attributes: their types, ranges and missing values. The Diagnose and Interpret groups of the Next Steps of the Geospatial Vector Files panel run each check on the file read.

## Reading the Layers and Coordinate System of a File

`ST_Read_Meta` of DuckDB's spatial extension returns what GDAL finds in a file: the driver that reads it, and for each layer its name, feature count, geometry fields with their type and coordinate system, and attribute fields with their types ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). The Layers and Coordinate System action of the Geospatial Vector Files panel prints them. A Shapefile with no `.prj` file shows no coordinate system recorded: its system has to be found from whoever published it, and given in the File Coordinate System input. For a GeoParquet file, the File Metadata action prints the geo metadata instead, with the geometry column's encoding, geometry types and coordinate system ([Open Geospatial Consortium (2026)](#ref-OGC2026b)).

## Invalid Geometries and How to Repair Them

A geometry is invalid when it breaks the rules of the Simple Features model: a polygon whose boundary crosses itself, a hole outside its polygon, a ring that is not closed or has too few points. Such geometries come from digitising by hand, from converting between formats and from simplifying shapes. `ST_IsValid` of DuckDB's spatial extension tests a geometry, through GEOS, and `ST_MakeValid` repairs it, for instance by splitting a self-crossing polygon into a multipolygon ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The Geometry Check action of the Geospatial Vector Files panel counts missing, empty and invalid geometries by type, and prints the SQL that repairs invalid ones. Areas, intersections and unions of invalid geometries can be wrong without any error.

## Common Problems of Geospatial Vector Files

| Problem | Sign | Remedy |
|---|---|---|
| No coordinate system | Layers and Coordinate System shows none recorded | Ask the publisher; give it in File Coordinate System |
| Axis order swapped | Points far from where they belong | `SET geometry_always_xy = true` before `ST_Transform` |
| Areas in square degrees | Tiny areas, below one | Measure in a projected system in metres |
| Several layers | Fewer features than expected | Read the other layer by name |
| Mixed geometry types | Geometry Check lists several types | Filter on `ST_GeometryType(geom)` |
| Garbled accented names | Shapefile attributes with odd characters | Check the `.cpg` file of the character encoding |
| Truncated field names | Shapefile names cut at ten characters | Keep the full names in another format |

## Attribute Columns of a Geospatial Vector File

The attribute columns of a vector file carry what the features are: names, codes, counts, dates. Their types depend on the format: GeoJSON and KML store text and numbers as written, a Shapefile's dBASE table has a few fixed types, and GeoPackage, GeoParquet and FlatGeobuf keep integer, real, text, date and time types ([Environmental Systems Research Institute (1998)](#ref-ESRI1998a); [Open Geospatial Consortium (2026)](#ref-OGC2026a)). The Column Summary action of the Geospatial Vector Files panel runs DuckDB's `SUMMARIZE` on the attributes, giving each column's type, minimum, maximum, approximate number of distinct values and share missing ([Raasveldt and Mühleisen (2019)](#ref-RM2019a)). A code column read as numbers loses its leading zeros, which a summary of its minimum shows.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-ESRI1998a"></a>Environmental Systems Research Institute (1998). ESRI Shapefile Technical Description. [esri.com](https://www.esri.com/content/dam/esrisites/sitecore-archive/Files/Pdfs/library/whitepapers/pdfs/shapefile.pdf)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OGC2026a"></a>Open Geospatial Consortium (2026). OGC GeoPackage Encoding Standard. [github.com/opengeospatial/geopackage](https://github.com/opengeospatial/geopackage)

<a id="ref-OGC2026b"></a>Open Geospatial Consortium (2026). GeoParquet: specification for storing geospatial vector data in Parquet. [github.com/opengeospatial/geoparquet](https://github.com/opengeospatial/geoparquet)

<a id="ref-RM2019a"></a>Raasveldt, M. and Mühleisen, H. (2019). DuckDB: an embeddable analytical database. *Proceedings of the 2019 International Conference on Management of Data (SIGMOD)*, 1981–1984. [doi:10.1145/3299869.3320212](https://doi.org/10.1145/3299869.3320212)

## See Also
- [Overview](overview.md) · [Coordinate Reference Systems](coordinate-reference-systems.md) · [Decision Guide](decision-guide.md) · [Shapefile](shapefile.md)
