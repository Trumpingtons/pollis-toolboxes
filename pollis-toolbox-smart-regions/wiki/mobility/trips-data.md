# Trip Data

## Santander Cycles Journeys for London

For London, Trips reads the journey data of Santander Cycles, the cycle hire scheme of Transport for London, published as CSV files that each cover part of a month ([Transport for London (2026)](#ref-TfL2026a)). Each journey has its start and end docking stations and its start time. The panel reads the files of the Month, or of the latest month listed, and places each docking station in an MSOA of London from the positions of the BikePoint resource of the Unified API, matched by terminal number ([Transport for London (2026)](#ref-TfL2026b)). Journeys from or to a station the BikePoint resource no longer lists are counted as flows outside the zones. The docking stations cover central and inner London, so many zones of outer London have no trips.

## Yellow Taxi Trips for New York

For New York, Trips reads the yellow taxi trip records of the New York City Taxi and Limousine Commission, one Parquet file a month, with the pickup and drop-off time and taxi zone of each trip ([New York City Taxi and Limousine Commission (2026)](#ref-TLC2026a)). The zones are the taxi zones, read from the shapefile published with the records and transformed to longitude and latitude. With Month set to latest, the panel tries the months before the current one, newest first, until it finds a published file, since the records appear some weeks after the month ends. Trips with an unknown pickup or drop-off zone are counted as flows outside the zones.

## Bus Trips for Singapore

For Singapore, Trips reads the passenger volume by origin and destination bus stops of LTA DataMall: the trips of a month by type of day, hour, bus stop where the passenger tapped in and bus stop where the passenger tapped out ([Land Transport Authority (2026)](#ref-LTA2026a)). The bus stops come from the same API with their positions, and are placed in the planning areas of the Master Plan 2025, the zones ([Urban Redevelopment Authority (2026)](#ref-URA2026a)). DataMall keeps the last three months, and the Month must be one of them. Both the trips and the bus stops need an account key: Authentication describes it.

## Hours and Kinds of Day in Trips

Trips keeps the hour each trip starts in a table `hours`, with the kind of day, for London, New York and Singapore. For London and New York, a day from Monday to Friday is a weekday and Saturday and Sunday are weekends, by the start time of each trip; public holidays are counted as weekdays. For Singapore, the passenger volume of LTA DataMall gives its own type of day, weekdays or weekends and holidays, and the hour of the tap-in ([Land Transport Authority (2026)](#ref-LTA2026a)). Trips by Hour adds the kinds of day together; Weekdays and Weekends shows the share of each kind of day's trips in each hour, which does not depend on how many days of each kind the month has.

## What a Trip Count Measures

A trip count measures journeys made with one service, not the movements of people. One person may make many trips in a month, and a journey that changes from one bus to another appears as two trips of the bus data. Bike-sharing journeys depend on where the docking stations are and how many bikes they hold; taxi trips concentrate where taxis are hailed. Trips between zones therefore show the use of each service rather than all travel, and the flows of one service cannot be compared directly with those of another or with commuting flows.

## References

<a id="ref-LTA2026a"></a>Land Transport Authority (2026). LTA DataMall. [datamall.lta.gov.sg](https://datamall.lta.gov.sg/content/datamall/en.html)

<a id="ref-TLC2026a"></a>New York City Taxi and Limousine Commission (2026). TLC Trip Record Data. [nyc.gov/site/tlc](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

<a id="ref-TfL2026a"></a>Transport for London (2026). Santander Cycles journey data. [cycling.data.tfl.gov.uk](https://cycling.data.tfl.gov.uk/)

<a id="ref-TfL2026b"></a>Transport for London (2026). Unified API: BikePoint. [api.tfl.gov.uk](https://api.tfl.gov.uk/)

<a id="ref-URA2026a"></a>Urban Redevelopment Authority (2026). Master Plan 2025 Planning Area Boundary (No Sea). [data.gov.sg](https://data.gov.sg/datasets/d_2cc750190544007400b2cfd5d7f53209/view)

## See Also
- [Commuting Data](commuting-data.md) · [Authentication](authentication.md) · [Spatial Interaction Models](spatial-interaction.md) · [Diagnostics](diagnostics.md) · [Overview](overview.md)
