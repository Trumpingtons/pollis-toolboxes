# Terrain Model from Point Cloud — Decision Guide

## The Survey's Ground or a Ground Filter

| Situation | Choice in Ground | Why |
|---|---|---|
| The survey has classes 2 or 8, and its terrain shows the forms searched | Survey's Ground (Classes 2 and 8) | The provider's classification, often checked by hand, is kept as it is |
| The survey has no ground class, or only classes 0 and 1 | Zhang's Filter or Pingel's Filter | The filters find the ground from every point but noise, whatever its class |
| The survey's ground smooths away low banks or mounds, or keeps vegetation as bumps | Zhang's Filter or Pingel's Filter, compared with Survey's Ground | The same area with another filter shows whether the forms come from the ground or from the classification |
| Several surveys of the same place, classified differently | The same filter on each | One filter with the same settings gives terrain models made alike |

Point Cloud, Step 1, prints the number of points of each class, which shows whether the survey has a ground class. No ground filter is best on every landscape: the best one depends on the density of the data, the type of landscape and the type of archaeological features ([Štular and Lozić (2020)](#ref-SL2020a)).

## Zhang's Filter or Pingel's Filter

Zhang's Filter, the progressive morphological filter, opens the surface with windows growing to the Window and keeps the cells within a height that grows with the Slope from the Initial Height to the Maximum Height ([Zhang, Chen, Whitman, Shyu, Yan and Zhang (2003)](#ref-ZCWSY...2003a)). Pingel's Filter, the simple morphological filter, takes the Window and the Slope alone ([Pingel, Clarke and McBride (2013)](#ref-PCM2013a)), and takes longer on the same area. Zhang's Filter has more settings to adjust, and Pingel's fewer. Both work on the same lowest surface in Terrain Model from Point Cloud, so running one and then the other on the same area, and comparing the shaded reliefs in Zoom and Pan, shows where they differ.

## The Window and the Slope of a Ground Filter

| Setting | Larger value | Smaller value |
|---|---|---|
| Window (m) | Removes larger objects, such as large buildings and dense clumps of trees; also takes wide low platforms and mounds for objects | Keeps wide low forms as ground; leaves objects wider than the window in the terrain model |
| Slope (m/m) | Keeps steep ground, such as the sides of terraces, ramparts and valleys, as ground; leaves more low vegetation in | Removes more low vegetation; takes the edges of steep forms for objects |
| Maximum Height (m), Zhang's Filter | Keeps more of the cells high above the opened surface as ground | Removes more of them |
| Initial Height (m) | Keeps more of the cells close above the opened surface as ground; counts more points as ground points of a cell | Removes more of them; counts fewer |

A Window a little wider than the largest object to remove, and narrower than the platforms or mounds to keep, suits a filter for archaeology. Where the two overlap in size, comparing the result with the Survey's Ground shows what each keeps.

## The Cell Size of the Terrain Model

The Cell Size is the side of a cell, in metres, and so the smallest form the terrain model can show. A smaller cell shows smaller forms, but leaves more cells without a ground point, to be filled, and takes more memory and time. A larger cell rests every height on more ground points, but merges small banks and ditches into their surroundings. The ground points a square metre in Check the Terrain Model show how many ground points the cells rest on; a Cell Size at which most cells have ground points and few are filled gives a terrain model of measured heights. Relief Visualisation, Candidate Features and Learned Detection in Lidar each read the Cell Size from the saved terrain model.

## The Distance and the Neighbours of Fill the Gaps

The Distance decides how far from measured ground a height is made up. A Distance of a few cells fills the scattered gaps among the ground points and leaves large gaps empty, such as lakes and large buildings. A Distance of tens of metres also fills the gaps under dense forest, with heights from farther away, which carry no form of the ground within the gap. The Neighbours, the number of nearest cells with ground whose heights are weighted, smooths the filled surface more as it grows. The map Filled Cells, in Zoom and Pan, shows where the filled heights lie.

## References

<a id="ref-PCM2013a"></a>Pingel, T. J., Clarke, K. C. and McBride, W. A. (2013). An improved simple morphological filter for the terrain classification of airborne LIDAR data. *ISPRS Journal of Photogrammetry and Remote Sensing* 77, 21–30. [doi:10.1016/j.isprsjprs.2012.12.002](https://doi.org/10.1016/j.isprsjprs.2012.12.002)

<a id="ref-SL2020a"></a>Štular, B. and Lozić, E. (2020). Comparison of filters for archaeology-specific ground extraction from airborne LiDAR point clouds. *Remote Sensing* 12(18), 3025. [doi:10.3390/rs12183025](https://doi.org/10.3390/rs12183025)

<a id="ref-ZCWSY...2003a"></a>Zhang, K., Chen, S.-C., Whitman, D., Shyu, M.-L., Yan, J. and Zhang, C. (2003). A progressive morphological filter for removing nonground measurements from airborne LIDAR data. *IEEE Transactions on Geoscience and Remote Sensing* 41(4), 872–882. [doi:10.1109/TGRS.2003.810682](https://doi.org/10.1109/TGRS.2003.810682)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [Ground Filters](ground-filters.md) · [Filling the Gaps](gap-filling.md) · [Diagnostics](diagnostics.md)
