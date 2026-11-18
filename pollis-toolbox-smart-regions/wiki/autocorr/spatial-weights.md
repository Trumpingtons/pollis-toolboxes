# Spatial Weights

## What a Spatial Weights Matrix Is

A spatial weights matrix W says which areas are neighbours, and how much each neighbour counts: the entry `wij` is positive when area j is a neighbour of area i, and zero otherwise, with zeros on the diagonal, so no area is its own neighbour ([Cressie (1993)](#ref-Cre1993a)). Every statistic of spatial autocorrelation compares values through W, so Moran's I, Geary's c and the local statistics are always measured for a given choice of neighbours, never in the abstract. Changing the neighbours changes the statistic, and sometimes the conclusion. The weights are fixed before the data are looked at, from the geometry of the areas: shared boundaries, distances between centroids, or distances within a threshold. Neighbours of an Area shows the neighbours one area gets in the Spatial Autocorrelation panel.

## Queen Contiguity and Rook Contiguity

Contiguity weights make neighbours of areas that touch. On a regular grid, a cell's nearest neighbours are the four cells that share an edge with it, and next the four that share only a corner ([Cressie (1993)](#ref-Cre1993a)). Rook contiguity, named after the moves of the chess piece, counts the four that share an edge; queen contiguity counts all eight. On irregular polygons, such as municipalities, rook neighbours share a stretch of boundary, and queen neighbours share at least one point of it. The Queen Contiguity option of the Spatial Autocorrelation panel finds the pairs with `ST_Intersects`, and the Rook Contiguity option keeps those whose intersection is a line or more ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Every rook neighbour is also a queen neighbour.

## k Nearest Neighbours

k nearest neighbours gives every area the same number of neighbours: the k areas whose centroids are closest to its own. The k Nearest option of the Spatial Autocorrelation panel ranks the centroids by great-circle distance, with `ST_Distance_Sphere`, so the file may be in any coordinate system ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). k nearest neighbours suits areas of very different sizes, where small urban areas would have many contiguous neighbours and large rural ones few, and maps with islands or gaps, where contiguity leaves some areas alone. k nearest weights are not symmetric: area j may be among the nearest of area i while area i is not among the nearest of area j. Weights: Contiguity and k Nearest shows Moran's I under queen, rook and k nearest neighbours side by side.

## Row Standardisation and the Spatial Lag

Row standardisation divides each weight by the number, or the total weight, of the area's neighbours, so the weights of every row of W sum to 1. The spatial lag of a variable, `Wx`, is then the average of the values of each area's neighbours, and statistics computed with different numbers of neighbours per area become comparable ([Anselin (1995)](#ref-Ans1995a)). The Spatial Autocorrelation panel builds the weights with `SpatialWeights`, which row-standardises them ([Barbero (2026)](#ref-Bar2026a)). The Moran Scatterplot plots each area's standardised value against its spatial lag, and Save the Results as GeoParquet writes the spatial lag of the column beside the areas.

## Islands and Gaps Between Boundaries

An island is an area without neighbours: an island in the sea under contiguity, or an area separated from the rest by a river or a gap in the boundaries. An island has an empty row in W, so its spatial lag is zero and it adds nothing to the products that make up Moran's I. Gaps and overlaps between polygons that should touch, common where boundaries come from different sources or have been simplified, change contiguity too: a gap removes a pair of neighbours, and an overlap is counted as a shared point by queen contiguity. Neighbour Counts lists how many areas have each number of neighbours, and the islands, so missing or surplus neighbours show before any statistic is read.

## References

<a id="ref-Ans1995a"></a>Anselin, L. (1995). Local indicators of spatial association—LISA. *Geographical Analysis*, 27(2), 93–115. [doi:10.1111/j.1538-4632.1995.tb00338.x](https://doi.org/10.1111/j.1538-4632.1995.tb00338.x)

<a id="ref-Bar2026a"></a>Barbero, J. (2026). SpatialDependence.jl: spatial dependence, spatial weights matrices and exploratory spatial data analysis in Julia. [github.com/javierbarbero/SpatialDependence.jl](https://github.com/javierbarbero/SpatialDependence.jl)

<a id="ref-Cre1993a"></a>Cressie, N. A. C. (1993). *Statistics for spatial data* (Revised ed.). John Wiley & Sons. [doi:10.1002/9781119115151](https://doi.org/10.1002/9781119115151)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

## See Also
- [Factsheet](factsheet.md) · [Spatial Autocorrelation](spatial-autocorrelation.md) · [Decision Guide](decision-guide.md) · [Global Moran's I](global-moran.md)
