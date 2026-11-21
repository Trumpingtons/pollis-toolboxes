# Decision Guide

## Which Tab of the Overture Maps Data Panel to Use

| Need | Tab | Overture feature type |
|---|---|---|
| Shops, services, schools, hospitals and other points of interest | Places | `place` |
| Building footprints, with subtype, height and floors where known | Buildings | `building` |
| Roads and paths, railways, or ferry routes, with their classes and junctions | Transportation | `segment` |
| The boundaries of counties, localities or neighbourhoods | Divisions | `division_area` |
| Address points with street, number and postcode | Addresses | `address` |

Overture defines a place as a concrete, physically identifiable, stationary destination in a publicly observable space, so administrative areas belong to divisions, standalone address points to addresses, and bus stops and platforms to the base theme rather than places ([Overture Maps Foundation (2026)](#ref-OMF2026a)). The base theme, with land, water, land use, land cover, infrastructure and bathymetry, has no tab in the Overture Maps Data panel.

## How Large an Area to Read

The Area input of the Overture Maps Data panel is a box of west, south, east and north in degrees. DuckDB reads only the parts of Overture's files whose features overlap the box, so the time and data read grow with the number of features in it ([Open Geospatial Consortium (2026)](#ref-OGC2026b)). A few square kilometres of a city read in seconds; a whole city or region reads more, and Show on a Map draws at most 50,000 features. For a whole country, a copy of the release on one's own computer or a data platform that mirrors Overture serves better ([Overture Maps Foundation (2026)](#ref-OMF2026a)).

## Which Release to Read

The Release input set to latest reads the newest release in Overture's catalogue, which changes every month ([Overture Maps Foundation (2026)](#ref-OMF2026a)). A named release, such as 2026-11-18.0, gives the same features each time, as long as Overture keeps it, for at most 60 days. Work that must be repeated later should save the features with Save as GeoParquet and read the file, or record the GERS IDs of the features used, which stay stable across releases.

## Which Places to Keep

The Category input of the Places tab keeps one basic category, such as `restaurant` or `college_university`, and Minimum Confidence leaves out places whose confidence is lower ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Overture describes confidence as a relative filter, where a higher threshold trades coverage for precision. Ballantyne and Berragan evaluated Overture's places for the United Kingdom against a reference dataset of supermarkets ([Ballantyne and Berragan (2024)](#ref-BB2024a)); a comparison with a trusted list of the places of interest is the surest way to choose a threshold for a study.

## What to Save for Other Tools

Save as GeoPackage writes the main columns of the features, their source and licence, with the geometry in WGS 84, for the Geospatial Vector Files panel and any GIS. Save as GeoParquet writes every column, the full list of sources included, as GeoParquet, a format for geospatial vector data in Parquet that DuckDB, GDAL and many data tools read ([Open Geospatial Consortium (2026)](#ref-OGC2026b)). The GeoParquet file keeps the features after Overture removes the release.

## References

<a id="ref-BB2024a"></a>Ballantyne, P. and Berragan, C. (2024). Overture Point of Interest data for the United Kingdom: a comprehensive, queryable open data product, validated against Geolytix supermarket data. *Environment and Planning B: Urban Analytics and City Science*, 51(8), 1974–1980. [doi:10.1177/23998083241263124](https://doi.org/10.1177/23998083241263124)

<a id="ref-OGC2026b"></a>Open Geospatial Consortium (2026). GeoParquet: specification for storing geospatial vector data in Parquet. [github.com/opengeospatial/geoparquet](https://github.com/opengeospatial/geoparquet)

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

## See Also
- [Factsheet](factsheet.md) · [Themes and Types](themes-and-types.md) · [GeoParquet in the Cloud](geoparquet-in-the-cloud.md) · [Sources and Licences](sources-and-licences.md) · [Diagnostics](diagnostics.md)
