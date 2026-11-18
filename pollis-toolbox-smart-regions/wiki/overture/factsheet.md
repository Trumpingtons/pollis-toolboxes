# Overture Maps — Factsheet

**Overture Maps** is open map data released every month by the Overture Maps Foundation, in six themes: addresses, base, buildings, divisions, places and transportation ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Each release is a set of GeoParquet files on Amazon S3 and Microsoft Azure, which tools such as DuckDB can query in place. The Overture Maps panel of the Smart Regions Toolbox reads five of the themes for an area with DuckDB.jl and DuckDB's spatial and httpfs extensions ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

| Item | Overture Maps panel |
|---|---|
| **Purpose** | Read the places, buildings, transportation, divisions or addresses of an area, check them, measure them and save them |
| **Input** | An area as west, south, east, north in degrees; a release, or latest |
| **Core packages** | [DuckDB.jl](https://github.com/duckdb/DuckDB.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), with DuckDB's spatial and httpfs extensions |
| **Tabs** | Places; Buildings; Transportation; Divisions; Addresses |
| **Output** | The table `features`: one row per feature, with its main columns, its main source and licence, all its sources, and its geometry as `geom` |
| **Key choices** | The area; the release; the category and minimum confidence of places; the network of segments; the subtype of divisions |

## How Does the Overture Maps Panel Find the Files of an Area?

Overture publishes a STAC catalogue of its releases at stac.overturemaps.org, whose catalog.json names the latest release ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Each release has a file collections.parquet that lists its GeoParquet files with the bounding box of the features each holds. The Overture Maps panel reads that list with DuckDB and keeps the files of the feature type of the tab whose bounding boxes overlap the area, so a city reads one or two files of a release of several hundred.

## How Does the Overture Maps Panel Read Only the Area?

Every Overture feature has a column bbox with its bounding box, and GeoParquet calls such a column a bbox covering: readers can check it against the statistics of row groups and pages and skip those that do not overlap a query ([Open Geospatial Consortium (2026)](#ref-OGC2026b)). The Overture Maps panel filters on bbox, so DuckDB reads over HTTPS only the parts of the files whose features may meet the area, then keeps the features whose geometry intersects the area ([Raasveldt and Mühleisen (2019)](#ref-RM2019a)).

## What the Next Steps of the Overture Maps Panel Do

| Group | Action | What it shows |
|---|---|---|
| Visualise | Show on a Map, Counts by Category | The features on a base map; the most frequent categories, subtypes, classes or postcodes |
| Diagnose | Release and Files, Column Completeness, Sources and Licences, Confidence Check (Places) | The release, its schema and the files read; how often each column has a value; where the features come from; how sure Overture is that places exist |
| Compare | Sources Side by Side | What each source dataset gives in the area |
| Interpret | Place Density, Building Measures, Network Measures, Division Areas, Streets and Numbers | Places per km²; footprints and cover; kilometres, intersections and dead ends; areas of divisions; addresses per street |
| Export | Save as GeoPackage, Save as GeoParquet | The features for any GIS; every column, kept after the release expires |

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-OGC2026b"></a>Open Geospatial Consortium (2026). GeoParquet: specification for storing geospatial vector data in Parquet. [github.com/opengeospatial/geoparquet](https://github.com/opengeospatial/geoparquet)

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

<a id="ref-RM2019a"></a>Raasveldt, M. and Mühleisen, H. (2019). DuckDB: an embeddable analytical database. *Proceedings of the 2019 International Conference on Management of Data (SIGMOD)*, 1981–1984. [doi:10.1145/3299869.3320212](https://doi.org/10.1145/3299869.3320212)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Themes and Types](themes-and-types.md) · [GeoParquet in the Cloud](geoparquet-in-the-cloud.md) · [Sources and Licences](sources-and-licences.md) · [Overture and OpenStreetMap](overture-and-openstreetmap.md)
