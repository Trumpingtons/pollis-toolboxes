# OpenSky Network — Overview

## The OpenSky Network and Its Receivers

The OpenSky Network is a network of ground receivers that collect the ADS-B and other Mode S messages aircraft broadcast, from which it stores the position, velocity and identity of the aircraft within reach, for research ([Schäfer, Strohmeier, Lenders, Martinovic and Wilhelm (2014)](#ref-SSLMW2014a)). Its receivers are hosted by its members, so what it sees depends on where they have placed them and changes as receivers are added or switched off ([Strohmeier, Olive, Lübbe, Schäfer and Lenders (2021)](#ref-SOLSL2021a)). OpenSky Network, the panel, reads what the network serves through its REST API ([The OpenSky Network (2026)](#ref-OSN2026a)); what the network did not receive, the panel cannot show.

## Three Kinds of Data in the OpenSky REST API

The REST API of the OpenSky Network serves three kinds of data ([The OpenSky Network (2026)](#ref-OSN2026a)). State vectors give the state of each aircraft at a moment: its address, callsign, position, altitude, velocity, heading and vertical rate. Flights are derived from the state vectors of a day: each has the aircraft, the times it was first and last seen, and the airports of departure and arrival as estimated. Tracks give the path of one flight as waypoints, a selection of its positions. Live Aircraft reads state vectors, Flights by Airport reads flights, and Aircraft Track reads a track.

## Times, Units and Codes of the OpenSky API

The OpenSky API gives times as Unix time in seconds, positions as longitude and latitude in degrees of WGS-84, altitudes in metres, velocities and vertical rates in metres per second, and headings in degrees clockwise from north ([The OpenSky Network (2026)](#ref-OSN2026a)). An aircraft is identified by the ICAO 24-bit address of its transponder, written as six lower-case hexadecimal characters; an airport by its four-letter ICAO code. OpenSky Network turns the times into timestamps in UTC and keeps the other units, except where a Next Step states speeds in kilometres per hour or distances in kilometres.

## OpenSky Network and the Air Traffic Tab of Mobility and Flows

Two panels of the Smart Regions Toolbox read the OpenSky Network. The Air Traffic tab of Mobility and Flows reads the flight list the network published on Zenodo for each month of 2019 to 2022, and fits gravity models to the flights between airports. OpenSky Network, the panel, reads the REST API: the aircraft in the air now, the flights of an airport on a recent day, and single tracks. The REST API reaches back days rather than years, and its requests are limited by daily credits, so it suits an area, an airport or a flight rather than a whole network over months ([The OpenSky Network (2026)](#ref-OSN2026a)).

## References

<a id="ref-OSN2026a"></a>The OpenSky Network (2026). The OpenSky REST API. [openskynetwork.github.io/opensky-api](https://openskynetwork.github.io/opensky-api/rest.html)

<a id="ref-SSLMW2014a"></a>Schäfer, M., Strohmeier, M., Lenders, V., Martinovic, I. and Wilhelm, M. (2014). Bringing up OpenSky: a large-scale ADS-B sensor network for research. In *IPSN-14 Proceedings of the 13th International Symposium on Information Processing in Sensor Networks* (pp. 83–94). [doi:10.1109/IPSN.2014.6846743](https://doi.org/10.1109/IPSN.2014.6846743)

<a id="ref-SOLSL2021a"></a>Strohmeier, M., Olive, X., Lübbe, J., Schäfer, M. and Lenders, V. (2021). Crowdsourced air traffic data from the OpenSky Network 2019–2020. *Earth System Science Data*, 13(2), 357–366. [doi:10.5194/essd-13-357-2021](https://doi.org/10.5194/essd-13-357-2021)

## See Also
- [Factsheet](factsheet.md) · [State Vectors](state-vectors.md) · [Flights by Airport](flights-by-airport.md) · [Aircraft Tracks](aircraft-tracks.md) · [Decision Guide](decision-guide.md)
