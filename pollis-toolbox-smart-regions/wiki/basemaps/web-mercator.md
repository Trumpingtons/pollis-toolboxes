# Web Mercator

## What Is Web Mercator?

Web Mercator is the projection of almost every online map, the base maps of the OpenStreetMap Base Maps panel among them ([Battersby, Finn, Usery and Yamamoto (2014)](#ref-BFUY2014a)). It draws longitude and latitude on WGS 84 with the equations of the Mercator projection for a sphere, rather than for the ellipsoid that WGS 84 defines, which keeps the computations simple for the tiles of web maps. Its code in the EPSG registry is EPSG:3857, with coordinates in metres. The Mercator projection has long been judged unsuitable for general-purpose maps of the world, and had almost left printed world maps, before Web Mercator brought it back as the default of online mapping.

## Why Web Maps Use Web Mercator

Web Mercator suits the way web maps are made and used ([Battersby, Finn, Usery and Yamamoto (2014)](#ref-BFUY2014a)). Cut at about 85.05 degrees north and south, the world becomes a square, which splits evenly into the square tiles of each zoom level. North is always up, and the shapes of small areas, such as a block of streets, are kept, so a street map looks right at every zoom and wherever the user pans. The same projection serves every zoom level, from the whole world to a single street, so a map can be zoomed without changing its projection. Those strengths are for finding the way at local scales, which is what most users of online maps do.

## How Web Mercator Distorts Areas and Distances

Web Mercator enlarges areas more and more away from the equator, so a region far north or south looks much larger than a region of the same area near the equator ([Battersby, Finn, Usery and Yamamoto (2014)](#ref-BFUY2014a)). The scale of the map changes with latitude in the same way: the scale bar of a map of `Pollis.webmap` gives the scale at the latitude of the centre, which differs from the scale at the top and the bottom of a map of a large region. Comparing the sizes of countries or regions by eye on a web map therefore misleads, and so do patterns of colour on large polygons far from the equator. Areas and lengths should be measured in a projected coordinate system chosen for the region.

## Measuring Areas and Distances Rather Than Reading Them From a Web Map

A web map shows where things are; measurements belong to the data, not the screen. DuckDB's spatial extension measures with `ST_Area`, `ST_Length` and `ST_Distance` in the units of the geometry's coordinate system, so features are first moved with `ST_Transform` into a projected system in metres chosen for the region, such as EPSG:3035 (ETRS89 / LAEA Europe), which keeps areas exact across Europe ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). `ST_Distance_Sphere` gives great-circle distances between points in longitude and latitude, which the Distance from the Centre action of the OpenStreetMap Base Maps panel uses. The Extent and Measures action of the Geospatial Vector Files panel measures in the Projected Coordinate System input.

## Latitudes Beyond 85.05 Degrees

Web Mercator cannot show the poles: the Mercator projection stretches latitudes without bound towards them, so web maps cut the world at about 85.05 degrees north and south, where the map becomes a square ([Battersby, Finn, Usery and Yamamoto (2014)](#ref-BFUY2014a)). Features beyond that latitude, such as the interior of Antarctica or the Arctic Ocean near the pole, are not drawn, and a polygon that crosses it is cut. The Coordinates in Range action of the OpenStreetMap Base Maps panel counts the features that reach beyond 85.05 degrees. Polar data needs a polar projection, such as a polar stereographic one, and a map other than a web map.

## References

<a id="ref-BFUY2014a"></a>Battersby, S. E., Finn, M. P., Usery, E. L. and Yamamoto, K. H. (2014). Implications of Web Mercator and its use in online mapping. *Cartographica*, 49(2), 85–101. [doi:10.3138/carto.49.2.2313](https://doi.org/10.3138/carto.49.2.2313)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Vector Tiles and Raster Tiles](vector-and-raster-tiles.md) · [Place](place.md) · [Decision Guide](decision-guide.md)
