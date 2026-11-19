# LAZ

## What Is a LAZ File?

A LAZ file is a LAS file compressed with LASzip, a lossless compressor for lidar point clouds published by Isenburg ([Isenburg (2013)](#ref-Ise2013a)). Lossless means that decompressing a LAZ file gives back the LAS file bit for bit: the same header, variable-length records and point attributes. LAZ is how national mapping agencies and data portals publish large lidar surveys. A file ending in .laz holds the same point data record formats, classes and coordinate system records as one ending in .las.

## Reading a LAZ File With PointClouds.jl

PointClouds.jl reads a LAZ file with the same `LAS(path)` as a LAS file, and decompresses the points as they are read ([Schmid (2026)](#ref-Sch2026b)). The accessor functions, `coordinates`, `classification`, `intensity` and the others, then work as on a LAS file, so the LAS and LAZ tab of the Point Cloud Files panel reads either with the same code. Header and Records names the format of the file read, LAS or LAZ (compressed). PointClouds.jl can also read a LAZ file from a web address, downloading it to a local cache first.

## LAS or LAZ: Disk Space Against Reading Time

A LAZ file takes a fraction of the disk space of the same LAS file, at the cost of the processor time to decompress it each time it is read ([Isenburg (2013)](#ref-Ise2013a)). For archives and downloads, LAZ is the better choice: storage and transfer cost more than decompression. For a cloud read many times by a program that is slow at decompressing, a LAS copy can pay off. Read Every in the LAS and LAZ tab thins a large LAZ file for a first look, but every point is still decompressed on the way.

## Converting Between LAS and LAZ

PointClouds.jl writes LAS files with `write(path, las)`, and Save Elevation Grids as GeoTIFF and Save as GeoParquet write what the LAS and LAZ tab computes from either format ([Schmid (2026)](#ref-Sch2026b)). To compress a LAS file into LAZ, or to decompress a LAZ file, the tools of the LASzip project convert between the two without loss ([Isenburg (2013)](#ref-Ise2013a)). Since LAZ is lossless, a file can go from LAZ to LAS and back any number of times without changing a single point.

## References

<a id="ref-Ise2013a"></a>Isenburg, M. (2013). LASzip. *Photogrammetric Engineering and Remote Sensing*, 79(2), 209–217. [doi:10.14358/PERS.79.2.209](https://doi.org/10.14358/PERS.79.2.209)

<a id="ref-Sch2026b"></a>Schmid, M. F. (2026). PointClouds.jl: fast and flexible processing of lidar point-cloud data. [github.com/efpl-columbia/PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl)

## See Also
- [LAS](las.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Cloud-Optimised GeoTIFF](cloud-optimised-geotiff.md)
