# Commuting Data

## Census 2021 Commuting Flows for Cambridge, Oxford and London

For Cambridge, Oxford and London, Commuting Flows reads table ODWP01EW of the Census 2021 of England and Wales, published through Nomis: the people aged 16 and over in employment by middle layer super output area (MSOA) of usual residence and MSOA of workplace ([Office for National Statistics (2026)](#ref-ONS2026a)). A place of work indicator separates those who work mainly at or from home, those with a workplace in the United Kingdom, and those offshore or abroad. The flows between zones are those with a workplace; the people who work at or from home are reported apart. The zones are the MSOAs of the local authorities of each city, from the Open Geography Portal ([Office for National Statistics (2026)](#ref-ONS2026b)).

## Jobs of Employees for Amsterdam

For Amsterdam, Commuting Flows reads table 85481NED of Statistics Netherlands, the jobs of employees by municipality of residence and municipality of work in December, whose figures are all provisional ([Centraal Bureau voor de Statistiek (2026)](#ref-CBS2026a)). The table counts jobs, not people: someone with two jobs is counted twice, and the self-employed are not counted. The table gives its figures in thousands of jobs, which the panel turns into jobs. The zones are the municipalities around Amsterdam, from the regional divisions of Statistics Netherlands served by PDOK ([Centraal Bureau voor de Statistiek (2026)](#ref-CBS2026b)). The jobs whose place of work is elsewhere in the Netherlands are counted as flows outside the zones.

## Home-to-Work Flows of the 2022 Census for Paris

For Paris, Commuting Flows reads the flow base of the 2022 census of INSEE on journeys between home and place of work: the employed people aged 15 and over by commune of residence and commune of work, with Paris divided into its twenty arrondissements ([Institut national de la statistique et des études économiques (2026)](#ref-INSEE2026a)). The zones are the arrondissements of Paris and the communes of Hauts-de-Seine, Seine-Saint-Denis and Val-de-Marne, with their contours from the API Découpage administratif ([geo.api.gouv.fr (2026)](#ref-GAG2026a)). The base also counts the people who work in their own commune, which are the flows within a zone.

## Commuters between Districts for Frankfurt

For Frankfurt, Commuting Flows reads the tables of the Federal Employment Agency of commuters among employees subject to social insurance contributions, by district (Kreis) of residence and district of work, on 30 June ([Statistik der Bundesagentur für Arbeit (2026)](#ref-BA2026a)). The employment statistics count as commuters only those whose place of work lies outside their district of residence, so the tables have no flows within a district, and civil servants and the self-employed are outside the statistics. The zones are the districts around Frankfurt, from the administrative areas VG250 of the Federal Agency for Cartography and Geodesy ([Bundesamt für Kartographie und Geodäsie (2026)](#ref-BKG2026a)).

## LODES Jobs for New York

For New York, Commuting Flows reads the origin-destination file of LODES version 8 for New York State, which counts jobs by census block of residence and census block of work ([U.S. Census Bureau (2026)](#ref-USCB2026a)). The panel reads the file of jobs whose home and work are both in the state, for all jobs. Each block is assigned to its 2020 census tract, and each tract to the 2020 Neighborhood Tabulation Area it is in ([New York City Department of City Planning (2026)](#ref-NYCDCP2026b)); the zones are the Neighborhood Tabulation Areas ([New York City Department of City Planning (2026)](#ref-NYCDCP2026a)). Jobs held by residents of New York City in the rest of the state are counted as flows outside the zones.

## Commuters of the 2020 Census for Tokyo

For Tokyo, Commuting Flows reads a table of the Tokyo Metropolitan Government on the daytime population from the 2020 census: the commuters aged 15 and over by municipality of residence and municipality of work, among those who live and work in Tokyo ([Tokyo Metropolitan Government (2026)](#ref-TMG2026a)). The zones are the 23 special wards and the cities, towns and villages of Tama, without the islands, made by joining the small areas of the 2020 census from e-Stat by municipality ([Statistics Bureau of Japan (2026)](#ref-SBJ2026a)). Commuters who cross the boundary of Tokyo are not in the table.

## Working Population by District for Hong Kong

For Hong Kong, Commuting Flows reads the 2021 Population Census by District Council district ([Census and Statistics Department (2026)](#ref-CSD2026a)). The census gives, for the working population of each district, whether they work in the same district, in another district of Hong Kong Island, Kowloon or the New Territories, at home, or outside Hong Kong. The flows therefore go from the eighteen districts to the three areas, the work done in the same district being counted in its own area, and the panel adds the three areas to the zones. Inflows to a district, net flows and self-containment cannot be measured from these figures.

## How the Commuting Sources Differ

The sources of Commuting Flows do not count the same thing. The Census 2021 of England and Wales, the 2022 census of France and the 2020 census of Tokyo count people; Statistics Netherlands and LODES count jobs; the Federal Employment Agency counts employees subject to social insurance contributions. The dates differ, from 2020 to 2024, and so do the zones, from MSOAs of a few thousand households to whole districts. Some sources count the people who work in their own zone and others do not. Comparisons between cities of the shares, distances or parameters of Commuting Flows and Spatial Interaction carry these differences with them.

## References

<a id="ref-BKG2026a"></a>Bundesamt für Kartographie und Geodäsie (2026). Verwaltungsgebiete 1:250 000 (VG250). [gdz.bkg.bund.de](https://gdz.bkg.bund.de/index.php/default/verwaltungsgebiete-1-250-000-stand-01-01-vg250-01-01.html)

<a id="ref-CSD2026a"></a>Census and Statistics Department (2026). 2021 Population Census (Statistics and Boundaries of District Council Districts). [portal.csdi.gov.hk](https://portal.csdi.gov.hk/)

<a id="ref-CBS2026b"></a>Centraal Bureau voor de Statistiek (2026). CBS Gebiedsindelingen 2016 t/m heden. [api.pdok.nl/cbs/gebiedsindelingen](https://api.pdok.nl/cbs/gebiedsindelingen/ogc/v1)

<a id="ref-CBS2026a"></a>Centraal Bureau voor de Statistiek (2026). Werknemersbanen en reisafstand; woon- en werkregio. Table 85481NED. [opendata.cbs.nl](https://opendata.cbs.nl/statline/#/CBS/nl/dataset/85481NED/table)

<a id="ref-GAG2026a"></a>geo.api.gouv.fr (2026). API Découpage administratif. [geo.api.gouv.fr/decoupage-administratif](https://geo.api.gouv.fr/decoupage-administratif)

<a id="ref-INSEE2026a"></a>Institut national de la statistique et des études économiques (2026). Mobilités professionnelles en 2022 : déplacements domicile - lieu de travail. [insee.fr/fr/statistiques/8582949](https://www.insee.fr/fr/statistiques/8582949)

<a id="ref-NYCDCP2026b"></a>New York City Department of City Planning (2026). 2020 Census Tracts. [data.cityofnewyork.us/d/63ge-mke6](https://data.cityofnewyork.us/d/63ge-mke6)

<a id="ref-NYCDCP2026a"></a>New York City Department of City Planning (2026). 2020 Neighborhood Tabulation Areas (NTAs). [data.cityofnewyork.us/d/9nt8-h7nd](https://data.cityofnewyork.us/d/9nt8-h7nd)

<a id="ref-ONS2026b"></a>Office for National Statistics (2026). Middle Layer Super Output Areas (December 2021) Boundaries EW BSC (V3). [geoportal.statistics.gov.uk](https://geoportal.statistics.gov.uk/)

<a id="ref-ONS2026a"></a>Office for National Statistics (2026). Origin-destination data, England and Wales: Census 2021. [nomisweb.co.uk/sources/census_2021_od](https://www.nomisweb.co.uk/sources/census_2021_od)

<a id="ref-SBJ2026a"></a>Statistics Bureau of Japan (2026). 統計地理情報システム 境界データ: 令和2年国勢調査 小地域. [e-stat.go.jp/gis](https://www.e-stat.go.jp/gis/statmap-search?type=2)

<a id="ref-BA2026a"></a>Statistik der Bundesagentur für Arbeit (2026). Pendlerverflechtungen der sozialversicherungspflichtig Beschäftigten nach Kreisen. [statistik.arbeitsagentur.de](https://statistik.arbeitsagentur.de/)

<a id="ref-TMG2026a"></a>Tokyo Metropolitan Government (2026). 国勢調査による東京都の昼間人口（従業地・通学地による人口）. [toukei.metro.tokyo.lg.jp/tyukanj](https://www.toukei.metro.tokyo.lg.jp/tyukanj/tj-index.htm)

<a id="ref-USCB2026a"></a>U.S. Census Bureau (2026). LEHD Origin-Destination Employment Statistics (LODES). Version 8. [lehd.ces.census.gov/data](https://lehd.ces.census.gov/data/)

## See Also
- [Overview](overview.md) · [Trip Data](trips-data.md) · [Spatial Interaction Models](spatial-interaction.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
