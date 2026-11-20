# Factsheet

## The Spatial Interaction Models Panel at a Glance

| Tab | Function | Effects | Main output |
|---|---|---|---|
| Unconstrained | `nlreg` of GLFixedEffectModels.jl | One shared by every flow | Coefficients of the Origin and Destination Variables and of the distance, the intercept, fit statistics |
| Production | `nlreg` | One per origin | Coefficients of the Destination Variables and of the distance, fit statistics |
| Attraction | `nlreg` | One per destination | Coefficients of the Origin Variables and of the distance, fit statistics |
| Doubly Constrained | `nlreg` | One per origin and destination | The distance coefficient, fit statistics |
| Negative Binomial | `fit_gravity` of SpatialEconometrics.jl | One per origin and destination | The distance coefficient, the dispersion alpha, fit statistics |

The fit statistics are the pseudo R-squared, the AIC, the SRMSE and the Sørensen similarity index that Oshan (2016) reports for spint ([Oshan (2016)](#ref-Osh2016a); [Boehm (2020)](#ref-Boe2020a); [Randsley (2026)](#ref-Ran2026a)).

## Inputs of the Spatial Interaction Models Panel

| Input | What it sets |
|---|---|
| Folder, Areas File, Flows File | The polygons of the places, and one row per origin and destination |
| Area Column, Origin Column, Destination Column, Flow Column | The names of the places and the size of each flow |
| Origin Variables, Destination Variables, Pair Variables | Columns entered in logs, for the origins and destinations, and as they are, for the pairs |
| Distance Column, Distance Decay, Flows Within a Place | The distance, its exponential or power form, and whether flows from a place to itself are kept |
| Standard Errors | Model-based, robust or clustered by origin |
| File Coordinate System, Distance Coordinate System | The EPSG codes of the file and of the metres in which centroid distances are measured |

The files are read through DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Next Steps of the Spatial Interaction Models Panel

| Group | Steps |
|---|---|
| Visualise | Map of the Flows; Map of the Outflows and Inflows; Map of the Origin and Destination Effects; Observed Against Predicted Flows |
| Diagnose | Goodness of Fit; Overdispersion Test; Moran's I of the Residual Flows |
| Compare | The Four Constrained Models; Exponential Against Power Decay; Poisson Against Negative Binomial; Standard Errors Side by Side; Log-Linear Least Squares Against Poisson |
| Interpret | Distance Decay in Plain Numbers; Flows After Distances Shrink |
| Replicate | Austrian Migration: spint |
| Export | Save the Results |

Map of the Origin and Destination Effects shows on the tabs with such effects; the steps that refit Poisson models do not show on the Negative Binomial tab.

## The Example Data of the Spatial Interaction Models Panel

With the default file names, the example copies two files from PollisDatasets.jl into the folder, unless the folder has them: the migration between the nine NUTS-2 regions of Austria, with each origin's total outflow, each destination's total inflow and the distance between them, the data of the spatial interaction tutorials of Dennett (2012) and of the primer of Oshan (2016), and the regions' outlines ([Dennett (2012)](#ref-Den2012a); [Oshan (2016)](#ref-Osh2016a)). The Origin Variables and Destination Variables are those totals. Pointing the inputs at other files replaces them.

## References

<a id="ref-Boe2020a"></a>Boehm, J. (2020). GLFixedEffectModels.jl: fast estimation of generalized linear models with high-dimensional fixed effects in Julia. [github.com/jmboehm/GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl)

<a id="ref-Den2012a"></a>Dennett, A. (2012). Estimating flows between geographical locations: get me started in spatial interaction modelling. CASA Working Paper 181, University College London. [ucl.ac.uk/bartlett/casa](https://www.ucl.ac.uk/bartlett/casa/publications/2012/mar/casa-working-paper-181)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Osh2016a"></a>Oshan, T. M. (2016). A primer for working with the Spatial Interaction modeling (SpInt) module in the Python Spatial Analysis Library (PySAL). *REGION*, 3(2), R11–R23. [doi:10.18335/region.v3i2.175](https://doi.org/10.18335/region.v3i2.175)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Replications](replications.md)
