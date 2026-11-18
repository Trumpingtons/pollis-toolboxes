# Decision Guide

## Which Tab of the Eurostat GISCO Panel to Use

| Need | Tab | GISCO theme |
|---|---|---|
| Regions for Eurostat's regional statistics, at NUTS level 0, 1, 2 or 3 | NUTS Regions | nuts |
| Municipalities and communes, with their population and density | Local Administrative Units | lau |
| The countries of the world, with their EU, EFTA and candidate status | Countries | countries |
| Cities, or cities with their commuting zones | Cities and Functional Urban Areas | urau |

The NUTS regions and the LAUs nest: the LAUs subdivide the NUTS 3 regions, which subdivide NUTS 2 and NUTS 1 regions ([Eurostat (2026)](#ref-Eur2026c)). Eurostat lists the LAUs of which each city and functional urban area is composed.

## Which NUTS Level to Use

NUTS 1 holds major socio-economic regions, NUTS 2 basic regions for regional policies and NUTS 3 small regions for specific diagnoses ([Eurostat (2026)](#ref-Eur2026c)). The level of a Eurostat table decides the level to read: a table at NUTS 2 joins with NUTS 2 regions only. Results computed from areal units depend on their scale and zoning: Fotheringham and Wong showed that the estimates of multiple regression and logit models can change with both, in ways hard to predict, which they called a warning for any multivariate analysis of data from areal units ([Fotheringham and Wong (1991)](#ref-FW1991a)). Repeating an analysis at two NUTS levels shows how much it depends on the level.

## Which Scale to Use

GISCO distributes the NUTS regions and countries at 1:1 million, 1:3 million, 1:10 million, 1:20 million and 1:60 million, generalised for cartographic purposes ([Eurostat (2026)](#ref-Eur2026a)). In the Eurostat GISCO panel, 1:20 million draws a map of Europe quickly; 1:1 million follows the boundaries most closely, for maps of a country or region and for areas. The LAUs are distributed at 1:1 million only, and the Urban Audit's cities and functional urban areas at 1:100,000.

## Which Year to Read

The Year input of the Eurostat GISCO panel chooses the version of the units: for NUTS, the classification of that year (2003, 2006, 2010, 2013, 2016, 2021 or 2024); for LAUs, the yearly list of that year ([Eurostat (2026)](#ref-Eur2026a)). Read the NUTS version that the Eurostat table uses: its codes must match those of the regions. NUTS 2024 is valid from 1 January 2024, and NUTS 2027 from 1 January 2027 ([Eurostat (2026)](#ref-Eur2026c)); a version that GISCO's distribution does not list yet cannot be read.

## Which Eurostat Table and Key

A Eurostat table is named by its code, and its key selects one value for each of its dimensions, in order, separated by dots, an empty position selecting every value ([Eurostat (2026)](#ref-Eur2026b)). Map a Eurostat Table needs one series per unit, so every dimension but the regions must have one value: the key A.PER_KM2. of demo_r_d3dens, for instance, selects the annual values in persons per km² of every region. When the key selects several series per unit, the panel names the dimensions that still vary.

## References

<a id="ref-Eur2026b"></a>Eurostat (2026). API Getting Started: SDMX 2.1. [ec.europa.eu/eurostat/web/user-guides/data-browser/api-data-access/api-getting-started/sdmx2.1](https://ec.europa.eu/eurostat/web/user-guides/data-browser/api-data-access/api-getting-started/sdmx2.1)

<a id="ref-Eur2026a"></a>Eurostat (2026). GISCO: Geographic Information System of the Commission. [ec.europa.eu/eurostat/web/gisco](https://ec.europa.eu/eurostat/web/gisco)

<a id="ref-Eur2026c"></a>Eurostat (2026). NUTS: Nomenclature of Territorial Units for Statistics. [ec.europa.eu/eurostat/web/nuts](https://ec.europa.eu/eurostat/web/nuts)

<a id="ref-FW1991a"></a>Fotheringham, A. S. and Wong, D. W. S. (1991). The modifiable areal unit problem in multivariate statistical analysis. *Environment and Planning A: Economy and Space*, 23(7), 1025–1044. [doi:10.1068/a231025](https://doi.org/10.1068/a231025)

## See Also
- [Factsheet](factsheet.md) · [NUTS Classification](nuts-classification.md) · [GISCO Distribution](gisco-distribution.md) · [Eurostat Statistics by Region](eurostat-statistics-by-region.md) · [Diagnostics](diagnostics.md)
