# Depressions: Mounds and Pits

## Depression Filling by Priority-Flood

A depression is a group of cells lower than every way out of it: water poured in would stay until it rose to the lowest point of the rim, the spill level, and then flow over. Filling a depression raises each of its cells to that level. Priority-Flood fills every depression of a grid in one pass ([Barnes, Lehman and Mulla (2014)](#ref-BLM2014a)). It starts from the cells on the edge of the grid, which can always drain outwards, and keeps the cells it has reached in a priority queue. It always takes the lowest one next, and raises each neighbour not yet reached to at least that cell's level before adding it to the queue. A cell is reached only through the lowest path from the edge, so it ends at its spill level. `fill_depressions` of SmartRegions.jl implements this algorithm without the small slope some variants add for water to flow across filled areas. Cells with no height act as drains, like the edge.

## Inverse Depression Analysis for Mounds

A mound is a depression turned upside down. Inverse depression analysis negates the surface, so that every summit becomes a hollow, fills the hollows, and takes the depth of the filling as the height of the mound above the level at which it would spill ([Freeland, Heung, Burley, Clark and Knudby (2016)](#ref-FHBCK2016a)). On the upside-down surface, the spill level of a mound is the highest point of the lowest path from its summit to lower ground, the saddle or foot from which it rises. The Mounds tab, `find_mounds` of SmartRegions.jl, marks the cells filled deeper than the Minimum Height. It joins them into regions through their eight neighbours and keeps the regions whose area and roundness lie within the limits. Freeland, Heung, Burley, Clark and Knudby (2016) used the method to map the earth mounds of the island of Tongatapu from aerial lidar.

## Pits and Hollows by Depression Filling

The Pits and Hollows tab, `find_pits` of SmartRegions.jl, fills the depressions of the surface the right way up. The depth of the filling at each cell is how far it lies below the rim of its depression. Pits, hollows, the bowls of kilns and the tops of filled shafts are depressions that hold water, and their depth is a measure of how much of them is left. The cells filled deeper than the Minimum Height are joined into regions, kept by area and roundness, as for mounds. The `height` that each candidate records is negative: the greatest depth within the region, as a level below the rim. Most terrain models also hold small depressions that are errors, left where the lidar returns were sparse or the ground was misclassified. The Minimum Height and the Minimum Area are set to leave them out.

## Height and Depth Measured From the Spill Level

The height of a mound found by inverse depression analysis is measured from its spill level, not from the ground around its foot. A mound on level ground has a spill level at the lowest point of its foot, and the fill gives nearly its full height. A mound joined to higher ground by a ridge, or on a slope, spills at a saddle or at its uphill side, and the fill gives only the part above that level. On the terrain model, a mound on a hilltop spills only at the foot of the hill, and is found as part of the hill. On the local relief model, the hill is removed first and the mound alone remains. The Surface input chooses between the two. The depth of a pit is measured from the lowest point of its rim in the same way, so that a pit cut into a slope shows less than its depth on the uphill side.

## Nested and Joined Depressions

Depressions can sit inside other depressions: two pits in one hollow, or a hollow of the ground holding a pit. Filling raises everything to the level of the outermost rim, so a pit inside a hollow becomes part of one region, the depth of which is that of the pit below the rim of the hollow. Likewise, two mounds joined by ground higher than their surroundings fill as one upside-down hollow. Its region holds both mounds, and only the deeper one sets its `height`. The local relief model reduces this, as it removes the broad hollow or ridge that joins the features. A larger Minimum Height splits such regions at the joining ground, so that each feature stands alone, while a smaller one keeps more of the faint ones.

## References

<a id="ref-BLM2014a"></a>Barnes, R., Lehman, C. and Mulla, D. (2014). Priority-flood: an optimal depression-filling and watershed-labeling algorithm for digital elevation models. *Computers & Geosciences* 62, 117–127. [doi:10.1016/j.cageo.2013.04.024](https://doi.org/10.1016/j.cageo.2013.04.024)

<a id="ref-FHBCK2016a"></a>Freeland, T., Heung, B., Burley, D. V., Clark, G. and Knudby, A. (2016). Automated feature extraction for prospection and analysis of monumental earthworks from aerial LiDAR in the Kingdom of Tonga. *Journal of Archaeological Science* 69, 64–74. [doi:10.1016/j.jas.2016.04.011](https://doi.org/10.1016/j.jas.2016.04.011)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Threshold and Shape](threshold-shape.md) · [Diagnostics](diagnostics.md)
