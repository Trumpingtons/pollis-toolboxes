# STAR

## What the STAR Tab Fits

The STAR tab fits the space-time autoregression of Pfeifer and Deutsch (1980) to the Variable to Forecast: each area's value in a period is explained by its own values in the last L periods and by the values of its neighbours, ring by ring up to the S-th, in the same past periods ([Pfeifer and Deutsch (1980)](#ref-PD1980a)). The tab calls `fit_star(y, X, W, N, T_per; spatial_lags, temporal_lags, spatial_weights)` of SpatialEconometrics.jl on the periods before those held back, with the Explanatory Variables, if any, as X and an intercept. The documentation explains that every regressor is dated before the period it explains, so none is correlated with that period's error and least squares is consistent without the Jacobian a contemporaneous spatial lag requires; this is the reason any lag orders are affordable ([Randsley (2026)](#ref-Ran2026a)). With Area Means set to Remove, each area's mean is subtracted first.

## Reading the Output of the STAR Tab

The STAR tab prints one row for each coefficient, with its estimate, standard error and t-value. The rows come lag by lag: `y(t-1)`, the area's own value one period before, then `W^1 y(t-1)`, `W^2 y(t-1)` and so on, its neighbours' values in each ring, then the same for the second lag; the explanatory variables and the intercept follow. With Spatial Weights set to Order-k Neighbours the rings are named with the order in brackets instead of a power ([Randsley (2026)](#ref-Ran2026a)). Below the table come the periods fitted, the area means, the error variance, the log-likelihood and the spectral radius of the system. A table of the forecasts of the Horizon follows, with the mean forecast over the areas at each step and, for the periods held back, the RMSE and MAE.

## The Coefficients of the STAR Tab

The coefficients of `y(t-l)` are the plain temporal autoregressive coefficients, and with no spatial lags the model nests a panel autoregression, which is the Panel AR tab ([Randsley (2026)](#ref-Ran2026a)). The coefficients of the rings say how much of the neighbours' past values carries into each area's value, and Pfeifer and Deutsch note that the model class collapses into that of ARIMA models in the absence of spatial correlation ([Pfeifer and Deutsch (1980)](#ref-PD1980a)). As the forecasts feed back period after period, the effect of a value on later periods and on areas further away is not read from any single coefficient: `space_time_irf` traces it through the fitted system, and the Space-Time Impulse Responses step draws it ([Randsley (2026)](#ref-Ran2026a)).

## When the STAR Design Cannot Be Fitted

`fit_star` checks the rank of its design before fitting and names the columns that make it deficient. Its documentation gives the usual causes. With powers of the weights, a regular weights matrix can make a power a combination of lower ones, a complete graph giving the second power proportional to the first, so the spatial lags cannot be raised indefinitely. With order-k neighbours, an order beyond the diameter of the neighbours' graph has no pairs, and the function refuses with the diameter. A column of the explanatory variables that is the same in every area, beside the intercept, or too few periods also leave the design deficient ([Randsley (2026)](#ref-Ran2026a)). The Lag Orders step marks the pairs of orders refused in this way and goes on with the others.

## Next Steps Particular to the STAR Tab

Powers Against Orders of W is offered only on the STAR tab: it fits STAR with two or more spatial lags under both definitions of the rings, which coincide with one spatial lag ([Randsley (2026)](#ref-Ran2026a)). The Spatial Interaction Test step tests by Wald whether every coefficient of the rings is zero, which leaves Panel AR, with the least squares covariance of the coefficients. Forecast Accuracy by Horizon sets the forecasts of STAR beside those of Spatial VAR, Panel AR and each area's last value, and Space-Time Impulse Responses shows the response of the area shocked and the spillover to the others, period by period after a shock.

## References

<a id="ref-PD1980a"></a>Pfeifer, P. E. and Deutsch, S. J. (1980). A three-stage iterative procedure for space-time modeling. *Technometrics*, 22(1), 35–47. [doi:10.2307/1268381](https://doi.org/10.2307/1268381)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Panel AR](panelar.md) · [Spatial VAR](spvar.md) · [Decision Guide](decision-guide.md)
