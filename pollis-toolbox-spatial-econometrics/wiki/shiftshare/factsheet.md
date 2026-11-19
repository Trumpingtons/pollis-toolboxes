# Factsheet

## The Shift-Share Designs Panel at a Glance

| Tab | Regression across the shocks | Function of SpatialEconometrics.jl |
|---|---|---|
| Shift-Share IV | The mean outcome on the mean Endogenous Variable, instrumented by the shock | `fit_shock_level` with `treatment` |
| Reduced Form | The mean outcome on the shock | `fit_shock_level` without `treatment` |

Both tabs build the design with `shift_share_design` and print the estimate, its standard error clustered by the Shock Clusters, its 95% interval with the null imposed and the effective number of shocks; Shift-Share IV adds the first-stage F ([Randsley (2026)](#ref-Ran2026a)).

## Inputs of the Shift-Share Designs Panel

| Input | What it sets |
|---|---|
| Folder, Areas File, File Coordinate System | The polygons of the areas, read by DuckDB's spatial extension |
| Changes File, Area Column, Period Column | One row per area and period |
| Dependent Variable, Endogenous Variable | The outcome, and on Shift-Share IV the variable instrumented |
| Weight Column, Controls | The regression weights and the controls of the areas |
| Shares File, Shock Column, Share Column | One row per area, period and shock |
| Shocks File, Shock Value, Shock Clusters | One row per shock and period, and the clusters of the standard error |
| Neighbours, k, Area Clusters, Shock to Map, Balance Variables | The Next Steps |

The files are joined with SQL ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Next Steps of the Shift-Share Designs Panel

| Group | Steps |
|---|---|
| Visualise | Map of the Exposure |
| Diagnose | Exposure Concentration; Balance Test; Moran's I of the Residuals |
| Compare | Against the Regional Standard Error |
| Interpret | Which Shocks Drive the Estimate; The Estimate Shock by Shock |
| Replicate | Borusyak, Hull and Jaravel's Table 4, on Shift-Share IV |

## Example Files of the Shift-Share Designs Panel

With the default file names, the example copies four files from PollisDatasets.jl into the folder, unless it has them: the polygons of the US commuting zones of 1990, `us_czones.gpkg`; the changes of the zones, `adh_czones.csv`; their shares of employment in each manufacturing industry, `adh_shares.parquet`; and the shocks of the industries, `adh_shocks.csv`. They are the data of Autor, Dorn and Hanson (2013) as the replication files of Borusyak, Hull and Jaravel (2022) give them ([Autor, Dorn and Hanson (2013)](#ref-ADH2013a); [Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)).

## References

<a id="ref-ADH2013a"></a>Autor, D. H., Dorn, D. and Hanson, G. H. (2013). The China syndrome: local labor market effects of import competition in the United States. *American Economic Review*, 103(6), 2121–2168. [doi:10.1257/aer.103.6.2121](https://doi.org/10.1257/aer.103.6.2121)

<a id="ref-BHJ2022a"></a>Borusyak, K., Hull, P. and Jaravel, X. (2022). Quasi-experimental shift-share research designs. *Review of Economic Studies*, 89(1), 181–213. [doi:10.1093/restud/rdab030](https://doi.org/10.1093/restud/rdab030)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Inference Across the Shocks](inference.md) · [Replications](replications.md)
