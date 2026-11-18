# Spatial VAR

## What the Spatial VAR Tab Fits

The Spatial VAR tab fits the spatial vector autoregression of Di Giacinto (2010) to the Variables, forecast together over the areas ([Di Giacinto (2010)](#ref-Gia2010a)). It calls `fit_spvar(Y, W, N, T_per; ordering, p, s, varnames)` of SpatialEconometrics.jl on the periods before those held back, with one column of Y per variable in the order listed, the Temporal Lags as p and the Spatial Lags as s. In each equation a variable depends on its neighbours' values in the same period, on the variables before it in the causal ordering, in the area and its neighbours, in the same period, and on the past values of all the variables in the area and its neighbours. The package fits the version with coefficients common to all areas, takes the rings as order-k neighbours, and removes each area's mean of each variable, which absorbs Di Giacinto's intercepts of the areas ([Randsley (2026)](#ref-Ran2026a)).

## How the Spatial VAR Tab Estimates the Model

Di Giacinto (2010) estimates the model by full information maximum likelihood ([Di Giacinto (2010)](#ref-Gia2010a)). The documentation of `fit_spvar` explains that, because the matrix of contemporaneous effects is block triangular, its determinant is the product of one determinant per variable, so the concentrated log-likelihood separates into one term per equation, each maximised on its own: the spatial VAR is fitted as one spatial autoregression per variable. The coefficient of the neighbours' values in the same period is searched for between −0.95 and 0.95, with a warning when it ends at either bound; with two or more spatial lags the search runs over each coefficient in turn, a method the code notes can stall on a ridge, and the tab reports when the search did not converge ([Randsley (2026)](#ref-Ran2026a)).

## Reading the Output of the Spatial VAR Tab

The Spatial VAR tab prints one table per variable, in causal order. Each table starts with the neighbours' values of its own variable in the same period, named `W^1·`, `W^2·` and so on, ring by ring, followed by the variable, the coefficients the likelihood's Jacobian is for; then the variables before it in the same period, in the area and in its rings; then the values of every variable l periods before, named with `(t-l)`. Each row has its estimate, standard error and z-value, and each table ends with the mean over the areas of the equation's error variance, which the model lets differ by area. The standard errors come from the numerical Hessian of each equation's likelihood ([Randsley (2026)](#ref-Ran2026a)). The causal ordering, the log-likelihood and the spectral radius follow, then the RMSE and MAE of each variable's forecasts at each step.

## Identification of the Spatial VAR

`fit_spvar` checks Di Giacinto's order condition for the identification of the contemporaneous matrix before it estimates anything, and when the condition fails it says how many areas the model needs or asks for fewer spatial lags ([Randsley (2026)](#ref-Ran2026a)). The causal ordering is the identifying assumption, which Di Giacinto adapts from the recursive identification scheme of time-series VAR models ([Di Giacinto (2010)](#ref-Gia2010a)). The documentation adds that the matrix is block triangular across the variables rather than strictly triangular, since a strictly triangular one would impose a one-way causal chain on the areas as well as on the variables; block triangularity keeps the ordering across the variables and the interaction between areas in both directions ([Randsley (2026)](#ref-Ran2026a)).

## A Spatial VAR Needs Many Periods

The documentation of `fit_spvar` states that its inference holds as the number of periods grows with the number of areas fixed, the asymptotics of structural VAR models, whereas the package's other panel estimators are consistent as the number of areas grows; it calls bringing a wide, short panel to `fit_spvar` a mistake. Removing each area's means over the periods fitted is algebraically the same as estimating an intercept for each area, and carries the usual dynamic-panel bias of order one over the number of periods ([Randsley (2026)](#ref-Ran2026a)). The Periods Held Back shorten the periods fitted, and the Forecast Beyond the Data step fits the model again on every period before forecasting after the end of the data.

## Next Steps on the Spatial VAR Tab

On the Spatial VAR tab, Moran's I of the Residuals and Pesaran's CD Test examine the residuals of each equation, and the maps and paths show the Variable to Forecast when it is one of the Variables, otherwise the last of them. Space-Time Impulse Responses draws Di Giacinto's space-time impulse response function outward, the effect on each ring of a shock at an area, for each variable's response to a shock to each ([Di Giacinto (2010)](#ref-Gia2010a); [Randsley (2026)](#ref-Ran2026a)). The Spatial Interaction Test compares the model by likelihood ratio with the panel VAR without spatial terms, which `lr_spatial_interaction` fits again on the same data ([Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-Gia2010a"></a>Di Giacinto, V. (2010). On vector autoregressive modeling in space and time. *Journal of Geographical Systems*, 12(2), 125–154. [doi:10.1007/s10109-010-0116-6](https://doi.org/10.1007/s10109-010-0116-6)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [STAR](star.md) · [Panel AR](panelar.md) · [Decision Guide](decision-guide.md)
