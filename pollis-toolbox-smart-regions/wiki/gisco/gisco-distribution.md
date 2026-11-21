# GISCO Distribution

## Themes, Years and Files

GISCO distributes its public geographic data by theme, among them nuts for the NUTS regions, lau for the local administrative units, countries for the countries of the world and urau for the cities and functional urban areas of the Urban Audit ([Eurostat (2026)](#ref-Eur2026a)). For each theme, a file datasets.json lists the years available, and a file named as nuts-2024-files.json lists the files of one year by format: GeoPackage, GeoJSON, TopoJSON, Shapefile, CSV, SVG and, for some themes, Parquet. The Eurostat GISCO panel reads this list before it downloads a file, and says which file is missing when the year, level or scale chosen is not there.

## File Names

The name of a GISCO file gives its content: NUTS_RG_20M_2024_4326_LEVL_3 holds the regions (RG) of NUTS 3 at 1:20 million in the version of 2024, with coordinates in EPSG:4326, longitude and latitude in degrees ([Eurostat (2026)](#ref-Eur2026a)). The countries follow the same pattern, as CNTR_RG_20M_2024_4326; the LAUs, LAU_RG_01M_2024_4326, come at 1:1 million only; the Urban Audit's files, URAU_RG_100K_2024_4326_CITIES and URAU_RG_100K_2024_4326_FUA, at 1:100,000.

## Years of Each Theme

GISCO distributes the NUTS regions of the versions of 2003, 2006, 2010, 2013, 2016, 2021 and 2024; the LAUs of every year from 2011 to 2024; the countries of 2001, 2006, 2010, 2013, 2016, 2020 and 2024; and the Urban Audit of 2001, 2004, 2014, 2018, 2020, 2021 and 2024 ([Eurostat (2026)](#ref-Eur2026a)). The Year input of the Eurostat GISCO panel takes any of these, and its tooltip lists them.

## Scales and Generalisation

GISCO creates its NUTS datasets mainly from EuroBoundaryMap of EuroGeographics, and distributes them at 1:1 million, 1:3 million, 1:10 million, 1:20 million and 1:60 million, the small scales meant for cartographic purposes ([Eurostat (2026)](#ref-Eur2026a)). Scales Side by Side in the Eurostat GISCO panel downloads each scale once and compares the units' vertices and total area with those at 1:1 million.

## Columns of the Files

Each theme has its own columns, which File and Columns in the Eurostat GISCO panel lists ([Eurostat (2026)](#ref-Eur2026a)). The NUTS files have NUTS_ID, LEVL_CODE, CNTR_CODE, NAME_LATN and NUTS_NAME, and typology columns; the LAU files GISCO_ID, CNTR_CODE, LAU_NAME and, in recent years, the population, density and area of the year; the countries CNTR_ID, NAME_ENGL, ISO3_CODE and the status columns EU_STAT, EFTA_STAT and CC_STAT; the Urban Audit `URAU_CODE`, URAU_NAME, CITY_CPTL and FUA_CODE, the code of a city's functional urban area. The panel adds km2, the area of each unit on the WGS 84 ellipsoid, computed with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Terms of Use and Copyright Notice

GISCO grants a non-exclusive and non-transferable right to use and process the data downloaded from its page of administrative units, on condition that they are not used for commercial purposes and that the source is acknowledged ([Eurostat (2026)](#ref-Eur2026a)). Any printed or electronic publication must show the notice © EuroGeographics for the administrative boundaries, in the legend of the map and in the introductory page. For commercial use, GISCO refers to EuroGeographics for their licence agreements. Each dataset's page on GISCO's website gives its own terms.

## Reading GISCO From R

The giscoR package for R downloads GISCO's data, among them country boundaries, NUTS regions, administrative units and statistical units ([Hernangómez (2026)](#ref-Her2026a)). Its description says that it is neither affiliated with nor endorsed by Eurostat. The Eurostat GISCO panel reads the same distribution from Julia, with DuckDB ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)).

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Eur2026a"></a>Eurostat (2026). GISCO: Geographic Information System of the Commission. [ec.europa.eu/eurostat/web/gisco](https://ec.europa.eu/eurostat/web/gisco)

<a id="ref-Her2026a"></a>Hernangómez, D. (2026). giscoR: download Eurostat GISCO spatial data. R package version 1.3.1. [doi:10.32614/CRAN.package.giscoR](https://doi.org/10.32614/CRAN.package.giscoR)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [NUTS Classification](nuts-classification.md) · [Eurostat Statistics by Region](eurostat-statistics-by-region.md)
