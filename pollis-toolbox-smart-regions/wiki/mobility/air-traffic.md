# Air Traffic Data

## The OpenSky Network and Its Flight List

The OpenSky Network is a sensor network of receivers, many run by volunteers, that collect the ADS-B messages aircraft broadcast and make them available for research ([Schäfer, Strohmeier, Lenders, Martinovic and Wilhelm (2014)](#ref-SSLMW2014a)). From its full data, the network published a list of the flights it saw from January 2019, derived and cleaned, with the aircraft, the times first and last seen, and the airports of departure and arrival ([Strohmeier, Olive, Lübbe, Schäfer and Lenders (2021)](#ref-SOLSL2021a)). Air Traffic reads one month of the list from Zenodo, from January 2019 to December 2022, after which the list was no longer updated ([Olive, Strohmeier and Lübbe (2023)](#ref-OSL2023a)).

## Airports of Departure and Arrival in the OpenSky Flight List

The airports of the OpenSky flight list are computed from the trajectory of each flight on take-off and approach, without checking against other sources, and the field is left empty when no airport could be found ([Olive, Strohmeier and Lübbe (2023)](#ref-OSL2023a)). An airport is named by a four-letter code, which Air Traffic looks up in the airports file of OurAirports to obtain its name, country and position ([OurAirports (2026)](#ref-Our2026a)). A flight counts towards a route only when both its airports are known and listed by OurAirports and they differ. Flights Without an Airport gives the share of flights with no airport and the codes OurAirports does not list.

## Coverage of the OpenSky Receivers

The OpenSky Network sees only the aircraft within reach of its receivers, which its members run where they are, so the coverage is uneven over the world ([Schäfer, Strohmeier, Lenders, Martinovic and Wilhelm (2014)](#ref-SSLMW2014a); [Strohmeier, Olive, Lübbe, Schäfer and Lenders (2021)](#ref-SOLSL2021a)). A flight may be seen only in part, so that its departure or its arrival is missed and the flight list leaves that airport empty ([Olive, Strohmeier and Lübbe (2023)](#ref-OSL2023a)). The counts of Air Traffic are therefore the flights seen, not all the flights flown, and a route between places with few receivers nearby has fewer flights in the list than it carries. Comparisons between months also reflect the receivers added or lost.

## Global, Country and City Gravity Models in Air Traffic

Air Traffic fits a gravity model to the flights between airports, with the Distance Function of the tab. With Example City set to Global, the model covers every ordered pair of the busiest airports of the world, as many as Airports Kept. With a country, United States, Canada, India, Brazil or Australia, it covers every ordered pair of the busiest airports of that country, from its domestic flights alone. Both are doubly constrained, with fixed effects for the airports of departure and of arrival. With a city, the model covers the flights from the city's airports to the busiest other airports, and is production constrained: each airport of the city keeps its departures, and the size of each destination is its departures and arrivals in the month. In all three, pairs with no flights count as flows of zero ([Santos Silva and Tenreyro (2006)](#ref-SST2006a)).

## Domestic Air Networks of a Country

With Example City set to a country, Air Traffic keeps the flights whose airports of departure and arrival both lie in that country, by the country OurAirports gives each airport ([OurAirports (2026)](#ref-Our2026a)). The routes, the busiest airports, the gravity model and the Next Steps then describe the domestic network: how flights spread over the airports of the country and how they fall with distance within it. Flights to and from other countries are left out, so an airport whose traffic is mostly international ranks lower than its total traffic would place it. Countries Compared sets the five side by side, each fitted among its own busiest airports.

## What the Distance Parameter Means for Flights

The flows of Air Traffic are flights, movements of aircraft, not passengers: the flight list carries the type of each aircraft but not the people on board ([Olive, Strohmeier and Lübbe (2023)](#ref-OSL2023a)). The distance parameter of Air Traffic summarises how the count of flights between two airports changes with the distance between them, measured on the ellipsoid, all else in the model held fixed: for a city, the departures of each of its airports and the size of each destination; for Global or a country, the fixed effects of every airport. Distance Parameter states it as the change for a doubling of the distance, or for each further thousand kilometres. Its value depends on the airports kept, the month and the coverage of the receivers.

## Airline Flights and All Flights in Air Traffic

The OpenSky flight list gives the callsign each aircraft broadcast and its type, but not whether the flight was an airline service ([Olive, Strohmeier and Lübbe (2023)](#ref-OSL2023a)). The Flights input of Air Traffic chooses which flights the routes count. With Airline Flights, a flight counts when its callsign is three letters followed by a digit, as the callsigns of airlines are written, and when OurAirports lists both its airports with scheduled service ([OurAirports (2026)](#ref-Our2026a)). With All Flights, every flight seen counts, general and business aviation included, whose many short trips between small airfields can rank those airfields among the busiest. The rule is a filter on what the list records, so a charter with an airline callsign counts as an airline flight and a scheduled service flown under another callsign does not.

## Air Network: Nonstop Links, Changes and Betweenness

Air Network treats the busiest airports as a directed network whose links are the routes flown at least eight times in the month, about twice a week, so that occasional flights do not count as service. It gives the share of ordered pairs of airports linked nonstop, the share reachable with at most one change, the share reachable at all and the mean number of flights needed, from the shortest paths of the network, and the size of its largest strongly connected part, in which every airport can reach every other. It then lists the airports of highest betweenness, the share of shortest paths between other airports that pass through them ([Freeman (1977)](#ref-Fre1977a)), computed with the algorithm of Brandes (2001) in Graphs.jl ([Brandes (2001)](#ref-Bra2001a); [Fairbanks, Besançon, Schölly, Hoffimann, Eubank and Karpinski (2021)](#ref-FBSHE...2021a)). Paths count flights, not distance or time.

## Comparing Countries and Months in Air Traffic

Countries Compared and Months Compared fit the same doubly constrained model to several flight networks: the domestic flights of the five countries in one month, or the same month of each year from 2019 to 2022, worldwide or within a country. The flights seen in each depend on the receivers of the OpenSky Network near its airports ([Schäfer, Strohmeier, Lenders, Martinovic and Wilhelm (2014)](#ref-SSLMW2014a)). Where few receivers cover the approaches, many flights lack their airport of arrival and drop out of the routes ([Olive, Strohmeier and Lübbe (2023)](#ref-OSL2023a)). Countries Compared therefore gives, for each country, the share of the departures seen whose airport of arrival is known; a country with a low share has fewer routes and airports than it serves, and its distance parameter rests on few pairs. A difference between months mixes the change in flying with the receivers added or lost.

## References

<a id="ref-Bra2001a"></a>Brandes, U. (2001). A faster algorithm for betweenness centrality. *The Journal of Mathematical Sociology*, 25(2), 163–177. [doi:10.1080/0022250X.2001.9990249](https://doi.org/10.1080/0022250X.2001.9990249)

<a id="ref-FBSHE...2021a"></a>Fairbanks, J., Besançon, M., Schölly, S., Hoffimann, J., Eubank, N. and Karpinski, S. (2021). JuliaGraphs/Graphs.jl: an optimized graphs package for the Julia programming language. [github.com/JuliaGraphs/Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl)

<a id="ref-Fre1977a"></a>Freeman, L. C. (1977). A Set of Measures of Centrality Based on Betweenness. *Sociometry*, 40(1), 35–41. [doi:10.2307/3033543](https://doi.org/10.2307/3033543)

<a id="ref-OSL2023a"></a>Olive, X., Strohmeier, M. and Lübbe, J. (2023). Crowdsourced air traffic data from The OpenSky Network 2020. Zenodo, version v23.00. [doi:10.5281/zenodo.7923702](https://doi.org/10.5281/zenodo.7923702)

<a id="ref-Our2026a"></a>OurAirports (2026). OurAirports open data. [ourairports.com/data](https://ourairports.com/data/)

<a id="ref-SST2006a"></a>Santos Silva, J. M. C. and Tenreyro, S. (2006). The log of gravity. *The Review of Economics and Statistics*, 88(4), 641–658. [doi:10.1162/rest.88.4.641](https://doi.org/10.1162/rest.88.4.641)

<a id="ref-SSLMW2014a"></a>Schäfer, M., Strohmeier, M., Lenders, V., Martinovic, I. and Wilhelm, M. (2014). Bringing up OpenSky: a large-scale ADS-B sensor network for research. In *IPSN-14 Proceedings of the 13th International Symposium on Information Processing in Sensor Networks* (pp. 83–94). [doi:10.1109/IPSN.2014.6846743](https://doi.org/10.1109/IPSN.2014.6846743)

<a id="ref-SOLSL2021a"></a>Strohmeier, M., Olive, X., Lübbe, J., Schäfer, M. and Lenders, V. (2021). Crowdsourced air traffic data from the OpenSky Network 2019–2020. *Earth System Science Data*, 13(2), 357–366. [doi:10.5194/essd-13-357-2021](https://doi.org/10.5194/essd-13-357-2021)

## See Also
- [Spatial Interaction Models](spatial-interaction.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md) · [Factsheet](factsheet.md)
