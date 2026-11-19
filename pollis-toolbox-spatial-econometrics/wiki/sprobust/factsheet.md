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

With the default files, the example first copies the outlines of the 48 contiguous US states from PollisDatasets.jl, and writes Munnell's panel of the states from 1970 to 1986 beside them, unless the folder has both already. The log of each state's gross product is explained by the logs of its public capital, private capital and employment and by its unemployment rate: the production function of the studies of the productivity of public capital. Neighbouring states share regional cycles, so their errors are alike, and the nine census divisions of the column region group the states for clustering. The distances between the states' centroids are measured in NAD83 / Conus Albers (EPSG:5070), in which the default cutoff of 1,000 km reaches beyond each state's neighbours to the states of its region.

## References

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Choosing a Cutoff](choosing-cutoff.md) · [Decision Guide](decision-guide.md) · [Conley Spatial HAC](conley.md) · [Cluster-Robust](cluster.md) · [Driscoll–Kraay](dk.md)
