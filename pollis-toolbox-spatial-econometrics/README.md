# Spatial Econometrics Toolbox

**Spatial Econometrics: Regression Models for Regions.** Models for data on regions, municipalities and other areas, where an area's outcome depends on its neighbours: through their outcomes, their characteristics or the shocks they share. For economists, regional scientists and analysts of regional policy.

Installing it adds the **Spatial Econometrics** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code you can send to the Julia REPL or a notebook, reference wikis, and Next Steps that replicate its results against R and published articles.

## Panels

**Spatial Lag and Error Models**: least squares with Moran's I of its residuals and the Lagrange multiplier tests, and the spatial lag (SAR), spatial error (SEM), spatial lag of X (SLX) and spatial Durbin (SDM) models, with their direct and indirect effects, on SpatialEconometrics.jl. Its Replicate steps reproduce Tables 2, 14, 17 and 18 of Bivand and Piras (2015) from the article's replication archive, and set the panel's estimates beside R's spatialreg on the Columbus and Boston data of the spData package.

**Geographically Weighted Regression**: regressions whose coefficients vary over the map, with a fixed or an adaptive bandwidth chosen by AICc, and multiscale GWR (MGWR), with one bandwidth per coefficient, on SpatialEconometrics.jl. Its Next Steps map the local coefficients, t-values and R-squared, adjust the local tests for multiple testing, test whether a coefficient varies over the map, and compare GWR with least squares and with MGWR. Its Replicate steps set the panel's results beside GWR4 and beside Oshan, Li, Kang, Wolf and Fotheringham (2019), on the Georgia counties of libpysal.

**Eigenvector Spatial Filtering**: regressions with a spatial filter made of Moran eigenvectors of the spatial weights, which removes the spatial autocorrelation of the residuals so that the coefficients can be read as in an ordinary regression, on SpatialEconometrics.jl. The eigenvectors are selected one at a time by the Moran coefficient of the residuals or by AIC, enter a Poisson or negative binomial regression for counts, or are all kept with their coefficients shrunk, in random-effects ESF. Its Next Steps map the filter and the selected eigenvectors, test the residuals with Moran's I before and after the filter, and compare the filter with least squares, SAR and SEM, the two criteria with each other, and stepwise with random-effects ESF. Its Replicate step sets the panel's results beside the case study examples of Murakami's R package spmoran, on the Boston data of the spData package.

The other items of the menu are greyed out:

| Group | Panels |
|---|---|
| Cross-section | Spatial Discrete Choice |
| Space and time | Spatial Panel Data, Spatio-Temporal Forecasting |
| Regions and policy | Spatial Causal Inference, Regionalisation and Spatial Regimes |

The [Smart Regions Toolbox](../pollis-toolbox-smart-regions/README.md) reads area files, draws them on base maps, and tests a value of a set of areas for spatial autocorrelation with Moran's I and Local Moran (LISA), the usual first step before a spatial regression.

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones. The panels read area files through DuckDB's spatial extension, which Pollis downloads from DuckDB's repository when the toolbox is installed, and keeps if the toolbox is uninstalled.

## License

AGPL-3.0
