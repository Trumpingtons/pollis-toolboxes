# Overview

## What the Spatial Correlation Robust Inference Panel Does

The Spatial Correlation Robust Inference panel fits a least squares regression to areas, or to areas observed over several periods, and corrects its standard errors for correlation between the areas' errors. It has three tabs, one per correction. Conley Spatial HAC lets the errors of areas closer than a cutoff be correlated, with weights that fall with distance, after Conley (1999) ([Conley (1999)](#ref-Con1999a)). Cluster-Robust lets the errors be correlated in any way inside groups of areas and independent between groups ([Cameron and Miller (2015)](#ref-CM2015a)). Driscoll–Kraay, for panels, lets any area be correlated with any other in the same period, and the periods with each other over a few lags, after Driscoll and Kraay (1998) ([Driscoll and Kraay (1998)](#ref-DK1998a)). All three run on SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)).

## Why Spatial Correlation Makes the Usual Standard Errors Too Small

The usual standard errors of least squares assume errors that are independent and of equal variance. White (1980) dropped the equal variance ([White (1980)](#ref-Whi1980a)); the corrections of this panel also drop the independence. When neighbouring areas share shocks, and the explanatory variables are also alike in neighbouring areas, the errors of nearby areas move together and a sample of correlated areas holds less information than its size suggests. Gupta (2026) notes that neglecting spatial correlation can make empirical findings spurious, and that the prevalent modern practice is to correct the standard errors directly rather than to test for the correlation first ([Gupta (2026)](#ref-Gup2026a)).

## The Coefficients Stay the Same, the Standard Errors Change

All three tabs fit the same least squares regression, with the same Fixed Effects, so the estimated coefficients are the same on every tab. What changes is their covariance, and with it the standard errors, t-statistics, p-values and confidence intervals. The table of each tab sets the usual standard error beside the robust one, with their ratio. The documentation of SpatialEconometrics.jl calls the gap between robust and model-based standard errors the diagnostic worth reading: a much larger robust standard error means the model's own covariance was understating the uncertainty ([Randsley (2026)](#ref-Ran2026a)). A spatial lag model, which changes the estimates themselves, is compared in the With a Spatial Lag step of the Next Steps.

## Correcting the Standard Errors or Modelling the Dependence

Gupta (2026) separates two aims. Spatial autoregressive models estimate how strongly an area's outcome depends on its neighbours', and inference is on that dependence. Often the object of interest is a regression coefficient instead, and the spatial correlation only needs to be allowed for in its standard error, as time series analysis does with heteroskedasticity and autocorrelation consistent covariances ([Gupta (2026)](#ref-Gup2026a); [Newey and West (1987)](#ref-NW1987a)). The Spatial Correlation Robust Inference panel serves the second aim. The Spatial Lag and Error Models panel of the same toolbox serves the first.

## Data the Spatial Correlation Robust Inference Panel Reads

The panel reads a file of polygons and, for a panel, a CSV or Parquet file with one row per area and period, joined by the Area Column. With no panel file, the columns are read from the polygons themselves, as a cross-section. Files are read through DuckDB and its spatial extension, and tables as columns with Tables.jl ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [Quinn (2023)](#ref-Qui2023c)). Distances between the areas' centroids are measured in kilometres in the Distance Coordinate System, a projected system. Only areas with every period are kept, so the panel is balanced, as the Conley and Driscoll–Kraay estimators of SpatialEconometrics.jl require.

## Next Steps of the Spatial Correlation Robust Inference Panel

The Next Steps map the residuals, the number of areas within the cutoff and the clusters. They test the residuals with Moran's I, show how the residuals' correlation falls with distance, and check what each estimator leans on: neighbours within the cutoff, the number of clusters and the number of periods. They compare the standard errors across cutoffs, kernels, cluster levels and lags, all the estimators side by side, and least squares with a spatial lag model. Interpret gives the confidence intervals and the effective number of observations. Replicate checks the estimators against Petersen's test data, R's plm and fixest ([Petersen (2009)](#ref-Pet2009b); [Croissant and Millo (2008)](#ref-CM2008a); [Bergé (2018)](#ref-Ber2018a)), with charts drawn by ECharts.jl ([Zwitch (2026)](#ref-Zwi2026a)).

## References

<a id="ref-Ber2018a"></a>Bergé, L. R. (2018). Efficient estimation of maximum likelihood models with multiple fixed-effects: the R package FENmlm. CREA Discussion Papers 13, University of Luxembourg. [uni.lu](https://wwwen-archive.uni.lu/content/download/110162/1299525/file/2018_13%20Efficient%20estimation%20of%20maximum%20likelihood%20models%20with%20multiple%20fixed-effects%20-%20the%20R%20package%20FENmlm.pdf)

<a id="ref-CM2015a"></a>Cameron, A. C. and Miller, D. L. (2015). A practitioner's guide to cluster-robust inference. *Journal of Human Resources*, 50(2), 317–372. [doi:10.3368/jhr.50.2.317](https://doi.org/10.3368/jhr.50.2.317)

<a id="ref-Con1999a"></a>Conley, T. G. (1999). GMM estimation with cross sectional dependence. *Journal of Econometrics*, 92(1), 1–45. [doi:10.1016/S0304-4076(98)00084-0](https://doi.org/10.1016/S0304-4076(98)00084-0)

<a id="ref-CM2008a"></a>Croissant, Y. and Millo, G. (2008). Panel data econometrics in R: the plm package. *Journal of Statistical Software*, 27(2), 1–43. [doi:10.18637/jss.v027.i02](https://doi.org/10.18637/jss.v027.i02)

<a id="ref-DK1998a"></a>Driscoll, J. C. and Kraay, A. C. (1998). Consistent covariance matrix estimation with spatially dependent panel data. *Review of Economics and Statistics*, 80(4), 549–560. [doi:10.1162/003465398557825](https://doi.org/10.1162/003465398557825)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Gup2026a"></a>Gupta, A. (2026). Recent developments in spatial econometrics. arXiv. [doi:10.48550/arXiv.2611.14673](https://doi.org/10.48550/arXiv.2611.14673)

<a id="ref-NW1987a"></a>Newey, W. K. and West, K. D. (1987). A simple, positive semi-definite, heteroskedasticity and autocorrelation consistent covariance matrix. *Econometrica*, 55(3), 703–708. [doi:10.2307/1913610](https://doi.org/10.2307/1913610)

<a id="ref-Pet2009b"></a>Petersen, M. A. (2009). Programming advice: test data with published OLS, White and clustered standard errors. Kellogg School of Management. [kellogg.northwestern.edu](https://www.kellogg.northwestern.edu/faculty/petersen/htm/papers/se/test_data.htm)

<a id="ref-Qui2023c"></a>Quinn, J. (2023). Tables.jl: an interface for tables in Julia. [github.com/JuliaData/Tables.jl](https://github.com/JuliaData/Tables.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-Whi1980a"></a>White, H. (1980). A heteroskedasticity-consistent covariance matrix estimator and a direct test for heteroskedasticity. *Econometrica*, 48(4), 817–838. [doi:10.2307/1912934](https://doi.org/10.2307/1912934)

<a id="ref-Zwi2026a"></a>Zwitch, R. (2026). ECharts.jl: Julia package for the Apache ECharts v6 visualization library. [github.com/randyzwitch/ECharts.jl](https://github.com/randyzwitch/ECharts.jl)

## See Also
- [Factsheet](factsheet.md) · [Choosing a Cutoff](choosing-cutoff.md) · [Decision Guide](decision-guide.md) · [Replications](replications.md)
