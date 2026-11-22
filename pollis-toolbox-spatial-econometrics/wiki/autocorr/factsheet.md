# Factsheet

## What the Spatial Autocorrelation Panel Does

The Spatial Autocorrelation panel measures how far the values of a numeric column cluster in space across a set of areas: municipalities, parishes, census tracts or grid cells. The Global Moran's I tab gives one statistic for the whole map ([Moran (1950)](#ref-Mor1950a)). The Local Moran (LISA) tab gives one for every area, and maps its hot spots, cold spots and spatial outliers ([Anselin (1995)](#ref-Ans1995a)). Both statistics, and the spatial weights they rest on, come from SpatialDependence.jl ([Barbero (2026)](#ref-Bar2026a)). The areas are read, and their neighbours found, with SQL through DuckDB's spatial extension, so any polygon file that the Geospatial Vector Files panel reads can be used ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## The Inputs of the Spatial Autocorrelation Panel

| Input | What it sets | Tabs |
|---|---|---|
| Folder, File | The polygon file of the areas | Both |
| Column | The numeric column tested; areas without a value are left out | Both |
| File Coordinate System | The EPSG code of the file, from which the areas are moved into longitude and latitude | Both |
| Neighbours | Queen Contiguity, Rook Contiguity or k Nearest | Both |
| k | The number of neighbours with k Nearest | Both |
| Permutations | The number of random permutations behind each pseudo p-value | Both |
| Significance Level | The pseudo p-value below which an area gets a cluster label | Local Moran (LISA) |
| Adjustment | None, Bonferroni or False Discovery Rate (FDR) | Local Moran (LISA) |

## How the Spatial Autocorrelation Panel Finds Neighbours with SQL

The Example Code of the Spatial Autocorrelation panel reads the file into a DuckDB table named `areas`, numbers the areas `i = 1, 2, ...` in the order of the file, and moves them into longitude and latitude with `ST_Transform`. Queen Contiguity joins the table to itself on `ST_Intersects`, so two areas whose boundaries share at least one point are neighbours. Rook Contiguity keeps the pairs whose intersection has a dimension of 1 or more, a stretch of shared boundary. k Nearest ranks the centroids of the other areas by `ST_Distance_Sphere`, the great-circle distance, and keeps the first k ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The pairs `(i, j)` come to Julia as a Tables.jl table, become a sparse matrix, and `SpatialWeights` turns that matrix into row-standardised weights ([Quinn (2023)](#ref-Qui2023c); [Barbero (2026)](#ref-Bar2026a)).

## The Next Steps of the Spatial Autocorrelation Panel

| Group | Next Step | What it gives |
|---|---|---|
| Visualise | Map of the Values | The areas coloured by the column on a base map |
| Visualise | Moran Scatterplot | Standardised values against their spatial lag, with Moran's I as the slope, drawn with ECharts.jl ([Zwitch (2026)](#ref-Zwi2026a)) |
| Visualise | Map of the Local p-Values | The pseudo p-value of every area (Local Moran (LISA) tab) |
| Diagnose | Neighbour Counts | How many neighbours the areas have, and the islands |
| Diagnose | Neighbours of an Area | One area and its neighbours on a base map |
| Compare | Weights: Contiguity and k Nearest | Moran's I with each kind of neighbours |
| Compare | Moran's I and Geary's c | The two global statistics side by side |
| Compare | Significance Adjustments | Cluster counts with no adjustment, Bonferroni and FDR (Local Moran (LISA) tab) |
| Compare | Local Moran and Getis-Ord Gi* | LISA clusters against Gi* hot and cold spots (Local Moran (LISA) tab) |
| Interpret | Permutation Distribution of Moran's I | A histogram of Moran's I over the permutations (Global Moran's I tab) |
| Interpret | Clusters in a Table | Areas and values in each LISA cluster (Local Moran (LISA) tab) |
| Export | Save the Results as GeoParquet | The areas with their spatial lag, and the LISA results, in a GeoParquet file |

## References

<a id="ref-Ans1995a"></a>Anselin, L. (1995). Local indicators of spatial association—LISA. *Geographical Analysis*, 27(2), 93–115. [doi:10.1111/j.1538-4632.1995.tb00338.x](https://doi.org/10.1111/j.1538-4632.1995.tb00338.x)

<a id="ref-Bar2026a"></a>Barbero, J. (2026). SpatialDependence.jl: spatial dependence, spatial weights matrices and exploratory spatial data analysis in Julia. [github.com/javierbarbero/SpatialDependence.jl](https://github.com/javierbarbero/SpatialDependence.jl)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Mor1950a"></a>Moran, P. A. P. (1950). Notes on continuous stochastic phenomena. *Biometrika*, 37(1-2), 17–23. [doi:10.1093/biomet/37.1-2.17](https://doi.org/10.1093/biomet/37.1-2.17)

<a id="ref-Qui2023c"></a>Quinn, J. (2023). Tables.jl: an interface for tables in Julia. [github.com/JuliaData/Tables.jl](https://github.com/JuliaData/Tables.jl)

<a id="ref-Zwi2026a"></a>Zwitch, R. (2026). ECharts.jl: Julia package for the Apache ECharts v6 visualization library. [github.com/randyzwitch/ECharts.jl](https://github.com/randyzwitch/ECharts.jl)

## See Also
- [Overview](overview.md) · [Spatial Weights](spatial-weights.md) · [Spatial Autocorrelation](spatial-autocorrelation.md) · [Permutation Inference](permutation-inference.md) · [Decision Guide](decision-guide.md) · [Global Moran's I](global-moran.md) · [Local Moran (LISA)](local-moran.md)
