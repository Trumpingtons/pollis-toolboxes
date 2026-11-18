# Replications

## Software the Eigenvector Spatial Filtering Panel Is Checked Against

The panel's results are compared with spmoran, the R package of Murakami for regression with Moran eigenvectors. Its `meigen` function extracts the Moran eigenvectors from the coordinates of the observations, `esf` fits eigenvector spatial filtering with eigenvectors selected stepwise, and `resf` fits random-effects ESF by restricted maximum likelihood ([Murakami (2017)](#ref-Mur2017b)). The case study examples of the package, an open document, print the full output of these functions on a standard dataset, which the panel's Replicate step uses as its targets.

## The Boston Housing Dataset

The Boston housing dataset records the median value of owner-occupied homes and characteristics of the 506 census tracts of the Boston area in 1970, with the coordinates of each tract. spmoran's case study examples model the corrected median value on the crime rate, the share of residential land zoned for large lots, the share of non-retail business acres, the Charles River dummy, the nitric oxides concentration, the average number of rooms and the share of old units, with Moran eigenvectors of the distances between the tracts ([Murakami (2017)](#ref-Mur2017b)). The data are distributed openly with the R package spData.

## Replicating the spmoran Case Study Examples

The panel's Boston House Prices step rebuilds spmoran's weights, an exponential kernel of the distances between the tracts with its range set by the longest edge of their minimum spanning tree, and keeps the eigenvectors with a Moran coefficient at least a quarter of the largest, as `meigen` does. It then fits ESF and random-effects ESF with SpatialEconometrics.jl and prints the coefficients and standard errors beside those of the case study ([Randsley (2026)](#ref-Ran2026a)).

## Why the Replication Can Differ From spmoran

The two packages do not select eigenvectors in the same way. spmoran's `esf` adds eigenvectors by adjusted R-squared with a limit on their variance inflation factors, while SpatialEconometrics.jl selects by the Moran coefficient of the residuals or by AIC, so the filters, and the coefficients they leave, can differ ([Murakami (2017)](#ref-Mur2017b); [Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-Mur2017b"></a>Murakami, D. (2017). Gaussian spatial regression using the spmoran package: case study examples. arXiv. [doi:10.48550/arXiv.1703.04467](https://doi.org/10.48550/arXiv.1703.04467)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Moran Eigenvectors](moran-eigenvectors.md) · [Random-Effects ESF](reesf.md)
