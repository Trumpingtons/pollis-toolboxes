# Historical Populations — Overview

The Historical Populations panel maps estimates of past populations from three open datasets: two of cities and one of the whole population on a grid. This page explains what such estimates are and how the map shows them.

## What Are Estimates of Historical Populations?

Before regular censuses, the population of a city or a region is estimated from the records that survive. Datasets of historical populations gather such estimates from the literature, harmonise them and put them in one table. Reba, Reitsma and Seto describe their dataset as built from historical, archaeological and census-based urban population data ([Reba, Reitsma and Seto (2016)](#ref-RRS2016a)). Buringh describes his as based on earlier historical demographic sources, critically assessed and complemented with new estimates from quantitative sources or proxies, with imputations for missing data ([Buringh (2020)](#ref-Bur2020a)). The numbers of the Historical Populations panel are therefore estimates whose precision varies by city, region and century.

## Cities or a Grid: Two Kinds of Historical Population Data

European Cities and World Cities give the population of named cities in the years for which the sources have an estimate. People outside those cities, in villages and the countryside, are not counted. HYDE 3.5 gives the whole population, towns and countryside together, on a grid of 5 arc-minutes covering the land of the world, at fixed years from 10,000 BCE to 2025 ([Klein Goldewijk (2025)](#ref-Gol2025a)). HYDE combines historical population estimates with allocation algorithms and maps that weight where people lived in each period ([Klein Goldewijk, Beusen, Doelman and Stehfest (2017)](#ref-GBDS2017a)). A city dataset answers how large a named city was; the grid answers how many people lived in an area and how densely.

## How Does the Year Slider of Historical Populations Show a Value?

The year slider of the Historical Populations panel moves one year at a time. In European Cities and World Cities, a value of a city is shown from its year until the year before the city's next value, for Years Shown at most, so that a value is not carried across a long gap in the source. A city's last value is shown in its own year only. A city appears once its population reaches Smallest City. In HYDE 3.5, each grid stands for its year until the year before the next grid: a grid of 1500 is shown until 1599, as the next grid is that of 1600. Clicking a point or a cell shows its values and the years in which it is shown.

## Why Does the Historical Populations Map Use Classes?

Populations of the past span several orders of magnitude, from towns of a few thousand people to cities of a million. A colour scale over the raw numbers would set the few largest cities apart and leave all others alike. The map of European Cities and World Cities therefore colours each city by its class of size: below 10,000, then 10,000 to 20,000, 20,000 to 50,000, 50,000 to 100,000, 100,000 to 200,000, 200,000 to 500,000, 500,000 to 1,000,000, and 1,000,000 and more. The map of HYDE 3.5 colours each cell by its class of people per km², from below 1 to 1,000 and more, in steps of 1, 2 and 5. A click shows the class as text, beside the population itself.

## References

<a id="ref-Bur2020a"></a>Buringh, E. (2020). European urban population, 700 - 2000. DANS Data Station Social Sciences and Humanities. Dataset, version 1.1. [doi:10.17026/dans-xzy-u62q](https://doi.org/10.17026/dans-xzy-u62q)

<a id="ref-GBDS2017a"></a>Klein Goldewijk, K., Beusen, A., Doelman, J. and Stehfest, E. (2017). Anthropogenic land use estimates for the Holocene – HYDE 3.2. *Earth System Science Data* 9, 927-953. [doi:10.5194/essd-9-927-2017](https://doi.org/10.5194/essd-9-927-2017)

<a id="ref-Gol2025a"></a>Klein Goldewijk, K. (2025). HYDE data for the Global Carbon Budget (2025). Utrecht University. Dataset, HYDE 3.5. [doi:10.24416/UU01-F45D44](https://doi.org/10.24416/UU01-F45D44)

<a id="ref-RRS2016a"></a>Reba, M., Reitsma, F. and Seto, K. C. (2016). Spatializing 6,000 years of global urbanization from 3700 BC to AD 2000. *Scientific Data* 3, 160034. [doi:10.1038/sdata.2016.34](https://doi.org/10.1038/sdata.2016.34)

## See Also
- [Factsheet](factsheet.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [European Cities](european-cities.md) · [World Cities](world-cities.md) · [HYDE 3.5](hyde.md)
