# Permutation Inference

## Why Spatial Autocorrelation Is Tested by Permutation

The significance of Moran's I and Geary's c can be judged in two ways: under an assumption of normality, from the moments of the statistic when the values are independent and normally distributed, or under randomisation, from the distribution of the statistic over all the ways the observed values could be arranged over the areas ([Cressie (1993)](#ref-Cre1993a)). A permutation test approximates the randomisation distribution by computing the statistic for many random rearrangements of the values over the same areas, with the same spatial weights. No distribution is assumed for the values, so skewed variables, such as rates and concentrations, are tested on their own terms. The Permutation Distribution of Moran's I, in the Next Steps of the Global Moran's I tab, draws the histogram of Moran's I over the permutations, with the value of the map beside it.

## The Pseudo p-Value and the Number of Permutations

The pseudo p-value of a permutation test is the share of permutations, with the observed map counted among them, that give a statistic at least as extreme as the observed one. With R permutations, the smallest pseudo p-value possible is therefore `1 / (R + 1)`: 0.01 with 99 permutations, 0.001 with 999, 0.0001 with 9999. The Permutations input of the Spatial Autocorrelation panel sets R for every test, global and local ([Barbero (2026)](#ref-Bar2026a)). More permutations give a finer and more stable pseudo p-value, at the cost of time; the local statistics need one set of permutations for every area. The output also gives a z-value, the distance of the statistic from the mean of the permutations in standard deviations of the permutations.

## Conditional Randomisation for Local Statistics

For a local statistic, Anselin proposed conditional randomisation: the value of area i is held fixed, and the other values are permuted over the remaining areas, so that the neighbours of area i receive random values from the rest of the map ([Anselin (1995)](#ref-Ans1995a)). The pseudo p-value of local Moran's I at area i is the share of those permutations that give a local statistic as extreme as the observed one. Local Moran (LISA) computes one such pseudo p-value for every area, and Map of the Local p-Values maps them. Anselin also noted that the local statistics of neighbouring areas share values, and so are not independent of one another, which complicates their joint interpretation ([Anselin (1995)](#ref-Ans1995a)).

## Multiple Comparisons: Bonferroni and the False Discovery Rate

Testing every area at once multiplies the chances of a false alarm: at a significance level of 0.05, about one area in twenty would be significant even with no spatial autocorrelation at all. Anselin discussed the Bonferroni bound, which tests each area at the significance level divided by the number of areas, and noted that it is conservative ([Anselin (1995)](#ref-Ans1995a)). Benjamini and Hochberg proposed controlling the false discovery rate, the expected share of false rejections among all rejections, which keeps more power than controlling the chance of any false rejection ([Benjamini and Hochberg (1995)](#ref-BH1995a)). The Adjustment input of the Local Moran (LISA) tab offers None, Bonferroni and False Discovery Rate (FDR). A Bonferroni or FDR threshold can fall below `1 / (R + 1)`, so the Permutations input must be large enough for any area to pass it.

## The Fixed Seed of the Permutations

The permutations of the Spatial Autocorrelation panel are drawn by a random number generator started with a fixed seed, `Xoshiro(2026)`, from Julia's Random standard library. Running the same code on the same data therefore gives the same permutations, and the same pseudo p-values and cluster labels, every time. Another seed gives another sample of permutations, and pseudo p-values that differ by sampling error, which shrinks as the number of permutations grows. An area whose pseudo p-value lies close to the significance level may change label between seeds; raising the Permutations input makes such changes rarer.

## References

<a id="ref-Ans1995a"></a>Anselin, L. (1995). Local indicators of spatial association—LISA. *Geographical Analysis*, 27(2), 93–115. [doi:10.1111/j.1538-4632.1995.tb00338.x](https://doi.org/10.1111/j.1538-4632.1995.tb00338.x)

<a id="ref-Bar2026a"></a>Barbero, J. (2026). SpatialDependence.jl: spatial dependence, spatial weights matrices and exploratory spatial data analysis in Julia. [github.com/javierbarbero/SpatialDependence.jl](https://github.com/javierbarbero/SpatialDependence.jl)

<a id="ref-BH1995a"></a>Benjamini, Y. and Hochberg, Y. (1995). Controlling the false discovery rate: a practical and powerful approach to multiple testing. *Journal of the Royal Statistical Society Series B: Statistical Methodology*, 57(1), 289–300. [doi:10.1111/j.2517-6161.1995.tb02031.x](https://doi.org/10.1111/j.2517-6161.1995.tb02031.x)

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

## See Also
- [Factsheet](factsheet.md) · [Spatial Autocorrelation](spatial-autocorrelation.md) · [Decision Guide](decision-guide.md) · [Global Moran's I](global-moran.md) · [Local Moran (LISA)](local-moran.md)
