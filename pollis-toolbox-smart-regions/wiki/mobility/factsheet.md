# Mobility and Flows — Factsheet

**Mobility and Flows** reads the flows of people and vehicles in a city from open data: the workers or jobs between the zones where people live and where they work, the trips of a month by bike, taxi or bus, the vehicles counted on the roads, and the flights between airports, worldwide, within a large country or from a city. Gravity models of spatial interaction are fitted to the flows ([Wilson (1971)](#ref-Wil1971a); [Flowerdew and Aitkin (1982)](#ref-FA1982a)). The panel of the Smart Regions Toolbox reads every source with DuckDB.jl and DuckDB's spatial extension, and fits the models with GLFixedEffectModels.jl ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b); [Boehm (2020)](#ref-Boe2020a)).

| Item | Mobility and Flows panel |
|---|---|
| **Purpose** | The flows between the zones of a city, the traffic on its roads and the flights between airports, and how flows fall with distance |
| **Input** | An Example City (Cambridge, Oxford, London, Amsterdam, Paris, Frankfurt, New York, Tokyo, Hong Kong, Singapore), Global or a country (United States, Canada, India, Brazil, Australia) on Air Routes, or Custom files |
| **Core packages** | [SmartRegions.jl](https://github.com/Trumpingtons/SmartRegions.jl) (`commuting_flows`, `trip_flows`, `given_flows`, `traffic_counts`, `given_counts`, `air_flights`, `flight_list`), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), [GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl), [GLM.jl](https://github.com/JuliaStats/GLM.jl), [Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl), with DuckDB's spatial extension |
| **Tabs** | Commuting Flows; Trips; Spatial Interaction; Traffic Counts; Air Routes |
| **Account** | An LTA DataMall account key for Singapore only |
| **Output** | `zones` and `flows`; `hours` for trips; `modelled` and `fit` for a model; `counts` for traffic counts; `flights`, `routes` and `traffic` for air traffic |

## Which Cities Each Tab of Mobility and Flows Offers

| Tab | Example Cities |
|---|---|
| Commuting Flows | Cambridge, Oxford, London, Amsterdam, Paris, Frankfurt, New York, Tokyo, Hong Kong, Custom |
| Trips | London (Santander Cycles), New York (yellow taxis), Singapore (buses), Custom |
| Spatial Interaction | Cambridge, Oxford, London, Amsterdam, Paris, Frankfurt, New York, Tokyo, Singapore, Custom |
| Traffic Counts | Cambridge, Oxford, London, Paris, New York, Custom |
| Air Routes | Global, United States, Canada, India, Brazil, Australia, London, Amsterdam, Paris, Frankfurt, New York, Tokyo, Hong Kong, Singapore |

## Files Kept in the Folder of Mobility and Flows

Every file the panel downloads goes to the folder mobility of the Folder, under a name of its own, and a later run reads it from there instead of downloading it again. The largest are the Census 2021 origin-destination archive of England and Wales, the LODES file of New York State, the trip records of a month and the OpenSky flight list of a month. The traffic counts of New York and Paris, which change every day, are named after the day they were downloaded. Save as GeoParquet and Save Flows as CSV write their files to the same folder, named after the table, the Example City and the tab.

## What the Next Steps of Mobility and Flows Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Flows on a Map, Inflows on a Map, Distances Travelled, Distance Decay, Trips by Hour, Count Points on a Map, Counts by Hour, Routes on a Map | The largest flows; the inflow of each zone; the flows by distance band; observed and fitted flows by distance; trips by hour; count points by flow; vehicles by hour; airports and routes |
| Diagnose | Coverage, Fitted Against Observed, Residuals on a Map, Overdispersion, Count Points Check, Flights Without an Airport | Zones without flows and flows outside them; the fit pair by pair; where the model errs; dispersion and zeros; how counts were obtained; flights the source could not place |
| Compare | Four Constraints, Power and Exponential, Countries Compared, Months Compared, Weekdays and Weekends, Counts over the Years | The model with each constraint; with each distance function; the domestic networks of five countries; the same month from 2019 to 2022; the hours of each kind of day; counts by year |
| Interpret | Net Flows, Largest Flows, Distance Parameter, Vehicle Types, Busiest Routes, Air Network | Inflow, outflow and self-containment; the largest pairs; what the distance parameter means; the mix of vehicles; the busiest airports and routes; nonstop links, changes and betweenness of airports |
| Export | Save as GeoParquet, Save Flows as CSV | The tables of the tab |

## References

<a id="ref-Boe2020a"></a>Boehm, J. (2020). GLFixedEffectModels.jl: fast estimation of generalized linear models with high-dimensional fixed effects in Julia. [github.com/jmboehm/GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-FA1982a"></a>Flowerdew, R. and Aitkin, M. (1982). A method of fitting the gravity model based on the Poisson distribution. *Journal of Regional Science*, 22(2), 191–202. [doi:10.1111/j.1467-9787.1982.tb00744.x](https://doi.org/10.1111/j.1467-9787.1982.tb00744.x)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: The DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Wil1971a"></a>Wilson, A. G. (1971). A family of spatial interaction models, and associated developments. *Environment and Planning A*, 3(1), 1–32. [doi:10.1068/a030001](https://doi.org/10.1068/a030001)

## See Also
- [Overview](overview.md) · [Commuting Data](commuting-data.md) · [Trip Data](trips-data.md) · [Spatial Interaction Models](spatial-interaction.md) · [Traffic Counts](traffic-counts.md) · [Air Route Data](air-traffic.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
