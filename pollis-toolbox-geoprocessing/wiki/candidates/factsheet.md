# Candidate Features — Factsheet

**Candidate features** are places in a lidar terrain model whose shape matches a rule for an earthwork: a mound, a pit, a ring ditch, a bank or a ditch. The Candidate Features panel of the Geoprocessing Toolbox finds them by four rule-based methods: inverse depression analysis, depression filling, template matching, and a threshold with rules of shape ([Freeland, Heung, Burley, Clark and Knudby (2016)](#ref-FHBCK2016a); [Trier and Pilø (2012)](#ref-TP2012a); [Davis, Lipo and Sanger (2019)](#ref-DLS2019a)). The methods are functions of SmartRegions.jl, run on a grid read with Rasters.jl and ArchGDAL.jl ([Schouten (2026a)](#ref-Sch2026a); [Ng (2026)](#ref-Ng2026a); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

| Item | Candidate Features panel |
|---|---|
| **Purpose** | List the places in a lidar terrain model shaped like earthworks, for archaeological prospection |
| **Input** | A GeoTIFF of a bare-earth terrain model in metres, in a projected coordinate system with square cells |
| **Core packages** | [SmartRegions.jl](https://github.com/Trumpingtons/SmartRegions.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl) |
| **Tabs** | Mounds, Pits and Hollows, Template Matching, Threshold and Shape |
| **Output** | `found`, with `candidates`, one named tuple for each candidate, and `labels`, a `Raster` of the candidate each cell belongs to |
| **Key choices** | The surface searched, the minimum height or score, the areas, and the shape |

## What Each Tab of the Candidate Features Panel Computes

| Tab | SmartRegions.jl function | Computation | Finds |
|---|---|---|---|
| Mounds | `find_mounds` | The surface turned upside down, its depressions filled by Priority-Flood, and the regions filled deeper than the Minimum Height | Raised, closed forms |
| Pits and Hollows | `find_pits` | The depressions of the surface filled, and the regions filled deeper than the Minimum Height | Sunken, closed forms |
| Template Matching | `find_templates` | The normalised cross-correlation of the local relief model with a mound, pit or ring ditch of each radius | Forms of one shape |
| Threshold and Shape | `find_regions` | The local relief model above or below the Threshold, in regions kept by area and shape | Round or long forms |

Every tab first computes `lrm`, the local relief model, with `local_relief`, the function behind the Local Relief Model tab of the Relief Visualisation panel ([Hesse (2010)](#ref-Hes2010a)).

## What the Next Steps of the Candidate Features Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Candidates on the Image, Zoom on a Place | The local relief model in grey from −0.5 to 0.5 m, with each candidate outlined in yellow, whole or enlarged around the Zoom Centre |
| Interpret | Highest Candidates | The 15 candidates highest above or deepest below their surroundings, or with the best scores |
| Interpret | Candidates and Scheduled Monuments | The scheduled monuments of England in the area, the candidates that meet each, and those that meet none |
| Interpret | Profile Through a Place | The height, the local relief and the candidate at points along a line from west to east |
| Export | Save the Candidates as GeoPackage | The outline of each candidate with its measures, in the coordinate system of the terrain model |

## What a Candidate of the Candidate Features Panel Records

Each candidate is a named tuple. `id` numbers it, and `x` and `y` give its centre in the coordinates of the terrain model. The depression tabs and Threshold and Shape add `area`, in square units of the coordinates; `height`, the value farthest from zero within the region; `length`, the long axis of the ellipse with the same spread as the region; and `roundness`, the short axis over the long. For Mounds the height is the greatest fill of the upside-down surface. For Pits and Hollows it is the greatest depth, given as a negative number. For Threshold and Shape it is the local relief. Template Matching gives `radius`, the radius of the best template, `score`, the correlation, and `height`, the local relief at the centre. Beside `candidates` and `labels`, the depression tabs return `depth`, the fill of every cell, and Template Matching returns `score`, the best score of every cell.

## Where the Example Data of the Candidate Features Panel Comes From

With the default Terrain Model, the Example Code downloads a 1 m terrain model from the Web Coverage Service of the Environment Agency's LIDAR Composite DTM, unless the folder already holds the file ([Environment Agency (2022)](#ref-EA2022a)). Candidates and Scheduled Monuments reads the boundaries of scheduled monuments from the open web service of Historic England's National Heritage List for England, for any terrain model in England ([Historic England (2026)](#ref-HE2026a)). Every function also accepts a terrain model of the user's own, in any projected coordinate system.

## References

<a id="ref-DLS2019a"></a>Davis, D. S., Lipo, C. P. and Sanger, M. C. (2019). A comparison of automated object extraction methods for mound and shell-ring identification in coastal South Carolina. *Journal of Archaeological Science: Reports* 23, 166–177. [doi:10.1016/j.jasrep.2018.10.035](https://doi.org/10.1016/j.jasrep.2018.10.035)

<a id="ref-EA2022a"></a>Environment Agency (2022). LIDAR Composite Digital Terrain Model (DTM) – 1m. Dataset. [environment.data.gov.uk](https://environment.data.gov.uk/dataset/13787b9a-26a4-4775-8523-806d13af58fc)

<a id="ref-FHBCK2016a"></a>Freeland, T., Heung, B., Burley, D. V., Clark, G. and Knudby, A. (2016). Automated feature extraction for prospection and analysis of monumental earthworks from aerial LiDAR in the Kingdom of Tonga. *Journal of Archaeological Science* 69, 64–74. [doi:10.1016/j.jas.2016.04.011](https://doi.org/10.1016/j.jas.2016.04.011)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Hes2010a"></a>Hesse, R. (2010). LiDAR-derived local relief models – a new tool for archaeological prospection. *Archaeological Prospection* 17(2), 67–72. [doi:10.1002/arp.374](https://doi.org/10.1002/arp.374)

<a id="ref-HE2026a"></a>Historic England (2026). National Heritage List for England (NHLE). Dataset, updated continuously. [historicengland.org.uk/listing/the-list](https://historicengland.org.uk/listing/the-list/)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026a). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-TP2012a"></a>Trier, Ø. D. and Pilø, L. H. (2012). Automatic detection of pit structures in airborne laser scanning data. *Archaeological Prospection* 19(2), 103–121. [doi:10.1002/arp.1421](https://doi.org/10.1002/arp.1421)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Depressions: Mounds and Pits](depressions.md) · [Template Matching](template-matching.md) · [Threshold and Shape](threshold-shape.md)
