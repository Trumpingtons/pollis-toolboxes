# Rasterizing

## What Rasterizing Does

Rasterizing writes vector features, such as polygons, lines or points, onto a grid of cells, so that their values can take part in map algebra with other rasters ([Tomlin (1990)](#ref-Tom1990a)). A census area's share of households without a car, a parcel's land use or a district's population density becomes a raster on the same grid as an elevation model or a satellite image, and a local operation can then combine them cell by cell. Rasterizing loses the exact boundaries of the features: each cell holds one value, so the finer the grid, the closer the rasterized areas follow the polygons, and the more cells there are to store.

## Value at the Cell Centre

With the Value at the Cell Centre method, the Rasterize tab gives each cell the value, from the Value Column, of the area in which the cell's centre lies, and leaves missing the cells whose centre lies in no area. This is the rule of terra's `rasterize` with a field, and of GDAL's rasterizer by default ([Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Where areas overlap, a reducing function decides: `last` keeps the value of the area that comes last, and `sum` or `mean` combine them. An area smaller than a cell can hold no cell centre and then leaves no trace on the grid.

## Share Covered

With the Share Covered method, the Rasterize tab gives each cell the share of it that the areas cover, from 0 for a cell outside them all to 1 for a cell wholly inside. Rasters.jl estimates the share by dividing each cell into sub-cells and counting those whose centres lie inside, ten by ten by default ([Schouten (2026)](#ref-Sch2026a)); terra's `rasterize` with `cover = TRUE` gives the same share. The share serves as a weight: a cell half inside a district contributes half its value to the district's total. Value and Coverage prints how many cells take a value at their centre, how many the areas cover in part or whole, and how many only in part.

## The Grid a Layer Is Rasterized Onto

Rasterizing needs a grid to write onto: its coordinate system, extent and cell size. The Rasterize tab uses the grid of the elevation aggregated into blocks of cells, whose size the Block of Cells input sets, so that the result can be combined with the elevation at that resolution. Cells much smaller than the areas give a close outline but many cells with the same value; cells about as large as the areas lose their shapes. The tab passes on only the areas whose envelope intersects the grid, so areas beyond it are not read into Julia at all.

## Rasterizing in Julia: rasterize and coverage of Rasters.jl

`rasterize(last, geoms; to = grid, fill = values)` of Rasters.jl burns each geometry into the cells of `grid`, with the matching entry of `values`, and `missingval = missing` leaves the other cells missing ([Schouten (2026)](#ref-Sch2026a)). `coverage(union, geoms; to = grid)` returns the share of each cell covered by the union of the geometries, and `coverage(sum, ...)` the sum of their shares, which can exceed one where they overlap. Both take geometries described by GeoInterface.jl, such as the GDAL geometries that DuckDB's `ST_AsWKB` and ArchGDAL.jl's `fromWKB` give ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [Ng (2026)](#ref-Ng2026a)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Tom1990a"></a>Tomlin, C. D. (1990). *Geographic information systems and cartographic modeling*. Prentice Hall.

## See Also
- [Overview](overview.md) · [Zonal Operations](zonal.md) · [Resampling and Aggregation](resampling.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
