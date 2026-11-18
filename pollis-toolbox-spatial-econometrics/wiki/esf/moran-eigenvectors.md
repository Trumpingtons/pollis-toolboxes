# Moran Eigenvectors

## What Moran Eigenvectors Are

Moran eigenvectors are the eigenvectors of the spatial weights matrix after it is centred on both sides, so that every eigenvector has mean zero and is uncorrelated with the others. Each eigenvector is a map pattern: a value for every area, and its Moran coefficient, as a variable, is proportional to its eigenvalue ([Griffith (2003)](#ref-Gri2003a)). The first eigenvector is the map pattern with the largest positive spatial autocorrelation possible for the weights, the second the largest among those uncorrelated with the first, and so on, down to patterns with negative spatial autocorrelation ([Tiefelsdorf and Griffith (2007)](#ref-TG2007a)).

## Reading the Map Patterns of Moran Eigenvectors

The eigenvectors with the largest eigenvalues vary smoothly over the map: the first usually separates one side of the study area from the other, and the next ones show regional patterns at finer and finer scales. Eigenvectors with eigenvalues near zero are patterns with little spatial autocorrelation, and those with negative eigenvalues alternate between neighbouring areas. A spatial filter built from the leading eigenvectors therefore describes the broad and regional spatial structure that the explanatory variables leave in the outcome ([Griffith (2003)](#ref-Gri2003a)).

## Candidate Eigenvectors and the Screening Ratio

Most outcomes in regional data show positive spatial autocorrelation, so the candidates for a filter are usually limited to eigenvectors of marked positive autocorrelation. A common rule keeps the eigenvectors whose Moran coefficient is at least a quarter of the largest, which is the default of SpatialEconometrics.jl and of the spmoran package ([Randsley (2026)](#ref-Ran2026a); [Murakami (2017)](#ref-Mur2017b)). The Candidate Screen input of the panel sets that ratio: a lower ratio adds candidates of weaker autocorrelation, at the cost of more possible selections.

## Weights Behind the Eigenvectors

The eigenvectors depend entirely on the spatial weights. With contiguity weights, the map patterns follow the boundaries between areas; with distance-based weights, such as a kernel of the distances between centroids, they follow the distances instead. spmoran builds its weights from an exponential kernel of the distances, with a range set by the longest edge of the minimum spanning tree of the locations ([Murakami (2017)](#ref-Mur2017b)). SpatialEconometrics.jl symmetrises the weights before centring them, so row-standardised weights can be used ([Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-Gri2003a"></a>Griffith, D. A. (2003). *Spatial autocorrelation and spatial filtering: gaining understanding through theory and scientific visualization*. Springer Berlin Heidelberg. [doi:10.1007/978-3-540-24806-4](https://doi.org/10.1007/978-3-540-24806-4)

<a id="ref-Mur2017b"></a>Murakami, D. (2017). Gaussian spatial regression using the spmoran package: case study examples. arXiv. [doi:10.48550/arXiv.1703.04467](https://doi.org/10.48550/arXiv.1703.04467)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-TG2007a"></a>Tiefelsdorf, M. and Griffith, D. A. (2007). Semiparametric filtering of spatial autocorrelation: the eigenvector approach. *Environment and Planning A: Economy and Space*, 39(5), 1193–1221. [doi:10.1068/a37378](https://doi.org/10.1068/a37378)

## See Also
- [Overview](overview.md) · [Selecting Eigenvectors](selecting-eigenvectors.md) · [Decision Guide](decision-guide.md)
