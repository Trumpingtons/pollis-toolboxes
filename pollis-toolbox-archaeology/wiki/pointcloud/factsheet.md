# Terrain Model from Point Cloud — Factsheet

**A terrain model from a point cloud** is a grid of the height of the bare ground, made from the points a lidar survey measured. The Terrain Model from Point Cloud panel of the Archaeology Toolbox makes one in Julia, in five steps. PDAL reads and gathers the points ([Butler, Chambers, Hartzell and Glennie (2021)](#ref-BCHG2021a)), LazIO.jl reads them into Julia ([Pronk (2026b)](#ref-Pro2026b)), Geomorphometry.jl finds the ground again ([Pronk and Schouten (2026)](#ref-PS2026a)), NearestNeighbors.jl fills the gaps ([Carlsson (2026)](#ref-Car2026a)), and Rasters.jl and ArchGDAL.jl write the result ([Schouten (2026a)](#ref-Sch2026a); [Ng (2026)](#ref-Ng2026a)).

| Item | Terrain Model from Point Cloud panel |
|---|---|
| **Purpose** | Make a bare-earth terrain model from the points of a lidar survey, for archaeological prospection |
| **Input** | A LAS or LAZ file, local or on the web, a folder of them, a tile index with an area, or a COPC file on the web; in a projected coordinate system in metres |
| **Core packages** | [ArchaeologicalDetection.jl](https://github.com/Trumpingtons/ArchaeologicalDetection.jl), [PDAL_jll.jl](https://github.com/JuliaBinaryWrappers/PDAL_jll.jl), [LazIO.jl](https://github.com/evetion/LazIO.jl), [Geomorphometry.jl](https://github.com/Deltares/Geomorphometry.jl), [NearestNeighbors.jl](https://github.com/KristofferC/NearestNeighbors.jl), [SmartRegions.jl](https://github.com/Trumpingtons/SmartRegions.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl) |
| **Steps** | Point Cloud; Ground; Fill the Gaps; Check the Terrain Model; Save the Terrain Model |
| **Output** | `dem`, a `Raster` of heights on cells of the Cell Size, north up; `density`, the ground points a square metre of each cell; and the file `<name>-dtm.tif`, a Cloud-Optimised GeoTIFF |
| **Key choices** | The survey's ground or a filter, the Cell Size, the Window and Slope of a filter, and the Distance up to which gaps are filled |

## How Terrain Model from Point Cloud Computes the Terrain Model

| Step | Function | Computation |
|---|---|---|
| 1. Point Cloud | `index_tiles`, `fetch_points`, `point_cloud_summary`, `read_points`, `point_classes` | The tiles of a tile index that cross the Area; the points of every source within the Area gathered by PDAL into one LAZ file in the Folder; its coordinate system checked; the points read, and counted by class |
| 2. Ground | `ground_grid` or `find_ground` | Survey's Ground: the lowest point of classes 2 and 8 in each cell. Zhang's Filter or Pingel's Filter: the lowest point of each cell but noise, kept where the filter takes it for ground |
| 3. Fill the Gaps | `fill_gaps`, `terrain_raster` | Each cell without ground given the mean height of the Neighbours nearest cells with ground, weighted by the inverse square of their distance, when the nearest is within the Distance; the grid turned into a `Raster`, north up |

## How Terrain Model from Point Cloud Shows and Saves the Terrain Model

| Step | Function | Computation |
|---|---|---|
| 4. Check the Terrain Model | `ground_density`, `terrain_maps` | The ground points a square metre of each cell. Zoom and Pan: the shaded relief of the terrain model, the ground points a square metre and the filled cells, side by side with aerial or satellite imagery of the same ground, with a scale bar, moving together, on the whole area, with a button that goes to the square of the Zoom Size around the Zoom Centre and back. The imagery comes from Google or Esri, with the user's own key, or from EOX's Sentinel-2 cloudless of 2016, open but in cells of 10 m, as Imagery chooses; its server learns where the survey is. |
| 5. Save the Terrain Model | `write` | The terrain model as a Cloud-Optimised GeoTIFF with DEFLATE compression, its empty cells NaN, named after the Name and kept in the Folder, where Relief Visualisation, Candidate Features and Learned Detection in Lidar read it |

## How the Steps of Terrain Model from Point Cloud Run

Each step of Terrain Model from Point Cloud has its inputs and its code, and the code of a step uses the results of the steps before it. Julia REPL first runs the earlier steps that have not run in the session as they are now, starting from the first one that changed. A new Distance therefore runs Fill the Gaps again and leaves the points and the ground as they are, while a new Cell Size runs Ground again. The LAZ file that Point Cloud writes is kept in the Folder, so a new session reads the points from it and fetches nothing again; a new Area or Resolution takes a new Name, or the file deleted. Zoom and Pan and the saving of the terrain model run only when asked.

## What Each Source of Points Terrain Model from Point Cloud Reads

A LAS or LAZ file on the computer is read where it is. A LAS or LAZ file on the web is downloaded once into the tiles folder within the Folder. A folder is read as all its LAS and LAZ files. A tile index, a shapefile, GeoPackage or zipped shapefile with a polygon for each tile, gives the tiles whose polygons cross the Area, from its field URL. A COPC file on the web is read in part: PDAL reads only the parts of its tree within the Area, and with a Resolution only down to the level where the points are that far apart ([Hobu, Inc. (2021)](#ref-Hob2021a)). Every source is cut to the Area, and the points of several sources are merged.

## Where the Example Data of Terrain Model from Point Cloud Comes From

Both examples are lidar surveys published by OpenTopography under CC BY 4.0 ([Krishnan and 6 coauthors (2011)](#ref-KCNPC...2011a)). Aguada Fénix, Mexico, reads tiles of the lidar survey of the Middle Usumacinta region, made for the Middle Usumacinta Archaeological Project, picked from the survey's tile index ([OpenTopography (2022)](#ref-Ope2022a)). Quiriguá, Guatemala, reads part of a COPC file of a drone lidar survey of Museo Quiriguá of January 2024, collected at the request of the curators of the archaeological site ([Maurer (2026)](#ref-Mau2026a)). Each is read once into the Folder.

## References

<a id="ref-BCHG2021a"></a>Butler, H., Chambers, B., Hartzell, P. and Glennie, C. (2021). PDAL: an open source library for the processing and analysis of point clouds. *Computers & Geosciences* 148, 104680. [doi:10.1016/j.cageo.2020.104680](https://doi.org/10.1016/j.cageo.2020.104680)

<a id="ref-Car2026a"></a>Carlsson, K. (2026). NearestNeighbors.jl: high performance nearest neighbor data structures and algorithms for Julia. [github.com/KristofferC/NearestNeighbors.jl](https://github.com/KristofferC/NearestNeighbors.jl)

<a id="ref-Hob2021a"></a>Hobu, Inc. (2021). Cloud Optimized Point Cloud Specification 1.0. [copc.io](https://copc.io)

<a id="ref-KCNPC...2011a"></a>Krishnan, S., Crosby, C., Nandigam, V., Phan, M., Cowart, C., Baru, C. and Arrowsmith, R. (2011). OpenTopography: a services oriented architecture for community access to LIDAR topography. In *Proceedings of the 2nd International Conference on Computing for Geospatial Research and Applications (COM.Geo '11)*, 1–8. [doi:10.1145/1999320.1999327](https://doi.org/10.1145/1999320.1999327)

<a id="ref-Mau2026a"></a>Maurer, J. (2026). UAV lidar survey of Museo Quirigua, Guatemala, January 2024. Dataset. OpenTopography. [doi:10.5069/G9416V95](https://doi.org/10.5069/G9416V95)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Ope2022a"></a>OpenTopography (2022). Lidar survey of Middle Usumacinta region, Mexico. Dataset. [doi:10.5069/G95B00NF](https://doi.org/10.5069/G95B00NF)

<a id="ref-Pro2026b"></a>Pronk, M. (2026b). LazIO.jl: extends LasIO with LASzip integration. [github.com/evetion/LazIO.jl](https://github.com/evetion/LazIO.jl)

<a id="ref-PS2026a"></a>Pronk, M. and Schouten, R. (2026). Geomorphometry.jl: analyzing and visualizing the shape of the Earth in Julia. *Journal of Open Source Software* 11, 10395. [doi:10.21105/joss.10395](https://doi.org/10.21105/joss.10395)

<a id="ref-Sch2026a"></a>Schouten, R. (2026a). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

## See Also
- [Overview](overview.md) · [Ground Filters](ground-filters.md) · [Filling the Gaps](gap-filling.md) · [Point Cloud Files](point-cloud-files.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
