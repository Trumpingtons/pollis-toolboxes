# Service Frequency

## Choosing the Service Day

A GTFS feed covers a period, often months, and its services run on different dates: a weekday timetable, a weekend one, holidays ([MobilityData (2026)](#ref-Mob2026a)). Measures of frequency belong to one service day. The Service Date input of the GTFS tab of the Transport Network Files panel names it, as YYYY-MM-DD, or is busiest, the date with the most trips. Service Calendar shows the trips of each weekday on average over the feed's dates, with the lowest and highest, so that a holiday or a date with reduced service stands out, and lists the dates without service.

## Departures and Their Count

The GTFS tab counts a departure for every stop time of a trip that runs on the service day, except at the trip's last stop, where the vehicle arrives but does not depart. Departures by Hour sums them over all stops, hour by hour of the service day, with the hours past midnight numbered 24, 25 and on, as GTFS writes them ([MobilityData (2026)](#ref-Mob2026a)). Wong analysed GTFS feeds at the stop, route and system levels with scripts and database queries, in the way of the Transit Capacity and Quality of Service Manual ([Wong (2013)](#ref-Won2013a)); Departures by Hour, Routes Side by Side and Service at Stops follow the same three levels.

## Headways

The headway is the time between two departures of the same route, in the same direction, from the same stop. Routes Side by Side gives each route's median headway at the first stop of its trips, over the service day, with the first and last departures and the median time from first to last stop. Service at Stops gives, for the 20 busiest stops, the departures of the day, the departures in the stop's busiest hour, and the median headway of the routes that call there. A median headway over the whole day mixes peak and evening service, so the busiest hour shows the best service a stop has.

## Trips Defined by Frequencies

frequencies.txt represents trips that run at regular headways: each row gives a trip, a start and an end time, and the headway in seconds at which the trip runs between them ([MobilityData (2026)](#ref-Mob2026a)). With `exact_times` 0 the service keeps headways rather than a fixed schedule; with `exact_times` 1 it is a compressed form of a fixed schedule. A feed with frequencies.txt runs more trips than stop_times.txt lists, so departures and headways counted from stop_times.txt understate its service. Feed Check reports when a feed has frequencies.txt.

## References

<a id="ref-Mob2026a"></a>MobilityData (2026). GTFS Schedule Reference. Revised April 27, 2026. [gtfs.org/documentation/schedule/reference](https://gtfs.org/documentation/schedule/reference/)

<a id="ref-Won2013a"></a>Wong, J. (2013). Leveraging the General Transit Feed Specification for efficient transit analysis. *Transportation Research Record*, 2338(1), 11–19. [doi:10.3141/2338-02](https://doi.org/10.3141/2338-02)

## See Also
- [GTFS](gtfs.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
