# Geospatial Vector Files — Coordinate Reference Systems

## What Is a Coordinate Reference System?

A coordinate reference system says what the numbers of a geometry mean on the Earth. A geographic system gives longitude and latitude in degrees on an ellipsoid, such as WGS 84, the system of GPS. A projected system flattens part of the Earth onto a plane and gives coordinates in metres east and north of an origin. The same place has different coordinates in each system, and PROJ, the library DuckDB's spatial extension uses, converts coordinates from one system to another ([PROJ Contributors (2026)](#ref-PROJC2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Systems are usually named by an authority and a code: `EPSG:4326` is WGS 84 in degrees, and `OGC:CRS84` is the same system with longitude first.

## Which Coordinate System Does Each Vector Format Use?

GeoJSON coordinates are always WGS 84 longitude and latitude in decimal degrees, longitude first; the earlier `crs` member was removed from the format ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a)). KML and GPX also fix WGS 84 ([Wilson (2008)](#ref-Wil2008a); [TopoGrafix (2004)](#ref-TG2004a)). A GeoPackage records a coordinate system for each layer in its `gpkg_spatial_ref_sys` table ([Open Geospatial Consortium (2026)](#ref-OGC2026a)). A GeoParquet file gives each geometry column's system in its geo metadata, as PROJJSON, and a column without one is `OGC:CRS84` ([Open Geospatial Consortium (2026)](#ref-OGC2026b)). A FlatGeobuf file stores it in its header ([FlatGeobuf Contributors (2026)](#ref-FGC2026a)). A Shapefile keeps it in a separate `.prj` file, which GDAL reads and writes ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)); without one, the system is unknown.

## Axis Order: Longitude First or Latitude First?

The definition of `EPSG:4326` puts latitude first, while GeoJSON, KML, GeoParquet and most software put longitude first ([Butler, Daly, Doyle, Gillies, Hagen and Schaub (2016)](#ref-BDDGH...2016a); [Open Geospatial Consortium (2026)](#ref-OGC2026b)). PROJ follows each system's own axis order ([PROJ Contributors (2026)](#ref-PROJC2026a)), so a transformation from `EPSG:4326` can read the coordinates of a longitude-first file the wrong way round, and move every point to another continent or fail. DuckDB's spatial extension has the setting `geometry_always_xy`: set to true, `ST_Transform` always takes and returns x as longitude (or easting) and y as latitude (or northing) ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The Example Code of the Geospatial Vector Files panel sets it at the start, so the File Coordinate System input can be `EPSG:4326` for any longitude-first file.

## Why Measure Areas and Lengths in a Projected System?

`ST_Area`, `ST_Length` and `ST_Perimeter` compute on the plane, in the units of the coordinates ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). On longitude and latitude, the result is in square degrees or degrees, and a degree of longitude shrinks from about 111 kilometres at the equator to nothing at the poles, so the number has no fixed meaning on the ground. Transforming the geometries to a projected system in metres first gives areas in square metres and lengths in metres. An equal-area projection keeps every area exact; a conformal one, such as Transverse Mercator or a UTM zone, keeps shapes and distances close over a region of a few hundred kilometres. The Extent and Measures action of the Geospatial Vector Files panel transforms to the Projected Coordinate System input before measuring.

## Projected Coordinate Systems for Europe and Portugal

| Code | Name | Kind | Suited to |
|---|---|---|---|
| `EPSG:3035` | ETRS89-extended / LAEA Europe | Lambert azimuthal equal-area | Areas anywhere in Europe, statistical grids |
| `EPSG:3763` | ETRS89 / Portugal TM06 | Transverse Mercator | Mainland Portugal, its official national system |
| `EPSG:32629` | WGS 84 / UTM zone 29N | Transverse Mercator | A band 6 degrees wide, from 12 to 6 degrees west |
| `EPSG:3857` | WGS 84 / Pseudo-Mercator | Web Mercator | Web map tiles only: areas grow towards the poles |

The codes come from the EPSG dataset, which PROJ uses to look up each system's definition ([PROJ Contributors (2026)](#ref-PROJC2026a)).

## References

<a id="ref-BDDGH...2016a"></a>Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S. and Schaub, T. (2016). The GeoJSON format. RFC 7946, Internet Engineering Task Force. [doi:10.17487/RFC7946](https://doi.org/10.17487/RFC7946)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-FGC2026a"></a>FlatGeobuf Contributors (2026). FlatGeobuf: a performant binary encoding for geographic data based on flatbuffers. [github.com/flatgeobuf/flatgeobuf](https://github.com/flatgeobuf/flatgeobuf)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OGC2026a"></a>Open Geospatial Consortium (2026). OGC GeoPackage Encoding Standard. [github.com/opengeospatial/geopackage](https://github.com/opengeospatial/geopackage)

<a id="ref-OGC2026b"></a>Open Geospatial Consortium (2026). GeoParquet: specification for storing geospatial vector data in Parquet. [github.com/opengeospatial/geoparquet](https://github.com/opengeospatial/geoparquet)

<a id="ref-PROJC2026a"></a>PROJ Contributors (2026). PROJ: cartographic projections and coordinate transformations library. [github.com/OSGeo/PROJ](https://github.com/OSGeo/PROJ)

<a id="ref-TG2004a"></a>TopoGrafix (2004). GPX 1.1: the GPS Exchange Format. [topografix.com/GPX/1/1](https://www.topografix.com/GPX/1/1/)

<a id="ref-Wil2008a"></a>Wilson, T. (2008). OGC KML. Open Geospatial Consortium. [ogc.org/standards/kml](https://www.ogc.org/standards/kml/)

## See Also
- [Overview](overview.md) · [File Formats](file-formats.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
