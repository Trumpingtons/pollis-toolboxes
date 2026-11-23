# Threshold and Shape

## Thresholding the Local Relief Model

The Threshold and Shape tab, `find_regions` of SmartRegions.jl, marks every cell of the local relief model that lies more than the Threshold above the trend, when Side is Raised, or more than the Threshold below it, when Side is Sunken. As the local relief model gives each cell's height above or below the mean of its surroundings, in metres, one threshold applies to the whole area, on hills and in valleys alike ([Hesse (2010)](#ref-Hes2010a)). The marked cells are joined into regions, and each region is kept or dropped by its area and its shape. Unlike the depression tabs, Threshold and Shape needs no rim or spill level, so it finds forms that are open on one side, such as a bank along a slope or a ditch that runs off the edge of a field.

## How Regions Are Joined Through Eight Neighbours

A region is a group of marked cells that touch, through a side or a corner: each cell has eight neighbours. Joining through corners keeps a narrow diagonal bank or ditch, one cell wide, as one region, where joining through sides alone would break it into single cells. It also joins two features that meet at one corner, and two mounds a cell apart diagonally count as one. `label_regions` of SmartRegions.jl numbers the regions from 1 in the order it meets them, scanning the grid, and gives 0 to the cells outside every region. The numbers are the `labels` that the panel returns as a `Raster`, and that Zoom and Pan outlines in yellow.

## How Area, Length and Roundness Are Measured

`regions` of SmartRegions.jl measures each region from its cells, the same way for the depression tabs and for Threshold and Shape. The area is the number of cells times the area of a cell. The shape comes from the second moments of the cells about their centre: the spread along each axis and the covariance between them, each cell counted as a unit square. These moments define the ellipse with the same spread as the region. The `length` is the long axis of that ellipse, four times the square root of its larger eigenvalue, in the units of the coordinates. The `roundness` is the short axis over the long, the square root of the ratio of the smaller eigenvalue to the larger. It is 1 for a circle and near 0 for a long, thin strip.

## Round and Long Shapes

The Shape input of the Threshold and Shape tab keeps regions by roundness. Round keeps regions with a roundness of at least 0.5, at most twice as long as they are wide: mounds, pits, and the interiors of small enclosures. Long keeps regions with a roundness of at most 0.25, at least four times as long as they are wide: banks, ditches, hollow ways, headlands and the ridges of ridge and furrow. Any keeps every region within the areas. The forms in between, from two to four times as long as wide, are left out by both Round and Long. Many of them are short stretches of bank or the remains of ploughed-down mounds, which Any keeps. Roundness measures the spread of a region, not its outline, so a curved bank, such as half a ring ditch, can be less long than it looks.

## Choosing the Threshold for Threshold and Shape

The Threshold is a height in metres. Many of the earthworks that a lidar terrain model reveals rise or sink by only a few tens of centimetres ([Kokalj and Hesse (2017)](#ref-KH2017a)), and the terrain model itself varies by a few centimetres from cell to cell where the ground is level. A threshold near 0.1 m finds faint features and much noise, which the Minimum Area then has to remove. A threshold near 0.5 m keeps the clearer earthworks, with less of their outline, as only their crest or floor passes. The threshold also cuts each feature at a height, so a region shows the part of a feature above that height. A low, broad mound may appear as a small region on its summit, measured as smaller than the whole mound.

## References

<a id="ref-Hes2010a"></a>Hesse, R. (2010). LiDAR-derived local relief models – a new tool for archaeological prospection. *Archaeological Prospection* 17(2), 67–72. [doi:10.1002/arp.374](https://doi.org/10.1002/arp.374)

<a id="ref-KH2017a"></a>Kokalj, Ž. and Hesse, R. (2017). *Airborne laser scanning raster data visualization: a guide to good practice*. Prostor, kraj, čas. Založba ZRC, Ljubljana. [doi:10.3986/9789612549848](https://doi.org/10.3986/9789612549848)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Depressions: Mounds and Pits](depressions.md) · [Template Matching](template-matching.md)
