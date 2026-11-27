# Historical Populations — Diagnostics

The Historical Populations panel reports what its sources record. The checks below tell a change in a city's or an area's population from a property of the data.

## Why Does a City Leave the Map and Come Back Later?

A city of European Cities or World Cities is shown only in the years its source gives it a value, and each value for Years Shown at most, until the city's next value. Where the source has no value for a city over a longer span, the city leaves the map until its next value. Years with Values lists, by century, how many years of the source have values in the Box and how many cities have one; World Cities has values in many different years, each city in its own, while European Cities has values at 19 fixed years, from every century to every half century. A city also leaves the map when its population falls below Smallest City. Raising Years Shown bridges longer gaps, and History of a Place lists every value of one city.

## Why Does a City Keep the Same Population for Centuries?

A city can have the same value in several consecutive years of its source. An estimate that the sources repeat, a value imputed for years without records, or a population that changed little can each give a run of equal values. Repeated Values lists the runs of one value over 200 years or more in the Box, the largest cities first, with what the source says of the values. In European Cities, values marked imputed are estimates that fill years without a population figure ([Buringh (2020)](#ref-Bur2020a)). A long run of equal values is best read beside a history of the city, and beside the other city tab with Two Sources.

## What Do the Kinds of Estimate of Historical Populations Say?

Kinds of Estimate counts the values of the cities by the `note` that their source gives. In European Cities, a value is imputed, proxied, or not marked: Buringh complemented earlier demographic sources with new estimates from quantitative sources or proxies, and covered missing data with city-specific imputations ([Buringh (2020)](#ref-Bur2020a)). In World Cities, the note is the certainty of the city's place, from 1 to 3, which Reba, Reitsma and Seto ranked to assess the geographic uncertainty of each geocoded location; it says how sure the coordinates are, not the population ([Reba, Reitsma and Seto (2016)](#ref-RRS2016a)). HYDE 3.5 has no such note, as each cell is an allocation of regional estimates ([Klein Goldewijk, Beusen, Doelman and Stehfest (2017)](#ref-GBDS2017a)).

## Why Does Population Over Time Jump for the Cities?

Population Over Time for European Cities and World Cities adds up the cities that have a value no older than Years Shown at each year of the source. The total follows the population of those cities and also the number of cities counted: a year in which the source has values for many more cities raises the total, and a city that leaves the map lowers it. Years with Values shows how many cities have a value in each century. The total of the cities is the urban population that the source records, not the population of the Box, which HYDE 3.5 gives with towns and countryside together.

## Why Do Coastal Cells of HYDE 3.5 Look Sparsely Populated?

The Historical Populations panel adds up the cells of HYDE 3.5, of 5 arc-minutes, into squares of the Cell input, and divides their people by the area of the whole square on a sphere. A square that holds sea, a lake or a mountain range has the area of all of it, so its people per km² are lower than those of the land alone. A finer Cell follows coasts more closely. The people of a square are the sum of HYDE's cells, which allocate the estimates of countries and regions to the grid with maps that weight where people lived ([Klein Goldewijk, Beusen, Doelman and Stehfest (2017)](#ref-GBDS2017a)).

## Why Do European Cities and World Cities Differ for One City?

European Cities and World Cities draw on different collections of estimates, and give values in different years, so one city can have two values for one year, or values in years that the other lacks ([Buringh (2020)](#ref-Bur2020a); [Reba, Reitsma and Seto (2016)](#ref-RRS2016a)). Two Sources finds the city nearest the Place in each tab and sets their values side by side by year, with the distance of each from the Place. A city found far from the Place in one tab is a different city, or a city that the source does not have. Names also differ between the sources, as one may use a local name and the other an English one.

## References

<a id="ref-Bur2020a"></a>Buringh, E. (2020). European urban population, 700 - 2000. DANS Data Station Social Sciences and Humanities. Dataset, version 1.1. [doi:10.17026/dans-xzy-u62q](https://doi.org/10.17026/dans-xzy-u62q)

<a id="ref-GBDS2017a"></a>Klein Goldewijk, K., Beusen, A., Doelman, J. and Stehfest, E. (2017). Anthropogenic land use estimates for the Holocene – HYDE 3.2. *Earth System Science Data* 9, 927-953. [doi:10.5194/essd-9-927-2017](https://doi.org/10.5194/essd-9-927-2017)

<a id="ref-RRS2016a"></a>Reba, M., Reitsma, F. and Seto, K. C. (2016). Spatializing 6,000 years of global urbanization from 3700 BC to AD 2000. *Scientific Data* 3, 160034. [doi:10.1038/sdata.2016.34](https://doi.org/10.1038/sdata.2016.34)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Decision Guide](decision-guide.md) · [European Cities](european-cities.md) · [World Cities](world-cities.md) · [HYDE 3.5](hyde.md)
