# OpenSky Network — Factsheet

**OpenSky Network** reads the REST API of the OpenSky Network, a network of receivers that collect the messages aircraft broadcast ([Schäfer, Strohmeier, Lenders, Martinovic and Wilhelm (2014)](#ref-SSLMW2014a)): the aircraft over an area now, the flights that arrived at and departed from an airport on a day, and the track of one aircraft ([The OpenSky Network (2026)](#ref-OSN2026a)). The panel of the Smart Regions Toolbox reads every answer with DuckDB.jl and draws its maps with DuckDB's spatial extension ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

| Item | OpenSky Network panel |
|---|---|
| **Purpose** | The aircraft in the air over an area, the traffic of an airport, and the path of a flight |
| **Input** | An Example Area (London, Paris, Frankfurt, New York, Singapore, United States, Canada, India, Brazil, Australia) or a Custom Box; an Airport and a Day; an Aircraft and a Time |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), with DuckDB's spatial extension; [ECharts.jl](https://github.com/randyzwitch/ECharts.jl) for the charts |
| **Tabs** | Live Aircraft; Flights by Airport; Aircraft Track |
| **Account** | An OpenSky API client for Flights by Airport and past tracks; none for Live Aircraft and live tracks |
| **Output** | `aircraft` for Live Aircraft; `flights` and `airports` for Flights by Airport; `track` for Aircraft Track |

## Requests Each Tab of OpenSky Network Makes

| Tab | Request of the OpenSky API | Account | Kept in the Folder |
|---|---|---|---|
| Live Aircraft | `states/all` over the box of the Example Area | Not needed | No, the states change every few seconds |
| Flights by Airport | `flights/arrival` and `flights/departure` of the Airport over the Day | An API client | Yes, one file for each day and direction |
| Aircraft Track | `tracks/all` for the Aircraft at the Time, after `states/all` when Aircraft is nearest | An API client for a past flight | No |

## What the Next Steps of OpenSky Network Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Aircraft on a Map, Altitudes and Speeds, Flights by Hour, Routes on a Map, Track on a Map, Altitude Profile | The aircraft by altitude; altitude against speed; arrivals and departures by hour; the airports linked; the path of a flight; its altitude over time |
| Diagnose | Position Sources, Airport Estimates, Gaps in the Track | How positions were obtained and how old they are; how sure the airports at the other end are; where the receivers lost the aircraft |
| Compare | Snapshots over Time, A Week Before, Flown and Direct | Five snapshots a minute apart; the same day a week earlier; the distance along the track against the direct one |
| Interpret | Countries of Registration, Callsign Prefixes, Aircraft Categories, Busiest Routes, Phases of Flight | Countries inferred from the addresses; airline designators; emitter categories; the airports with most flights; time climbing, level and descending |
| Export | Save as GeoParquet, Save as CSV | The table of the tab |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: Geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: The DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-SSLMW2014a"></a>Schäfer, M., Strohmeier, M., Lenders, V., Martinovic, I. and Wilhelm, M. (2014). Bringing up OpenSky: a large-scale ADS-B sensor network for research. In *IPSN-14 Proceedings of the 13th International Symposium on Information Processing in Sensor Networks* (pp. 83–94). [doi:10.1109/IPSN.2014.6846743](https://doi.org/10.1109/IPSN.2014.6846743)

## See Also
- [Overview](overview.md) · [State Vectors](state-vectors.md) · [Flights by Airport](flights-by-airport.md) · [Aircraft Tracks](aircraft-tracks.md) · [Credits and Limits](credits-limits.md) · [Authentication](authentication.md) · [Decision Guide](decision-guide.md)
