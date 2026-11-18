# LAS

## What Is the LAS Format?

LAS, the LASer file format, is the public file format of the American Society for Photogrammetry and Remote Sensing for point cloud data, from lidar or other sources. Software combines GPS, inertial and laser range measurements into points with X, Y and Z coordinates, and LAS gives different hardware and software a common format to exchange them ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). Version 1.4 is the one in common use; its revisions clarify the text without changing the format. National mapping agencies publish their airborne lidar surveys as LAS, or as LAZ, its compressed form.

## The Parts of a LAS File

A LAS file has four parts ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)):

| Part | What it holds |
|---|---|
| Public header block | Version, point data record format, number of points by return, scale factors, offsets, extent, the software that wrote the file and the date |
| Variable-length records | The coordinate reference system and other metadata, each record with a user id and a record id |
| Point data records | One record per point, in one of the point data record formats |
| Extended variable-length records | Large metadata after the points, such as waveform data |

Header and Records prints the header and lists the variable-length records of the file read.

## Point Data Record Formats

LAS 1.4 defines point data record formats 0 to 10, which differ in the attributes each point carries ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). Every format has X, Y and Z, intensity, the return number and number of returns, the classification, the scan angle and the point source id. Formats 1 and 3 to 10 add the GPS time of the pulse; 2, 3, 5, 7, 8 and 10 add red, green and blue; 8 and 10 add near infrared; 4, 5, 9 and 10 point to waveform data. Formats 0 to 5 are legacy formats; 6 to 10, introduced in LAS 1.4, allow up to 15 returns per pulse and 256 classes. PointClouds.jl reads and writes LAS files of versions 1.0 to 1.4 ([Schmid (2026)](#ref-Sch2026b)).

## The ASPRS Classification Codes

The classification of a point says what the point hit. LAS 1.4 defines these codes for formats 6 to 10 ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)):

| Code | Class |
|---|---|
| 0, 1 | Created and never classified; unclassified |
| 2 | Ground |
| 3, 4, 5 | Low, medium and high vegetation |
| 6 | Building |
| 7, 18 | Low point (noise); high noise |
| 9, 10, 11 | Water; rail; road surface |
| 13, 14, 15, 16 | Wire guard; wire conductor; transmission tower; wire-structure connector |
| 17, 19 | Bridge deck; overhead structure |
| 20, 21, 22 | Ignored ground; snow; temporal exclusion |
| 64 to 255 | Defined by the user |

Classes and Returns counts the points of each code in the file read.

## Returns and Intensity of Lidar Points

A laser pulse can produce several returns as it meets objects on its way down: the first return from the top of a tree, intermediate returns from branches, and the last return from the ground. Each point records its return number and the number of returns of its pulse ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). Single returns usually come from solid surfaces, roofs and open ground; multiple returns from vegetation, edges and wires. The intensity is the strength of the return, which depends on the material, the angle and the distance; PointClouds.jl returns it as a number from 0 to 1 ([Schmid (2026)](#ref-Sch2026b)). Classes Side by Side compares the mean intensity of the classes of the file read.

## Reading a LAS File With PointClouds.jl

`LAS(path)` of PointClouds.jl reads the header and records of a LAS file, and the points lazily ([Schmid (2026)](#ref-Sch2026b)). `length(las)` is the number of points; `coordinates(las, range)` gives their x, y and z with the scale and offset applied; `classification`, `intensity`, `return_number` and `return_count` give the other attributes. `getcrs(String, las)` gives the coordinate system as Well-Known Text. The LAS and LAZ tab of the Raster and Point Cloud Files panel collects these into the table `pts`, one row per point, which Tables.jl and DuckDB read.

## References

<a id="ref-ASPRS2025a"></a>American Society for Photogrammetry and Remote Sensing (2025). LAS Specification 1.4, Revision 16. [github.com/ASPRSorg/LAS/releases/tag/1.4.R16](https://github.com/ASPRSorg/LAS/releases/tag/1.4.R16)

<a id="ref-Sch2026b"></a>Schmid, M. F. (2026). PointClouds.jl: fast and flexible processing of lidar point-cloud data. [github.com/efpl-columbia/PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl)

## See Also
- [LAZ](laz.md) · [Elevation Models From Point Clouds](elevation-models.md) · [Coordinates and Georeferencing](georeferencing.md) · [Diagnostics](diagnostics.md)
