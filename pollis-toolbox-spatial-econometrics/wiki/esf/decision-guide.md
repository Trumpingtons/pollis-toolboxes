# Decision Guide

## Choosing a Tab of the Eigenvector Spatial Filtering Panel

| Situation | Tab | Reason |
|---|---|---|
| A continuous outcome whose residuals are spatially autocorrelated | ESF, Moran Criterion | Removes the residual autocorrelation with few eigenvectors |
| A continuous outcome, where the fit of the model matters most | ESF, AIC Criterion | Keeps the eigenvectors that improve the fit for their number |
| Counts per area | ESF for Counts | The filter enters a Poisson or negative binomial regression |
| Standard errors that should not depend on a stepwise choice | Random-Effects ESF | Keeps every candidate and shrinks their coefficients |

## Eigenvector Spatial Filtering or a Spatial Lag or Error Model

Eigenvector spatial filtering and the spatial lag and error models answer different questions. The spatial lag model estimates how an area's outcome depends on its neighbours' outcomes, with spillovers between areas; the spatial error model estimates the dependence of the errors. A spatial filter makes no claim about how the dependence arises: it removes it, so that the coefficients of the explanatory variables and their standard errors can be read as in an ordinary regression ([Tiefelsdorf and Griffith (2007)](#ref-TG2007a)). When spillovers are the question, the spatial lag model answers it; when they are not, or the outcome is a count, a filter is simpler.

## Stepwise ESF or Random-Effects ESF

Stepwise ESF gives a filter made of a few named eigenvectors, which can be mapped and read one by one, but its standard errors ignore the uncertainty of the selection. Random-effects ESF keeps every candidate and estimates how much to shrink them, which avoids that uncertainty and, in the simulations of Murakami and Griffith (2015), often estimates the coefficients more accurately ([Murakami and Griffith (2015)](#ref-MG2015a)). They also found that an accuracy-maximising stepwise ESF is comparable to random-effects ESF in many cases.

## Checking That the Filter Has Done Its Work

After the fit, the residuals' Moran coefficient should be close to zero: the Moran's I Before and After step tests it by permutation. A filter that explains a large share of the variance, in How Much the Filter Explains, means that much of the outcome's variation is spatial pattern that the explanatory variables do not account for, which may point to a missing variable with a spatial pattern of its own ([Griffith (2003)](#ref-Gri2003a)).

## References

<a id="ref-Gri2003a"></a>Griffith, D. A. (2003). *Spatial autocorrelation and spatial filtering: gaining understanding through theory and scientific visualization*. Springer Berlin Heidelberg. [doi:10.1007/978-3-540-24806-4](https://doi.org/10.1007/978-3-540-24806-4)

<a id="ref-MG2015a"></a>Murakami, D. and Griffith, D. A. (2015). Random effects specifications in eigenvector spatial filtering: a simulation study. *Journal of Geographical Systems*, 17(4), 311–331. [doi:10.1007/s10109-015-0213-7](https://doi.org/10.1007/s10109-015-0213-7)

<a id="ref-TG2007a"></a>Tiefelsdorf, M. and Griffith, D. A. (2007). Semiparametric filtering of spatial autocorrelation: the eigenvector approach. *Environment and Planning A: Economy and Space*, 39(5), 1193–1221. [doi:10.1068/a37378](https://doi.org/10.1068/a37378)

## See Also
- [Overview](overview.md) · [Selecting Eigenvectors](selecting-eigenvectors.md) · [Random-Effects ESF](reesf.md)
