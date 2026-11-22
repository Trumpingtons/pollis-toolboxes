# Terrain and Elevation Analysis — Decision Guide

## Which Measure Answers Which Question

| Question | Tab | Measure |
|---|---|---|
| Where is the ground too steep to build, cycle or farm on? | Slope and Aspect | Slope, and the share of land in each class of slope |
| Which slopes face the sun? | Slope and Aspect | Aspect, and Aspect by Direction |
| How can the relief be shown under other maps? | Hillshade | Brightness under a light |
| Where does water converge or spread out over a slope? | Curvature | Tangential curvature |
| Where does a slope steepen or ease? | Curvature | Profile curvature |
| How uneven is the ground around each place? | Relief Indices | Terrain Ruggedness Index, roughness |
| Is a place on a ridge or in a valley? | Relief Indices | Topographic Position Index |
| Where do streams run, and how large an area feeds each point? | Flow and Wetness | Upslope area |
| Where is the ground most likely to be wet? | Flow and Wetness | Topographic Wetness Index |
| Where can running water erode? | Flow and Wetness | Stream Power Index |

## Choosing a Slope Method

Horn's method estimates the gradient of a cell from all eight neighbours, the four that share a side weighted twice as much as the four at the corners, and so smooths the noise of the model ([Horn (1981)](#ref-Hor1981a)). Zevenbergen and Thorne's method uses only the four neighbours that share a side, follows the surface more closely and is more sensitive to errors in single cells ([Zevenbergen and Thorne (1987)](#ref-ZT1987a)). Horn's method is the default of GDAL and of terra, and the usual choice for a surface model with buildings or trees; Zevenbergen and Thorne's suits a smooth, accurate terrain model ([Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)).

## Choosing the Window of the Curvature

The Radius in Cells input of the Curvature tab sets the window to which the quadratic surface is fitted: 3 by 3 cells at radius 1, 5 by 5 at radius 2. A small window measures forms a few cells across and is most sensitive to noise; a larger one measures broader forms, such as the shape of a whole hillside, and smooths small errors ([Ilich, Misiuk, Lecours and Murawski (2023)](#ref-IMLM2023a)). The right window depends on the size of the forms being studied, in metres, divided by the cell size.

## Choosing a Threshold for Streams

A stream begins where enough area drains into a cell to keep water flowing, and the Stream from input of the Flow and Wetness tab sets that area. No single threshold suits every landscape: humid, steep catchments start streams from smaller areas than dry, flat ones. Thresholds Compared prints the length of stream that several thresholds give, which can be checked against mapped streams of the area ([Moore, Grayson and Ladson (1991)](#ref-MGL1991a)).

## References

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-Hor1981a"></a>Horn, B. K. P. (1981). Hill shading and the reflectance map. *Proceedings of the IEEE* 69(1), 14–47. [doi:10.1109/PROC.1981.11918](https://doi.org/10.1109/PROC.1981.11918)

<a id="ref-IMLM2023a"></a>Ilich, A. R., Misiuk, B., Lecours, V. and Murawski, S. A. (2023). MultiscaleDTM: an open-source R package for multiscale geomorphometric analysis. *Transactions in GIS* 27(4), 1164–1204. [doi:10.1111/tgis.13067](https://doi.org/10.1111/tgis.13067)

<a id="ref-MGL1991a"></a>Moore, I. D., Grayson, R. B. and Ladson, A. R. (1991). Digital terrain modelling: a review of hydrological, geomorphological, and biological applications. *Hydrological Processes* 5(1), 3–30. [doi:10.1002/hyp.3360050103](https://doi.org/10.1002/hyp.3360050103)

<a id="ref-ZT1987a"></a>Zevenbergen, L. W. and Thorne, C. R. (1987). Quantitative analysis of land surface topography. *Earth Surface Processes and Landforms* 12(1), 47–56. [doi:10.1002/esp.3290120107](https://doi.org/10.1002/esp.3290120107)

## See Also
- [Overview](overview.md) · [Slope and Aspect](slope-aspect.md) · [Curvature](curvature.md) · [Relief Indices](relief.md) · [Flow and Wetness](flow-wetness.md)
