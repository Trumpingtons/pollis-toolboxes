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

The GeoTIFF standard has two raster spaces, chosen with GTRasterTypeGeoKey: RasterPixelIsArea, where a value describes the whole area of its cell, and RasterPixelIsPoint, where a value is a sample at a point ([Open Geospatial Consortium (2019)](#ref-OGC2019a)). The choice shifts the grid by half a cell, which matters when rasters of different sources are overlaid. GDAL reports it as the metadata item AREA_OR_POINT, and by default moves the georeference of a point raster by half a cell, to the corner of the cell around the first point ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). The GeoTIFF tab sets GDAL's option `GTIFF_POINT_GEO_IGNORE` before it opens a file, so that the georeference of a point raster gives the points as recorded, and then gives `grid` interval lookups centred on those points, the same cells an area raster has ([Schouten (2026)](#ref-Sch2026a)). Elevation models are published both ways, so the raster type is worth checking before combining two of them.

## Why Rasters Are Kept in Projected Coordinates

Elevation models are mostly delivered in a projected coordinate system, in metres, so that a cell is square on the ground and distances and areas come out in metres. A raster in longitude and latitude has cells whose width on the ground shrinks towards the poles, which Reproject to Longitude and Latitude produces only for web maps and global datasets. The map view of Pollis draws in longitude and latitude, so Show on a Map in the Raster Files panel transforms cells with `ST_Transform` of DuckDB's spatial extension before drawing them ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OGC2019a"></a>Open Geospatial Consortium (2019). OGC GeoTIFF Standard, Version 1.1 (OGC 19-008r4). [docs.ogc.org/is/19-008r4/19-008r4.html](https://docs.ogc.org/is/19-008r4/19-008r4.html)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [GeoTIFF](geotiff.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
