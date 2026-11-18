# Geospatial Vector Files — Decision Guide

## Which Geospatial Vector Format to Choose

| Need | Format | Why |
|---|---|---|
| Share a few thousand features with a web map | GeoJSON | Read by every web mapping library, as plain JSON |
| Keep the layers of a project in one file | GeoPackage | Many layers, each with its coordinate system, and a spatial index |
| Exchange with older GIS software | Shapefile | Read almost everywhere, despite its limits |
| Analyse millions of features | GeoParquet | Compressed columns, read only as needed |
| Serve features by area over the web | FlatGeobuf | Spatial index that a reader uses with HTTP range requests |
| Show placemarks in Google Earth | KML or KMZ | Its own format, with styles and descriptions |
| Record or exchange GPS tracks | GPX | Points with time and elevation, from any GPS device |

## Choosing a Format for Analysis

For analysis, a format that keeps types, records its coordinate system and reads fast serves best. GeoParquet stores geometries as binary in compressed Parquet columns, with the coordinate system in its metadata, and DuckDB reads only the columns and row groups a query needs ([Open Geospatial Consortium (2026)](#ref-OGC2026b); [Apache Software Foundation (2026)](#ref-ASF2026a)). GeoPackage suits work that is edited, such as layers changed in a GIS, as it is a database updated in place ([Open Geospatial Consortium (2026)](#ref-OGC2026a)). GeoJSON, KML and GPX are best converted once, with Save as GeoParquet in the Geospatial Vector Files panel, when they are large or read often.

## Choosing a Format for Sharing

For sharing, the format the receiver reads matters more than speed. GeoJSON is the common format of the web, and its fixed WGS 84 coordinates leave no doubt about the coordinate system ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). A Shapefile is still what many agencies publish and many tools expect, but its field names, file size and single geometry type are limited ([Environmental Systems Research Institute (1998)](#ref-ESRI1998a)). GeoPackage is an open standard of the Open Geospatial Consortium that keeps several layers and their systems in one file, and suits sending a project's data whole ([Open Geospatial Consortium (2026)](#ref-OGC2026a)). KML suits people who will look at the data in Google Earth rather than analyse it ([Wilson (2008)](#ref-Wil2008a)).

## Which Tab of the Geospatial Vector Files Panel to Use

| File | Tab | Inputs to set |
|---|---|---|
| `.geojson`, `.json` | GeoJSON | File |
| `.gpkg` | GeoPackage | File, Layer |
| `.shp`, with `.shx`, `.dbf`, `.prj` | Shapefile | File, File Coordinate System if no `.prj` |
| `.parquet` | GeoParquet, Format GeoParquet | File, Geometry Column |
| `.fgb` | GeoParquet, Format FlatGeobuf | File |
| `.kml`, `.kmz` | KML and KMZ | File |
| `.gpx` | GPX | File, Layer |

All tabs share the Filter, File Coordinate System and Projected Coordinate System inputs. Every tab gives the same `features` table, so the Next Steps work the same on each.

## References

<a id="ref-ASF2026a"></a>Apache Software Foundation (2026). Apache Parquet Format. [github.com/apache/parquet-format](https://github.com/apache/parquet-format)

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON format. RFC 7946, Internet Engineering Task Force. [doi:10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-ESRI1998a"></a>Environmental Systems Research Institute (1998). ESRI Shapefile Technical Description. [esri.com](https://www.esri.com/content/dam/esrisites/sitecore-archive/Files/Pdfs/library/whitepapers/pdfs/shapefile.pdf)

<a id="ref-OGC2026a"></a>Open Geospatial Consortium (2026). OGC GeoPackage Encoding Standard. [github.com/opengeospatial/geopackage](https://github.com/opengeospatial/geopackage)

<a id="ref-OGC2026b"></a>Open Geospatial Consortium (2026). GeoParquet: specification for storing geospatial vector data in Parquet. [github.com/opengeospatial/geoparquet](https://github.com/opengeospatial/geoparquet)

<a id="ref-Wil2008a"></a>Wilson, T. (2008). OGC KML. Open Geospatial Consortium. [ogc.org/standards/kml](https://www.ogc.org/standards/kml/)

## See Also
- [Factsheet](factsheet.md) · [File Formats](file-formats.md) · [Coordinate Reference Systems](coordinate-reference-systems.md) · [Diagnostics](diagnostics.md)
