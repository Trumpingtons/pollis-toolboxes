# SKATER Regions

## What the SKATER Regions Tab Does

The SKATER Regions tab groups the areas of the file into Number of Regions contiguous regions, each alike inside in the SKATER Variables, with `skater_regimes` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)). It follows SKATER, the method of Assunção, Neves, Câmara and Freitas (2006), which cuts a minimum spanning tree of neighbouring areas into connected parts ([Assunção, Neves, Câmara and Freitas (2006)](#ref-ANCF2006a)). The tab prints the number of regions found, the share of the spread of the standardised SKATER Variables that lies between the regions, and each region's number of areas and means. It fits no regression: the regions it builds are what the Regimes From SKATER option of the regime tabs uses.

## The Tree and the Cuts of SKATER in SpatialEconometrics.jl

`skater_regimes` standardises each SKATER Variable, joins each pair of neighbours by an edge whose length is the Euclidean distance between their standardised values, and builds the minimum spanning tree of that graph ([Randsley (2026)](#ref-Ran2026a)). It then splits the tree one edge fewer times than the number of regions. At each step it removes, among all edges of all regions, the one whose removal most reduces the within-region sum of squared deviations. Its documentation explains why it does not cut the longest edge instead: that edge usually attaches one outlying area, so cutting it would peel off regions of a single area. The panel passes the neighbours in both directions, so that k Nearest, which need not be symmetric, still gives a connected graph where it can.

## Minimum Region Size and Fewer Regions Than Asked

Minimum Region Size is the fewest areas a region may have. `skater_regimes` skips any cut that would leave a smaller part, and stops when no admissible cut is left, so it can return fewer regions than Number of Regions ([Randsley (2026)](#ref-Ran2026a)); the tab then says so. Its documentation advises raising the minimum when the regions feed a regime regression, which needs enough areas in each region to estimate that region's own intercept and slopes. An area with no neighbour cannot be joined to the tree, so islands are best removed from the file, or joined with k Nearest, before SKATER runs.

## Reading the Share of the Spread Between the Regions

The tab prints the share of the total spread of the standardised SKATER Variables that lies between the regions, one minus the within-region sum of squared deviations over the total. It grows with every cut, and reaches 1 only when every area is its own region. Number of Regions, in the Next Steps, prints it for 2 to 8 regions beside the AIC of the regime regression each set of regions gives, which helps to choose how many regions to keep.

## References

<a id="ref-ANCF2006a"></a>Assunção, R. M., Neves, M. C., Câmara, G. and Freitas, C. da C. (2006). Efficient regionalization techniques for socio-economic geographical units using minimum spanning trees. *International Journal of Geographical Information Science*, 20(7), 797–811. [doi:10.1080/13658810600665111](https://doi.org/10.1080/13658810600665111)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Regionalisation](regionalisation.md) · [Regimes, OLS](regols.md) · [Testing Regimes](testing-regimes.md)
