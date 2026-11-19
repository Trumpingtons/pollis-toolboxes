# Regionalisation

## What Regionalisation Means

Regionalisation groups areas into regions that are alike inside and that each form one connected piece of the map. Duque, Ramos and Suriñach (2007) review almost four decades of such methods, which aggregate a set of areas into a predefined number of spatially contiguous regions while optimising an aggregation criterion ([Duque, Ramos and Suriñach (2007)](#ref-DRS2007a)). Ordinary clustering groups areas by their values alone, so a cluster can be scattered over the map; regionalisation adds the contiguity constraint. Uses include zones for a census or a survey, regions for a policy, and regimes for a regression whose coefficients may differ from one part of the map to another.

## Kinds of Regionalisation Methods

Duque, Ramos and Suriñach (2007) classify regionalisation methods into eight groups by the strategy each uses to satisfy the contiguity constraint, and compare the groups qualitatively ([Duque, Ramos and Suriñach (2007)](#ref-DRS2007a)). Some cluster the areas first and then split clusters that are not connected; some add the coordinates of the areas to the clustering variables; some build the constraint into the clustering, by joining only neighbouring areas or by optimising over partitions that are connected. SKATER, the method of the SKATER Regions tab, belongs with the methods that work on a graph of neighbouring areas ([Assunção, Neves, Câmara and Freitas (2006)](#ref-ANCF2006a)).

## How SKATER Builds Regions

SKATER, by Assunção, Neves, Câmara and Freitas (2006), starts from a graph that joins each pair of neighbouring areas, with a cost on each edge that grows as the two areas differ ([Assunção, Neves, Câmara and Freitas (2006)](#ref-ANCF2006a)). It summarises that graph by a minimum spanning tree, a connected tree with no circuits, and then removes edges that link dissimilar areas, one at a time. Removing an edge of a tree splits it in two connected parts, so every region stays contiguous. Partitioning the tree optimally is NP-hard, and the authors propose a heuristic that speeds the partition up. In SpatialEconometrics.jl, `skater_regimes` chooses each cut as the one that most reduces the sum of squared deviations within the regions, over the standardised variables ([Randsley (2026)](#ref-Ran2026a)).

## Choices That Shape the Regions

The regions depend on four choices of the panel. SKATER Variables are the columns the regions are made alike in; each is standardised, so that no variable dominates by its units. Neighbours sets which areas may be joined: contiguity keeps the regions in one piece on the map, while k Nearest joins areas by distance. Number of Regions sets how many cuts are made. Minimum Region Size skips cuts that would leave a smaller region; the documentation of `skater_regimes` advises raising it when the regions feed a regime regression, which needs enough areas per region for its own coefficients ([Randsley (2026)](#ref-Ran2026a)). Number of Regions, in the Next Steps, shows how the share of the spread between the regions grows with each cut.

## References

<a id="ref-ANCF2006a"></a>Assunção, R. M., Neves, M. C., Câmara, G. and Freitas, C. da C. (2006). Efficient regionalization techniques for socio-economic geographical units using minimum spanning trees. *International Journal of Geographical Information Science*, 20(7), 797–811. [doi:10.1080/13658810600665111](https://doi.org/10.1080/13658810600665111)

<a id="ref-DRS2007a"></a>Duque, J. C., Ramos, R. and Suriñach, J. (2007). Supervised regionalization methods: a survey. *International Regional Science Review*, 30(3), 195–220. [doi:10.1177/0160017607301605](https://doi.org/10.1177/0160017607301605)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [SKATER Regions](skater.md) · [Testing Regimes](testing-regimes.md) · [Overview](overview.md)
