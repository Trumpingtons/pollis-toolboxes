# Flights by Airport

## How the OpenSky Network Derives Flights

The OpenSky Network computes flights from the state vectors it received, in the same processing step as the tracks, by a batch process at night, so the flights of a day are available from the next day ([The OpenSky Network (2026)](#ref-OSN2026a)). A flight has the address of the aircraft, its callsign, the times it was first and last seen, and the airports of departure and arrival as estimated from its first and last positions. The flight list the network published for research was derived the same way ([Strohmeier, Olive, Lübbe, Schäfer and Lenders (2021)](#ref-SOLSL2021a)). A flight the receivers saw only in part has a later first time or an earlier last time than the real departure and arrival.

## Estimated Airports of Departure and Arrival

Each flight of the OpenSky API carries the ICAO code of its estimated airports of departure and arrival, empty when no airport could be identified ([The OpenSky Network (2026)](#ref-OSN2026a)). It also carries the horizontal and vertical distance between the airport and the first or last airborne position received, and the number of other candidate airports close to the one chosen. Flights by Airport keeps the airport at the other end of each flight as `other`. Airport Estimates gives, for the arrivals and the departures, the share of flights with no airport at the other end, the median distance of their last or first position to the airport, and the share with other candidates, where neighbouring airfields could have been the real one.

## Days and Intervals of Flights by Airport

The OpenSky API returns the arrivals or departures of an airport over an interval of at most two days, in Unix time ([The OpenSky Network (2026)](#ref-OSN2026a)). Flights by Airport asks for the Day in UTC, from midnight to the last second, once for the arrivals and once for the departures, and keeps each answer in the folder opensky, so a later run of the same day reads the files instead of asking again. With Day set to yesterday, the panel asks for the latest day the batch of the night has produced. A day with no flights comes back empty, and the panel shows no arrivals or departures. A Week Before asks for the same day of the week seven days earlier.

## Callsigns and Callsign Prefixes

The callsign of a flight is the one the aircraft broadcast, eight characters at most; when it broadcast several during the flight, the OpenSky API gives the one seen most often ([The OpenSky Network (2026)](#ref-OSN2026a)). Callsign Prefixes, on Flights by Airport and on Live Aircraft, groups the callsigns written as three letters followed by a digit, the form airline callsigns take, by their three letters, and gives the share of callsigns written otherwise and of flights with none. The panel does not name the airlines: it shows the three letters, which can be looked up in a list of airline designators.

## Airports of the Other End in OurAirports

Flights by Airport looks up the Airport and the airports at the other end in the airports file of OurAirports, for their names, countries and positions ([OurAirports (2026)](#ref-Our2026a)). The file is downloaded once into the folder opensky. Routes on a Map draws a straight line from the Airport to each airport linked by a flight that day, not the path flown; Busiest Routes lists them with their arrivals, departures and distance on the ellipsoid, and the share of flights within the Airport's country. An airport code that OurAirports does not list leaves its flights out of these two Next Steps, though they stay in the table `flights`.

## References

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

<a id="ref-Our2026a"></a>OurAirports (2026). OurAirports open data. [ourairports.com/data](https://ourairports.com/data/)

<a id="ref-SOLSL2021a"></a>Strohmeier, M., Olive, X., Lübbe, J., Schäfer, M. and Lenders, V. (2021). Crowdsourced air traffic data from the OpenSky Network 2019–2020. *Earth System Science Data*, 13(2), 357–366. [doi:10.5194/essd-13-357-2021](https://doi.org/10.5194/essd-13-357-2021)

## See Also
- [Overview](overview.md) · [Credits and Limits](credits-limits.md) · [Authentication](authentication.md) · [Aircraft Tracks](aircraft-tracks.md) · [Factsheet](factsheet.md)
