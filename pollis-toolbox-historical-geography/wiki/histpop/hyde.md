# Historical Populations — HYDE 3.5

HYDE 3.5 is the tab of the Historical Populations panel that reads the population of the History Database of the Global Environment (HYDE), version 3.5, by Kees Klein Goldewijk, published by Utrecht University under CC BY 4.0 ([Klein Goldewijk (2025)](#ref-Gol2025a)).

## What Is HYDE 3.5?

HYDE, the History Database of the Global Environment, is an internally consistent combination of historical population estimates and land use, covering 10,000 BCE to 2025 on a grid of 5 arc-minutes, about 85 km² at the equator ([Klein Goldewijk (2025)](#ref-Gol2025a)). Population is given as maps of total, urban and rural population, population density and built-up area, beside maps of cropland and grazing land. Version 3.5 updates the population estimates and land use of version 3.4, extends the database to 2025, and adds NetCDF as a format. The HYDE 3.5 tab of the Historical Populations panel reads the total population, the people of each cell, from the file `population.nc`, with ArchGDAL.jl ([Ng (2026)](#ref-Ng2026a)).

## How Does HYDE Place People on the Grid?

HYDE combines historical population estimates with allocation algorithms and time-dependent weighting maps ([Klein Goldewijk, Beusen, Doelman and Stehfest (2017)](#ref-GBDS2017a)). The estimates for countries and regions are spread over the cells of the grid with maps that weight where people lived in each period, so a cell's population is an allocation of a larger estimate rather than a count for that cell. Klein Goldewijk, Beusen, Doelman and Stehfest estimate that the population of the world grew from 4.4 million in 10,000 BCE, within a range up to 8.9 million, to 7.257 billion in 2015, and its density from 0.03 to almost 56 people per km² ([Klein Goldewijk, Beusen, Doelman and Stehfest (2017)](#ref-GBDS2017a)).

## Which Years Does HYDE 3.5 Have?

The file `population.nc` of HYDE 3.5 holds 128 grids: one every 1,000 years from 10,000 BCE to the year 0, one every 100 years from 0 to 1700, one every 10 years from 1700 to 1950, and one every year from 1950 to 2025. The HYDE 3.5 tab of the Historical Populations panel reads the grids between From and Until, and each grid stands on the map for its year until the year before the next grid. Two Years and Densest Cells of the Year use the grid nearest the year asked for.

## How Do I Get population.nc of HYDE 3.5?

Utrecht University's server answers only web browsers, so the HYDE 3.5 tab cannot download `population.nc` itself. When the file is not in the Folder, the tab stops and prints the link of the file; opening the link in a web browser downloads it, 640 MB. The file then goes into the Folder of the Historical Populations panel, under its own name, and the Example Code reads it from there. The whole HYDE 3.5 collection, with land use and other formats, is far larger, so the link is to the one file the tab needs ([Klein Goldewijk (2025)](#ref-Gol2025a)).

## How Does the HYDE 3.5 Tab Add Up Cells?

The HYDE 3.5 tab of the Historical Populations panel reads, for each grid, the cells of 5 arc-minutes within the Box, and adds them up into squares whose side is the Cell input, in degrees, rounded to a whole number of HYDE's cells. Each square of the table `grid` has its centre, its people and its area on a sphere of the Earth's mean radius, sea and land together. A square without people in a year has no row for that year. People per km² are the people of a square divided by its whole area.

## References

<a id="ref-GBDS2017a"></a>Klein Goldewijk, K., Beusen, A., Doelman, J. and Stehfest, E. (2017). Anthropogenic land use estimates for the Holocene – HYDE 3.2. *Earth System Science Data* 9, 927-953. [doi:10.5194/essd-9-927-2017](https://doi.org/10.5194/essd-9-927-2017)

<a id="ref-Gol2025a"></a>Klein Goldewijk, K. (2025). HYDE data for the Global Carbon Budget (2025). Utrecht University. Dataset, HYDE 3.5. [doi:10.24416/UU01-F45D44](https://doi.org/10.24416/UU01-F45D44)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [European Cities](european-cities.md) · [World Cities](world-cities.md)
