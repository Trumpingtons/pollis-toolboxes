# Shapefile

## What Is a Shapefile?

A Shapefile is a vector format of the Environmental Systems Research Institute (ESRI), described in its 1998 technical description, that stores nontopological geometry and attributes of features ([Environmental Systems Research Institute (1998)](#ref-ESRI1998a)). Despite its name, a Shapefile is several files with the same name and different extensions: the main file `.shp` with the geometries, the index file `.shx` with the position of each geometry in the main file, and a dBASE table `.dbf` with one row of attributes per feature, in the same order. All three are required. GDAL also reads and writes a `.prj` file with the coordinate system and a `.cpg` file with the character encoding of the attributes ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

## Shape Types and Rings in a Shapefile

All the shapes of a Shapefile that are not null are of one shape type: Point, MultiPoint, PolyLine or Polygon, each also with a measure (M) or with elevation and measure (Z), and MultiPatch for 3D surfaces ([Environmental Systems Research Institute (1998)](#ref-ESRI1998a)). So points and polygons go in separate Shapefiles. A Polygon is one or more rings; the vertices of an outer ring run clockwise and those of a hole counterclockwise, the opposite of the recommendation of GeoJSON ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). GDAL turns rings into polygons and multipolygons by their order and nesting when it reads them, so `ST_Read` returns Simple Features geometries ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

## Limits of the Shapefile Format

The Shapefile format has limits that newer formats do not ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)):

| Limit | Shapefile |
|---|---|
| File size | 2 GB for the `.shp` and for the `.dbf` |
| Field names | At most 10 characters, from the dBASE format |
| Field types | Text, numbers and dates; no time of day |
| Geometry types | One per file |
| Coordinate system | Only in a separate `.prj` file, which may be missing |
| Character encoding | Only in a separate `.cpg` file, which may be missing |

GeoPackage and GeoParquet have none of these limits, and keep the coordinate system inside the file ([Open Geospatial Consortium (2026)](#ref-OGC2026a); [Open Geospatial Consortium (2026)](#ref-OGC2026b)).

## Reading a Shapefile With DuckDB

`ST_Read('file.shp')` of DuckDB's spatial extension reads a Shapefile through GDAL's ESRI Shapefile driver, which finds the `.shx`, `.dbf`, `.prj` and `.cpg` files beside the `.shp` ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). The Shapefile tab of the Geospatial Vector Files panel takes the `.shp` in its File input; the other files must be in the same folder with the same name. Layers and Coordinate System shows whether a `.prj` was found. A Shapefile delivered as a zip archive can be read in place through GDAL's virtual file system, as `/vsizip/archive.zip/file.shp`.

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON format. RFC 7946, Internet Engineering Task Force. [doi:10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-ESRI1998a"></a>Environmental Systems Research Institute (1998). ESRI Shapefile Technical Description. [esri.com](https://www.esri.com/content/dam/esrisites/sitecore-archive/Files/Pdfs/library/whitepapers/pdfs/shapefile.pdf)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OGC2026a"></a>Open Geospatial Consortium (2026). OGC GeoPackage Encoding Standard. [github.com/opengeospatial/geopackage](https://github.com/opengeospatial/geopackage)

<a id="ref-OGC2026b"></a>Open Geospatial Consortium (2026). GeoParquet: specification for storing geospatial vector data in Parquet. [github.com/opengeospatial/geoparquet](https://github.com/opengeospatial/geoparquet)

## See Also
- [File Formats](file-formats.md) · [Diagnostics](diagnostics.md) · [GeoPackage](geopackage.md) · [Decision Guide](decision-guide.md)
