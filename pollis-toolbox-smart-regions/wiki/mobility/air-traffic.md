# Air Traffic Data

## The OpenSky Network and Its Flight List

The OpenSky Network is a sensor network of receivers, many run by volunteers, that collect the ADS-B messages aircraft broadcast and make them available for research ([Schäfer, Strohmeier, Lenders, Martinovic and Wilhelm (2014)](#ref-SSLMW2014a)). From its full data, the network published a list of the flights it saw from January 2019, derived and cleaned, with the aircraft, the times first and last seen, and the airports of departure and arrival ([Strohmeier, Olive, Lübbe, Schäfer and Lenders (2021)](#ref-SOLSL2021a)). Air Traffic reads one month of the list from Zenodo, from January 2019 to December 2022, after which the list was no longer updated ([Olive, Strohmeier and Lübbe (2023)](#ref-OSL2023a)).

## Airports of Departure and Arrival in the OpenSky Flight List

The airports of the OpenSky flight list are computed from the trajectory of each flight on take-off and approach, without checking against other sources, and the field is left empty when no airport could be found ([Olive, Strohmeier and Lübbe (2023)](#ref-OSL2023a)). An airport is named by a four-letter code, which Air Traffic looks up in the airports file of OurAirports to obtain its name, country and position ([OurAirports (2026)](#ref-Our2026a)). A flight counts towards a route only when both its airports are known and listed by OurAirports and they differ. Flights Without an Airport gives the share of flights with no airport and the codes OurAirports does not list.

## Coverage of the OpenSky Receivers

The OpenSky Network sees only the aircraft within reach of its receivers, which its members run where they are, so the coverage is uneven over the world ([Schäfer, Strohmeier, Lenders, Martinovic and Wilhelm (2014)](#ref-SSLMW2014a); [Strohmeier, Olive, Lübbe, Schäfer and Lenders (2021)](#ref-SOLSL2021a)). A flight may be seen only in part, so that its departure or its arrival is missed and the flight list leaves that airport empty ([Olive, Strohmeier and Lübbe (2023)](#ref-OSL2023a)). The counts of Air Traffic are therefore the flights seen, not all the flights flown, and a route between places with few receivers nearby has fewer flights in the list than it carries. Comparisons between months also reflect the receivers added or lost.

## Global and City Gravity Models in Air Traffic

Air Traffic fits a gravity model to the flights between airports, with the Distance Function of the tab. With Example City set to Global, the model covers every ordered pair of the busiest airports, as many as Airports Kept, and is doubly constrained, with fixed effects for the airports of departure and of arrival. With a city, the model covers the flights from the city's airports to the busiest other airports, and is production constrained: each airport of the city keeps its departures, and the size of each destination is its departures and arrivals in the month. In both, pairs with no flights count as flows of zero ([Santos Silva and Tenreyro (2006)](#ref-SST2006a)).

## What the Distance Parameter Means for Flights

The flows of Air Traffic are flights, movements of aircraft, not passengers: the flight list carries the type of each aircraft but not the people on board ([Olive, Strohmeier and Lübbe (2023)](#ref-OSL2023a)). The distance parameter of Air Traffic summarises how the count of flights between two airports changes with the distance between them, measured on the ellipsoid, all else in the model held fixed: for a city, the departures of each of its airports and the size of each destination; for Global, the fixed effects of every airport. Distance Parameter states it as the change for a doubling of the distance, or for each further thousand kilometres. Its value depends on the airports kept, the month and the coverage of the receivers.

## References

<a id="ref-OSL2023a"></a>Olive, X., Strohmeier, M. and Lübbe, J. (2023). Crowdsourced air traffic data from The OpenSky Network 2020. Zenodo, version v23.00. [doi:10.5281/zenodo.7923702](https://doi.org/10.5281/zenodo.7923702)

<a id="ref-Our2026a"></a>OurAirports (2026). OurAirports open data. [ourairports.com/data](https://ourairports.com/data/)

<a id="ref-SST2006a"></a>Santos Silva, J. M. C. and Tenreyro, S. (2006). The log of gravity. *The Review of Economics and Statistics*, 88(4), 641–658. [doi:10.1162/rest.88.4.641](https://doi.org/10.1162/rest.88.4.641)

<a id="ref-SSLMW2014a"></a>Schäfer, M., Strohmeier, M., Lenders, V., Martinovic, I. and Wilhelm, M. (2014). Bringing up OpenSky: a large-scale ADS-B sensor network for research. In *IPSN-14 Proceedings of the 13th International Symposium on Information Processing in Sensor Networks* (pp. 83–94). [doi:10.1109/IPSN.2014.6846743](https://doi.org/10.1109/IPSN.2014.6846743)

<a id="ref-SOLSL2021a"></a>Strohmeier, M., Olive, X., Lübbe, J., Schäfer, M. and Lenders, V. (2021). Crowdsourced air traffic data from the OpenSky Network 2019–2020. *Earth System Science Data*, 13(2), 357–366. [doi:10.5194/essd-13-357-2021](https://doi.org/10.5194/essd-13-357-2021)

## See Also
- [Spatial Interaction Models](spatial-interaction.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md) · [Factsheet](factsheet.md)
