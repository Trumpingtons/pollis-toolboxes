# Panel AR

## What the Panel AR Tab Fits

The Panel AR tab fits a panel autoregression to the Variable to Forecast: each area's value in a period is explained by its own values in the last L periods, the Explanatory Variables of the same period, if any, and an intercept, with coefficients common to all areas. The tab calls `fit_star` of SpatialEconometrics.jl with no spatial lag, `spatial_lags = 0`, on the periods before those held back; the documentation of `fit_star` notes that the space-time autoregression then nests a non-spatial panel autoregression of order L, its coefficients being the plain temporal autoregressive ones ([Randsley (2026)](#ref-Ran2026a)). The estimation is by least squares, as on the STAR tab, and Area Means works as there: with Remove, each area's mean over the periods fitted is subtracted before the fit and added back to the forecasts.

## Reading the Output of the Panel AR Tab

The Panel AR tab prints the coefficients of `y(t-1)` to `y(t-L)`, the area's own values one to L periods before, then the explanatory variables and the intercept, each with its estimate, standard error and t-value; the standard errors are those of least squares ([Randsley (2026)](#ref-Ran2026a)). The periods fitted, the area means, the error variance, the log-likelihood and the spectral radius of the system follow, as on the STAR tab, and a closing line names the tab as the benchmark of the Next Steps. The forecasts of the Horizon come last, with the mean forecast over the areas at each step and, for the periods held back, the RMSE and MAE. The Spatial Lags and Spatial Weights inputs do not apply to the fit of this tab.

## Panel AR as the Benchmark Without Space

Pfeifer and Deutsch (1980) note that the class of space-time models collapses into that of ARIMA models in the absence of spatial correlation ([Pfeifer and Deutsch (1980)](#ref-PD1980a)). Panel AR is the forecasting model for that case: the neighbours play no part, and each area's forecasts follow its own past alone. The Forecast Accuracy by Horizon step fits STAR, Spatial VAR and Panel AR on the same periods, forecasts the same periods held back and sets their RMSE and MAE side by side, with each area's last value carried forward as the simplest forecast of all. A spatial model whose forecasts are no more accurate than those of Panel AR adds nothing to the forecasts of those periods.

## Testing Panel AR Against STAR

On the Panel AR tab, the Spatial Interaction Test step fits STAR with the Spatial Lags, at least one, on the same periods and the same settings, and tests by Wald whether every coefficient of the neighbours' past values is zero, using the package's `wald_test` with the least squares covariance of the coefficients ([Randsley (2026)](#ref-Ran2026a)). Not rejecting that restriction leaves Panel AR. The Lag Orders step, offered on this tab as on STAR, fits the grid of spatial orders from 0 to 3 and temporal orders from 1 to 3, in which spatial order 0 is Panel AR, and ranks the pairs by AIC, BIC and the accuracy of the forecasts of the periods held back.

## The Residuals of Panel AR

Panel AR leaves the neighbours out, so dependence on their past values or on their values in the same period stays in its residuals. Moran's I of the Residuals measures that dependence period by period, from `panel_moran` of SpatialEconometrics.jl. Pesaran's CD Test looks at the correlation of the residuals across all pairs of areas, not only neighbours; Pesaran (2015) argues that in panels of many units the null of weak dependence is more appropriate than that of independence ([Pesaran (2015)](#ref-Pes2015a)). The documentation of `pesaran_cd` notes that a rejection says the dependence is stronger than the test's null of weak dependence, not that it comes from a common factor; the exponent of cross-sectional dependence, which the step reports beside the test, tells them apart, and the package describes the strong case as a common factor that touches nearly every area and that no weight matrix absorbs ([Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-Pes2015a"></a>Pesaran, M. H. (2015). Testing weak cross-sectional dependence in large panels. *Econometric Reviews*, 34(6–10), 1089–1117. [doi:10.1080/07474938.2014.956623](https://doi.org/10.1080/07474938.2014.956623)

<a id="ref-PD1980a"></a>Pfeifer, P. E. and Deutsch, S. J. (1980). A three-stage iterative procedure for space-time modeling. *Technometrics*, 22(1), 35–47. [doi:10.2307/1268381](https://doi.org/10.2307/1268381)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [STAR](star.md) · [Spatial VAR](spvar.md) · [Forecasting in Space and Time](forecasting.md)
