# GTFS

## The Files of a GTFS Feed

A GTFS dataset is a set of files: agency.txt, routes.txt, trips.txt and stop_times.txt are required; stops.txt is required unless all stops are demand-responsive zones defined in locations.geojson ([MobilityData (2026)](#ref-Mob2026a)). calendar.txt, the weekly schedule of each service between a start and an end date, is required unless every date of service is listed in calendar_dates.txt, which is then required. Optional files add fares, shapes, frequencies, transfers, pathways inside stations, translations and information about the feed. A route is a group of trips shown to riders as one service, and a trip is a sequence of two or more stops at a given time.

## How GTFS Files Are Written

All files of a GTFS dataset are comma-delimited text, with the field names on the first line; file and field names are case-sensitive ([MobilityData (2026)](#ref-Mob2026a)). Values that contain quotation marks or commas are enclosed in quotation marks, and a quotation mark inside such a value is doubled, as spreadsheets write CSV files. Files should be encoded in UTF-8, and a byte-order mark is acceptable. The GTFS tab of the Transport Network Files panel reads each file with DuckDB's `read_csv`, with the comma, the quotation mark and the doubled quotation mark given rather than guessed, and keeps every column as text, so that identifiers such as 0012 keep their leading zeros ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)).

## Times of the Service Day

GTFS writes times as HH:MM:SS, measured from noon minus 12 hours of the service day, which is midnight except on days when daylight saving time changes ([MobilityData (2026)](#ref-Mob2026a)). A time after midnight of the service day is written as more than 24:00:00: 25:35:00 is 1:35 in the morning of the next calendar day. Times are in the time zone of the agency. The GTFS tab turns each time into seconds since the start of the service day with a SQL macro, so a trip that leaves at 23:50:00 and arrives at 24:10:00 stays in order. Arrival and departure times are required at the first and last stop of a trip and at stops with timepoint 1, and optional at the others.

## Service Calendars

calendar.txt gives each service, by its `service_id`, the weekdays it runs between a `start_date` and an `end_date`; calendar_dates.txt lists exceptions, with `exception_type` 1 when service is added on a date and 2 when it is removed ([MobilityData (2026)](#ref-Mob2026a)). A holiday is typically handled by adding the date to a holiday service and removing it from the regular one. The GTFS tab expands calendar.txt into one row per date and service, adds the dates calendar_dates.txt adds and removes those it removes, which gives the table `service_dates`; the trips of the services that run on the Service Date become `day_trips`.

## Stops, Shapes and Route Lines

Each stop of stops.txt has a latitude and a longitude, and shapes.txt, when present, gives the path a vehicle travels along a route as a sequence of points ([MobilityData (2026)](#ref-Mob2026a)). Stops need not lie exactly on the shape, but should lie close to it. Show on a Map in the GTFS tab draws, for each route and direction, the trip with the most stops: along its shape when the trip has one, otherwise as straight segments from stop to stop, which cut the corners of streets. The stops become points in the table `stop_points`.

## References

<a id="ref-Mob2026a"></a>MobilityData (2026). GTFS Schedule Reference. Revised April 27, 2026. [gtfs.org/documentation/schedule/reference](https://gtfs.org/documentation/schedule/reference/)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Service Frequency](service-frequency.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
