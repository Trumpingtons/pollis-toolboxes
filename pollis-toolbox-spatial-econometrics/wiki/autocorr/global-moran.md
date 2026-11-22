# Global Moran's I

## What the Global Moran's I Tab Computes

The Global Moran's I tab of the Spatial Autocorrelation panel computes Moran's I of the Column input over all the areas of the file, with the spatial weights of the Neighbours input, and tests it with the number of random permutations of the Permutations input ([Moran (1950)](#ref-Mor1950a)). The computation is `moran(x, W; permutations, rng)` of SpatialDependence.jl, where `x` holds the values in the order of the areas and `W` the row-standardised weights built from the neighbour pairs found with SQL ([Barbero (2026)](#ref-Bar2026a)). Areas with no value in the column are left out before the neighbours are found, so they are neither tested nor counted as anyone's neighbour. The result is printed in the REPL; the Next Steps map the values, draw the Moran scatterplot and the permutation distribution, and compare neighbours and statistics.

## How to Read the Output of the Global Moran's I Tab

| Line | What it is |
|---|---|
| Moran's I | The statistic of the map |
| Expectation | `−1 / (n − 1)`, its expected value under no spatial autocorrelation, for n areas |
| Mean | The mean of Moran's I over the permutations |
| Std Error | The standard deviation of Moran's I over the permutations |
| zscore | Moran's I minus the mean, divided by the standard deviation |
| p-value | The pseudo p-value of the permutation test |

The Mean over the permutations should lie close to the Expectation; the gap between them shrinks as the number of permutations grows ([Cressie (1993)](#ref-Cre1993a)). A zscore far from zero and a small p-value say that the arrangement of the values over the areas is unlikely to be random. The sign of Moran's I minus the Expectation gives the direction: positive for clustering of similar values, negative for dispersion.

## What a Significant Moran's I Does and Does Not Say

A significant Moran's I says that, for the neighbours chosen, the values of the column are arranged over the areas in a way that random arrangements seldom match. Moran's I says nothing about where the similar values lie, nor whether the whole map or a few areas account for it: the Local Moran (LISA) tab answers that ([Anselin (1995)](#ref-Ans1995a)). Moran's I is also specific to the spatial weights: a variable can be significantly autocorrelated among contiguous areas and not among more distant ones. Finally, spatial autocorrelation in a variable may come from large-scale variation, a trend across the map, as well as from small-scale dependence between neighbours ([Cressie (1993)](#ref-Cre1993a)); Moran's I alone does not tell the two apart.

## References

<a id="ref-Ans1995a"></a>Anselin, L. (1995). Local indicators of spatial association—LISA. *Geographical Analysis*, 27(2), 93–115. [doi:10.1111/j.1538-4632.1995.tb00338.x](https://doi.org/10.1111/j.1538-4632.1995.tb00338.x)

<a id="ref-Bar2026a"></a>Barbero, J. (2026). SpatialDependence.jl: spatial dependence, spatial weights matrices and exploratory spatial data analysis in Julia. [github.com/javierbarbero/SpatialDependence.jl](https://github.com/javierbarbero/SpatialDependence.jl)

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-Mor1950a"></a>Moran, P. A. P. (1950). Notes on continuous stochastic phenomena. *Biometrika*, 37(1-2), 17–23. [doi:10.1093/biomet/37.1-2.17](https://doi.org/10.1093/biomet/37.1-2.17)

## See Also
- [Factsheet](factsheet.md) · [Spatial Autocorrelation](spatial-autocorrelation.md) · [Permutation Inference](permutation-inference.md) · [Local Moran (LISA)](local-moran.md)
