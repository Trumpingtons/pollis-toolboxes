# Air Traffic — Decision Guide

| Tab | Data | Question it answers |
|---|---|---|
| Live Aircraft | State vectors now | Which aircraft are over an area, how high and how fast, and where they are registered |
| Flights by Airport | Flights of a day | When an airport is busy, which airports it is linked to, and which airlines fly there |
| Aircraft Track | Waypoints of one flight | Where a flight went, how its altitude changed, and how far it flew |

## Which Tab of Air Traffic to Use

Live Aircraft answers what is in the air now: the number of aircraft over a city or a country, their altitudes and speeds, how they report their positions, their countries of registration and their categories. Flights by Airport answers what an airport handled on a recent day: its arrivals and departures by hour, the airports at the other end and the callsigns of the airlines. Aircraft Track answers what one aircraft did: the path of its flight, its altitude profile, the gaps in what the receivers saw, and the time it spent climbing, level and descending ([The OpenSky Network (2026)](#ref-OSN2026a)).

## Which Example Area of Live Aircraft to Choose

A city's Example Area shows the aircraft arriving at and leaving its airports, many of them low and slow, and costs the fewest credits. A country's Example Area shows its whole airspace and the aircraft passing over it, many at cruising altitude, in a box that also takes in its neighbours, and costs the most. The Custom Box takes any other area. Where the OpenSky Network has few receivers, the aircraft over an area are fewer than those in the air, so a small count may come from the coverage rather than the traffic ([Strohmeier, Olive, Lübbe, Schäfer and Lenders (2021)](#ref-SOLSL2021a)).

## When an OpenSky API Client Is Needed

An API client of the OpenSky Network is needed for Flights by Airport, and for Aircraft Track with a past Time. Live Aircraft and live tracks work without one, as an anonymous user, with 400 credits a day in each of the buckets of state vectors and tracks; with an API client they draw on the 4,000 credits of a standard user ([The OpenSky Network (2026)](#ref-OSN2026a)). A user who looks at a country's airspace often, or uses Snapshots over Time, reaches the anonymous allowance quickly. Authentication describes how to create the client and set it on the Powered by line.

## References

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

<a id="ref-SOLSL2021a"></a>Strohmeier, M., Olive, X., Lübbe, J., Schäfer, M. and Lenders, V. (2021). Crowdsourced air traffic data from the OpenSky Network 2019–2020. *Earth System Science Data*, 13(2), 357–366. [doi:10.5194/essd-13-357-2021](https://doi.org/10.5194/essd-13-357-2021)

## See Also
- [Overview](overview.md) · [State Vectors](state-vectors.md) · [Credits and Limits](credits-limits.md) · [Authentication](authentication.md) · [Factsheet](factsheet.md)
