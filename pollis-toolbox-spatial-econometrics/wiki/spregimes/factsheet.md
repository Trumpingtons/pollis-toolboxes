# Factsheet

## The Regionalisation and Spatial Regimes Panel at a Glance

| Tab | Function of SpatialEconometrics.jl | Main output |
|---|---|---|
| SKATER Regions | `skater_regimes` | The number of regions found, the share of the spread of the SKATER Variables between the regions, and each region's areas and means |
| Regimes, OLS | `fit_spatial_regime` with `spatial_lag = false`, `regime_chow_test` | One intercept and set of slopes per regime with standard errors, the likelihood ratio Chow test and the Chow F test |
| Regimes, Spatial Lag | `fit_spatial_regime` with `spatial_lag = true`, `regime_chow_test` | The same with a shared rho, by maximum likelihood, and the likelihood ratio Chow test |

Each tab reads the same file of areas ([Randsley (2026)](#ref-Ran2026a)).

## Inputs of the Regionalisation and Spatial Regimes Panel

| Input | What it sets |
|---|---|
| Folder, File | The polygons and their columns |
| Dependent Variable, Explanatory Variables | The outcome and the columns that explain it in each regime |
| File Coordinate System | The EPSG code of the file, for the maps and for Regimes Against GWR |
| Neighbours, k | Queen or rook contiguity, or the k nearest centroids |
| Regimes From, Regime Column | Regimes from a column, or from SKATER, on the regime tabs |
| SKATER Variables, Number of Regions, Minimum Region Size | What SKATER makes regions alike in, how many, and how small |

The file is read through DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Next Steps of the Regionalisation and Spatial Regimes Panel

| Group | SKATER Regions | Regimes, OLS and Regimes, Spatial Lag |
|---|---|---|
| Visualise | Map of the Regimes | Map of the Regimes; Maps of the Coefficients; Map of the Residuals |
| Diagnose | Regime Sizes and Spread | Moran's I of the Residuals; Regime Sizes and Spread; Which Coefficients Differ |
| Compare | Number of Regions; Given Regimes Against SKATER | Number of Regions; Regimes Against One Model; OLS Against Spatial Lag Regimes; Given Regimes Against SKATER; Regimes Against GWR |
| Interpret | Bootstrap Chow Test | Coefficients Side by Side; Bootstrap Chow Test, on Regimes, OLS |
| Replicate | Baltimore Houses: spreg | Baltimore Houses: spreg |
| Export | Save the Results as GeoParquet | Save the Results as GeoParquet |

## The Example Data of the Regionalisation and Spatial Regimes Panel

With the default file name, the example writes the census tracts of Boston in 1970 from PollisDatasets.jl, the Boston housing data with the corrected median value of owner-occupied homes, into the folder before reading it, in metres on NAD83 / UTM zone 19N. It adds a column, part, that sets the regimes: city for the tracts of the City of Boston and suburbs for the others. The tabs explain the median house value by crimes per head, rooms per dwelling and the share of the population of lower status, and SKATER builds its regions from the house value, the rooms and that share. Pointing File at another file replaces the example.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md)
