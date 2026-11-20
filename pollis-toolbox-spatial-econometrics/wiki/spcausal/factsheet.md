# Factsheet

## The Spatial Causal Inference Panel at a Glance

| Tab | Function of SpatialEconometrics.jl | Main output |
|---|---|---|
| Spatial DiD | `fit_spatial_did` | The direct effect, the spillover onto the areas under the policy and onto the comparison areas, and the total onto the areas under the policy, with standard errors; the regression table; the counts of comparison areas with and without a neighbour under the policy |
| Synthetic Control | `fit_synthetic_control` | The average effect on the areas under the policy, the ratio of the fit after the policy to that before, a table per area under the policy, the mean path of the areas and of their synthetic controls, and the largest weights |

Each tab has its own Areas File, Panel File, columns and Neighbours, with an example of its own ([Randsley (2026)](#ref-Ran2026a)).

## Inputs of the Spatial Causal Inference Panel

| Input | What it sets |
|---|---|
| Folder, Areas File, Panel File | The polygons, and one row per area and period |
| Area Column, Areas File Column, Period Column | The columns naming each area in the panel file and in the areas file, and each period |
| Dependent Variable, Policy Column, Explanatory Variables | The outcome, the 0 and 1 column of the policy, and further columns |
| File Coordinate System, Distance Coordinate System | The EPSG codes of the file and of the metres used for distances |
| Neighbours, k | Queen or rook contiguity, or the k nearest centroids |
| Exposure Order, Periods, Standard Errors, Conley Cutoff | Spatial DiD |
| Predictors, Predictor Weights, Comparison Areas, Penalty, Penalty Distance | Synthetic Control |

The files are read through DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Next Steps of the Spatial Causal Inference Panel

| Group | Spatial DiD | Synthetic Control |
|---|---|---|
| Visualise | Map of the Policy and Exposure; Outcome Paths | Map of the Policy and Exposure; Outcome Paths; Map of the Comparison Weights |
| Diagnose | Interference Check | Interference Check; Fit Before the Policy |
| Compare | With and Without the Exposure Column; Standard Errors | Comparison Areas; Penalty; Spatial DiD Against Synthetic Control |
| Interpret | Direct and Spillover Effects | Permutation Test; Spillover Onto the Neighbours |
| Replicate | None | Abadie, Diamond and Hainmueller's Proposition 99 |

## The Example Data of the Spatial Causal Inference Panel

With the default file names, each tab copies its example files from PollisDatasets.jl into the folder, unless the folder has them. Spatial DiD reads the minimum wage panel of Callaway and Sant'Anna (2021): the teen employment of a sample of US counties in the years around the rise of the minimum wage in some of their states, which starts in different years, with the counties' polygons from the US Census Bureau ([Callaway and Sant'Anna (2021)](#ref-CS2021a)). Synthetic Control reads the cigarette sales of the US states of Abadie, Diamond and Hainmueller (2010), with Proposition 99 in California, and the polygons of the states ([Abadie, Diamond and Hainmueller (2010)](#ref-ADH2010a)). Pointing the inputs at other files replaces them.

## References

<a id="ref-ADH2010a"></a>Abadie, A., Diamond, A. and Hainmueller, J. (2010). Synthetic control methods for comparative case studies: estimating the effect of California's tobacco control program. *Journal of the American Statistical Association*, 105(490), 493–505. [doi:10.1198/jasa.2009.ap08746](https://doi.org/10.1198/jasa.2009.ap08746)

<a id="ref-CS2021a"></a>Callaway, B. and Sant'Anna, P. H. C. (2021). Difference-in-differences with multiple time periods. *Journal of Econometrics*, 225(2), 200–230. [doi:10.1016/j.jeconom.2020.12.001](https://doi.org/10.1016/j.jeconom.2020.12.001)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Replications](replications.md)
