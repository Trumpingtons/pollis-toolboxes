# Terrain Model from Point Cloud — Filling the Gaps

## Why a Terrain Model from Lidar Has Gaps

A cell of a terrain model has a measured height only where at least one ground point falls within it. Under dense forest few laser pulses reach the soil, and under a building none do; water often returns no pulse at all; and the swaths of a survey leave thinner strips between them. The smaller the cell, the more cells are left without a ground point. Ground points removed by a filter as objects leave gaps too. Relief Visualisation and the other panels of Archaeological Prospection read a height from every cell, and an empty cell leaves a hole in the images made from the terrain model.

## Inverse Distance Weighting in Terrain Model from Point Cloud

Fill the Gaps, Step 3 of Terrain Model from Point Cloud, gives each cell without ground the weighted mean height of the nearest cells with ground, each weighted by the inverse square of its distance, the interpolation of irregularly spaced data of Shepard ([Shepard (1968)](#ref-She1968a)). The distance is that between the centres of the cells, and the Neighbours is the number of nearest cells with ground that are used. NearestNeighbors.jl finds them with a k-d tree built on the centres of the cells with ground ([Carlsson (2026)](#ref-Car2026a)). Cells that had a ground point keep their heights as they are.

## The Distance up to Which Terrain Model from Point Cloud Fills

A cell without ground is filled only when the nearest cell with ground is at most the Distance away, in metres. Farther cells stay empty, as NaN in the terrain model and in the saved Cloud-Optimised GeoTIFF, so that no height is made up where no ground was measured, as over a lake, a quarry floor without returns or the middle of a large building. A larger Distance fills more of the gaps under dense forest, with heights drawn from farther away; a smaller one leaves more cells empty. The number of filled cells and of cells left empty is printed by Fill the Gaps.

## What a Filled Cell Shows in the Relief

A filled cell has a height interpolated from its neighbours, not measured. Over a wide gap, inverse distance weighting gives a surface that rises and falls smoothly between the cells with ground, and cannot show a bank, a ditch or a mound that lies wholly within the gap. Where gaps and measured cells alternate, as under broken canopy, the filled surface joins heights from different points and can look rough or cracked in shaded relief. The map Filled Cells, in Zoom and Pan of Check the Terrain Model, shows which cells were filled, so that forms seen there can be read with care.

## References

<a id="ref-Car2026a"></a>Carlsson, K. (2026). NearestNeighbors.jl: high performance nearest neighbor data structures and algorithms for Julia. [github.com/KristofferC/NearestNeighbors.jl](https://github.com/KristofferC/NearestNeighbors.jl)

<a id="ref-She1968a"></a>Shepard, D. (1968). A two-dimensional interpolation function for irregularly-spaced data. In *Proceedings of the 1968 23rd ACM National Conference*, 517–524. [doi:10.1145/800186.810616](https://doi.org/10.1145/800186.810616)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [Ground Filters](ground-filters.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
