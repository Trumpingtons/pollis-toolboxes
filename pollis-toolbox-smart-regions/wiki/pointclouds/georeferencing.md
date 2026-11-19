# Coordinates and Georeferencing

## How LAS Stores Coordinates: Scale and Offset

The point records of a LAS file store X, Y and Z as 32-bit integers. The header holds a scale factor and an offset for each axis, and the coordinate is the record value times the scale factor plus the offset ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). A scale factor of 0.01 keeps coordinates to two decimal digits, and 0.001 to three. The offset brings large coordinates, such as northings of millions of metres, within the range of the integers. PointClouds.jl applies the scale and offset in `coordinates`, so the values in `pts` are map coordinates ([Schmid (2026)](#ref-Sch2026b)). Header and Records prints the scale and offset of the file read.

## How LAS Stores the Coordinate System

A LAS file records its coordinate reference system in variable-length records of the header. The LAS 1.4 specification requires Well-Known Text for point data record formats 6 to 10, and keeps the GeoTIFF keys of earlier versions, called legacy, for formats 0 to 5 ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). PointClouds.jl reads either and converts GeoTIFF keys to Well-Known Text ([Schmid (2026)](#ref-Sch2026b)). Some files record no coordinate system at all. The File Coordinate System input of the Point Cloud Files panel then takes an EPSG code, such as EPSG:3763 for ETRS89 / Portugal TM06, which the maps and the saved grids use.

## Why Point Clouds Are Kept in Projected Coordinates

Lidar surveys are mostly delivered in a projected coordinate system, in metres, so that distances, areas and the cells of the grids made from them come out in metres. The map view of Pollis draws in longitude and latitude, so Show on a Map in the Point Cloud Files panel transforms the points with `ST_Transform` of DuckDB's spatial extension before drawing them ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## References

<a id="ref-ASPRS2025a"></a>American Society for Photogrammetry and Remote Sensing (2025). LAS Specification 1.4, Revision 16. [github.com/ASPRSorg/LAS/releases/tag/1.4.R16](https://github.com/ASPRSorg/LAS/releases/tag/1.4.R16)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Sch2026b"></a>Schmid, M. F. (2026). PointClouds.jl: fast and flexible processing of lidar point-cloud data. [github.com/efpl-columbia/PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl)

## See Also
- [Overview](overview.md) · [LAS](las.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
