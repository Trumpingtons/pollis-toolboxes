# Shaded Relief

## How the Shaded Relief Tab Lights the Terrain Model

The Shaded Relief tab of the Relief Visualisation panel lights the terrain model with a distant sun. The brightness of a cell is the cosine of the angle between the direction of the sun and the perpendicular to the ground, which follows from the slope and aspect of the cell and from the azimuth and elevation of the sun; ground turned away from the sun, where the cosine is negative, is black ([Horn (1981)](#ref-Hor1981a)). The brightness runs from 0 to 1, as in RVT. The slope and aspect come from the method of Zevenbergen and Thorne (1987), which fits a surface to each cell and its eight neighbours and takes the gradient from the differences between the four neighbours that share a side with the cell ([Zevenbergen and Thorne (1987)](#ref-ZT1987a)), as RVT's `slope_aspect` does.

## Why One Light Hides Features

A hillshade shows best the features that run across the light: one side of a bank faces the sun and is bright, the other faces away and is dark, and the pair of tones draws the bank. A bank that runs towards the sun has its two sides lit alike and almost vanishes. Devereux, Amable and Crow (2008) showed that the features an interpreter maps from a hillshade change with the direction of the light ([Devereux, Amable and Crow (2008)](#ref-DAC2008a)). Low suns make the effect stronger, since they lengthen the shadows of small forms. A second hillshade with the Sun Azimuth turned by 90 degrees shows the features that the first light hid.

## The Sun Azimuth and Sun Elevation Inputs

The Sun Azimuth input is the direction the light comes from, in degrees clockwise from north, and the Sun Elevation input its height above the horizon. Both default to RVT's settings, 315 and 35 degrees ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)). A light from the north-west, at the top left of a map with north up, is the convention because the eye expects light from above; with a light from the south-east, valleys can be read as ridges and ditches as banks. An elevation of 35 degrees is lower than the 45 degrees of many relief maps and gives small features longer shadows; an elevation below 20 degrees leaves much of any hilly ground in shadow.

## The Several Directions Choice

The Several Directions choice of the Shading input lights the ground from more than one direction at once. It calls `shaded_relief` of SmartRegions.jl with four azimuths, which follows Mark (1992): lights from 225, 270, 315 and 360 degrees, each weighted by how much the cell faces it, so that every cell is lit mostly from the direction that shows its slope best ([Mark (1992)](#ref-Mar1992a)). Linear features of any direction keep some contrast, and the image keeps the familiar look of a relief map. RVT's own multiple hillshading takes 16 directions at an elevation of 35 degrees ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)), a different method from Mark's.

## Slope as a Visualisation

The Slope choice of the Shading input shows the steepness of each cell, in degrees, by the method of Zevenbergen and Thorne (1987). Slope depends on no light and no direction: both sides of a bank are steep and the bank appears as a pair of parallel lines, its crest and the ground around it flat. On level ground the slope of earthworks is the strongest signal there is; on hillsides the natural slope dominates and features fade. The layered image uses slope with its scale reversed, steep ground dark and level ground light, between 0 and 50 degrees ([Kokalj and Somrak (2019)](#ref-KS2019a)).

## References

<a id="ref-DAC2008a"></a>Devereux, B. J., Amable, G. S. and Crow, P. (2008). Visualisation of LiDAR terrain models for archaeological feature detection. *Antiquity* 82(316), 470–479. [doi:10.1017/S0003598X00096952](https://doi.org/10.1017/S0003598X00096952)

<a id="ref-Hor1981a"></a>Horn, B. K. P. (1981). Hill shading and the reflectance map. *Proceedings of the IEEE* 69(1), 14–47. [doi:10.1109/PROC.1981.11918](https://doi.org/10.1109/PROC.1981.11918)

<a id="ref-KS2019a"></a>Kokalj, Ž. and Somrak, M. (2019). Why not a single image? Combining visualizations to facilitate fieldwork and on-screen mapping. *Remote Sensing* 11(7), 747. [doi:10.3390/rs11070747](https://doi.org/10.3390/rs11070747)

<a id="ref-Mar1992a"></a>Mark, R. K. (1992). Multidirectional, oblique-weighted, shaded-relief image of the Island of Hawaii. U.S. Geological Survey Open-File Report 92-422. [doi:10.3133/ofr92422](https://doi.org/10.3133/ofr92422)

<a id="ref-ZRCUL2025a"></a>ZRC SAZU and University of Ljubljana (UL FGG) (2025). RVT: Relief Visualization Toolbox in Python (rvt-py), version 2.2.3. [github.com/EarthObservation/RVT_py](https://github.com/EarthObservation/RVT_py)

<a id="ref-ZT1987a"></a>Zevenbergen, L. W. and Thorne, C. R. (1987). Quantitative analysis of land surface topography. *Earth Surface Processes and Landforms* 12(1), 47–56. [doi:10.1002/esp.3290120107](https://doi.org/10.1002/esp.3290120107)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Sky-View Factor and Openness](sky-view-openness.md) · [Layered Image](layered-image.md)
