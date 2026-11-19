# Factsheet

## The Spatial Causal Inference Panel at a Glance

| Tab | Function of SpatialEconometrics.jl | Main output |
|---|---|---|
| Spatial DiD | `fit_spatial_did` | The direct effect, the spillover onto the areas under the policy and onto the comparison areas, and the total onto the areas under the policy, with standard errors; the regression table; the counts of comparison areas with and without a neighbour under the policy |
| Synthetic Control | `fit_synthetic_control` | The average effect on the areas under the policy, the ratio of the fit after the policy to that before, a table per area under the policy, the mean path of the areas and of their synthetic controls, and the largest weights |

Both tabs read the same areas and panel files ([Randsley (2026)](#ref-Ran2026a)).

## Inputs of the Spatial Causal Inference Panel

| Input | What it sets |
|---|---|
| Folder, Areas File, Panel File | The polygons, and one row per area and period |
| Area Column, Period Column | The columns naming each area and each period |
| Dependent Variable, Policy Column, Explanatory Variables | The outcome, the 0 and 1 column of the policy, and further columns |
| File Coordinate System, Distance Coordinate System | The EPSG codes of the file and of the metres used for distances |
| Neighbours, k | Queen or rook contiguity, or the k nearest centroids |
| Exposure Order, Periods, Standard Errors, Conley Cutoff | Spatial DiD |
| Predictors, Comparison Areas, Penalty, Penalty Distance | Synthetic Control |

The files are read through DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Next Steps of the Spatial Causal Inference Panel

| Group | Spatial DiD | Synthetic Control |
|---|---|---|
| Visualise | Map of the Policy and Exposure; Outcome Paths | Map of the Policy and Exposure; Outcome Paths; Map of the Comparison Weights |
| Diagnose | Interference Check | Interference Check; Fit Before the Policy |
| Compare | With and Without the Exposure Column; Standard Errors; Spatial DiD Against Synthetic Control | Comparison Areas; Penalty; Spatial DiD Against Synthetic Control |
| Interpret | Direct and Spillover Effects | Permutation Test; Spillover Onto the Neighbours |

## The Example Data of the Spatial Causal Inference Panel

With the default file names, the example writes two files before reading them: a grid of 225 square cells of 1 km around the centre of Bologna, in EPSG:32632; a quarterly panel of six years with a low-emission zone in the 9 central cells from the first quarter of 2022, with the wind speed and the jobs of each cell. The values are simulated with a fixed seed, so that every tab and Next Step runs without other data, and are replaced by pointing the inputs at other files.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md)
