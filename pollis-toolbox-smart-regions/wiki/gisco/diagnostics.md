# Diagnostics

## Codes of Another NUTS Version

The NUTS classification is amended every few years, and a region that is split, merged or redrawn gets new codes; when it is amended, the country concerned has to replace its historical data by time series on the new regional breakdown within two years ([Eurostat (2026)](#ref-Eur2026c)). A Eurostat table may therefore hold codes of an earlier NUTS version for some years, and codes of the current one for others. Codes and Eurostat in the Eurostat GISCO panel lists the codes of the table, of the level and countries read, that are not among the units, with the first and last period of their values, and the units that have no value in the table.

## Generalised Boundaries

GISCO's metadata for its NUTS datasets says that they are created mainly from EuroBoundaryMap of EuroGeographics, and are distributed at scales of 1:1 million, 1:3 million, 1:10 million, 1:20 million and 1:60 million, the small scales meant for cartographic purposes ([Eurostat (2026)](#ref-Eur2026a)). Generalisation removes vertices, so the boundaries of a small scale are simpler and areas computed from them are approximate. Scales Side by Side in the Eurostat GISCO panel shows, for the same units, the number of vertices and the total area at each scale GISCO has for the year.

## Invalid and Multipart Geometries

Geometry Check in the Eurostat GISCO panel tests the units read with the functions of DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)): it counts the geometries that are invalid, those that are empty and the units in several parts, such as islands, gives the number of vertices of the boundaries, and lists the five smallest units with their areas.

## Units Without Population

The LAU files of GISCO carry the population and density of each unit for the year of the file, where Eurostat received them with the yearly LAU lists, which the member states send if available ([Eurostat (2026)](#ref-Eur2026c)). The Eurostat GISCO panel leaves out units with a population of 0 from its population figures; Countries Side by Side shows, for every country of the file, how many units have a population above 0, so countries without population data in the file show as blank.

## Terms of Use

GISCO grants the use of the geographical data on its page of administrative units on condition that they are not used for commercial purposes and that the source is acknowledged, with the notice © EuroGeographics for the administrative boundaries in the legend of the map and in the introductory page of any publication ([Eurostat (2026)](#ref-Eur2026a)). For commercial use, it refers to EuroGeographics for their licence agreements. The Eurostat GISCO panel prints the notice under each map it draws.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Eur2026a"></a>Eurostat (2026). GISCO: Geographic Information System of the Commission. [ec.europa.eu/eurostat/web/gisco](https://ec.europa.eu/eurostat/web/gisco)

<a id="ref-Eur2026c"></a>Eurostat (2026). NUTS: Nomenclature of Territorial Units for Statistics. [ec.europa.eu/eurostat/web/nuts](https://ec.europa.eu/eurostat/web/nuts)

## See Also
- [Factsheet](factsheet.md) · [NUTS Classification](nuts-classification.md) · [GISCO Distribution](gisco-distribution.md) · [Eurostat Statistics by Region](eurostat-statistics-by-region.md) · [Decision Guide](decision-guide.md)
