# Historical Populations — European Cities

European Cities is the tab of the Historical Populations panel that reads European urban population, 700 - 2000, by Eltjo Buringh, published by DANS under CC0 1.0 ([Buringh (2020)](#ref-Bur2020a)).

## What Does European Urban Population, 700 - 2000 Contain?

European urban population, 700 - 2000 contains estimates of the urban population, in thousands of inhabitants, of 2,262 European settlements between the years 700 and 2000 ([Buringh (2020)](#ref-Bur2020a)). It is based on earlier historical demographic sources, critically assessed and systematically complemented with new estimates for further years, from quantitative sources or proxies, and missing data are covered by city-specific imputations. Each settlement also has its historical names and geographical data, such as its elevation and its access to transport by water. The values fall at 19 years: every century from 700 to 1500, then every 50 years from 1500 to 2000. The European Cities tab reads the file once into the Folder from DANS, without an account.

## What Do Imputed and Proxied Mean in European Cities?

The column `natureofestimate` of European urban population, 700 - 2000 says how each value was obtained, and the European Cities tab of the Historical Populations panel keeps it as the `note` of the table `cities`. An imputed value is a city-specific imputation that covers a year without a population figure. A proxied value is an estimate derived from a proxy rather than from a quantitative source. A value with neither mark comes from the demographic sources ([Buringh (2020)](#ref-Bur2020a)). Kinds of Estimate counts the values of each kind in the Box, and History of a Place shows the kind of every value of one city.

## How Does the European Cities Tab Read the Values?

The European Cities tab of the Historical Populations panel reads European urban population, 700 - 2000 with DuckDB, with the function `buringh_cities` of HistoricalGeography.jl. The inhabitants, given in thousands, become people, and the coordinates, written with decimal commas, become numbers. A settlement with 0 inhabitants in a year has no row for that year, so it appears on the map from its first year with inhabitants. Each settlement is one city, told apart by its name, its country and its coordinates, as two settlements can share a name in one country.

## Which Research Uses City Data of Europe and the Islamic World?

City-level data of this kind support research on long-run urban development. Bosker, Buringh and van Zanden used a city-specific data set covering Europe, the Middle East and North Africa between 800 and 1800 to study why the urban centre of gravity moved from the Islamic world to Europe, relating city growth to geography, transport and local participative government ([Bosker, Buringh and van Zanden (2013)](#ref-BBZ2013a)). The European Cities tab covers Europe only; Two Sources sets a European city beside its values in World Cities.

## References

<a id="ref-BBZ2013a"></a>Bosker, M., Buringh, E. and van Zanden, J. L. (2013). From Baghdad to London: Unraveling Urban Development in Europe, the Middle East, and North Africa, 800–1800. *The Review of Economics and Statistics* 95, 1418-1437. [doi:10.1162/REST_a_00284](https://doi.org/10.1162/REST_a_00284)

<a id="ref-Bur2020a"></a>Buringh, E. (2020). European urban population, 700 - 2000. DANS Data Station Social Sciences and Humanities. Dataset, version 1.1. [doi:10.17026/dans-xzy-u62q](https://doi.org/10.17026/dans-xzy-u62q)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [World Cities](world-cities.md) · [HYDE 3.5](hyde.md)
