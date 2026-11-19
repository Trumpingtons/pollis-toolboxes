# Point Cloud Files — Factsheet

**Point clouds** hold measured points, each with its own coordinates, such as the returns of an airborne laser scan. The Point Cloud Files panel of the Smart Regions Toolbox reads LAS and LAZ files with PointClouds.jl ([Schmid (2026)](#ref-Sch2026b)), and writes the elevation grids it makes from them with Rasters.jl ([Schouten (2026)](#ref-Sch2026a)).

| Item | Point Cloud Files panel |
|---|---|
| **Purpose** | Read, check, summarise and convert lidar files from Julia |
| **Input** | A LAS or LAZ file |
| **Core packages** | [PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl) |
| **Tabs** | LAS and LAZ |
| **Output** | A Tables.jl table of points named `pts` |
| **Key choices** | How many points to read, the coordinate system if the file records none, and the cell size of grids |

## How Does the Point Cloud Files Panel Read a LAS or LAZ File?

The LAS and LAZ tab of the Point Cloud Files panel opens the file with `LAS(path)` of PointClouds.jl, which reads the header at once and the point records when they are used, decompressing them first when the file is LAZ ([Schmid (2026)](#ref-Sch2026b)). The Read Every input keeps every point, or every second or tenth point of a large file. The coordinates, classification, intensity and return numbers of the points kept become `pts`, a Tables.jl table with one row per point. The coordinate system comes from the file's variable-length records, or from the File Coordinate System input when the file records none.

## What the Next Steps of the Point Cloud Files Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Plot the Points, Cross-Section, Show on a Map | The cloud from above, a profile coloured by class, points on a base map |
| Diagnose | Header and Records, Classes and Returns, Point Density | The header, the classes and returns, points per square unit |
| Compare | Classes Side by Side | Height and intensity of each class |
| Interpret | Surface and Terrain Grids | Surface model, terrain model and height above ground |
| Export | Save Elevation Grids as GeoTIFF, Save as GeoParquet | Grids for the Raster Files panel; points for SQL with DuckDB |

## References

<a id="ref-Sch2026b"></a>Schmid, M. F. (2026). PointClouds.jl: fast and flexible processing of lidar point-cloud data. [github.com/efpl-columbia/PointClouds.jl](https://github.com/efpl-columbia/PointClouds.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [Coordinates and Georeferencing](georeferencing.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [LAS](las.md) · [LAZ](laz.md) · [Elevation Models From Point Clouds](elevation-models.md)
