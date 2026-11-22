# Hillshade

## What a Hillshade Shows

A hillshade renders the relief as if lit by a distant sun: ground that faces the light is bright, ground that faces away is dark. The eye reads the pattern of light and shadow as the shape of the land, so a hillshade under a map of land use, roads or buildings shows where they lie among hills and valleys. The brightness of each cell is the cosine of the angle between the light and the perpendicular to the surface, computed from the slope and aspect of the cell, scaled to whole numbers from 0 in full shadow to 255 facing the light ([Horn (1981)](#ref-Hor1981a)).

## The Direction and Height of the Light

The Sun Azimuth input of the Hillshade tab gives the direction the light comes from, clockwise from north, and the Sun Elevation input its height above the horizon. The convention of relief maps is a light from the north-west, at 315 degrees and 45 degrees above the horizon: with the light from the top of the map, the eye sees ridges as ridges, while a light from the south can make valleys look like ridges. A low sun lengthens the shadows and brings out gentle relief; a high sun flattens it. `hillshade(dem; azimuth, zenith)` of Geomorphometry.jl takes the angle of the sun from the vertical, which is 90 degrees less its elevation ([Pronk and Schouten (2026)](#ref-PS2026a)).

## Light From Several Directions

A ridge that runs in the direction of the light casts no shadow on either side and disappears from a hillshade lit from one direction. Mark's multidirectional hillshade combines lights from several directions, each weighting the cells that face it, so that ridges of every direction show ([Mark (1992)](#ref-Mar1992a)). The Several Directions choice of the Light input uses `multihillshade` of Geomorphometry.jl, with lights from 225, 270, 315 and 360 degrees. Light Directions Compared prints the mean brightness under lights from four directions: a large difference between them shows that the slopes of the area mostly face one way.

## Hillshade in terra

terra computes a hillshade with `shade`, from the slope and aspect in radians that `terrain` gives, and a light at an `angle` above the horizon and from a `direction` clockwise from north ([Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)). `shade` returns the cosine itself, from 0 to 1; multiplied by 255 it is the brightness that Geomorphometry.jl returns rounded to whole numbers. Replicate with terra of the Hillshade tab sets the two side by side, with the light at 315 and 45 degrees.

## References

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-Hor1981a"></a>Horn, B. K. P. (1981). Hill shading and the reflectance map. *Proceedings of the IEEE* 69(1), 14–47. [doi:10.1109/PROC.1981.11918](https://doi.org/10.1109/PROC.1981.11918)

<a id="ref-Mar1992a"></a>Mark, R. K. (1992). Multidirectional, oblique-weighted, shaded-relief image of the Island of Hawaii. U.S. Geological Survey Open-File Report 92-422. [doi:10.3133/ofr92422](https://doi.org/10.3133/ofr92422)

<a id="ref-PS2026a"></a>Pronk, M. and Schouten, R. (2026). Geomorphometry.jl: analyzing and visualizing the shape of the Earth in Julia. *Journal of Open Source Software* 11(122), 10395. [doi:10.21105/joss.10395](https://doi.org/10.21105/joss.10395)

## See Also
- [Overview](overview.md) · [Slope and Aspect](slope-aspect.md) · [Decision Guide](decision-guide.md)
