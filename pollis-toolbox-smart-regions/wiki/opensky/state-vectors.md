# State Vectors

## The Fields of a State Vector

A state vector of the OpenSky API describes one aircraft at the moment of the answer ([The OpenSky Network (2026)](#ref-OSN2026a)). Live Aircraft keeps its fields in the table `aircraft`: `icao24`, the address of the transponder; `callsign`; `country`; `positioned`, the time of the last position, empty if none came in the last 15 seconds; `last_contact`, the time of the last message of any kind; `lon` and `lat`; `altitude`, the barometric altitude, and `geo_altitude`, the geometric one; `on_ground`, whether the position came from a surface report; `velocity` over the ground; `heading`, the true track; `vertical_rate`, positive when climbing; `squawk`, the transponder code; `source`, the source of the position; and `category`. Each may be empty when the receivers did not get it, and `seen` is the time of the answer.

## Position Sources in Live Aircraft

The OpenSky API says how the position of each state vector was obtained: ADS-B, ASTERIX, MLAT or FLARM, coded 0 to 3 ([The OpenSky Network (2026)](#ref-OSN2026a)). An ADS-B position is the one the aircraft broadcasts itself, which the receivers of the OpenSky Network were built to collect ([Schäfer, Strohmeier, Lenders, Martinovic and Wilhelm (2014)](#ref-SSLMW2014a)). Position Sources counts the aircraft by source, and gives the number without a position report in the last 15 seconds, the median age of the positions and the oldest last contact at the time of the answer. An aircraft whose last contact is old may have left the reach of the receivers.

## Aircraft Categories in the OpenSky API

With the request parameter `extended`, which Live Aircraft sets, a state vector carries the emitter category of the aircraft: light, small, large, high vortex large, heavy, high performance, rotorcraft, glider, lighter than air, parachutist, ultralight, unmanned aerial vehicle and space vehicle, as well as surface vehicles and obstacles ([The OpenSky Network (2026)](#ref-OSN2026a)). The category is what the transponder broadcasts. Category 0 means no information at all, and 1 that the aircraft broadcasts no ADS-B emitter category. Aircraft Categories counts the aircraft by category, so the share in the first two shows how many say nothing of their kind.

## Country of an Aircraft from Its ICAO 24-bit Address

The country of a state vector is not reported by the aircraft: the OpenSky Network infers it from the ICAO 24-bit address of the transponder ([The OpenSky Network (2026)](#ref-OSN2026a)). Countries of Registration counts the aircraft by that country, the one to which the address belongs. The country belongs to the transponder of the aircraft, and says nothing of the operator or of where the flight comes from or goes. Callsign Prefixes, which groups the callsigns by their first three letters, gives another view of who flies the aircraft over the area.

## Example Areas and Boxes of Live Aircraft

Live Aircraft asks the OpenSky API for the state vectors inside a box of longitude and latitude ([The OpenSky Network (2026)](#ref-OSN2026a)). The Example Areas of a city cover the city and its main airports; those of a country cover a box around it, which takes in aircraft over neighbouring countries and the sea, and for the United States the contiguous states only. The Custom Box takes four numbers, the west, south, east and north edges in degrees. The credits a request costs grow with the area of the box, as Credits and Limits describes, so a box around a country costs more than one around a city.

## When a State Vector Was Seen

An anonymous user of the OpenSky API receives only the most recent state vectors, at a resolution of 10 seconds; an authenticated user can ask for any moment of the last hour, at a resolution of 5 seconds ([The OpenSky Network (2026)](#ref-OSN2026a)). Live Aircraft asks for the most recent ones in both cases. All the vectors of an answer refer to the second before its time, which the table keeps as `seen`. Snapshots over Time asks four more times, a minute apart, and compares the counts, and how many aircraft appear in every snapshot. The table `snapshots` keeps the five, numbered in the column `k`.

## References

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

<a id="ref-SSLMW2014a"></a>Schäfer, M., Strohmeier, M., Lenders, V., Martinovic, I. and Wilhelm, M. (2014). Bringing up OpenSky: a large-scale ADS-B sensor network for research. In *IPSN-14 Proceedings of the 13th International Symposium on Information Processing in Sensor Networks* (pp. 83–94). [doi:10.1109/IPSN.2014.6846743](https://doi.org/10.1109/IPSN.2014.6846743)

## See Also
- [Overview](overview.md) · [Credits and Limits](credits-limits.md) · [Aircraft Tracks](aircraft-tracks.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
