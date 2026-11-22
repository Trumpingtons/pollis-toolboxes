# Flow and Wetness

## Following Water Over an Elevation Model

Water on the ground flows downhill, and the area that drains through a point, its upslope area or catchment, decides how much water passes it. On an elevation model the upslope area of a cell is found by giving each cell a direction of flow to one or more of its lower neighbours and then adding up, from the highest cell down, the area that each cell passes on ([Moore, Grayson and Ladson (1991)](#ref-MGL1991a)). The Flow and Wetness tab gives the upslope area in square kilometres, the cells that drain at least the Stream from area as streams, and two indices that combine the upslope area with the slope.

## Filling Depressions With Priority-Flood

Before the flow is followed, the depressions of the elevation model are filled, so that water from every cell can reach the edge of the grid. Priority-Flood visits the cells from the edge inwards, always the lowest cell not yet visited first, and raises any cell lower than the cell it was reached from to that level ([Barnes, Lehman and Mulla (2014)](#ref-BLM2014a)). Filled depressions are flat, and on a flat cell water has no direction; the variant of Priority-Flood that the tab uses raises each cell of a filled area by the smallest step a number can take above the cell it drains to, so that a path leads out across every flat. `filldepressions` of Geomorphometry.jl fills to the same levels without the steps ([Pronk and Schouten (2026)](#ref-PS2026a)).

## D-infinity Flow Directions

D-infinity gives each cell a direction of flow at any angle, not only towards one of its eight neighbours ([Tarboton (1997)](#ref-Tar1997a)). The eight triangles around a cell, each between a neighbour that shares a side and the corner neighbour beside it, are planes; the direction is that of steepest descent on the steepest of them. The water of the cell is shared between the two neighbours of that triangle in proportion to how close the direction lies to each. Shared flow spreads over hillsides as water does, while flow to a single neighbour cuts parallel lines across them. Replicate with WhiteboxTools sets the tab's upslope area beside D-infinity of WhiteboxTools ([Lindsay (2016)](#ref-Lin2016a); [Wu and Brown (2019)](#ref-WB2019a)).

## Topographic Wetness Index

The Topographic Wetness Index is ln(a / tan b), where a is the upslope area per metre of contour, the specific catchment area, and b the slope ([Beven and Kirkby (1979)](#ref-BK1979a)). The index is high where much water arrives and the ground is gentle, in valley bottoms and at the foot of slopes, and low near ridges and on steep ground. The tab takes a as the number of cells draining through a cell times the width of a cell, and b from Horn's slope. The index ranks places by their tendency to be saturated, under the assumption that water moves through the soil as it would over the surface; it is not a measurement of soil moisture.

## Stream Power Index

The Stream Power Index is ln(a tan b), the product of the specific catchment area and the slope, an index of the power of running water to erode ([Moore, Grayson and Ladson (1991)](#ref-MGL1991a)). The index is high where much water arrives on steep ground, in steep channels and gullies, and low on gentle ground or near ridges. Like the wetness index, the Stream Power Index is undefined on flat ground, where the slope is 0. Flat Cells of the Diagnose group counts the cells where both indices are missing for that reason.

## References

<a id="ref-BK1979a"></a>Beven, K. J. and Kirkby, M. J. (1979). A physically based, variable contributing area model of basin hydrology. *Hydrological Sciences Bulletin* 24(1), 43–69. [doi:10.1080/02626667909491834](https://doi.org/10.1080/02626667909491834)

<a id="ref-BLM2014a"></a>Barnes, R., Lehman, C. and Mulla, D. (2014). Priority-flood: an optimal depression-filling and watershed-labeling algorithm for digital elevation models. *Computers & Geosciences* 62, 117–127. [doi:10.1016/j.cageo.2013.04.024](https://doi.org/10.1016/j.cageo.2013.04.024)

<a id="ref-Lin2016a"></a>Lindsay, J. B. (2016). Whitebox GAT: a case study in geomorphometric analysis. *Computers & Geosciences* 95, 75–84. [doi:10.1016/j.cageo.2016.07.003](https://doi.org/10.1016/j.cageo.2016.07.003)

<a id="ref-MGL1991a"></a>Moore, I. D., Grayson, R. B. and Ladson, A. R. (1991). Digital terrain modelling: a review of hydrological, geomorphological, and biological applications. *Hydrological Processes* 5(1), 3–30. [doi:10.1002/hyp.3360050103](https://doi.org/10.1002/hyp.3360050103)

<a id="ref-PS2026a"></a>Pronk, M. and Schouten, R. (2026). Geomorphometry.jl: analyzing and visualizing the shape of the Earth in Julia. *Journal of Open Source Software* 11(122), 10395. [doi:10.21105/joss.10395](https://doi.org/10.21105/joss.10395)

<a id="ref-Tar1997a"></a>Tarboton, D. G. (1997). A new method for the determination of flow directions and upslope areas in grid digital elevation models. *Water Resources Research* 33(2), 309–319. [doi:10.1029/96WR03137](https://doi.org/10.1029/96WR03137)

<a id="ref-WB2019a"></a>Wu, Q. and Brown, A. (2019). whitebox: 'WhiteboxTools' R frontend. R package version 2.4.3. [doi:10.32614/cran.package.whitebox](https://doi.org/10.32614/cran.package.whitebox)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Slope and Aspect](slope-aspect.md)
