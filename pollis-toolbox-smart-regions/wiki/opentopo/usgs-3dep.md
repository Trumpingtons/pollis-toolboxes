# USGS 3D Elevation Program

## What the 3D Elevation Program Is

The 3D Elevation Program (3DEP) of the U.S. Geological Survey began in 2012 to collect high-quality lidar data for the conterminous United States, Hawaii and the U.S. territories, and interferometric radar data for Alaska, with many federal, state, tribal and local partners, and to refresh the National Elevation Dataset with the new data ([Sugarbaker and 6 coauthors (2014)](#ref-SCHJL...2014a)). Its data are collected at different times by different producers, under a common lidar base specification, and integrated into seamless digital elevation models ([Stoker and Miller (2022)](#ref-SM2022a)).

## The 3DEP Elevation Rasters USGS 3DEP Downloads

| Resolution | What it is | Largest area of a request |
|---|---|---|
| 1 Arc-Second, 30 m | The seamless elevation at 1 arc-second | 225,000 km² |
| 1/3 Arc-Second, 10 m | The seamless elevation at 1/3 arc-second, the default | 25,000 km² |
| 1 m (Academic Users) | The elevation at 1 m, made from lidar where it has been flown | 250 km² |

OpenTopography serves the three through the endpoint `usgsdem`, relying on the resources of the U.S. Geological Survey, and opens the 1 m rasters to academic users only ([OpenTopography (2026)](#ref-Ope2026a)).

## How Accurate and Consistent 3DEP Data Are

Stoker and Miller tested two assumptions of the 3D Elevation Program: that its lidar base specification gives standardised and consistent data across collections made at different times by different producers, and that integrating lidar into the seamless elevation models makes the derived products more accurate, updating the accuracy measures of earlier versions of the standard products ([Stoker and Miller (2022)](#ref-SM2022a)). Two Models Side by Side sets the 3DEP elevation of the Area beside a global model chosen in Compare With.

## How USGS 3DEP Reads the Elevation

USGS 3DEP asks the endpoint `usgsdem` for the Resolution over the Area, writes the GeoTIFF to the folder of the resolution, and reads it with Rasters.jl, with the cells of its no-data value left out ([Schouten (2026)](#ref-Sch2026a)). The coordinate system of the file is kept in `crs`, so that Show the Elevation on a Map places each cell correctly. Over an Area outside the United States, the API answers with no content, and the tab stops with a message.

## References

<a id="ref-Ope2026a"></a>OpenTopography (2026). OpenTopography API. [portal.opentopography.org/apidocs](https://portal.opentopography.org/apidocs/)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: Raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-SM2022a"></a>Stoker, J. and Miller, B. (2022). The Accuracy and Consistency of 3D Elevation Program Data: A Systematic Analysis. *Remote Sensing*, 14(4), 940. [doi:10.3390/rs14040940](https://doi.org/10.3390/rs14040940)

<a id="ref-SCHJL...2014a"></a>Sugarbaker, L. J., Constance, E. W., Heidemann, H. K., Jason, A. L., Lukas, V., Saghy, D. L. and Stoker, J. M. (2014). The 3D Elevation Program initiative: A call for action. [doi:10.3133/cir1399](https://doi.org/10.3133/cir1399)

## See Also
- [Decision Guide](decision-guide.md) · [The Global Elevation Models](global-dems.md) · [Authentication](authentication.md) · [Factsheet](factsheet.md)
