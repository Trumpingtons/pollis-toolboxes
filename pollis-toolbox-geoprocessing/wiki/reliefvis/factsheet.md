# Relief Visualisation — Factsheet

**Relief visualisation** turns a lidar terrain model into images in which small earthworks stand out: banks, ditches, mounds, hollow ways and old field boundaries that rise or sink by a few tens of centimetres ([Kokalj and Hesse (2017)](#ref-KH2017a)). The Relief Visualisation panel of the Geoprocessing Toolbox computes the visualisations of the Relief Visualization Toolbox (RVT) in Julia, with SmartRegions.jl and Rasters.jl, on a grid read through ArchGDAL.jl ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a); [Schouten (2026a)](#ref-Sch2026a); [Ng (2026)](#ref-Ng2026a)).

| Item | Relief Visualisation panel |
|---|---|
| **Purpose** | Bring out small features of the ground in a lidar terrain model, for archaeological prospection |
| **Input** | A GeoTIFF of a bare-earth terrain model in metres, in a projected coordinate system with square cells |
| **Core packages** | [SmartRegions.jl](https://github.com/Trumpingtons/SmartRegions.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl) |
| **Tabs** | Local Relief Model, Sky-View and Openness, Shaded Relief, Layered Image |
| **Output** | A Rasters.jl `Raster` named `result` on the grid of the terrain model, missing near the edge |
| **Key choices** | The trend radius, the search radius and directions, the light, and the opacity of the openness overlay |

## What Each Tab of the Relief Visualisation Panel Computes

| Tab | SmartRegions.jl function | Computation | Result |
|---|---|---|---|
| Local Relief Model | `local_relief` | The terrain model less its mean in a square window, from summed-area tables | Metres above or below the trend |
| Sky-View and Openness | `sky_view_factor`, `openness` | The highest horizon in each direction within the search radius | Sky-view factor from 0 to 1, or positive or negative openness in degrees |
| Shaded Relief | `shaded_relief`, `terrain_slope` | Slope and aspect by the method of Zevenbergen and Thorne, or lights from several directions by the method of Mark | Hillshade from 0 to 1, multidirectional hillshade, or slope in degrees |
| Layered Image | `layered_image` | Hillshade, slope, positive openness and sky-view factor, each stretched and blended | A grey image from 0 to 1 |

## What the Next Steps of the Relief Visualisation Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Show the Image, Zoom on a Place | The result as a grey image, whole or around the Zoom Centre |
| Interpret | Summary of the Result, Profile Through a Place, Scheduled Monuments in the Area | Quantiles, a line across a feature, the protected sites of England within the area |
| Export | Save the Result as Cloud-Optimised GeoTIFF | A file written to the folder of the files |

## How the Relief Visualisation Panel Follows RVT

Each function of SmartRegions.jl behind the Relief Visualisation panel follows the computation of a function of RVT 2.2.3, with RVT's default settings as the panel's defaults ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)). `local_relief` follows `rvt.vis.slrm`; `sky_view_factor` and `openness` follow `rvt.vis.sky_view_factor`, with the same points along each direction; `terrain_slope` and `shaded_relief` with one light follow `rvt.vis.slope_aspect` and `rvt.vis.hillshade`; and `layered_image` follows the blending of RVT's Visualization for Archaeological Topography from its four layers. RVT computes in single precision and SmartRegions.jl in double precision, so the last digits of the two can differ.

## References

<a id="ref-KH2017a"></a>Kokalj, Ž. and Hesse, R. (2017). *Airborne laser scanning raster data visualization: a guide to good practice*. Prostor, kraj, čas. Založba ZRC, Ljubljana. [doi:10.3986/9789612549848](https://doi.org/10.3986/9789612549848)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026a). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-ZRCUL2025a"></a>ZRC SAZU and University of Ljubljana (UL FGG) (2025). RVT: Relief Visualization Toolbox in Python (rvt-py), version 2.2.3. [github.com/EarthObservation/RVT_py](https://github.com/EarthObservation/RVT_py)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Local Relief Model](local-relief.md) · [Sky-View Factor and Openness](sky-view-openness.md) · [Shaded Relief](shaded-relief.md) · [Layered Image](layered-image.md)
