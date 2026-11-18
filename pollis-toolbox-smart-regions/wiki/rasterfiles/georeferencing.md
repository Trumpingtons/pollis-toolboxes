# Coordinates and Georeferencing

## How a Geotransform Places a Raster on the Map

GDAL describes the position of a north-up raster with a geotransform of six numbers ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)):

| Position | Meaning |
|---|---|
| 1 | x coordinate of the upper left corner of the upper left cell |
| 2 | Width of a cell, in the units of the coordinate system |
| 3 | Rotation term of the rows, 0 for a north-up raster |
| 4 | y coordinate of the upper left corner of the upper left cell |
| 5 | Rotation term of the columns, 0 for a north-up raster |
| 6 | Height of a cell, negative when the rows run from north to south |

The map coordinates of the corner of column c and row r, both counted from 0, are x = first + c × width + r × rotation and y = fourth + c × rotation + r × height. File Metadata prints the geotransform of the GeoTIFF read.

## How GeoTIFF Stores the Georeference

A GeoTIFF file is a TIFF image with tags that tie raster space to a model coordinate system ([Open Geospatial Consortium (2019)](#ref-OGC2019a)). ModelTiepointTag pairs a cell position with map coordinates, ModelPixelScaleTag gives the size of a cell, and ModelTransformationTag gives a full affine transformation when the grid is rotated. GeoKeys, stored in the GeoKeyDirectoryTag, name the coordinate reference system, usually by its EPSG code: ProjectedCRSGeoKey for a projected system, GeodeticCRSGeoKey for longitude and latitude, and VerticalGeoKey for the reference of heights. GDAL turns these tags into the geotransform and the Well-Known Text that ArchGDAL.jl returns.

## Does a Cell Value Describe an Area or a Point?

The GeoTIFF standard has two raster spaces, chosen with GTRasterTypeGeoKey: RasterPixelIsArea, where a value describes the whole area of its cell, and RasterPixelIsPoint, where a value is a sample at a point ([Open Geospatial Consortium (2019)](#ref-OGC2019a)). The choice shifts the grid by half a cell, which matters when rasters of different sources are overlaid. GDAL reports it as the metadata item AREA_OR_POINT. Rasters.jl reads an area raster with interval lookups, where each cell has two edges, and a point raster with point lookups, the cell centres ([Schouten (2026)](#ref-Sch2026a)). Elevation models are published both ways, so the raster type is worth checking before combining two of them.

## How LAS Stores Coordinates: Scale and Offset

The point records of a LAS file store X, Y and Z as 32-bit integers. The header holds a scale factor and an offset for each axis, and the coordinate is the record value times the scale factor plus the offset ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). A scale factor of 0.01 keeps coordinates to two decimal digits, and 0.001 to three. The offset brings large coordinates, such as northings of millions of metres, within the range of the integers. PointClouds.jl applies the scale and offset in `coordinates`, so the values in `pts` are map coordinates ([Schmid (2026)](#ref-Sch2026b)). Header and Records prints the scale and offset of the file read.

## How LAS Stores the Coordinate System

A LAS file records its coordinate reference system in variable-length records of the header. The LAS 1.4 specification requires Well-Known Text for point data record formats 6 to 10, and keeps the GeoTIFF keys of earlier versions, called legacy, for formats 0 to 5 ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). PointClouds.jl reads either and converts GeoTIFF keys to Well-Known Text ([Schmid (2026)](#ref-Sch2026b)). Some files record no coordinate system at all. The File Coordinate System input of the LAS and LAZ tab then takes an EPSG code, such as EPSG:3763 for ETRS89 / Portugal TM06, which the maps and the saved grids use.

## Why Rasters and Point Clouds Are Kept in Projected Coordinates

Elevation models and lidar surveys are mostly delivered in a projected coordinate system, in metres, so that a cell is square on the ground and distances and areas come out in metres. A raster in longitude and latitude has cells whose width on the ground shrinks towards the poles, which Reproject to Longitude and Latitude produces only for web maps and global datasets. The map view of Pollis draws in longitude and latitude, so Show on a Map transforms cells and points with `ST_Transform` of DuckDB's spatial extension before drawing them ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## References

<a id="ref-ASPRS2025a"></a>American Society for Photogrammetry and Remote Sensing (2025). LAS Specification 1.4, Revision 16. [github.com/ASPRSorg/LAS/releases/tag/1.4.R16](https://github.com/ASPRSorg/LAS/releases/tag/1.4.R16)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OGC2019a"></a>Open Geospatial Consortium (2019). OGC GeoTIFF Standard, Version 1.1 (OGC 19-008r4). [docs.ogc.org/is/19-008r4/19-008r4.html](https://docs.ogc.org/is/19-008r4/19-008r4.html)

<a id="ref-Sch2026b"></a>Schmid, M. F. (2026). PointClouds.jl: fast and flexible processing of lidar point-cloud data. [github.com/efpl-columbia/PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [GeoTIFF](geotiff.md) · [LAS](las.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
