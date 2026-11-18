# Overture and OpenStreetMap

## OpenStreetMap as a Source

OpenStreetMap is a world map that its contributors edit collaboratively, following the peer production model of Wikipedia, with data free to use ([Haklay and Weber (2008)](#ref-HW2008a)). Overture uses it as the primary source of its buildings, roads, railways and boundaries, and its base theme of land, water and land use is made wholly or in part from it ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Those themes are therefore under OpenStreetMap's Open Database License.

## What Overture Adds

Overture adds sources to OpenStreetMap's and publishes them in one schema ([Overture Maps Foundation (2026)](#ref-OMF2026a)). For buildings it adds footprints from Esri Community Maps, national and municipal data and machine learning by Microsoft and Google; for roads, data from TomTom; for places, records from Meta, Microsoft, Foursquare and other providers; and for addresses, national and regional registers. It gives features GERS IDs that stay stable across releases, and publishes each month as GeoParquet files with a bounding box per feature.

## How the Two Differ in Use

Overture's schema gives each feature type fixed columns, such as subtype and class, with the values the schema defines ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Its transportation theme splits roads where their class changes and gives each segment its connectors with a linear reference, from 0 at the start of the segment to 1 at its end; the ways of an OpenStreetMap extract, as the Transport Network Files panel reads them, are joined by the nodes they share. Gabrielli, Sulis, Thabit and Minghini found both datasets to have rich building schemas, with low and uneven completeness of attributes ([Gabrielli, Sulis, Thabit and Minghini (2026)](#ref-GSTM2026a)).

## Data Not From OpenStreetMap

Machine-learned building footprints fill gaps where OpenStreetMap has few buildings, but their accuracy varies by place ([Gevaert, Buunk and Van den Homberg (2024)](#ref-GBH2024a)). Gevaert, Buunk and Van den Homberg compared Google Open Buildings, Microsoft's footprints, Overture Maps and OpenStreetMap in Tanzania and the Philippines and found all four less accurate than expected there, with biases related to wealth, population density and building size. The main source of each feature in the Overture Maps panel tells which footprints come from OpenStreetMap and which from machine learning.

## Comparing Overture With an OpenStreetMap Extract

The Transport Network Files panel of the Smart Regions Toolbox reads an OpenStreetMap extract as an .osm.pbf file, and the Overture Maps panel reads Overture's segments and buildings for an area; both save GeoPackage files with geometry in WGS 84. Saved for the same area, the two can be compared in the Geospatial Vector Files panel or any GIS, and in SQL with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Lengths by class, counts of buildings and the share of features from each source show where the two differ.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GSTM2026a"></a>Gabrielli, L., Sulis, P., Thabit, S. and Minghini, M. (2026). Towards a comparison of the semantic information of pan-European open building data. *ISPRS International Journal of Geo-Information*, 15(6), 252. [doi:10.3390/ijgi15060252](https://doi.org/10.3390/ijgi15060252)

<a id="ref-GBH2024a"></a>Gevaert, C. M., Buunk, T. and Van den Homberg, M. J. C. (2024). Auditing geospatial datasets for biases: using global building datasets for disaster risk management. *IEEE Journal of Selected Topics in Applied Earth Observations and Remote Sensing*, 17, 12579–12590. [doi:10.1109/JSTARS.2024.3422503](https://doi.org/10.1109/JSTARS.2024.3422503)

<a id="ref-HW2008a"></a>Haklay, M. and Weber, P. (2008). OpenStreetMap: user-generated street maps. *IEEE Pervasive Computing*, 7(4), 12–18. [doi:10.1109/MPRV.2008.80](https://doi.org/10.1109/MPRV.2008.80)

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

## See Also
- [Sources and Licences](sources-and-licences.md) · [Overview](overview.md) · [Themes and Types](themes-and-types.md) · [Factsheet](factsheet.md)
