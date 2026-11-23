# Historical Borders — Factsheet

**Historical borders** are the limits of the territory that states and other polities held in the past. The Historical Borders panel of the Historical Geography and Archaeology Toolbox reads them from three open datasets with DuckDB's spatial extension and draws them on a map with a year slider ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

| Item | Historical Borders panel |
|---|---|
| **Purpose** | See how the states of an area change over the centuries, and which states held a place |
| **Tabs** | Cliopatria; Historical Basemaps; CShapes 2.0 |
| **Inputs** | Folder; Box; Units (Cliopatria); From; Until; Year; Other Year; Place |
| **Core packages** | [HistoricalGeography.jl](https://github.com/Trumpingtons/HistoricalGeography.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), with DuckDB's spatial extension |
| **Output** | A map with a year slider, and the table `borders`: one row per shape, with `name`, `starts`, `ends`, `km2` and `geom` |
| **Needs** | An Internet connection for the first download and for the base map; no account or key |

## What Do the Inputs of Historical Borders Set?

| Input | What the input sets |
|---|---|
| Folder | Where the downloaded files are kept, and where Save as GeoParquet writes |
| Box | The area mapped, as west, south, east and north in degrees |
| Units | For Cliopatria, Realms or Their Parts |
| From, Until | The first and last year of the slider, within the years of the source; years BCE are negative |
| Year | The year the slider opens on, and the year of the Next Steps |
| Other Year | The year that Two Years sets beside Year |
| Place | The point of History of a Place, as longitude and latitude |

## What Is in the Table of Borders?

The table `borders` of the Historical Borders panel has one row for each shape of a state in the Box. The columns `starts` and `ends` are the first and last year in which the shape is shown, both included, cut to From and Until. The column `km2` is the area of the shape inside the Box, in square kilometres on the WGS 84 ellipsoid, so a state that reaches beyond the Box has only part of its area there. The geometry `geom` keeps the detail of the source. Only the copy drawn under the year slider is simplified, to keep the map quick ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## Which Functions of HistoricalGeography.jl Does Historical Borders Call?

The Example Code of Historical Borders makes the table `borders` with `historical_borders(con, source; folder, box, since, upto, units)` of HistoricalGeography.jl, where `source` is `:cliopatria`, `:basemaps` or `:cshapes`. The function downloads the files of the source once into the Folder, keeps the shapes that lie in the Box between From and Until, cuts them to the Box and adds their area, and returns the name of the source, the first and last years with borders in the Box, and the years in which a border changes there. `borders_geojson(con)` then writes every shape with its years, simplified for drawing, as the GeoJSON file under the year slider. The SQL that reads each source on its own comes from `cliopatria(; folder, units)`, `historical_basemaps(; folder, since, upto)` and `cshapes(; folder)`, and `basemap_years()` lists the years of the maps of historical-basemaps.

## What Do the Next Steps of Historical Borders Do?

| Group | Action | What the action shows |
|---|---|---|
| Visualise | Map of the Year | The states of Year on a base map, with the Place marked |
| Visualise | States Over Time | The number of states in the Box in each year |
| Diagnose | Years of Change | The years in which the source changes a border, by century |
| Diagnose | Overlapping States | The pairs of states that share land in Year |
| Compare | Two Years | The area of each state in the Box in Year and in Other Year |
| Interpret | History of a Place | The states that held the Place, in order, with their years |
| Interpret | States of the Year | The states of Year, by area |
| Export | Save as GeoParquet | The table `borders`, for any GIS or data tool |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Cliopatria](cliopatria.md) · [Historical Basemaps](historical-basemaps.md) · [CShapes 2.0](cshapes.md)
