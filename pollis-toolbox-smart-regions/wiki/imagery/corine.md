# CORINE Land Cover

## What Is CORINE Land Cover?

CORINE Land Cover gives consistent and thematically detailed information on land cover and land cover changes across Europe ([European Environment Agency (2019)](#ref-EEA2019a)). National teams of the member and cooperating countries of the European Environment Agency classify satellite images, and their inventories are joined into one seamless map, with 44 classes in three levels, a minimum mapping unit of 25 hectares and a minimum width of 100 metres. The years mapped are 1990, 2000, 2006, 2012 and 2018, each with the change layer since the year before, and 1990 covers fewer countries than the later years ([Feranec, Soukup, Hazeu and Jaffrain (2016)](#ref-FSHJ2016a)). The CORINE Land Cover tab of the Copernicus Imagery Layers panel draws the year chosen in the Year input from the European Environment Agency's map service of that year.

## Inputs of the CORINE Land Cover Tab

| Input | What it sets |
|---|---|
| Year | 1990, 2000, 2006, 2012 or 2018 |
| Opacity | From 0, transparent, to 1, opaque: below 1 the base map shows through |
| Style | The base map, whose labels are drawn over the layer |
| Place Name, Longitude, Latitude, Zoom | The place the map opens on, and how far in |
| Box Side (km) | The square around the place that the Next Steps measure and save |

The legend shows the 44 classes in the colours every year uses. The service draws the 100 m raster when the map is zoomed out and the polygons when it is zoomed in, which Service Description prints ([Esri (2026)](#ref-Esr2026a)).

## Reading the CORINE Classes at Points and in a Box

Values at Points asks the year's map service for the polygon under the place and under four points around it, half the box side away to the north, east, south and west, and prints each one's class with its code and name ([Esri (2026)](#ref-Esr2026a)). Land Cover Shares asks the service for every polygon that meets the box, cuts them to it with DuckDB's spatial extension, and adds up the area of each class in EPSG:3035, an equal-area projection, with its share of the box ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). A class's area in a box smaller than a few polygons depends on where their edges fall, since each polygon is at least 25 hectares ([European Environment Agency (2019)](#ref-EEA2019a)).

## Comparing Years of CORINE Land Cover

Two Years shows the year chosen and 2000, or 2018 when 2000 is chosen, at the same place and zoom: 2000 maps more countries than 1990 ([Feranec, Soukup, Hazeu and Jaffrain (2016)](#ref-FSHJ2016a)). The status layers of two years show what each map says, but a difference between them can come from a change of the land or from a polygon drawn differently. Changes 2012 to 2018 reads the change layer instead, whose polygons of 5 hectares or more each keep their class in 2012 and in 2018, and prints the area of each change of class in the box ([European Environment Agency (2019)](#ref-EEA2019a)). Save the Polygons writes the polygons of the box, cut to it, with their code and class, to a GeoPackage.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Esr2026a"></a>Esri (2026). ArcGIS REST APIs: map services and image services. [developers.arcgis.com/rest/services-reference/enterprise](https://developers.arcgis.com/rest/services-reference/enterprise/)

<a id="ref-EEA2019a"></a>European Environment Agency (2019). CORINE Land Cover 2018 (vector), Europe, 6-yearly - version 2020_20u1, May 2020. [doi:10.2909/71c95a07-e296-44fc-b22b-415f42acfdf0](https://doi.org/10.2909/71c95a07-e296-44fc-b22b-415f42acfdf0)

<a id="ref-FSHJ2016a"></a>Feranec, J., Soukup, T., Hazeu, G. and Jaffrain, G. (eds.) (2016). *European Landscape Dynamics: CORINE Land Cover Data*. CRC Press, Boca Raton, FL. [doi:10.1201/9781315372860](https://doi.org/10.1201/9781315372860)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [CORINE Nomenclature](corine-nomenclature.md) · [Map Services](map-services.md) · [Decision Guide](decision-guide.md)
