# Diagnostics

## A Download That Fails in Mobility and Flows

Every source of Mobility and Flows is downloaded over the internet the first time a city is run. When a server answers that it is busy or failing, with HTTP status 429 or a status of 500 or more, or does not answer, the panel waits and asks again, up to five times, waiting 5, 10, 20, 40 and 80 seconds; any other error, such as a page not found, stops the tab with its message. A file is written to the folder mobility only once complete, so an interrupted download leaves no partial file behind. A source that has moved its files shows as a page not found: the address in the code of the tab is then the one to update.

## Zones with No Flows

Coverage lists the zones from which no flow leaves and those at which none arrives. For commuting, such a zone has no residents or no workplaces in the source, or the source does not count its flows: the tables of Hong Kong give flows only from districts to areas. For Trips, a zone has no trips when the service does not reach it: bike-sharing stations cover only part of London, and taxi zones such as islands see few taxis. A zone with no outflow or no inflow has no fixed effect that Spatial Interaction can estimate, and its pairs are left out of the model.

## Flows That Start or End outside the Zones

Each source counts some flows that leave the zones of the Example City: people who live in the zones and work elsewhere, journeys from stations no longer listed, trips from unknown taxi zones, or bus stops outside the planning areas. Coverage gives them as a share of all the flows the panel read, and the summary of Commuting Flows and Trips prints their number. Some sources count no such flows at all: the commuting table of Tokyo counts only commuters who live and work in Tokyo. A large share means the zones cut through the area the flows belong to.

## Overdispersion of the Flows

A Poisson model expects the variance of each flow to equal its mean ([Flowerdew and Aitkin (1982)](#ref-FA1982a)); flows whose variance is larger are overdispersed. Overdispersion gives the Pearson statistic over its degrees of freedom, near 1 when the variation is as the Poisson model expects and above 1 when it is larger, and the share of pairs with no flow, observed and expected. Overdispersion leaves the Poisson estimates of the parameters consistent but makes the usual standard errors too small ([Santos Silva and Tenreyro (2006)](#ref-SST2006a)); Spatial Interaction and Air Traffic report robust standard errors, which remain valid ([Boehm (2020)](#ref-Boe2020a)).

## Where a Gravity Model Fits Badly

Fitted Against Observed draws each pair's observed flow against its fitted flow, in logs, with the diagonal on which a perfect fit would lie. Residuals on a Map shows the pairs of zones whose flows lie furthest above and below the model, by their Pearson residuals. The model contains only the constrained totals, the sizes of the places and the distance between centroids, so whatever else draws flows between two zones or holds them back shows in the residuals: the roads and railways between them, which the straight distance ignores, and ties the sizes do not capture. A cluster of large residuals around one zone points to a zone the model treats poorly, for example one whose centroid stands far from where its people or jobs are.

## Flights Without an Airport

The OpenSky flight list leaves the airport of departure or arrival empty when the trajectory of a flight did not reveal it, and some codes it gives are missing from OurAirports ([Olive, Strohmeier and Lübbe (2023)](#ref-OSL2023a); [OurAirports (2026)](#ref-Our2026a)). Flights Without an Airport gives the share of flights with no airport of departure and with no airport of arrival, the flights that return to the airport they left, and the most frequent codes OurAirports does not list. None of these flights count towards a route, so the routes of Air Traffic hold fewer flights than the list.

## References

<a id="ref-Boe2020a"></a>Boehm, J. (2020). GLFixedEffectModels.jl: fast estimation of generalized linear models with high-dimensional fixed effects in Julia. [github.com/jmboehm/GLFixedEffectModels.jl](https://github.com/jmboehm/GLFixedEffectModels.jl)

<a id="ref-FA1982a"></a>Flowerdew, R. and Aitkin, M. (1982). A method of fitting the gravity model based on the Poisson distribution. *Journal of Regional Science*, 22(2), 191–202. [doi:10.1111/j.1467-9787.1982.tb00744.x](https://doi.org/10.1111/j.1467-9787.1982.tb00744.x)

<a id="ref-OSL2023a"></a>Olive, X., Strohmeier, M. and Lübbe, J. (2023). Crowdsourced air traffic data from The OpenSky Network 2020. Zenodo, version v23.00. [doi:10.5281/zenodo.7923702](https://doi.org/10.5281/zenodo.7923702)

<a id="ref-Our2026a"></a>OurAirports (2026). OurAirports open data. [ourairports.com/data](https://ourairports.com/data/)

<a id="ref-SST2006a"></a>Santos Silva, J. M. C. and Tenreyro, S. (2006). The log of gravity. *The Review of Economics and Statistics*, 88(4), 641–658. [doi:10.1162/rest.88.4.641](https://doi.org/10.1162/rest.88.4.641)

## See Also
- [Commuting Data](commuting-data.md) · [Spatial Interaction Models](spatial-interaction.md) · [Air Traffic Data](air-traffic.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
