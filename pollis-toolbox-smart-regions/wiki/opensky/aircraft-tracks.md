# Aircraft Tracks

## Waypoints of an Aircraft Track

A track of the OpenSky API is the path of one flight as waypoints, each with its time, position, barometric altitude, true track and whether the aircraft was on the ground ([The OpenSky Network (2026)](#ref-OSN2026a)). The waypoints are a selection of the positions received: the first just after the departure, or when the aircraft entered the reach of the receivers; the last just before the arrival, or when it left their reach; one at least every 15 minutes in flight; and one whenever the track changes by more than 2.5 degrees, the altitude by more than 100 metres, or the aircraft lands or takes off. Aircraft Track keeps them in the table `track`.

## Live Tracks and Past Tracks

The OpenSky API returns the track of an aircraft at a given time, the flight it was on then; with the time 0 it returns the live track, if the aircraft is in flight ([The OpenSky Network (2026)](#ref-OSN2026a)). Tracks more than 30 days old are not available, and the API documentation calls the endpoint experimental. With Time set to live, Aircraft Track asks for the live track, which an anonymous user can do. With a time in UTC, written as 2026-11-19 14:30, it asks for the flight of that moment, which the panel sends with the OpenSky API client. When the aircraft has no track at the time, the panel stops with a message.

## Choosing the Aircraft of a Track

The Aircraft of Aircraft Track is the ICAO 24-bit address of a transponder, six hexadecimal characters ([The OpenSky Network (2026)](#ref-OSN2026a)), which Live Aircraft lists for every aircraft in the column `icao24`, and Flights by Airport for every flight. With Aircraft set to nearest, the panel first asks for the state vectors over the Example Area and takes the airborne aircraft nearest the centre of its box, trying the next nearest, up to five, when one has no track. Nearest works only with a live track, since it picks an aircraft in the air now.

## Distances along a Track and Flown and Direct

Aircraft Track adds the distances on the ellipsoid between successive waypoints, the distance along the track. Since the waypoints are a selection of positions, joined by straight segments, the distance along them can be a little shorter than the path flown, and since the track begins and ends where the receivers first and last saw the aircraft, it can miss the start or the end of the flight ([The OpenSky Network (2026)](#ref-OSN2026a)). Flown and Direct compares the distance along the waypoints with the distance between the first and last positions, and gives the time between them and the mean speed. Gaps in the Track lists the longest intervals between waypoints; one longer than 15 minutes means the receivers lost the aircraft for a while.

## Phases of Flight from the Waypoints

Phases of Flight splits the time between successive waypoints into climbing, descending and level, by whether the altitude rose or fell by more than 100 metres from one waypoint to the next, and counts the time from waypoints on the ground apart. The threshold follows the rule by which the OpenSky Network adds a waypoint when the altitude changes by more than 100 metres ([The OpenSky Network (2026)](#ref-OSN2026a)). Because the time between waypoints is long when the aircraft flies straight and level, and short when it turns or changes altitude, the minutes of each phase sum the intervals rather than count the waypoints.

## References

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

## See Also
- [State Vectors](state-vectors.md) · [Flights by Airport](flights-by-airport.md) · [Credits and Limits](credits-limits.md) · [Overview](overview.md) · [Factsheet](factsheet.md)
