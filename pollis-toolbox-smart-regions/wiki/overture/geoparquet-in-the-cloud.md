# GeoParquet in the Cloud

## Parquet Files and Row Groups

Parquet is a columnar file format: a file is divided into row groups, each row group stores each column in its own chunk, and the file's footer holds metadata with statistics such as the minimum and maximum of each column chunk ([Apache Software Foundation (2026)](#ref-ASF2026a)). A reader that knows the footer can read only the columns a query needs and skip the row groups whose statistics rule them out. Over HTTP, a reader asks for byte ranges of the file, so skipped row groups are never downloaded.

## GeoParquet and the bbox Covering

GeoParquet specifies how to store geospatial vector data, points, lines and polygons, in Parquet: the geometry columns, their encoding and their coordinate reference system, in the file's metadata ([Open Geospatial Consortium (2026)](#ref-OGC2026b)). A GeoParquet file may name a bbox covering, a column of bounding boxes with fields xmin, ymin, xmax and ymax for each feature. Its statistics per row group and its page index let a reader skip row groups and pages that do not intersect a query, and a bounding box check avoids costly spatial operations on most features.

## How Overture Publishes Its Releases

Overture publishes each release as GeoParquet files on Amazon S3, at s3://overturemaps-us-west-2/release/, and on Microsoft Azure, partitioned by theme and type ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Every feature has a column bbox, which Overture's examples filter on to read an area. Overture also publishes a STAC catalogue at stac.overturemaps.org: its catalog.json lists the releases and names the latest, and each release has a collections.parquet that lists the release's files with the bounding box of their features and their sizes.

## How the Overture Maps Data Panel Reads an Area

The Overture Maps Data panel of the Smart Regions Toolbox reads the latest release's name from catalog.json, then the files of the feature type whose bounding boxes overlap the area from collections.parquet, both with DuckDB over HTTPS ([Raasveldt and Mühleisen (2019)](#ref-RM2019a); [Overture Maps Foundation (2026)](#ref-OMF2026a)). It reads those files with `read_parquet`, filtered on the bbox column, so DuckDB downloads only the row groups whose features may lie in the area. Of those, it keeps the features whose geometry intersects the area, a test of DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)).

## DuckDB's httpfs Extension

DuckDB reads files on HTTPS and on S3 through its httpfs extension, which the Smart Regions Toolbox installs with the spatial extension ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)). Overture's buckets are public, so no credentials are needed. The Overture Maps Data panel reads the HTTPS addresses that collections.parquet gives for each file on Amazon S3.

## References

<a id="ref-ASF2026a"></a>Apache Software Foundation (2026). Apache Parquet Format. [github.com/apache/parquet-format](https://github.com/apache/parquet-format)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-OGC2026b"></a>Open Geospatial Consortium (2026). GeoParquet: specification for storing geospatial vector data in Parquet. [github.com/opengeospatial/geoparquet](https://github.com/opengeospatial/geoparquet)

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

<a id="ref-RM2019a"></a>Raasveldt, M. and Mühleisen, H. (2019). DuckDB: an embeddable analytical database. *Proceedings of the 2019 International Conference on Management of Data (SIGMOD)*, 1981–1984. [doi:10.1145/3299869.3320212](https://doi.org/10.1145/3299869.3320212)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Themes and Types](themes-and-types.md)
