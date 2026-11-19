# Diagnostics

## A Coordinate System That Is Missing or Wrong

A point cloud whose file records no coordinate system can still be read, but it cannot be placed on a map or combined with other layers. Header and Records prints the name of the coordinate system found, or none recorded. The publisher's documentation then gives the system, and the File Coordinate System input of the Point Cloud Files panel takes its EPSG code. A file whose coordinates do not match its declared system, such as eastings of hundreds of thousands of metres labelled as longitude and latitude, shows itself on Show on a Map, where the points land far from where they belong.

## Classes and Returns of a Point Cloud

Classes and Returns counts the points of each ASPRS class and of each pair of return number and number of returns ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). A file in which every point is class 0 or 1 has not been classified, so a terrain model needs a ground classification first. Classes 7 and 18, low and high noise, mark points that are errors of the measurement, such as returns from birds or multipath, and are usually left out of every analysis. Return numbers of 0, or pulses with more returns than the scanner records, point to a file whose return fields were not filled.

## Point Density and Gaps in Coverage

Point Density counts the points that fall in each cell of the Cell Size input and divides by the area of the cell, giving points per square unit ([Schmid (2026)](#ref-Sch2026b)). The mean density says how much detail the survey resolves, and the share of empty cells says where it does not: water absorbs most laser pulses, and flight lines that do not overlap leave strips without points. A cell size at which most cells are empty is too small for grids from that cloud: the Surface and Terrain Grids action reports the cells without points and without ground points at the same cell size.

## Reading Part of a Large File

A national lidar tile can hold tens of millions of points. The Read Every input of the Point Cloud Files panel keeps every n-th point, a regular thinning that keeps the extent and the proportions of the classes for a first look.

## References

<a id="ref-ASPRS2025a"></a>American Society for Photogrammetry and Remote Sensing (2025). LAS Specification 1.4, Revision 16. [github.com/ASPRSorg/LAS/releases/tag/1.4.R16](https://github.com/ASPRSorg/LAS/releases/tag/1.4.R16)

<a id="ref-Sch2026b"></a>Schmid, M. F. (2026). PointClouds.jl: fast and flexible processing of lidar point-cloud data. [github.com/efpl-columbia/PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl)

## See Also
- [Coordinates and Georeferencing](georeferencing.md) · [LAS](las.md) · [Elevation Models From Point Clouds](elevation-models.md) · [Decision Guide](decision-guide.md)
