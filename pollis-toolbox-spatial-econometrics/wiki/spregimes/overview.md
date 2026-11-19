# Overview

## What the Regionalisation and Spatial Regimes Panel Does

The Regionalisation and Spatial Regimes panel groups areas into regions and lets a regression's coefficients differ from one region to another. It has three tabs. SKATER Regions builds a chosen number of contiguous regions, each alike inside in the variables chosen, with the method of Assunção, Neves, Câmara and Freitas (2006) ([Assunção, Neves, Câmara and Freitas (2006)](#ref-ANCF2006a)). Regimes, OLS fits one intercept and one set of slopes per regime by least squares, and tests whether the split is needed with the test of Chow (1960) ([Chow (1960)](#ref-Cho1960a)). Regimes, Spatial Lag adds a spatial lag of the outcome, so that the outcomes of neighbouring areas affect each other, across the regime boundaries too ([Anselin (1990)](#ref-Ans1990a)). All three run on SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)).

## Spatial Regimes and Structural Instability

A single regression over a whole map assumes that each explanatory variable has the same effect everywhere. Anselin (1988) calls a departure from that spatial heterogeneity, and treats regimes, distinct sets of coefficients for distinct groups of areas, as one of its forms ([Anselin (1988)](#ref-Ans1988a)). The groups can be known before the analysis, such as a city and its suburbs, the regions of a country or the two sides of a border, or found from the data. Anselin (1990) shows that when the errors are spatially autocorrelated the usual tests of equal coefficients across regimes no longer hold, and compares tests that allow for it ([Anselin (1990)](#ref-Ans1990a)).

## Regimes Given or Found From the Data

The Regimes From input sets where the regimes of the Regimes, OLS and Regimes, Spatial Lag tabs come from. Column takes them from the values of Regime Column, fixed before the outcome is looked at. SKATER takes the regions that SKATER builds from the SKATER Variables, as on the SKATER Regions tab. The documentation of `regime_chow_test` warns that when the regimes come from SKATER rather than from outside knowledge, the p-value is optimistic, as the split was chosen with the same data it is tested on ([Randsley (2026)](#ref-Ran2026a)). The Bootstrap Chow Test of the Next Steps gives a p-value that allows for the search.

## Data the Regionalisation and Spatial Regimes Panel Reads

The panel reads one file of polygons with a column for each variable, through DuckDB and its spatial extension, so GeoPackage, GeoJSON, Shapefile, FlatGeobuf and KML all serve ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The neighbours, by queen or rook contiguity or the k nearest centroids, are found with SQL on the polygons, and their weights sum to 1 for each area. Areas without a value in the dependent variable, an explanatory variable or a column that sets the regimes are left out. Tables are read as columns with Tables.jl, and the chart of the slopes is drawn with ECharts.jl ([Quinn (2023)](#ref-Qui2023c); [Zwitch (2026)](#ref-Zwi2026a)).

## Next Steps of the Regionalisation and Spatial Regimes Panel

The Next Steps map the regimes, the coefficients of each regime and the residuals. They check the residuals with Moran's I, the size and spread of each regime, and which coefficients differ. They compare numbers of regions, the regimes with a single model, least squares with a spatial lag, the regimes of a column with SKATER's regions, and the regimes with geographically weighted regression ([Brunsdon, Fotheringham and Charlton (1996)](#ref-BFC1996a)). Interpret sets the coefficients side by side and runs the Bootstrap Chow Test. Replicate checks the regime spatial lag model against PySAL's spreg on Baltimore house prices ([Rey and Anselin (2007)](#ref-RA2007a)).

## References

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-Ans1990a"></a>Anselin, L. (1990). Spatial dependence and spatial structural instability in applied regression analysis. *Journal of Regional Science*, 30(2), 185–207. [doi:10.1111/j.1467-9787.1990.tb00092.x](https://doi.org/10.1111/j.1467-9787.1990.tb00092.x)

<a id="ref-ANCF2006a"></a>Assunção, R. M., Neves, M. C., Câmara, G. and Freitas, C. da C. (2006). Efficient regionalization techniques for socio-economic geographical units using minimum spanning trees. *International Journal of Geographical Information Science*, 20(7), 797–811. [doi:10.1080/13658810600665111](https://doi.org/10.1080/13658810600665111)

<a id="ref-BFC1996a"></a>Brunsdon, C., Fotheringham, A. S. and Charlton, M. E. (1996). Geographically weighted regression: a method for exploring spatial nonstationarity. *Geographical Analysis*, 28(4), 281–298. [doi:10.1111/j.1538-4632.1996.tb00936.x](https://doi.org/10.1111/j.1538-4632.1996.tb00936.x)

<a id="ref-Cho1960a"></a>Chow, G. C. (1960). Tests of equality between sets of coefficients in two linear regressions. *Econometrica*, 28(3), 591–605. [doi:10.2307/1910133](https://doi.org/10.2307/1910133)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Qui2023c"></a>Quinn, J. (2023). Tables.jl: an interface for tables in Julia. [github.com/JuliaData/Tables.jl](https://github.com/JuliaData/Tables.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-RA2007a"></a>Rey, S. J. and Anselin, L. (2007). PySAL: a Python library of spatial analytical methods. *Review of Regional Studies*, 37(1). [doi:10.52324/001c.8285](https://doi.org/10.52324/001c.8285)

<a id="ref-Zwi2026a"></a>Zwitch, R. (2026). ECharts.jl: Julia package for the Apache ECharts v6 visualization library. [github.com/randyzwitch/ECharts.jl](https://github.com/randyzwitch/ECharts.jl)

## See Also
- [Factsheet](factsheet.md) · [Regionalisation](regionalisation.md) · [Testing Regimes](testing-regimes.md) · [Decision Guide](decision-guide.md)
