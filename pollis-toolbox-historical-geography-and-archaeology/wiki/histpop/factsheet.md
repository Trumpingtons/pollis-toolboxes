# Historical Populations — Factsheet

**Historical populations** are estimates of how many people lived in a place in the past, from historical, archaeological and census records. The Historical Populations panel of the Historical Geography and Archaeology Toolbox reads three open datasets with DuckDB and draws them on a map with a year slider: the populations of cities, and the population of the world on a grid ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

| Item | Historical Populations panel |
|---|---|
| **Purpose** | See where people lived in the past and how many, city by city or cell by cell, year by year |
| **Tabs** | European Cities; World Cities; HYDE 3.5 |
| **Inputs** | Folder; Box; Smallest City and Years Shown (cities); Cell (HYDE 3.5); From; Until; Year; Other Year; Place |
| **Core packages** | [HistoricalGeography.jl](https://github.com/Trumpingtons/HistoricalGeography.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl) (HYDE 3.5), with DuckDB's spatial and excel extensions |
| **Output** | A map with a year slider, and the table `cities` (one row per city and year) or `grid` (one row per cell and year) |
| **Needs** | An Internet connection for the first download and the base map; a free NASA Earthdata account for World Cities; the file `population.nc`, downloaded in a web browser, for HYDE 3.5 |

## What Do the Inputs of Historical Populations Set?

| Input | What the input sets |
|---|---|
| Folder | Where the downloaded files are kept, where `population.nc` of HYDE 3.5 goes, and where Save as GeoParquet writes |
| Box | The area mapped, as west, south, east and north in degrees |
| Smallest City | The population from which a city is drawn on the map, in European Cities and World Cities |
| Years Shown | The years for which a value of a city is shown at most, until its next value |
| Cell | The side of a square of the HYDE 3.5 map, in degrees |
| From, Until | The first and last year of the slider, within the years of the source; years BCE are negative |
| Year | The year the slider opens on, and the year of the Next Steps |
| Other Year | The year that Two Years sets beside Year |
| Place | The point of History of a Place and Two Sources, as longitude and latitude |

## What Is in the Tables of Historical Populations?

The table `cities` of the European Cities and World Cities tabs has one row for each value of a city: `key` (one per city), `name`, `country`, `lon`, `lat`, `year`, `population` and `note`. The `note` of European Cities says whether a value is imputed or proxied, and that of World Cities gives the certainty of the city's place. A city has rows only in the years its source gives it a value. The table `grid` of the HYDE 3.5 tab has one row for each cell of the Cell input and each year of HYDE 3.5 with people in it: `lon` and `lat` (the centre of the cell), `year`, `population` and `km2`, the area of the whole cell on a sphere ([Klein Goldewijk (2025)](#ref-Gol2025a)).

## Which Functions of HistoricalGeography.jl Does Historical Populations Call?

The Example Code of European Cities and World Cities makes the table `cities` with `city_populations(con, source; folder, box, since, upto)` of HistoricalGeography.jl, where `source` is `:buringh` or `:reba`, and writes the points under the year slider with `cities_geojson(con; least, reach)`. The Example Code of HYDE 3.5 makes the table `grid` with `hyde_population(con; folder, box, since, upto, cell)`, which reads `population.nc` with ArchGDAL.jl, and writes the squares with `grid_geojson(con)`. The Next Steps call `total_population`, `largest_cities`, `city_history` and `cell_history` of the same package. Each function returns, beside its table, the name of the source, the first and last years with values in the Box, and the years of the source.

## What Do the Next Steps of Historical Populations Do?

| Group | Action | What the action shows |
|---|---|---|
| Visualise | Population Over Time | The people of the cities counted, or of the grid, in the Box at each year of the source |
| Diagnose | Years with Values | The years with values by century, and how many cities or cells have one |
| Diagnose | Kinds of Estimate | The values by kind: imputed or proxied, or the certainty of the place |
| Diagnose | Repeated Values | The cities whose value stays the same over 200 years or more |
| Compare | Two Years | The largest cities of Other Year beside Year, or the grid in both years |
| Compare | Two Sources | The city nearest the Place in European Cities and in World Cities, side by side |
| Interpret | History of a Place | The values of the city nearest the Place, or of its cell |
| Interpret | Largest Cities of the Year | The cities of Year, from the largest, with the year of each value |
| Interpret | Densest Cells of the Year | The cells of the grid with the most people per km² |
| Export | Save as GeoParquet | The table `cities` or `grid`, with points or squares, for any GIS or data tool |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Gol2025a"></a>Klein Goldewijk, K. (2025). HYDE data for the Global Carbon Budget (2025). Utrecht University. Dataset, HYDE 3.5. [doi:10.24416/UU01-F45D44](https://doi.org/10.24416/UU01-F45D44)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [European Cities](european-cities.md) · [World Cities](world-cities.md) · [HYDE 3.5](hyde.md) · [Authentication](authentication.md)
