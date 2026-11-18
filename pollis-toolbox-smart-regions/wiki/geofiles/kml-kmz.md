# KML and KMZ

## What Is KML?

KML is an XML language for showing geographic data in Earth browsers and maps: placemarks, lines and areas with their names, descriptions and styles. It was made for Google Earth, under its earlier name Keyhole Markup Language, and became a standard of the Open Geospatial Consortium in 2008, OGC KML 2.2 ([Wilson (2008)](#ref-Wil2008a)). A KML file is a `Document` of `Folder`s and `Placemark`s; each Placemark has a geometry (Point, LineString, LinearRing, Polygon or MultiGeometry), a `name`, a `description` and optional `ExtendedData`. Styles set colours, icons and line widths, and elements such as `GroundOverlay` place images on the ground. KML describes how data is shown as much as the data itself.

## Coordinates in KML

KML coordinates are always longitude, latitude and an optional altitude, in that order, on WGS 84, written as comma-separated tuples separated by spaces ([Wilson (2008)](#ref-Wil2008a)). An `altitudeMode` says how the altitude is read: `clampToGround` ignores it and puts the geometry on the terrain, `relativeToGround` measures it from the terrain, and `absolute` from sea level. As in GeoJSON, a KML file in another coordinate system does not follow the standard, so the File Coordinate System input of the Geospatial Vector Files panel stays `EPSG:4326` for KML and KMZ files.

## What Is a KMZ File?

A KMZ file is a KML file zipped, with the images, icons and other files it refers to in the same archive ([Wilson (2008)](#ref-Wil2008a)). The main KML file is at the root of the archive, by convention named `doc.kml`. GDAL reads a file inside a zip archive through its virtual file system, with a path such as `/vsizip/places.kmz/doc.kml` ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)), which the KML and KMZ tab of the Geospatial Vector Files panel builds when the File input ends in `.kmz`. A KMZ whose main file has another name is read by giving that name after the archive in the same way.

## Reading KML With DuckDB

`ST_Read('file.kml')` of DuckDB's spatial extension reads a KML file through GDAL's KML driver, one row per Placemark with `Name` and `Description` columns and the geometry ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Each Folder of the file becomes a layer, which Layers and Coordinate System lists; styles and overlays are not read. GDAL also has a LIBKML driver that reads more of KML, but DuckDB's spatial extension is built with the KML driver, as `ST_Drivers()` shows. `COPY ... (FORMAT GDAL, DRIVER 'KML')` writes features as Placemarks, for opening in Google Earth.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Wil2008a"></a>Wilson, T. (2008). OGC KML. Open Geospatial Consortium. [ogc.org/standards/kml](https://www.ogc.org/standards/kml/)

## See Also
- [File Formats](file-formats.md) · [GeoJSON](geojson.md) · [GPX](gpx.md) · [Decision Guide](decision-guide.md)
