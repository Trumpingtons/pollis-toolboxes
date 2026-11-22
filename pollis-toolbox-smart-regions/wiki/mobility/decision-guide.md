# Decision Guide

| Tab | Data | When to use it |
|---|---|---|
| Commuting Flows | Censuses and registers of jobs | Where the people of each zone work, at one date |
| Trips | Bike-sharing journeys, taxi trips, bus tap-ins | Where and when people travel with one service, over a month |
| Spatial Interaction | Commuting flows or bus trips | How flows fall with distance, and the flows a model expects |
| Traffic Counts | Vehicles counted at points on the roads | How busy the roads are and how traffic changes over the years |
| Air Routes | Flights seen by the OpenSky Network | The busiest airports and routes, and a gravity model of flights |

## Which Tab of Mobility and Flows to Use

Commuting Flows answers where people live and work: the zones that draw workers from others, those that send them, and how far they travel. Trips answers when and between which zones people use a service, by hour and kind of day. Spatial Interaction answers how strongly distance holds flows back, and which pairs of zones exchange more or less than their sizes and distance predict. Traffic Counts answers how many vehicles use a road, not where they come from. Air Routes answers the same questions as Commuting Flows and Spatial Interaction for flights between airports, over the world or from a city.

## Which Example City of Mobility and Flows to Choose

The Example Cities of Mobility and Flows differ in what their sources count and in the size of their zones. Cambridge, Oxford and London have the finest zones, the MSOAs of the Census 2021, and the counts of the Department for Transport. New York has every tab, and Paris every tab but Trips, with commuting from LODES and from the 2022 census. Amsterdam, Frankfurt and Tokyo have commuting between municipalities or districts. Hong Kong gives flows from districts to three areas, which a gravity model cannot use. Singapore has bus trips between planning areas and needs an LTA DataMall account key. On Air Routes, Global gives the flights among the busiest airports of the world, and the United States, Canada, India, Brazil and Australia their domestic networks, whose coverage by the OpenSky receivers differs from one country to another, as Air Route Data describes. Commuting Data compares the sources.

## Which Constraint of Spatial Interaction to Use

The Constraint of Spatial Interaction should keep the totals that are known and not to be explained ([Wilson (1971)](#ref-Wil1971a)). Doubly suits a question about the pattern of flows between zones whose outflows and inflows are both given, as for the distance parameter of a city's commuting. Production suits forecasting where the flows of each origin go when the destinations change, Attraction where the flows to each destination come from. Unconstrained suits explaining the totals themselves by the sizes of the zones and, keeping fewer totals, follows the flows less closely. Four Constraints fits all four ([Dennett (2012)](#ref-Den2012a)).

## Which Distance Function of Spatial Interaction to Use

The Distance Function of Spatial Interaction sets the shape of the fall of flows with distance. Power makes the flow fall by the same share each time the distance doubles, steep at short distances and slow at long ones; Exponential makes it fall by the same share for each further kilometre, so long-distance flows die out faster. Lenormand, Bassolas and Ramasco (2016) compared gravity laws of both shapes on commuting data at different scales, and found that the single parameter of a law depends on the scale of the geographic units ([Lenormand, Bassolas and Ramasco (2016)](#ref-LBR2016a)). Power and Exponential fits both, with their common part of the flows and SRMSE.

## References

<a id="ref-Den2012a"></a>Dennett, A. (2012). Estimating flows between geographical locations: get me started in spatial interaction modelling. CASA Working Paper 181, University College London. [ucl.ac.uk/bartlett/casa](https://www.ucl.ac.uk/bartlett/casa/publications/2012/mar/casa-working-paper-181)

<a id="ref-LBR2016a"></a>Lenormand, M., Bassolas, A. and Ramasco, J. J. (2016). Systematic comparison of trip distribution laws and models. *Journal of Transport Geography*, 51, 158–169. [doi:10.1016/j.jtrangeo.2015.12.008](https://doi.org/10.1016/j.jtrangeo.2015.12.008)

<a id="ref-Wil1971a"></a>Wilson, A. G. (1971). A family of spatial interaction models, and associated developments. *Environment and Planning A*, 3(1), 1–32. [doi:10.1068/a030001](https://doi.org/10.1068/a030001)

## See Also
- [Overview](overview.md) · [Commuting Data](commuting-data.md) · [Spatial Interaction Models](spatial-interaction.md) · [Air Route Data](air-traffic.md) · [Factsheet](factsheet.md)
