# Eurostat Statistics by Region

## Eurostat's SDMX 2.1 API

Eurostat disseminates its datasets through an SDMX 2.1 REST API: a request names a dataset by its code, as https://ec.europa.eu/eurostat/api/dissemination/sdmx/2.1/data/demo_r_d3dens, optionally followed by a key, and the parameter format=SDMX-CSV returns the data as CSV ([Eurostat (2026)](#ref-Eur2026b)). Each dataset has a data structure definition that lists its dimensions in order, with the codes each can take. The Eurostat GISCO panel reads such a URL with DuckDB's read_csv over HTTPS ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)).

## Series Keys

A key filters the series of a dataset: one value for each dimension, in the order of the data structure definition, separated by dots ([Eurostat (2026)](#ref-Eur2026b)). Several values of one dimension are separated by a + sign, and a dimension left blank selects all its values. For demo_r_d3dens, whose dimensions are frequency, unit and region, the key A.PER_KM2. selects the annual values in persons per km² of every region. The Key input of the Eurostat GISCO panel takes such a key.

## Columns of SDMX-CSV

An SDMX-CSV file of Eurostat has one row per observation, with a column for each dimension, the column TIME_PERIOD with the period, OBS_VALUE with the value and OBS_FLAG with a flag of the observation where there is one ([Eurostat (2026)](#ref-Eur2026b)). The column of the regions or countries is named geo in demo_r_d3dens, and that of the cities is named cities in urb_cpop1; the panel looks for either. The Eurostat GISCO panel joins that column with the code of the units read.

## Joining Statistics and Boundaries

A Eurostat table by region and GISCO's boundaries share the NUTS codes, so the join is by code, and the NUTS version of both must match ([Eurostat (2026)](#ref-Eur2026c)). Map a Eurostat Table in the Eurostat GISCO panel reads the table and key, checks that only the regions vary, takes the latest period that has a value for a unit read, and draws the values as a choropleth, the units without a value left blank. Codes and Eurostat lists the codes of the table that the units do not have, and the units without values.

## Tables of Cities

Eurostat's urban statistics, such as urb_cpop1, the population of cities on 1 January, use the codes of the Urban Audit, which GISCO's URAU files share in their column URAU_CODE ([Eurostat (2026)](#ref-Eur2026a)). The Cities and Functional Urban Areas tab of the Eurostat GISCO panel takes such a table in its Eurostat Table input, with a key such as A.DE1001V. for the total population.

## Eurostat From R

The eurostat package for R provides tools to query, download, manipulate and visualise the data of Eurostat's open data service in a reproducible manner, and documents the analysis of these spatio-temporal data with examples ([Lahti, Huovari, Kainu and Biecek (2017)](#ref-LHKB2017a)). The Eurostat GISCO panel does the same in SQL with DuckDB, joining the tables with GISCO's boundaries in one database.

## Data at Different Levels

A statistic may tell a different story at NUTS 2 than at NUTS 3, or in LAUs: Fotheringham and Wong showed that estimates from areal data change with the scale and zoning of the units, the modifiable areal unit problem ([Fotheringham and Wong (1991)](#ref-FW1991a)). Reading the same statistic at a second NUTS level shows how much a result depends on the level.

## References

<a id="ref-Eur2026b"></a>Eurostat (2026). API Getting Started: SDMX 2.1. [ec.europa.eu/eurostat/web/user-guides/data-browser/api-data-access/api-getting-started/sdmx2.1](https://ec.europa.eu/eurostat/web/user-guides/data-browser/api-data-access/api-getting-started/sdmx2.1)

<a id="ref-Eur2026a"></a>Eurostat (2026). GISCO: Geographic Information System of the Commission. [ec.europa.eu/eurostat/web/gisco](https://ec.europa.eu/eurostat/web/gisco)

<a id="ref-Eur2026c"></a>Eurostat (2026). NUTS: Nomenclature of Territorial Units for Statistics. [ec.europa.eu/eurostat/web/nuts](https://ec.europa.eu/eurostat/web/nuts)

<a id="ref-FW1991a"></a>Fotheringham, A. S. and Wong, D. W. S. (1991). The modifiable areal unit problem in multivariate statistical analysis. *Environment and Planning A: Economy and Space*, 23(7), 1025–1044. [doi:10.1068/a231025](https://doi.org/10.1068/a231025)

<a id="ref-LHKB2017a"></a>Lahti, L., Huovari, J., Kainu, M. and Biecek, P. (2017). Retrieval and analysis of Eurostat open data with the eurostat package. *The R Journal*, 9(1), 385–392. [doi:10.32614/RJ-2017-019](https://doi.org/10.32614/RJ-2017-019)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [NUTS Classification](nuts-classification.md) · [GISCO Distribution](gisco-distribution.md)
