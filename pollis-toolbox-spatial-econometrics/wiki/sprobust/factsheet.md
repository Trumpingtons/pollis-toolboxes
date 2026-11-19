# Factsheet

## Spatial Correlation Robust Inference at a Glance

| Tab | Correlation allowed for | Needs |
|---|---|---|
| Conley Spatial HAC | Between areas closer than a cutoff, fading with distance; in a panel, of each area with itself over a few periods | Distances between the areas, a cutoff |
| Cluster-Robust | Any correlation inside a group of areas, none between groups | A column naming the groups, many groups |
| Driscoll–Kraay | Any correlation between areas in the same period, and between periods over a few lags | A panel with many periods |

Each tab fits least squares with the chosen Fixed Effects and prints, for every coefficient, the estimate, the usual standard error, the robust one, their ratio, the t-statistic and the p-value from the normal distribution ([Randsley (2026)](#ref-Ran2026a)).

## Inputs of the Spatial Correlation Robust Inference Panel

| Input | What it sets |
|---|---|
| Folder, Areas File | Where the polygons are |
| Panel File | One row per area and period; empty for a cross-section in the areas file |
| Area Column, Period Column | The columns naming the areas and the periods |
| Dependent Variable, Explanatory Variables | The regression |
| Fixed Effects | None, Periods, Areas, or Areas and Periods, removed by subtracting means |
| File Coordinate System, Distance Coordinate System | The file's EPSG code, and a projected one for distances in kilometres |
| Cutoff (km), Kernel | Conley Spatial HAC: the reach of the correlation and how its weight falls |
| Lags | Periods of correlation over time, for Conley Spatial HAC and Driscoll–Kraay |
| Cluster Column | Cluster-Robust: the column naming the groups |

## Next Steps of the Spatial Correlation Robust Inference Panel

| Group | Steps |
|---|---|
| Visualise | Map of the Residuals; Map of the Neighbours Within the Cutoff; Map of the Clusters |
| Diagnose | Moran's I of the Residuals; Residual Correlation by Distance; Design Check |
| Compare | Standard Errors Against the Cutoff; Kernels; Cluster Levels; Lags; All Estimators Side by Side; With a Spatial Lag |
| Interpret | Intervals and Effective Sample Size |
| Replicate | Petersen's Test Data; Earthquakes off Fiji: fixest |
| Export | Save the Results |

## Example Data of the Spatial Correlation Robust Inference Panel

With the default files, the example first writes a grid of square cells of 1 km around Bruges, in Belgian Lambert 72, and a panel of the cells over twelve years, unless the folder has both already. The simulated log price per square metre depends on the share of green space and on road noise. Both regressors and the errors are alike in neighbouring cells; the errors also have a level of their own for each cell and a shock common to each year; and the cells are grouped into districts of three by three cells, for clustering. The usual standard errors therefore understate the uncertainty, which is what the three tabs correct.

## References

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Choosing a Cutoff](choosing-cutoff.md) · [Decision Guide](decision-guide.md) · [Conley Spatial HAC](conley.md) · [Cluster-Robust](cluster.md) · [Driscoll–Kraay](dk.md)
