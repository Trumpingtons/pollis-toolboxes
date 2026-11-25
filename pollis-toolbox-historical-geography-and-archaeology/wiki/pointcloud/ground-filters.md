# Terrain Model from Point Cloud — Ground Filters

## What a Ground Filter Does

A ground filter decides which points of a lidar point cloud are ground and which belong to objects above it: trees, shrubs, buildings, vehicles. Its result is either a class for each point or, as in the Terrain Model from Point Cloud panel, a set of cells of a grid whose lowest point is taken for ground. Filters differ in how they tell ground from objects: by slope, by the shape of the surface, by interpolation, or by morphology. An experimental comparison runs several filters on the same point clouds, so that their results can be set side by side ([Sithole and Vosselman (2004)](#ref-SV2004a)). The interpolation of Kraus and Pfeifer determines terrain models in wooded areas ([Kraus and Pfeifer (1998)](#ref-KP1998a)).

## The Survey's Ground in Terrain Model from Point Cloud

A survey published as a point cloud has usually been classified by its provider, with a ground filter and often with checks by hand. Survey's Ground, in Step 2 of Terrain Model from Point Cloud, keeps the points of classes 2, ground, and 8, model key points, which are ground points kept for a thinned terrain model in LAS 1.0 to 1.3 ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)). The lowest of them in each cell is the height of that cell, and their number is the cell's ground points. The survey's ground is the provider's choice, made for the survey as a whole, and the filters of Zhang and of Pingel find the ground again for the area read.

## Morphological Ground Filters

A morphological filter treats the lowest point of each cell as a surface and opens it: first an erosion, which gives each cell the lowest height within a window around it, then a dilation, which gives each cell the highest height of the eroded surface within the same window. An object narrower than the window disappears from the opened surface, while the ground, wider than the window, keeps its shape. A cell much higher than the opened surface is taken for an object; a cell close to it, for ground. Repeating the opening with windows growing to the size of the largest object removes trees and buildings of every size. Both filters of Terrain Model from Point Cloud are morphological filters of Geomorphometry.jl ([Pronk and Schouten (2026)](#ref-PS2026a)).

## Zhang's Progressive Morphological Filter

The progressive morphological filter of Zhang, Chen, Whitman, Shyu, Yan and Zhang removes the measurements of vehicles, vegetation and buildings by gradually increasing the window of the filter and using thresholds of the difference in height, while the ground is preserved ([Zhang, Chen, Whitman, Shyu, Yan and Zhang (2003)](#ref-ZCWSY...2003a)). In Terrain Model from Point Cloud, Zhang's Filter grows the window up to the Window, in metres. The height above the opened surface at which a cell is still ground starts at the Initial Height with the smallest window, grows with the Slope as the window grows, and stops at the Maximum Height. A cell that is never above that height is ground.

## Pingel's Simple Morphological Filter

The simple morphological filter of Pingel, Clarke and McBride is an improved simple morphological filter for the terrain classification of airborne lidar data ([Pingel, Clarke and McBride (2013)](#ref-PCM2013a)). In Terrain Model from Point Cloud, Pingel's Filter takes the Window, the largest window in metres, and the Slope, in metres a metre, and keeps the cells of the lowest surface that it classifies as ground. Pingel's Filter takes longer than Zhang's Filter on the same area. Both filters are given the same lowest surface, so their results can be compared cell by cell with each other and with the Survey's Ground.

## How Terrain Model from Point Cloud Prepares the Surface for a Filter

Zhang's Filter and Pingel's Filter in Terrain Model from Point Cloud work on the lowest point of each cell among all the points but noise, classes 7 and 18, whatever their other classes. A cell without any point, as under water or a roof that returned no pulse, is given the highest height of the area before filtering, so that the filter never takes it for ground, and it stays empty in the result. After filtering, the ground points of a cell kept as ground are its points at most the Initial Height above its height; these are the ground points a square metre that Check the Terrain Model shows.

## References

<a id="ref-ASPRS2025a"></a>American Society for Photogrammetry and Remote Sensing (2025). LAS Specification 1.4, Revision 16. [github.com/ASPRSorg/LAS](https://github.com/ASPRSorg/LAS/releases/tag/1.4.R16)

<a id="ref-KP1998a"></a>Kraus, K. and Pfeifer, N. (1998). Determination of terrain models in wooded areas with airborne laser scanner data. *ISPRS Journal of Photogrammetry and Remote Sensing* 53(4), 193–203. [doi:10.1016/S0924-2716(98)00009-4](https://doi.org/10.1016/S0924-2716(98)00009-4)

<a id="ref-PCM2013a"></a>Pingel, T. J., Clarke, K. C. and McBride, W. A. (2013). An improved simple morphological filter for the terrain classification of airborne LIDAR data. *ISPRS Journal of Photogrammetry and Remote Sensing* 77, 21–30. [doi:10.1016/j.isprsjprs.2012.12.002](https://doi.org/10.1016/j.isprsjprs.2012.12.002)

<a id="ref-PS2026a"></a>Pronk, M. and Schouten, R. (2026). Geomorphometry.jl: analyzing and visualizing the shape of the Earth in Julia. *Journal of Open Source Software* 11, 10395. [doi:10.21105/joss.10395](https://doi.org/10.21105/joss.10395)

<a id="ref-SV2004a"></a>Sithole, G. and Vosselman, G. (2004). Experimental comparison of filter algorithms for bare-Earth extraction from airborne laser scanning point clouds. *ISPRS Journal of Photogrammetry and Remote Sensing* 59(1–2), 85–101. [doi:10.1016/j.isprsjprs.2004.05.004](https://doi.org/10.1016/j.isprsjprs.2004.05.004)

<a id="ref-ZCWSY...2003a"></a>Zhang, K., Chen, S.-C., Whitman, D., Shyu, M.-L., Yan, J. and Zhang, C. (2003). A progressive morphological filter for removing nonground measurements from airborne LIDAR data. *IEEE Transactions on Geoscience and Remote Sensing* 41(4), 872–882. [doi:10.1109/TGRS.2003.810682](https://doi.org/10.1109/TGRS.2003.810682)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [Filling the Gaps](gap-filling.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
