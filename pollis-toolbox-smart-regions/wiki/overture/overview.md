# Overture Maps Data — Overview

## What Overture Maps Is

Overture Maps is a set of open map datasets, released every month since October 2023 by the Overture Maps Foundation ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Each release covers the world in six themes: addresses, base, buildings, divisions, places and transportation. Overture builds a release by conflation: it matches the features of several source datasets that describe the same thing, such as two footprints of one building, and publishes one feature in one schema. The releases are GeoParquet files on Amazon S3 and Microsoft Azure, and partners mirror them on other platforms.

## Stable Identifiers: GERS

Every feature of Overture's reference map that carries a GERS ID, the identifier of the Global Entity Reference System, keeps it from release to release ([Overture Maps Foundation (2026)](#ref-OMF2026a)). A GERS ID is a random 128-bit UUID with nothing encoded in it; Overture replaced its earlier identifiers, which encoded an H3 cell and a theme, in the release of June 2025. Data matched once to GERS IDs can be joined on the identifier afterwards, and a registry, a changelog of each release and bridge files to the source identifiers help keep such matches current. Features of the base theme and building parts carry no GERS ID.

## Points of Interest from Overture

Points of interest that are global, open and of good quality are scarce, despite being inputs to research in many fields ([Ballantyne and Berragan (2024)](#ref-BB2024a)). Ballantyne and Berragan built a queryable version of Overture's places for the United Kingdom and evaluated its quality against the ISO standards for geographic data, comparing it with Geolytix's supermarket data. They noted that working with the full files needs computational resources beyond those of the average researcher; reading only an area, as the Places tab of the Overture Maps Data panel does, is one answer to that.

## Buildings from Several Sources

Open building datasets for Europe include OpenStreetMap, EUBUCCO, Microsoft's Global ML Building Footprints, Overture Maps, GHS-OBAT and the Digital Building Stock Model ([Gabrielli, Sulis, Thabit and Minghini (2026)](#ref-GSTM2026a)). Comparing their attributes over the 27 member states of the European Union, Gabrielli, Sulis, Thabit and Minghini found that community-driven and conflated datasets, OpenStreetMap and Overture Maps, have richer and more detailed schemas than those derived from remote sensing, but low and spatially uneven completeness of height, typology, age, floors and material. The Buildings tab of the Overture Maps Data panel shows that completeness for an area with Column Completeness.

## How the Overture Maps Data Panel Uses the Releases

The Overture Maps Data panel of the Smart Regions Toolbox reads one feature type of a release for an area: places, buildings, road, rail or water segments, division areas or addresses ([Overture Maps Foundation (2026)](#ref-OMF2026a)). It finds the release's files that cover the area in its catalogue and reads only the parts of those files that the area needs, with DuckDB over HTTPS ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)). The features land in one DuckDB table, from which the Next Steps draw maps and charts, check the data and save it as GeoPackage or GeoParquet.

## References

<a id="ref-BB2024a"></a>Ballantyne, P. and Berragan, C. (2024). Overture Point of Interest data for the United Kingdom: a comprehensive, queryable open data product, validated against Geolytix supermarket data. *Environment and Planning B: Urban Analytics and City Science*, 51(8), 1974–1980. [doi:10.1177/23998083241263124](https://doi.org/10.1177/23998083241263124)

<a id="ref-GSTM2026a"></a>Gabrielli, L., Sulis, P., Thabit, S. and Minghini, M. (2026). Towards a comparison of the semantic information of pan-European open building data. *ISPRS International Journal of Geo-Information*, 15(6), 252. [doi:10.3390/ijgi15060252](https://doi.org/10.3390/ijgi15060252)

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Factsheet](factsheet.md) · [Themes and Types](themes-and-types.md) · [GeoParquet in the Cloud](geoparquet-in-the-cloud.md) · [Sources and Licences](sources-and-licences.md) · [Overture and OpenStreetMap](overture-and-openstreetmap.md)
