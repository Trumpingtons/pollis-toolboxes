# GPX

## What Is GPX?

GPX, the GPS Exchange Format, is an XML schema for GPS data, published by TopoGrafix; version 1.1 dates from 2004 ([TopoGrafix (2004)](#ref-TG2004a)). It is what GPS receivers, sports watches, phone apps and route planners export and import. A GPX file holds three kinds of data: waypoints (`wpt`), single points of interest; routes (`rte`), ordered lists of route points (`rtept`) that lead to a destination; and tracks (`trk`), ordered lists of points that record where a device went, in one or more track segments (`trkseg`) of track points (`trkpt`). Extensions add data of other schemas, such as heart rate or temperature, inside an `extensions` element.

## Points, Times and Elevations in GPX

Every waypoint, route point and track point of a GPX file has `lat` and `lon` attributes, latitude and longitude in decimal degrees on WGS 84 ([TopoGrafix (2004)](#ref-TG2004a)). Its optional elements include `ele`, the elevation in metres, `time`, in Coordinated Universal Time as an XML Schema date and time, `name`, `desc`, `sym` and the number of satellites and dilution of precision of the fix. A track point's time is when it was recorded, so a track gives speed and pace between points as well as the path. A route usually has no times: it is a plan, where a track is a record.

## How GDAL Reads a GPX File as Layers

GDAL's GPX driver reads a GPX file as five layers ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)):

| Layer | One row per | Geometry |
|---|---|---|
| `waypoints` | Waypoint | Point |
| `routes` | Route | LineString |
| `tracks` | Track | MultiLineString, one line per segment |
| `route_points` | Route point, with its route's number | Point |
| `track_points` | Track point, with its track and segment numbers | Point |

The point layers have columns for `ele`, `time` and the other elements of each point. The Layer input of the GPX tab of the Geospatial Vector Files panel picks one, read with `ST_Read('file.gpx', layer = '...')` ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Working With GPS Tracks in SQL

With the `track_points` layer in a DuckDB table, a track becomes rows ordered by time, which window functions of SQL compare one to the next. `ST_Distance` between consecutive points, transformed to a projected system in metres, gives the length of each step, and the difference of their times gives its duration, from which speed follows ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). `ST_MakeLine` over the ordered points rebuilds the path as a line. The `tracks` layer gives the same path directly, one line per segment. The Extent and Measures action of the Geospatial Vector Files panel measures the length of lines and the extent of points in the Projected Coordinate System input.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-TG2004a"></a>TopoGrafix (2004). GPX 1.1: the GPS Exchange Format. [topografix.com/GPX/1/1](https://www.topografix.com/GPX/1/1/)

## See Also
- [File Formats](file-formats.md) · [KML and KMZ](kml-kmz.md) · [Coordinate Reference Systems](coordinate-reference-systems.md) · [Decision Guide](decision-guide.md)
