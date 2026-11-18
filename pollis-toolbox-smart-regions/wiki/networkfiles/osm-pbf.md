# OpenStreetMap PBF

## What Is the PBF Format?

PBF, the Protocolbuffer Binary Format, is the binary alternative to OpenStreetMap's XML format: about half the size of a gzipped planet file and about 30% smaller than a bzipped one, about five times faster to write and six times faster to read than a gzipped planet ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026a)). A PBF file is a series of blocks, each decodable on its own, so a reader can go to any block. Keys and values of tags are stored in full as strings, with no tags hard-coded, and identifiers of nodes, ways and relations are 64-bit. Coordinates are stored at a resolution of 100 nanodegrees by default, about 1 cm at the equator. Files end in .osm.pbf.

## Nodes, Ways, Relations and Tags

OpenStreetMap data are made of three kinds of base objects: nodes, which are points with a longitude and a latitude; ways, which are ordered lists of nodes; and relations, which group nodes, ways and other relations ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). Any of them can carry tags, pairs of a key and a value, such as highway=residential or name=Avenue Pasteur. A way with the highway key is a street or path, one with railway a railway. A way has no coordinates of its own: its shape comes from its nodes, so a reader has to join the two to draw it.

## Reading a PBF File With DuckDB

DuckDB's spatial extension reads PBF files with `ST_ReadOSM`, which returns one row per node, way and relation: its kind, identifier and tags as a map from key to value, and for nodes the longitude and latitude, for ways and relations the identifiers of their members ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The OpenStreetMap PBF tab of the Transport Network Files panel reads the file twice, once for the ways with the Network Key and once for the nodes they use, so the rest of the file is never held in memory. GDAL's OSM driver builds geometries too, but is slow on files larger than a few megabytes ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

## Extracts and Their Edges

An extract of OpenStreetMap covers a country, a region or a city, cut from the planet along a boundary. A way that crosses the boundary may keep references to nodes outside the extract, which the file does not contain. The OpenStreetMap PBF tab draws such a way through the nodes it finds and drops ways with fewer than two, and File Contents and Tag Check count both. A network measured near the edge of an extract misses the streets beyond it, so an extract should reach past the area studied.

## How Complete Is OpenStreetMap?

Barrington-Leigh and Millard-Ball assessed the completeness of OpenStreetMap's road data in every country, with a visual assessment against satellite imagery and with curves fitted to the cumulative length of contributions ([Barrington-Leigh and Millard-Ball (2017)](#ref-BM2017a)). They estimated that OpenStreetMap was about 83% complete worldwide in 2017, with a fully mapped street network in more than 40% of countries, several in the developing world. Well-governed countries with good internet access tended to be more complete, and completeness had a U-shaped relationship with population density: sparsely populated areas and dense cities were the best mapped.

## References

<a id="ref-BM2017a"></a>Barrington-Leigh, C. and Millard-Ball, A. (2017). The world's user-generated road map is more than 80% complete. *PLOS ONE*, 12(8), e0180698. [doi:10.1371/journal.pone.0180698](https://doi.org/10.1371/journal.pone.0180698)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-OSMWC2026a"></a>OpenStreetMap Wiki contributors (2026). PBF Format. [wiki.openstreetmap.org/wiki/PBF_Format](https://wiki.openstreetmap.org/wiki/PBF_Format)

## See Also
- [Street Networks](street-networks.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
