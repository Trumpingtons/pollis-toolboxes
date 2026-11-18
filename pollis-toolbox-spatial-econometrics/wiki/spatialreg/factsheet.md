# Factsheet

## What the Spatial Lag and Error Models Panel Does

The Spatial Lag and Error Models panel fits regression models to data on areas (municipalities, parishes, census tracts or grid cells) in which the outcome of an area may depend on its neighbours. The OLS and LM Tests tab fits least squares and tests its residuals for spatial dependence ([Cliff and Ord (1972)](#ref-CO1972a); [Anselin, Bera, Florax and Yoon (1996)](#ref-ABFY1996a)). The Spatial Lag (SAR), Spatial Error (SEM), Lag of X (SLX) and Spatial Durbin (SDM) tabs fit the four spatial models ([LeSage and Pace (2009)](#ref-LP2009a); [Elhorst (2014)](#ref-Elh2014a)). The models come from SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)). The areas are read, and their neighbours found, with SQL through DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## The Inputs of the Spatial Lag and Error Models Panel

| Input | What it sets |
|---|---|
| Folder, File | The polygon file of the areas |
| Dependent Variable | The numeric column the models explain |
| Explanatory Variables | The numeric columns that explain it, separated by commas; every model adds an intercept |
| File Coordinate System | The EPSG code of the file, from which the areas are moved into longitude and latitude |
| Neighbours | Queen Contiguity, Rook Contiguity or k Nearest |
| k | The number of neighbours with k Nearest |

Areas without a value in the dependent variable or in an explanatory variable are left out before the neighbours are found.

## How the Spatial Lag and Error Models Panel Builds the Spatial Weights

The Example Code of the Spatial Lag and Error Models panel reads the file into a DuckDB table named `areas` and numbers the areas `i = 1, 2, ...` in the order of the file. Queen Contiguity joins the table to itself on `ST_Intersects`; Rook Contiguity keeps the pairs whose shared boundary has a length; k Nearest ranks the other centroids by `ST_Distance_Sphere`. The pairs `(i, j)` come to Julia as a Tables.jl table ([Quinn (2023)](#ref-Qui2023c)), become a sparse matrix, and `row_standardize` of SpatialEconometrics.jl makes the weights of each area's neighbours sum to 1. The same matrix `W` enters every model of the panel.

## The Next Steps of the Spatial Lag and Error Models Panel

| Group | Next Step | What it gives |
|---|---|---|
| Visualise | Map of the Dependent Variable | The areas coloured by the dependent variable |
| Visualise | Map of the Residuals | The residuals of the tab's model on a base map |
| Visualise | Chart of the Effects | Direct and indirect effects, drawn with ECharts.jl ([Zwitch (2026)](#ref-Zwi2026a)) (SAR and SDM tabs) |
| Diagnose | Moran's I of the Residuals | Spatial dependence left in the residuals |
| Diagnose | LM Tests for the Durbin Terms | Tests of the spatial lag and of the spatial lags of X (OLS, SLX and SDM tabs) |
| Diagnose | Neighbour Counts | How many neighbours the areas have, and the islands |
| Predict | Change One Area | The change in every area after a change in one |
| Compare | Models Compared | Log-likelihood, AIC and BIC of the five models |
| Compare | Likelihood Ratio Tests of the SDM | The SDM against the SAR, SLX and SEM models |
| Compare | Weights: Contiguity and k Nearest | The spatial parameter with each kind of neighbours |
| Interpret | Spatial Multiplier | The multiplier and the total effects (SAR and SDM tabs) |
| Interpret | Direct and Indirect Effects | The SLX model's effects (SLX tab) |
| Replicate | Bivand and Piras (2015) | Tables 2, 14, 17 and 18 of the article |
| Replicate | Columbus Crime, Boston House Prices | Julia beside R's spatialreg |
| Export | Save the Results as GeoParquet | The areas with the residuals |

## References

<a id="ref-ABFY1996a"></a>Anselin, L., Bera, A. K., Florax, R. and Yoon, M. J. (1996). Simple diagnostic tests for spatial dependence. *Regional Science and Urban Economics*, 26(1), 77–104. [doi:10.1016/0166-0462(95)02111-6](https://doi.org/10.1016/0166-0462(95)02111-6)

<a id="ref-CO1972a"></a>Cliff, A. and Ord, K. (1972). Testing for spatial autocorrelation among regression residuals. *Geographical Analysis*, 4(3), 267–284. [doi:10.1111/j.1538-4632.1972.tb00475.x](https://doi.org/10.1111/j.1538-4632.1972.tb00475.x)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

<a id="ref-Qui2023c"></a>Quinn, J. (2023). Tables.jl: an interface for tables in Julia. [github.com/JuliaData/Tables.jl](https://github.com/JuliaData/Tables.jl)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-Zwi2026a"></a>Zwitch, R. (2026). ECharts.jl: Julia package for the Apache ECharts v6 visualization library. [github.com/randyzwitch/ECharts.jl](https://github.com/randyzwitch/ECharts.jl)

## See Also
- [Overview](overview.md) · [Lagrange Multiplier Tests](lm-tests.md) · [Maximum Likelihood Estimation](maximum-likelihood.md) · [Direct and Indirect Effects](effects.md) · [Decision Guide](decision-guide.md) · [Replications](replications.md)
