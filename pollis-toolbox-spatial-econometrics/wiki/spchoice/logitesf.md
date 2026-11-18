# Logit With a Filter

## What the Logit With a Filter Tab Fits

The Logit With a Filter tab fits a logistic regression of a binary choice on an intercept, the explanatory variables and a spatial filter: a few Moran eigenvectors of the spatial weights, map patterns of known spatial autocorrelation, chosen to take up the spatial pattern that the explanatory variables leave in the choices ([Griffith (2003)](#ref-Gri2003a)). The eigenvectors enter as ordinary explanatory variables, so the choices of different areas stay independent given the filter, and the model is fitted as any logistic regression. The tab calls `fit_esf` of SpatialEconometrics.jl with `family = :logit`, which fits the regression by iteratively reweighted least squares ([Randsley (2026)](#ref-Ran2026a)).

## How the Logit With a Filter Tab Selects Eigenvectors

The candidates are the eigenvectors whose Moran coefficient is at least the Candidate Screen times the largest. Starting from the logistic regression without a filter, each step refits the regression with every remaining candidate and keeps the one that most reduces the absolute Moran coefficient of the Pearson residuals, each choice minus its fitted probability divided by the standard deviation of a 0 or 1 with that probability. Selection stops when that coefficient falls below 0.05, when no candidate reduces it, or when the Maximum Eigenvectors are in ([Randsley (2026)](#ref-Ran2026a)). As each candidate tried is a full refit, the number of candidates drives the time the tab takes.

## Reading the Output of the Logit With a Filter Tab

The Logit With a Filter tab prints the coefficients of the intercept and the explanatory variables with their standard errors and z-values, on the log-odds scale: the exponential of a coefficient is the factor by which the odds of the choice change for one more unit of its variable, the filter held fixed. It then lists the eigenvectors selected, the Moran coefficient of the Pearson residuals without the filter and with it, and the hit rate. The documentation of `fit_esf` notes that the standard errors treat the selected eigenvectors as fixed in advance, so they do not include the uncertainty of the selection ([Randsley (2026)](#ref-Ran2026a)).

## A Spatial Filter Instead of a Spillover

A spatial filter removes the spatial autocorrelation of the choices without saying how it arises: no area's choice responds to its neighbours', so the model has no indirect effects, and a change in an explanatory variable moves only the probability of its own area. The filter describes where on the map the choices are more or less likely than the explanatory variables predict ([Griffith (2003)](#ref-Gri2003a)). The Lag Probit Against a Filter step sets the filter beside a spatial lag probit on the same data, comparing their hit rates, the autocorrelation left in their residuals and their effects on the probability.

## References

<a id="ref-Gri2003a"></a>Griffith, D. A. (2003). *Spatial autocorrelation and spatial filtering: gaining understanding through theory and scientific visualization*. Springer Berlin Heidelberg. [doi:10.1007/978-3-540-24806-4](https://doi.org/10.1007/978-3-540-24806-4)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Decision Guide](decision-guide.md) · [Probit, GMM](probitgmm.md) · [Overview](overview.md)
