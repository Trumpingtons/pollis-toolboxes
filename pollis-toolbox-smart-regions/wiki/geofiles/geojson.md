# GeoJSON

## What Is GeoJSON?

GeoJSON is a format for geographic features written as JSON, standardised by the Internet Engineering Task Force as RFC 7946 in 2016 ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). A GeoJSON text is a Geometry, a Feature, or a FeatureCollection of Features. A Feature has a `geometry` member, a `properties` member with the attributes as a JSON object, and an optional `id`. The geometry types are Point, MultiPoint, LineString, MultiLineString, Polygon, MultiPolygon and GeometryCollection. Files usually end in `.geojson` and have the media type `application/geo+json`. GeoJSON is the common format of web mapping libraries and of web services that return features.

## Coordinates and Polygons in GeoJSON

Every GeoJSON coordinate is a position in WGS 84: longitude, then latitude, in decimal degrees, with an optional altitude ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). RFC 7946 removed the `crs` member of the earlier 2008 specification, so a GeoJSON file in another coordinate system does not follow the standard. Polygon rings are closed, their first and last positions equal; the exterior ring should run counterclockwise and holes clockwise, the right-hand rule, though readers are told not to reject files that do otherwise. A geometry that crosses the antimeridian, at 180 degrees, should be cut in two. A `bbox` member may give the extent of a feature or collection.

## Reading GeoJSON With DuckDB

`ST_Read('file.geojson')` of DuckDB's spatial extension reads a GeoJSON file through GDAL's GeoJSON driver, one row per Feature, one column per property and a `geom` column for the geometry ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Properties that differ between Features become columns with missing values where a Feature lacks them. The GeoJSON tab of the Geospatial Vector Files panel reads the File input this way, with the Filter as a SQL condition. Writing back, with `COPY ... (FORMAT GDAL, DRIVER 'GeoJSON')`, gives a FeatureCollection; Save as GeoJSON first transforms the features to WGS 84, as the standard requires.

## Size and Precision of GeoJSON Files

GeoJSON writes each coordinate as decimal text, so a file of many detailed polygons grows large, and every byte is parsed when it is read. RFC 7946 notes that the precision of coordinates has a large effect on size, and that six decimal places of a degree, about ten centimetres, suit most uses ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). GeoJSON has no spatial index, so finding the features in an area reads the whole file. For files of more than some tens of megabytes, or read often, GeoParquet or FlatGeobuf read faster, and the File Formats Side by Side action of the Geospatial Vector Files panel shows by how much for the file read.

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON format. RFC 7946, Internet Engineering Task Force. [doi:10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

## See Also
- [File Formats](file-formats.md) · [Coordinate Reference Systems](coordinate-reference-systems.md) · [GeoParquet and FlatGeobuf](geoparquet-flatgeobuf.md) · [Decision Guide](decision-guide.md)
