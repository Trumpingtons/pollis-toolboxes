# Eurostat GISCO — Factsheet

**GISCO**, the Geographic Information System of the Commission, provides the European Commission with geographical information and distributes, among other data, the boundaries of the NUTS regions, the local administrative units, the countries of the world and the cities and functional urban areas of the Urban Audit ([Eurostat (2026)](#ref-Eur2026a)). The Eurostat GISCO panel of the Smart Regions Toolbox reads these boundaries from GISCO's distribution with DuckDB.jl and DuckDB's spatial extension, and joins them by their codes with Eurostat's tables of statistics ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

| Item | Eurostat GISCO panel |
|---|---|
| **Purpose** | Read the boundaries of European statistical and administrative units, map Eurostat's statistics on them, check them, compare versions and scales, and save them |
| **Input** | A year (the version of the units), a level and scale for NUTS and countries, a country, and a Eurostat table with its key |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), with DuckDB's spatial and httpfs extensions |
| **Tabs** | NUTS Regions; Local Administrative Units; Countries; Cities and Functional Urban Areas |
| **Output** | The table `features`: one row per unit, with GISCO's columns, its area in km² as `km2`, and its geometry as `geom` |
| **Key choices** | The year; the NUTS level; the scale; the country; the Eurostat table and key |

## How Does the Eurostat GISCO Panel Get GISCO's Files?

GISCO's distribution lists, for each theme and year, the files it has, in GeoPackage, GeoJSON, TopoJSON, Shapefile and other formats ([Eurostat (2026)](#ref-Eur2026a)). The Eurostat GISCO panel reads that list for the theme and year chosen, checks that the file of the level and scale chosen is in it, downloads the GeoPackage once to the Folder and reads it from there afterwards with DuckDB's spatial extension, keeping the units of the country chosen ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## How Does the Eurostat GISCO Panel Join Eurostat's Statistics?

Eurostat's SDMX 2.1 API returns the series of a dataset selected by a key, one value for each dimension of the dataset in order, in formats that include SDMX-CSV ([Eurostat (2026)](#ref-Eur2026b)). The panel's Map a Eurostat Table and Codes and Eurostat read the table and key chosen with DuckDB over HTTPS, and join its column of regions, countries or cities with the code of the units read: NUTS_ID for NUTS regions, CNTR_ID for countries and `URAU_CODE` for cities and functional urban areas.

## What the Next Steps of the Eurostat GISCO Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Show on a Map, Map a Eurostat Table, Largest Units by Area | The units on a base map; a choropleth of the latest values of a Eurostat table; the largest units in km² |
| Diagnose | File and Columns, Geometry Check, Codes and Eurostat | The file, its columns and extent; invalid, empty and multipart geometries and vertices; codes of the table that the units do not have, and units without values |
| Compare | Scales Side by Side, Versions Side by Side, Countries Side by Side, Cities and Their Areas | The same units at each scale; NUTS codes kept, added and removed since the version before; the LAUs of each country; each city beside its functional urban area |
| Interpret | Areas Within Their Parents, Population and Density, Countries by Status, City Areas | Each region's share of its parent; the population and density of LAUs; countries by EU, EFTA and candidate status; the areas of cities |
| Export | Save as GeoPackage, Save as GeoParquet | The units read, with their area, for any GIS or data tool |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Eur2026b"></a>Eurostat (2026). API Getting Started: SDMX 2.1. [ec.europa.eu/eurostat/web/user-guides/data-browser/api-data-access/api-getting-started/sdmx2.1](https://ec.europa.eu/eurostat/web/user-guides/data-browser/api-data-access/api-getting-started/sdmx2.1)

<a id="ref-Eur2026a"></a>Eurostat (2026). GISCO: Geographic Information System of the Commission. [ec.europa.eu/eurostat/web/gisco](https://ec.europa.eu/eurostat/web/gisco)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [NUTS Classification](nuts-classification.md) · [Local Administrative Units](local-administrative-units.md) · [GISCO Distribution](gisco-distribution.md) · [Eurostat Statistics by Region](eurostat-statistics-by-region.md)
