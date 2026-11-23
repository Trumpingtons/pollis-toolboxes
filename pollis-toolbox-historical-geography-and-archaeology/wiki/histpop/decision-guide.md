# Historical Populations — Decision Guide

The Historical Populations panel has three tabs, each a different source. This page helps choose the tab and the inputs for a question.

## Which Tab of Historical Populations for Which Question?

| Question | Tab | Why |
|---|---|---|
| How did the towns and cities of Europe grow, small ones included? | European Cities | Estimates for 2,262 European settlements at 19 years from 700 to 2000 |
| Which were the largest cities of the world in a period? | World Cities | The cities of Chandler and Modelski, from 3700 BC to AD 2000, on every continent |
| How many people lived in an area, in towns and countryside? | HYDE 3.5 | The whole population on a grid, from 10,000 BCE to 2025 |
| Where were people most densely settled? | HYDE 3.5 | People per km² for every cell |
| How sure is a city's figure? | European Cities and World Cities | Two Sources sets the two estimates side by side |

European Cities covers Europe only ([Buringh (2020)](#ref-Bur2020a)). World Cities covers the world, with the gaps in space and time of its sources ([Reba, Reitsma and Seto (2018)](#ref-RRS2018a)). HYDE 3.5 covers the land of the whole world ([Klein Goldewijk (2025)](#ref-Gol2025a)).

## Cities or the Grid of HYDE 3.5?

The city tabs of the Historical Populations panel give the population of named places, which suits questions about a city, its rank among others, and urban growth. They leave out everyone living outside the cities that the source lists. The HYDE 3.5 tab gives everyone, but by cell rather than by place: a city is part of the people of its cell, together with the countryside around it, and HYDE's cells are allocations of the estimates of countries and regions ([Klein Goldewijk, Beusen, Doelman and Stehfest (2017)](#ref-GBDS2017a)). For the population of a region over time, HYDE 3.5 is the measure; for the history of one town, a city tab, with History of a Place.

## Which Years Shown for European Cities and World Cities?

Years Shown sets how long a value of a city stays on the map of the Historical Populations panel until the city's next value. The default of 100 years matches the century steps of European Cities before 1500, so a city is shown continuously wherever its source has a value every century. A smaller Years Shown shows each value only near its own year, which suits World Cities, whose values fall in many different years. A larger Years Shown bridges longer gaps and also keeps an old value on the map for longer. Largest Cities of the Year, Two Years and Population Over Time use the same Years Shown, and say the year of each value.

## Which Cell for HYDE 3.5?

The Cell input of the Historical Populations panel sets the side of the squares into which the cells of HYDE 3.5, of 5 arc-minutes (1/12 of a degree), are added up. The default of 0.5 degrees keeps a map of a continent quick, as each square holds 36 cells of HYDE. A Cell of 0.0833 keeps HYDE's own cells, which suits a region or a country; for a continent, the table and the map become large. A Cell of 1 or 2 degrees suits the whole world. The people of a square are the same whatever the Cell; the people per km² are those of the whole square.

## Which Box and Smallest City?

The Box of the Historical Populations panel sets the area read and mapped, as west, south, east and north in degrees: Europe by default, and -180, -90, 180, 90 for the whole world. A smaller Box makes the tables smaller and the map quicker, which matters most for HYDE 3.5 with a fine Cell. Smallest City sets the population from which a city appears on the map of European Cities or World Cities; the tables and the Next Steps keep every city. The default of 10,000 keeps the map readable for a continent; a smaller Smallest City adds the towns, and a larger one leaves only the largest cities on the map.

## References

<a id="ref-Bur2020a"></a>Buringh, E. (2020). European urban population, 700 - 2000. DANS Data Station Social Sciences and Humanities. Dataset, version 1.1. [doi:10.17026/dans-xzy-u62q](https://doi.org/10.17026/dans-xzy-u62q)

<a id="ref-GBDS2017a"></a>Klein Goldewijk, K., Beusen, A., Doelman, J. and Stehfest, E. (2017). Anthropogenic land use estimates for the Holocene – HYDE 3.2. *Earth System Science Data* 9, 927-953. [doi:10.5194/essd-9-927-2017](https://doi.org/10.5194/essd-9-927-2017)

<a id="ref-Gol2025a"></a>Klein Goldewijk, K. (2025). HYDE data for the Global Carbon Budget (2025). Utrecht University. Dataset, HYDE 3.5. [doi:10.24416/UU01-F45D44](https://doi.org/10.24416/UU01-F45D44)

<a id="ref-RRS2018a"></a>Reba, M., Reitsma, F. and Seto, K. C. (2018). Historical Urban Population: 3700 BC - AD 2000. NASA Socioeconomic Data and Applications Center (SEDAC). [doi:10.7927/H4ZG6QBX](https://doi.org/10.7927/H4ZG6QBX)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [European Cities](european-cities.md) · [World Cities](world-cities.md) · [HYDE 3.5](hyde.md)
