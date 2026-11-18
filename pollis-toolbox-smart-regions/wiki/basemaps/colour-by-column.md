# Colour by Column

## What the Colour by Column Tab of the OpenStreetMap Base Maps Panel Shows

The Colour by Column tab of the OpenStreetMap Base Maps panel reads a file as the Features tab does, and colours each feature by the value of one of its columns, named by the Column input, with a legend at the bottom right. It is a map of how a value varies over an area: a count, a rate or a measurement for each district, sensor or road, or a category such as a land use or a type of facility. `Pollis.layer(file; column = "...")` does the colouring, and MapLibre GL JS draws it with an expression of its style language that computes each feature's colour from the feature's own properties ([MapLibre Contributors (2026)](#ref-MLC2026a)). The Opacity input sets how much of the base map shows through the polygons.

## How a Numeric Column Is Coloured

When every value of the column is a number, `Pollis.webmap` spreads a colour scale from the smallest value to the largest: dark purple, blue, green, light green and yellow, with the colours between them interpolated linearly. The legend shows the scale and its two ends. A feature without a number in the column is drawn grey, never in the colour of zero. A linear scale from the smallest to the largest value lets one extreme value squeeze all the others into a few colours; a transformed column, such as its logarithm or its rank, computed with SQL in DuckDB and written to the file with `COPY`, spreads them out. Base maps of muted colours, such as Positron and Dark, keep the scale readable ([Ero (2026)](#ref-Ero2026a)).

## How a Text Column Is Coloured

When the column holds text, or a mix of text and numbers, each value is a category. The ten most common values get a colour each, from a palette of ten distinct colours, and the legend lists them; the other values share one grey, which the legend counts as "N more". A column of codes, such as a district code stored as a number, is coloured as a scale unless stored as text: `CAST(code AS VARCHAR)` in a query makes it categories. Colours of categories carry no order, so a column with an order, such as low, medium and high, reads better as numbers. A feature without a value in the column is grey.

## Polygons, Lines and Points Coloured by a Column

The same colour of a feature fills a polygon, draws a line, and fills the circle of a point; polygons also get an outline in the same colour, drawn opaque so the edge shows through a translucent fill, and points a thin white ring ([MapLibre Contributors (2026)](#ref-MLC2026a)). Polygons coloured by a column, such as the districts of a region, make a choropleth map: the eye reads larger polygons as more important, whatever their value, and Web Mercator enlarges polygons far from the equator, so a map of values on areas is read with care ([Battersby, Finn, Usery and Yamamoto (2014)](#ref-BFUY2014a)). Points coloured by a column, such as sensors, avoid that, but hide one another where they are dense.

## References

<a id="ref-BFUY2014a"></a>Battersby, S. E., Finn, M. P., Usery, E. L. and Yamamoto, K. H. (2014). Implications of Web Mercator and its use in online mapping. *Cartographica*, 49(2), 85–101. [doi:10.3138/carto.49.2.2313](https://doi.org/10.3138/carto.49.2.2313)

<a id="ref-Ero2026a"></a>Ero, Z. (2026). OpenFreeMap: free and open-source map hosting with OpenStreetMap data. [github.com/hyperknot/openfreemap](https://github.com/hyperknot/openfreemap)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

## See Also
- [Factsheet](factsheet.md) · [Features](features.md) · [Base Map Styles](base-map-styles.md) · [Decision Guide](decision-guide.md) · [Web Mercator](web-mercator.md)
