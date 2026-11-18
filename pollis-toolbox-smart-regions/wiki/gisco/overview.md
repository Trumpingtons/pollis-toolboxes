# Overview

## What GISCO Is

GISCO, the Geographic Information System of the Commission, provides the European Commission with geographical information at three levels: the EU, the member states and the regions ([Eurostat (2026)](#ref-Eur2026a)). Besides making statistical and thematic maps, it manages a database of geographical information covering the whole of Europe, such as administrative boundaries, and thematic geospatial information, such as population grids. Some of these data are distributed to the public, for non-commercial use, under the terms given on GISCO's pages.

## Why Statistics Need Boundaries

Eurostat describes location as a key feature of virtually all official statistics: it gives the structure for collecting, processing, storing, analysing and aggregating data, and the same location is often shared by different statistical datasets ([Eurostat (2026)](#ref-Eur2026a)). The most important location framework at EU level is the NUTS classification, whose boundaries GISCO produces in cooperation with the national mapping and cadastral authorities and the national statistical institutes. Boundaries change, through administrative reforms, urban sprawl and changing land use, which makes statistics hard to compare over time.

## NUTS Regions

NUTS, the Nomenclature of Territorial Units for Statistics, divides each EU country into regions at three levels: NUTS 1, major socio-economic regions; NUTS 2, basic regions for regional policies; and NUTS 3, small regions for specific diagnoses ([Eurostat (2026)](#ref-Eur2026c)). It serves to collect, develop and harmonise European regional statistics, to carry out socio-economic analyses of the regions and to frame EU regional policies; the regions eligible for support from cohesion policy are defined at NUTS 2. The NUTS Regions tab of the Eurostat GISCO panel reads the regions of one level.

## Local Administrative Units

Eurostat maintains a system of local administrative units (LAUs) compatible with NUTS, to meet the demand for statistics at a local level: the LAUs are the building blocks of NUTS and comprise the EU's municipalities and communes ([Eurostat (2026)](#ref-Eur2026c)). They subdivide the NUTS 3 regions and cover the EU's whole economic territory. The Local Administrative Units tab of the Eurostat GISCO panel reads the LAUs of a country with their population, density and area.

## Cities and Functional Urban Areas

A functional urban area, as the EU-OECD method defines it, is composed of a city and its commuting zone, and so encompasses the economic and functional extent of a city based on people's daily movements ([Dijkstra, Poelman and Veneri (2019)](#ref-DPV2019a)). The method has been applied to the member countries of the European Union, to 33 OECD member countries and to Colombia. Eurostat lists the LAUs that make up each city and each functional urban area ([Eurostat (2026)](#ref-Eur2026c)). The Cities and Functional Urban Areas tab of the Eurostat GISCO panel reads either the cities or the functional urban areas of GISCO's Urban Audit files.

## Countries

GISCO's countries theme holds the countries of the world, each with its code, its names and its status: member of the European Union, of EFTA, or a candidate country ([Eurostat (2026)](#ref-Eur2026a)). The Countries tab of the Eurostat GISCO panel reads them at one scale, for world and European maps and for Eurostat's tables by country.

## Other Tools for GISCO and Eurostat

In R, the giscoR package downloads GISCO's spatial data, such as country boundaries, NUTS regions and administrative units ([Hernangómez (2026)](#ref-Her2026a)), and the eurostat package queries, downloads, manipulates and visualises the data of Eurostat's open data service ([Lahti, Huovari, Kainu and Biecek (2017)](#ref-LHKB2017a)). The Eurostat GISCO panel does both in Julia with DuckDB, reading GISCO's files and Eurostat's tables with SQL ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)).

## References

<a id="ref-DPV2019a"></a>Dijkstra, L., Poelman, H. and Veneri, P. (2019). The EU-OECD definition of a functional urban area. *OECD Regional Development Working Papers*. Paris: Organisation for Economic Co-operation and Development. [doi:10.1787/d58cb34d-en](https://doi.org/10.1787/d58cb34d-en)

<a id="ref-Eur2026a"></a>Eurostat (2026). GISCO: Geographic Information System of the Commission. [ec.europa.eu/eurostat/web/gisco](https://ec.europa.eu/eurostat/web/gisco)

<a id="ref-Eur2026c"></a>Eurostat (2026). NUTS: Nomenclature of Territorial Units for Statistics. [ec.europa.eu/eurostat/web/nuts](https://ec.europa.eu/eurostat/web/nuts)

<a id="ref-Her2026a"></a>Hernangómez, D. (2026). giscoR: download Eurostat GISCO spatial data. R package version 1.3.1. [doi:10.32614/CRAN.package.giscoR](https://doi.org/10.32614/CRAN.package.giscoR)

<a id="ref-LHKB2017a"></a>Lahti, L., Huovari, J., Kainu, M. and Biecek, P. (2017). Retrieval and analysis of Eurostat open data with the eurostat package. *The R Journal*, 9(1), 385–392. [doi:10.32614/RJ-2017-019](https://doi.org/10.32614/RJ-2017-019)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Factsheet](factsheet.md) · [NUTS Classification](nuts-classification.md) · [Local Administrative Units](local-administrative-units.md) · [GISCO Distribution](gisco-distribution.md) · [Decision Guide](decision-guide.md)
