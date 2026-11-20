# Negative Binomial

## What the Negative Binomial Tab Fits

The Negative Binomial tab fits the doubly constrained model with a negative binomial variance, mu + alpha mu^2, which grows faster than the mean when alpha is above 0, and is the Poisson variance when alpha is 0. It calls `fit_gravity(NegBinGravity(), ...)` of SpatialEconometrics.jl with `BilateralFE()`, one effect per origin and per destination, swept out of the regression ([Randsley (2026)](#ref-Ran2026a)). The documentation of `fit_gravity` states that the fit starts from the Poisson model and alternates between the coefficients, with weights mu / (1 + alpha mu), and the dispersion, which solves a moment condition on the Pearson residuals counting the absorbed effects among the parameters.

## Reading the Output of the Negative Binomial Tab

The Negative Binomial tab prints the coefficients of the Pair Variables and the distance coefficient, with robust standard errors whatever the Standard Errors input, then the fit statistics and the dispersion alpha ([Randsley (2026)](#ref-Ran2026a)). The pseudo R-squared compares the log-likelihood with that of a constant alone under the same variance, so it is not set beside the Poisson tabs' ([Oshan (2016)](#ref-Osh2016a)). The Poisson Against Negative Binomial step prints the distance coefficient of both models, with the model-based and robust standard errors of the Poisson model.

## When to Use the Negative Binomial Tab

Cameron and Trivedi (1990) give regression-based tests of whether the variance of counts exceeds their mean, as a negative binomial variance allows; the Overdispersion Test step of the Poisson tabs applies one ([Cameron and Trivedi (1990)](#ref-CT1990a)). Under overdispersion the Poisson estimates stay consistent, as Santos Silva and Tenreyro (2006) note, while its model-based standard errors understate the uncertainty ([Santos Silva and Tenreyro (2006)](#ref-SST2006a)). Robust standard errors are one remedy, keeping the Poisson estimates; the Negative Binomial tab is the other, weighing the large flows less and estimating the extra variance.

## References

<a id="ref-CT1990a"></a>Cameron, A. C. and Trivedi, P. K. (1990). Regression-based tests for overdispersion in the Poisson model. *Journal of Econometrics*, 46(3), 347–364. [doi:10.1016/0304-4076(90)90014-K](https://doi.org/10.1016/0304-4076(90)90014-K)

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-SST2006a"></a>Santos Silva, J. M. C. and Tenreyro, S. (2006). The log of gravity. *The Review of Economics and Statistics*, 88(4), 641–658. [doi:10.1162/rest.88.4.641](https://doi.org/10.1162/rest.88.4.641)

## See Also
- [Doubly Constrained](doubly.md) · [Decision Guide](decision-guide.md) · [Goodness of Fit](goodness-of-fit.md)
