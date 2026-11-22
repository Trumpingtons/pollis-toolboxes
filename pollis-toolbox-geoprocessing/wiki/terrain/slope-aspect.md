# Slope and Aspect

## What Slope and Aspect Measure

Slope is the steepness of the ground, the angle between the surface and the horizontal, in degrees from 0 on flat ground towards 90 on a vertical face. Aspect is the direction the ground faces, the compass direction of steepest descent, in degrees clockwise from north. Both come from the gradient of the surface, its rise per metre to the east and to the north: slope is the arctangent of the gradient's length, and aspect its direction ([Hengl and Reuter (2009)](#ref-HR2009a)). Aspect has no meaning on flat ground, where the gradient is zero, and the Slope and Aspect tab leaves it missing there.

## Horn's Method

Horn's method estimates the rise to the east from the three cells to the east of a cell less the three to the west, and the rise to the north likewise, weighting the middle cell of each three twice ([Horn (1981)](#ref-Hor1981a)). Each estimate rests on six cells, so a single wrong height moves it less. `slope(dem; method = Horn())` and `aspect(dem; method = Horn())` of Geomorphometry.jl compute it ([Pronk and Schouten (2026)](#ref-PS2026a)); terra's `terrain` with `neighbors = 8` does the same ([Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)).

## Zevenbergen and Thorne's Method

Zevenbergen and Thorne's method fits a surface through the nine cells around a cell and takes its gradient at the centre, which comes from the four neighbours that share a side: the cell to the east less the cell to the west, over twice the cell size, and likewise north and south ([Zevenbergen and Thorne (1987)](#ref-ZT1987a)). It follows the surface closely and reacts to every error in those four cells. `slope(dem; method = ZevenbergenThorne())` of Geomorphometry.jl computes it, as terra's `terrain` with `neighbors = 4` does. Slope Methods Compared prints how far the two methods are apart.

## Classes of Slope

Planning and land-use rules often set limits of slope: for building, for roads and paths that people walk or cycle, for machinery on farmland, or for the risk of landslides. The Slope Classes input of the Slope and Aspect tab takes such limits, in degrees, and the tab prints the share and the area of the land in each class. A slope in degrees converts to a gradient in percent as 100 times its tangent: 5 degrees is about 9 percent, 30 degrees about 58 percent. Aspect by Direction prints the share of the land facing each of the eight directions of the compass, with the mean slope of each.

## References

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-HR2009a"></a>Hengl, T. and Reuter, H. I. (eds.) (2009). *Geomorphometry: concepts, software, applications*. Developments in Soil Science 33. Elsevier. [doi:10.1016/S0166-2481(08)X0001-7](https://doi.org/10.1016/S0166-2481(08)X0001-7)

<a id="ref-Hor1981a"></a>Horn, B. K. P. (1981). Hill shading and the reflectance map. *Proceedings of the IEEE* 69(1), 14–47. [doi:10.1109/PROC.1981.11918](https://doi.org/10.1109/PROC.1981.11918)

<a id="ref-PS2026a"></a>Pronk, M. and Schouten, R. (2026). Geomorphometry.jl: analyzing and visualizing the shape of the Earth in Julia. *Journal of Open Source Software* 11(122), 10395. [doi:10.21105/joss.10395](https://doi.org/10.21105/joss.10395)

<a id="ref-ZT1987a"></a>Zevenbergen, L. W. and Thorne, C. R. (1987). Quantitative analysis of land surface topography. *Earth Surface Processes and Landforms* 12(1), 47–56. [doi:10.1002/esp.3290120107](https://doi.org/10.1002/esp.3290120107)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Hillshade](hillshade.md) · [Diagnostics](diagnostics.md)
