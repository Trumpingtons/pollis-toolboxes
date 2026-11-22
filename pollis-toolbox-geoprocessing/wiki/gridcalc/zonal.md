# Zonal Operations

## What a Zonal Operation Does

A zonal operation computes one value for each zone from all the cells that belong to it ([Tomlin (1990)](#ref-Tom1990a)). The zones can be a raster of zone numbers or, as in the Zonal tab of the Grid Calculations panel, the polygons of a vector layer, such as districts, catchments or census areas. The statistic summarises the cells of each zone: the mean or median of a continuous raster, its maximum or minimum, its standard deviation, or the share of the cells of one class in a raster of classes. A zonal statistic links a raster to the units in which other data are reported, so that elevation or tree cover can sit in the same table as population or income.

## Which Cells Belong to an Area

A cell along the boundary of an area lies partly inside it, and a rule decides whether the cell counts. Rasters.jl and terra count a cell as inside an area when the cell's centre is, by default, so that each cell belongs to at most one of the areas that share a boundary ([Schouten (2026)](#ref-Sch2026a); [Hijmans, Brown, Barbosa, Cordano and Dyba (2020)](#ref-HBBCD2020a)). The `boundary = :touches` option of Rasters.jl counts every cell the area touches instead, so boundary cells count for every area they touch. Centres and Touching Cells computes the Elevation Statistic of each area both ways and lists the areas where the two differ most: small areas, and areas with long, convoluted boundaries.

## Zonal Statistics of a Raster of Classes

For a raster of classes, a mean of the class codes has no meaning; the zonal statistic is instead the share of each area's cells that are of a given class. The Zonal tab computes that share for the Land Cover Class chosen, as the mean of a test that is true for the cells of that class and false for the others. Shares of all the classes of an area add up to one, and together describe its composition, such as how much of it is built up and how much is under trees. The share counts cells, not ground area, which is the same thing when the cells are of one size.

## Zonal Operations in Julia: zonal of Rasters.jl

`zonal(f, raster; of = geoms)` of Rasters.jl applies the function `f` to the cells of the raster inside each geometry of `geoms`, and returns one value per geometry ([Schouten (2026)](#ref-Sch2026a)). The keyword `skipmissing = true` hands `f` only the cells that are not missing, so that `mean` and the other statistics ignore no-data cells. The geometries can be any that GeoInterface.jl describes; the Zonal tab reads them with DuckDB's `ST_Read`, keeps the areas that lie within the land cover with `ST_Within`, and passes them on as GDAL geometries ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [Ng (2026)](#ref-Ng2026a)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-HBBCD2020a"></a>Hijmans, R. J., Brown, A., Barbosa, A. M., Cordano, E. and Dyba, K. (2020). terra: spatial data analysis. R package version 1.9-60. [doi:10.32614/cran.package.terra](https://doi.org/10.32614/cran.package.terra)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Tom1990a"></a>Tomlin, C. D. (1990). *Geographic information systems and cartographic modeling*. Prentice Hall.

## See Also
- [Overview](overview.md) · [Local Operations](local.md) · [Rasterizing](rasterizing.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
