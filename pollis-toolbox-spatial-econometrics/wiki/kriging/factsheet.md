# Factsheet

## What the Kriging Panel Does

The Kriging panel maps a value measured at scattered points, such as air quality at monitoring stations, over a grid of square cells covering the stations. The Variogram tab measures how the difference between two stations' values grows with the distance between them, and fits a variogram model. Ordinary Kriging and Universal Kriging estimate the value in every cell from that model, each estimate with its kriging standard deviation ([Matheron (1963)](#ref-Mat1963a)). Inverse Distance maps the value with weights that fall with a power of the distance and no variogram ([Shepard (1968)](#ref-She1968a)). Gaussian Simulation draws many maps that each honour the stations ([Goovaerts (1997)](#ref-Goo1997a)). The variograms, kriging, inverse distance weighting and simulation come from GeoStats.jl ([Hoffimann (2026)](#ref-Hof2026a)); the stations are read with SQL through DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## The Inputs of the Kriging Panel

| Input | What it sets | Tabs |
|---|---|---|
| Folder, File | The point file of the stations | All |
| Column | The numeric column mapped; stations without a value are left out | All |
| File Coordinate System | The EPSG code of the file | All |
| Metric Coordinate System | A projected system in metres, in which distances are measured and the grid is drawn | All |
| Cell Size (m) | The side of the square cells of the grid | All |
| Variogram Model | Spherical, Exponential, Gaussian or Matérn | All |
| Lags, Maximum Lag (m) | The distance classes of the empirical variogram | All |
| Estimator | Matheron, or Cressie and Hawkins | All |
| Trend Degree | The degree of the polynomial mean | Universal Kriging |
| Power | The power of the distance in the weights | Inverse Distance |
| Realisations, Threshold | The number of simulated maps, and the value whose exceedance is mapped | Gaussian Simulation |

## How the Kriging Panel Reads the Stations and Builds the Grid

The Example Code of the Kriging panel reads the file into a DuckDB table named `stations`, numbers the stations `i = 1, 2, ...` in the order of the file, and moves them with `ST_Transform` into the Metric Coordinate System, so that distances come out in metres ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). `ST_X` and `ST_Y` give the coordinates to Julia as a Tables.jl table ([Quinn (2023)](#ref-Qui2023c)), and `georef` of GeoStats.jl turns them, with the values of the column, into a geotable of points named `data` ([Hoffimann (2026)](#ref-Hof2026a)). The grid, a `CartesianGrid` of cells of the Cell Size, covers the bounding box of the stations. The kriging tabs estimate the value at the centre of every cell with all the stations; `predictprob` gives there a normal distribution, whose mean is the estimate and whose standard deviation is the kriging standard deviation. The cells go back to DuckDB, into longitude and latitude, for the map.

## The Next Steps of the Kriging Panel

| Group | Next Step | What it gives |
|---|---|---|
| Visualise | Map of the Stations | The stations coloured by the column on a base map |
| Visualise | Variogram Plot | The empirical variogram and the model, drawn with ECharts.jl ([Zwitch (2026)](#ref-Zwi2026a)) |
| Visualise | Map of the Kriging Standard Deviation | The uncertainty of each cell's estimate (kriging tabs) |
| Visualise | Map of the Mean of the Realisations | The mean and spread of the simulated maps (Gaussian Simulation) |
| Diagnose | Directional Variograms | The variogram west to east and south to north |
| Diagnose | Leave-One-Out Cross-Validation | Errors of each station estimated from the others |
| Predict | Estimate at a Location | The estimate at one point, with its interval for kriging |
| Predict | Probability above a Threshold | The share of realisations above the Threshold (Gaussian Simulation) |
| Compare | Variogram Models Compared | Four models fitted, with their cross-validation errors |
| Compare | Kriging and Inverse Distance | Five methods by their cross-validation errors |
| Interpret | Nugget, Sill and Range | The parameters of the variogram model |
| Interpret | Kriging Weights of the Nearest Stations | The weights of the stations around the centre (kriging tabs) |
| Export | Save the Estimates as GeoParquet | The cells with their estimates in a GeoParquet file |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Goo1997a"></a>Goovaerts, P. (1997). *Geostatistics for natural resources evaluation*. Oxford University Press. [doi:10.1093/oso/9780195115383.001.0001](https://doi.org/10.1093/oso/9780195115383.001.0001)

<a id="ref-Hof2026a"></a>Hoffimann, J. (2026). GeoStats.jl: an extensible framework for geospatial data science and geostatistical modeling. [github.com/JuliaEarth/GeoStats.jl](https://github.com/JuliaEarth/GeoStats.jl)

<a id="ref-Mat1963a"></a>Matheron, G. (1963). Principles of geostatistics. *Economic Geology*, 58(8), 1246–1266. [doi:10.2113/gsecongeo.58.8.1246](https://doi.org/10.2113/gsecongeo.58.8.1246)

<a id="ref-Qui2023c"></a>Quinn, J. (2023). Tables.jl: an interface for tables in Julia. [github.com/JuliaData/Tables.jl](https://github.com/JuliaData/Tables.jl)

<a id="ref-She1968a"></a>Shepard, D. (1968). A two-dimensional interpolation function for irregularly-spaced data. In *Proceedings of the 1968 23rd ACM National Conference* (pp. 517–524). [doi:10.1145/800186.810616](https://doi.org/10.1145/800186.810616)

<a id="ref-Zwi2026a"></a>Zwitch, R. (2026). ECharts.jl: Julia package for the Apache ECharts v6 visualization library. [github.com/randyzwitch/ECharts.jl](https://github.com/randyzwitch/ECharts.jl)

## See Also
- [Overview](overview.md) · [Variograms](variograms.md) · [Kriging Systems](kriging-systems.md) · [Cross-Validation](cross-validation.md) · [Decision Guide](decision-guide.md) · [Variogram](variogram.md) · [Ordinary Kriging](ordinary-kriging.md)
