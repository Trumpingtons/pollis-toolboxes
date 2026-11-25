# Terrain Model from Point Cloud — Point Cloud Files

## LAS and LAZ Files

LAS is the open format of the American Society for Photogrammetry and Remote Sensing for exchanging point cloud data, from lidar or other sources, between hardware and software ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). A LAS file has a header, with the number of points, their bounds and their coordinate system, and then a record for each point. LAZ is LAS compressed without loss by LASzip ([Isenburg (2013)](#ref-Ise2013a)). Terrain Model from Point Cloud reads LAS and LAZ files with PDAL ([Butler, Chambers, Hartzell and Glennie (2021)](#ref-BCHG2021a)), writes the points of the area as one LAZ file, and reads that file into Julia with LazIO.jl ([Pronk (2026b)](#ref-Pro2026b)).

## The Classes of a LAS File

| Class | Meaning in the LAS specification | In Terrain Model from Point Cloud |
|---|---|---|
| 0, 1 | Never classified; unclassified | Read by Zhang's Filter and Pingel's Filter |
| 2 | Ground | Survey's Ground |
| 3, 4, 5 | Low, medium and high vegetation | Read by Zhang's Filter and Pingel's Filter |
| 6 | Building | Read by Zhang's Filter and Pingel's Filter |
| 7 | Low point (noise) | Left out of every grid |
| 8 | Model key point in LAS 1.0 to 1.3, reserved in LAS 1.4 | Survey's Ground |
| 9 | Water | Read by Zhang's Filter and Pingel's Filter |
| 18 | High noise | Left out of every grid |

The classes are those of the LAS specification ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). Point Cloud, Step 1, prints the number of points of each class.

## COPC Files Read Over the Web

A Cloud Optimized Point Cloud, COPC, is a LAZ file whose points are ordered in an octree, so that a program can read over the web only the parts it needs: a geospatial, compressed, range-readable, LAZ-compatible point cloud format ([Hobu, Inc. (2021)](#ref-Hob2021a)). Each level of the tree holds points farther apart than the level below. Terrain Model from Point Cloud recognises a COPC file by its ending, `.copc.laz`, and PDAL reads from it only the points within the Area. With a Resolution in metres, PDAL reads only down to the level of the tree where the points are that far apart, which gives fewer points, more quickly. Every other LAS or LAZ file on the web is downloaded whole, once.

## Tile Indexes

A large survey is published in tiles, often squares of a few hundred metres to a few kilometres, with a tile index: a vector file with a polygon for each tile and a field giving its file or address. Terrain Model from Point Cloud reads the tile index with ArchGDAL.jl ([Ng (2026)](#ref-Ng2026a); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)), keeps the tiles whose polygons cross the Area, and passes their field URL to PDAL. A shapefile, a GeoPackage or a zipped shapefile can be given as the Source. The Area of a tile index is in the coordinates of the index.

## The Coordinate System of the Points

The header of a LAS file holds the coordinate system of its points, as well-known text. Terrain Model from Point Cloud reads it with PDAL and stops when there is none, or when it is not projected, since the cells and the Distance are in metres. The terrain model keeps the coordinate system of the points, by its EPSG code when it has one, so it lies on the same grid as other data of the area in that system. The heights are kept as the points give them, above the ellipsoid or above a geoid, as the survey's documentation states.

## References

<a id="ref-ASPRS2025a"></a>American Society for Photogrammetry and Remote Sensing (2025). LAS Specification 1.4, Revision 16. [github.com/ASPRSorg/LAS](https://github.com/ASPRSorg/LAS/releases/tag/1.4.R16)

<a id="ref-BCHG2021a"></a>Butler, H., Chambers, B., Hartzell, P. and Glennie, C. (2021). PDAL: an open source library for the processing and analysis of point clouds. *Computers & Geosciences* 148, 104680. [doi:10.1016/j.cageo.2020.104680](https://doi.org/10.1016/j.cageo.2020.104680)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Hob2021a"></a>Hobu, Inc. (2021). Cloud Optimized Point Cloud Specification 1.0. [copc.io](https://copc.io)

<a id="ref-Ise2013a"></a>Isenburg, M. (2013). LASzip: lossless compression of LiDAR data. *Photogrammetric Engineering and Remote Sensing* 79(2), 209–217. [doi:10.14358/PERS.79.2.209](https://doi.org/10.14358/PERS.79.2.209)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Pro2026b"></a>Pronk, M. (2026b). LazIO.jl: extends LasIO with LASzip integration. [github.com/evetion/LazIO.jl](https://github.com/evetion/LazIO.jl)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [Ground Filters](ground-filters.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
