# Diagnostics

## Required Files of a GTFS Feed

Feed Check in the GTFS tab of the Transport Network Files panel first lists the required files a feed lacks: agency.txt, routes.txt, trips.txt, stop_times.txt and stops.txt, and calendar.txt or calendar_dates.txt, at least one of which must give the dates of service ([MobilityData (2026)](#ref-Mob2026a)). stops.txt may be missing only when every stop is a demand-responsive zone in locations.geojson, which the GTFS tab does not read. A feed without its calendar files has no service dates, so the service day cannot be chosen; Feed Contents lists every file with its rows and columns.

## Broken References in a GTFS Feed

The files of a GTFS feed refer to one another by identifiers: stop times name a trip and a stop, trips name a route and a service ([MobilityData (2026)](#ref-Mob2026a)). Feed Check counts the stop times at stops missing from stops.txt and of trips missing from trips.txt, the trips without stop times, the trips of routes missing from routes.txt, the routes without trips, and the stops without valid coordinates. Each count should be zero; a stop time at an unknown stop has no place on the map, and a trip without stop times has no departures.

## Times in a GTFS Feed

Along a trip, each arrival should come no later than the departure at the same stop, and no earlier than the departure at the stop before. Feed Check counts the stop times that break either rule, and the stop times without times, which are allowed except at the first and last stop of a trip and at stops whose timepoint is 1, where times are exact ([MobilityData (2026)](#ref-Mob2026a)). It also counts the times past 24:00:00, which belong to trips that run after midnight of the service day. Last, Feed Check says whether the feed has frequencies.txt, whose trips run more often than stop_times.txt lists.

## Tags of an OpenStreetMap Network

Tag Check in the OpenStreetMap PBF tab lists the 20 most frequent tag keys of the ways of the network, besides the Network Key, with the share of ways that have each. OpenStreetMap is edited collaboratively by its contributors ([Haklay and Weber (2008)](#ref-HW2008a)), and tags such as name, maxspeed, lanes, surface or oneway are on some ways and not on others. A tag on only a small share of ways describes those ways, not the network. Classes Side by Side gives the share of each class that is named, has a speed limit and is one-way.

## Ways Cut at the Edge of an Extract

An extract of OpenStreetMap may keep ways that run beyond its boundary, with references to nodes the file does not contain. File Contents in the OpenStreetMap PBF tab counts the node references of the network and how many of them are in the file; Tag Check counts the ways cut at the edge, drawn through the nodes found, and the ways left out because fewer than two of their nodes are in the file. Completeness varies by country and by density, so a network may also lack ways that were never mapped ([Barrington-Leigh and Millard-Ball (2017)](#ref-BM2017a)).

## References

<a id="ref-BM2017a"></a>Barrington-Leigh, C. and Millard-Ball, A. (2017). The world's user-generated road map is more than 80% complete. *PLOS ONE*, 12(8), e0180698. [doi:10.1371/journal.pone.0180698](https://doi.org/10.1371/journal.pone.0180698)

<a id="ref-HW2008a"></a>Haklay, M. and Weber, P. (2008). OpenStreetMap: user-generated street maps. *IEEE Pervasive Computing*, 7(4), 12–18. [doi:10.1109/MPRV.2008.80](https://doi.org/10.1109/MPRV.2008.80)

<a id="ref-Mob2026a"></a>MobilityData (2026). GTFS Schedule Reference. Revised April 27, 2026. [gtfs.org/documentation/schedule/reference](https://gtfs.org/documentation/schedule/reference/)

## See Also
- [GTFS](gtfs.md) · [OpenStreetMap PBF](osm-pbf.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
