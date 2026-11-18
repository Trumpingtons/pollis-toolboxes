# Transport Network Files — Factsheet

**GTFS**, the General Transit Feed Specification, publishes a public transport timetable as a set of comma-separated text files, usually in one .zip ([MobilityData (2026)](#ref-Mob2026a)). **OpenStreetMap PBF** files hold OpenStreetMap data in a compact binary format ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026a)). The Transport Network Files panel of the Smart Regions Toolbox reads GTFS feeds with ZipArchives.jl and DuckDB's CSV reader, and OpenStreetMap PBF files with `ST_ReadOSM` of DuckDB's spatial extension ([Zimmerberg (2026)](#ref-Zim2026a); [Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

| Item | Transport Network Files panel |
|---|---|
| **Purpose** | Read, check, measure and convert transit timetables and street networks from Julia |
| **Input** | A GTFS feed, as a .zip or a folder of .txt files; an .osm.pbf extract |
| **Core packages** | [ZipArchives.jl](https://github.com/JuliaIO/ZipArchives.jl), [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), with DuckDB's spatial extension |
| **Tabs** | GTFS; OpenStreetMap PBF |
| **Output** | GTFS: one DuckDB table per file, with `stop_points`, `times`, `service_dates` and `day_trips`; OpenStreetMap: the table `network_m`, one line per way |
| **Key choices** | The service date of a feed; the tag key whose ways form a network |

## How Does the Transport Network Files Panel Read a GTFS Feed?

The GTFS tab of the Transport Network Files panel unpacks the .zip of a feed with ZipArchives.jl, or reads a folder of its files, and loads each file into a DuckDB table of text columns with `read_csv` ([Zimmerberg (2026)](#ref-Zim2026a); [Raasveldt and Mühleisen (2026)](#ref-RM2026a)). Times become seconds since the start of the service day, so times past 24:00:00 are kept, as GTFS allows ([MobilityData (2026)](#ref-Mob2026a)). Stops become points, and calendar.txt and calendar_dates.txt are expanded into the dates of each service. The Service Date input picks the day analysed, or the busiest date of the feed.

## How Does the Transport Network Files Panel Read an OpenStreetMap PBF File?

The OpenStreetMap PBF tab of the Transport Network Files panel reads the file with `ST_ReadOSM`, which returns its nodes, ways and relations with their tags ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). A first pass keeps the ways with the tag key the Network Key input names, highway by default; a second keeps the nodes those ways use. SQL then joins each way's node references to the nodes' coordinates, in order, and makes a line of each way, with its length in metres on the WGS 84 ellipsoid. The values of the key become the classes of the network, such as residential or primary for highway.

## What the Next Steps of the GTFS Tab Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Show on a Map, Departures by Hour | Stops and route lines on a base map; departures in each hour of the service day |
| Diagnose | Feed Contents, Feed Check | Files, rows and agencies; required files, broken references, times |
| Compare | Routes Side by Side | Trips, stops, span, headway and trip time of each route |
| Interpret | Service at Stops, Service Calendar | The busiest stops; trips by weekday and dates without service |
| Export | Save Stops as GeoPackage, Save Feed as DuckDB Database | Stops for any GIS; the whole feed for SQL |

## What the Next Steps of the OpenStreetMap PBF Tab Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Show on a Map, Kilometres by Class | The network coloured by class; its length per class |
| Diagnose | File Contents, Tag Check | Nodes, ways and relations; how often each tag is filled in |
| Compare | Classes Side by Side | Ways, length, names, speed limits and one-way streets of each class |
| Interpret | Network Measures, Names of the Network | Length, intersections, dead ends, density; the longest named streets |
| Export | Save Network as GeoPackage, Save Network as DuckDB Database | Lines for any GIS; ways with all tags for SQL |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-Mob2026a"></a>MobilityData (2026). GTFS Schedule Reference. Revised April 27, 2026. [gtfs.org/documentation/schedule/reference](https://gtfs.org/documentation/schedule/reference/)

<a id="ref-OSMWC2026a"></a>OpenStreetMap Wiki contributors (2026). PBF Format. [wiki.openstreetmap.org/wiki/PBF_Format](https://wiki.openstreetmap.org/wiki/PBF_Format)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

<a id="ref-Zim2026a"></a>Zimmerberg, N. (2026). ZipArchives.jl: read and write Zip archive files in Julia. [github.com/JuliaIO/ZipArchives.jl](https://github.com/JuliaIO/ZipArchives.jl)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [GTFS](gtfs.md) · [OpenStreetMap PBF](osm-pbf.md) · [Service Frequency](service-frequency.md) · [Street Networks](street-networks.md)
