# Historical Populations — World Cities

World Cities is the tab of the Historical Populations panel that reads Historical Urban Population: 3700 BC - AD 2000, by Meredith Reba, Femke Reitsma and Karen C. Seto, distributed by NASA's Socioeconomic Data and Applications Center (SEDAC) through Earthdata ([Reba, Reitsma and Seto (2018)](#ref-RRS2018a)).

## What Does Historical Urban Population: 3700 BC - AD 2000 Contain?

Historical Urban Population: 3700 BC - AD 2000 is a spatially explicit global dataset of the location and size of urban populations over 6,000 years. Reba, Reitsma and Seto made it by digitising, transcribing and geocoding the historical, archaeological and census-based urban population data that Chandler and Modelski had published in tabular form, then cleaning and harmonising them to make them internally consistent ([Reba, Reitsma and Seto (2016)](#ref-RRS2016a)). Each record has a city's name, latitude, longitude, year and population, and a reliability ranking of its location. The dataset has gaps in space and time, as its sources do ([Reba, Reitsma and Seto (2018)](#ref-RRS2018a)).

## What Do Certainty 1, 2 and 3 Mean in World Cities?

Reba, Reitsma and Seto ranked the reliability of each geocoded location, to assess the geographic uncertainty of each record ([Reba, Reitsma and Seto (2016)](#ref-RRS2016a)). The World Cities tab of the Historical Populations panel keeps that ranking as the `note` of the table `cities`, written certainty 1, certainty 2 or certainty 3: 1 where the location of the city is sure, 2 and 3 where it is less so. The certainty is about the coordinates, not about the population. Kinds of Estimate counts the values of each certainty in the Box.

## How Does the World Cities Tab Read the Values?

The World Cities tab of the Historical Populations panel downloads the spreadsheet of Historical Urban Population once into the Folder, with the Earthdata login set on the Powered by line, and reads it with DuckDB's excel extension through the function `reba_cities` of HistoricalGeography.jl. Each city keeps the identifier the dataset gives it. Where the dataset gives one city two values for the same year, the table `cities` keeps the larger, and a value of 0 or a missing value has no row. Once the spreadsheet is in the Folder, the tab reads it without logging in again.

## Why Does World Cities Have Values in So Many Different Years?

The values of Historical Urban Population: 3700 BC - AD 2000 are in the years of the tables that Reba, Reitsma and Seto transcribed, which give each city's population in the years for which an estimate exists ([Reba, Reitsma and Seto (2016)](#ref-RRS2016a)). The World Cities tab therefore has values in many different years, each city in its own. Years Shown sets how long a value stays on the map of the Historical Populations panel, and Largest Cities of the Year gives, beside each city, the year of the value it uses.

## References

<a id="ref-RRS2016a"></a>Reba, M., Reitsma, F. and Seto, K. C. (2016). Spatializing 6,000 years of global urbanization from 3700 BC to AD 2000. *Scientific Data* 3, 160034. [doi:10.1038/sdata.2016.34](https://doi.org/10.1038/sdata.2016.34)

<a id="ref-RRS2018a"></a>Reba, M., Reitsma, F. and Seto, K. C. (2018). Historical Urban Population: 3700 BC - AD 2000. NASA Socioeconomic Data and Applications Center (SEDAC). [doi:10.7927/H4ZG6QBX](https://doi.org/10.7927/H4ZG6QBX)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [European Cities](european-cities.md) · [HYDE 3.5](hyde.md) · [Authentication](authentication.md)
