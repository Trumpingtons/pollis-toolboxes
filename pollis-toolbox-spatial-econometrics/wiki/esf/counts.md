# Spatial Filtering for Counts and Binary Outcomes

## Why Spatial Filtering Suits Counts

Counts per area, such as cases of a disease, hospital visits or crimes, are usually modelled by Poisson or negative binomial regression, and binary outcomes by logistic regression. The spatial lag and error models are built for a continuous outcome with normal errors and do not carry over directly to these models. A spatial filter does: the selected eigenvectors are ordinary explanatory variables, so they can enter the linear predictor of any generalised linear model ([Griffith (2003)](#ref-Gri2003a)). This makes eigenvector spatial filtering one of the simplest ways to account for spatial autocorrelation in counts.

## Poisson and Negative Binomial Families in ESF

A Poisson regression assumes that the variance of a count equals its mean. Counts per area often vary more than that, because of unmeasured differences between areas, and a negative binomial regression allows for this overdispersion with a dispersion parameter. SpatialEconometrics.jl fits both by iteratively reweighted least squares, and estimates the negative binomial's dispersion by maximum likelihood by default, or by the method of moments ([Randsley (2026)](#ref-Ran2026a)). The Count Family input of the ESF for Counts tab chooses between them.

## How Eigenvectors Are Selected in a Count Regression

The residuals of a count regression have a variance that grows with the expected count, so their Moran coefficient is computed on Pearson residuals, each residual divided by its standard deviation under the model. In SpatialEconometrics.jl, the Moran criterion of `fit_esf` uses the Pearson residuals for the Poisson, negative binomial and logistic families, and each step refits the regression by iteratively reweighted least squares ([Randsley (2026)](#ref-Ran2026a)). Since each candidate needs a refit, the number of candidates and of eigenvectors drives the time a count filter takes.

## Reading the Coefficients of a Count Regression With a Filter

The Poisson and negative binomial regressions use a log link, so their coefficients, and the spatial filter, are on the log scale of the expected count. The exponential of a coefficient is the factor by which the expected count changes for one more unit of its variable, with the other variables and the filter held fixed. The Map of the Spatial Filter step shows the filter on that log scale: a value of zero leaves the expected count as the explanatory variables give it.

## References

<a id="ref-Gri2003a"></a>Griffith, D. A. (2003). *Spatial autocorrelation and spatial filtering: gaining understanding through theory and scientific visualization*. Springer Berlin Heidelberg. [doi:10.1007/978-3-540-24806-4](https://doi.org/10.1007/978-3-540-24806-4)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [ESF for Counts](esfcounts.md) · [Selecting Eigenvectors](selecting-eigenvectors.md) · [Decision Guide](decision-guide.md)
