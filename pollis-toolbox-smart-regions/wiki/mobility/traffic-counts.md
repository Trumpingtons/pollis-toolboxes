# Traffic Counts

## Annual Average Daily Flows for Cambridge, Oxford and London

For Cambridge, Oxford and London, Traffic Counts reads the annual average daily flows of the Department for Transport: for each count point and year, the number of vehicles that travel past the point on an average day of the year ([Department for Transport (2026)](#ref-DfT2026a)). The flows are given by type of vehicle, from pedal cycles to heavy goods vehicles, with the road, the junctions between which the point lies, its position, and whether the flow of that year was counted or estimated. The panel reads the file of each local authority or of the London region and keeps the points inside a box around the city. The flow of a point is that of all motor vehicles, which leaves out pedal cycles.

## Counted and Estimated Flows of the Department for Transport

Not every count point of the Department for Transport is counted every year. For the years a point is not counted, its annual average daily flow is estimated, and the estimation method of each point and year says whether the flow was counted or estimated ([Department for Transport (2026)](#ref-DfT2026a)). Count Points Check gives, for each of the last ten years, how many points were counted and how many estimated. Counts over the Years compares the points present in both the first and the latest of the last ten years, whichever way their flows were obtained; a change at a point whose flow was estimated in either year comes from the estimate as well as from the road.

## Automated Traffic Volume Counts for New York

For New York, Traffic Counts reads the Automated Traffic Volume Counts of the New York City Department of Transportation, counts of vehicles by street segment, direction and quarter of an hour, collected with Automated Traffic Recorders at bridge crossings and roadways ([New York City Department of Transportation (2026)](#ref-NYCDOT2026a)). The counts do not cover the whole year, and the days counted at a location vary from year to year. The panel averages the counts of each segment, direction and year over the quarters of an hour counted and multiplies by the 96 quarters of a day, a mean daily volume over the days counted rather than an annual average. Counts by Hour shows the mean count of each hour in the latest year.

## Permanent Road Sensors for Paris

For Paris, Traffic Counts reads the data of the permanent traffic sensors of the Ville de Paris, mostly electromagnetic loops in the roadway, which give for each road section and hour the flow, the vehicles that passed, and the occupancy rate ([Ville de Paris (2026)](#ref-VdP2026a)). The data cover a rolling thirteen months, so the panel has the current year, incomplete, and the year before. The mean hourly flow of each section in each year, times 24, is its daily flow. The sections are placed by the geographic reference of the counted road sections, of which the panel keeps the latest version of each ([Ville de Paris (2026)](#ref-VdP2026b)).

## Comparing Traffic Counts between Sources

The flows of Traffic Counts are vehicles a day in every city, but they are not computed alike. The Department for Transport gives annual averages, counted or estimated; New York gives means over the days a recorder was out, which may fall in any season; Paris gives means over the hours of a partial year on a dense network of sensors in a city centre. A count point measures one road at one place and says nothing of where its vehicles come from or go. The kinds of road also differ: the points of the Department for Transport include motorways and minor roads, while those of Paris lie on its streets.

## References

<a id="ref-DfT2026a"></a>Department for Transport (2026). Road traffic statistics: annual average daily flows. [roadtraffic.dft.gov.uk/downloads](https://roadtraffic.dft.gov.uk/downloads)

<a id="ref-NYCDOT2026a"></a>New York City Department of Transportation (2026). Automated Traffic Volume Counts. [data.cityofnewyork.us/d/7ym2-wayt](https://data.cityofnewyork.us/d/7ym2-wayt)

<a id="ref-VdP2026a"></a>Ville de Paris (2026). Comptage routier - Données trafic issues des capteurs permanents. [opendata.paris.fr](https://opendata.paris.fr/explore/dataset/comptages-routiers-permanents/)

<a id="ref-VdP2026b"></a>Ville de Paris (2026). Comptage routier - Référentiel géographique. [opendata.paris.fr](https://opendata.paris.fr/explore/dataset/referentiel-comptages-routiers/)

## See Also
- [Commuting Data](commuting-data.md) · [Trip Data](trips-data.md) · [Diagnostics](diagnostics.md) · [Overview](overview.md) · [Factsheet](factsheet.md)
