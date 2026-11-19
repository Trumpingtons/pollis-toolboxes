# Overview

## What OpenStreetMap Is

OpenStreetMap is a knowledge collective that provides user-generated street maps: it follows the peer production model that created Wikipedia, and aims at map data that is free to use, editable and licensed under new copyright schemes ([Haklay and Weber (2008)](#ref-HW2008a)). Many contributors edit the world map collaboratively, a core group of volunteers maintains its servers and software, and a community of developers writes tools that make its data available for further use. OpenStreetMap is a database of features with their coordinates and descriptions; maps are drawn from it.

## Nodes, Ways and Relations

Elements are the basic components of OpenStreetMap's data model, of three types: nodes, which define points in space; ways, which define linear features and area boundaries; and relations, which define how other elements work together ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026d)). A node has an id and a latitude and longitude in WGS 84. A way is an ordered list of between 1 and 2,000 nodes; when its first and last nodes are the same, it is a closed way, which may be an area such as a building, or a loop such as a roundabout. Areas with holes, or with boundaries of more than 2,000 nodes, are multipolygon relations. Each element type has its own id space, so a node and a way may have the same id.

## Tags

Every element can have tags, which describe its meaning: a tag is a key and a value, both free-format text, such as highway=residential ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026d)). There is no fixed dictionary of tags, but there are conventions documented on the OpenStreetMap wiki. The Overpass API and Geofabrik Full Extract tabs of the OpenStreetMap Data panel select features by a tag, or by a key for every value of it.

## Where OpenStreetMap Data Can Be Downloaded

The Overpass API is a database engine to query the OpenStreetMap data ([Olbricht (2026)](#ref-Olb2026a)): it returns the elements that match a query, in an area or worldwide, as OpenStreetMap holds them now or at an earlier date. Geofabrik's free download server has extracts of OpenStreetMap by continent, country and, for some countries, their subdivisions, normally updated every day ([Geofabrik (2026)](#ref-Geo2026a)): .osm.pbf files with all the data of a region, and, for smaller regions, shape files and GeoPackages with a selection of layers. The OpenStreetMap Data panel has one tab for each: Overpass API, Geofabrik Layers and Geofabrik Full Extract.

## How Complete OpenStreetMap Is

Haklay compared OpenStreetMap with Ordnance Survey datasets for London and England, where the project started in August 2004, and found its information fairly accurate: on average within about 6 m of the position recorded by Ordnance Survey, with about 80% overlap of motorway objects; in four years, OpenStreetMap had captured about 29% of the area of England ([Haklay (2010)](#ref-Hak2010a)). Barrington-Leigh and Millard-Ball assessed the completeness of OpenStreetMap's roads in every country and estimated it at about 83% worldwide, with more than 40% of countries having a fully mapped street network ([Barrington-Leigh and Millard-Ball (2017)](#ref-BM2017a)). Completeness differs by feature and by place; Tag Completeness and Then and Now in the OpenStreetMap Data panel show what the features read carry and how they have grown.

## Other Tools for OpenStreetMap Data

In Python, OSMnx downloads political boundaries, building footprints and street networks from OpenStreetMap, corrects the topology of the networks, and saves and analyses them ([Boeing (2017)](#ref-Boe2017a)). GDAL's OSM driver reads .osm and .pbf files into points, lines and polygons, and is recommended for importing small extracts into a GIS format such as GeoPackage ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026b)). The OpenStreetMap Data panel reads OpenStreetMap's data in Julia with DuckDB and GDAL, and saves it as GeoPackage or GeoParquet ([Raasveldt and Mühleisen (2026)](#ref-RM2026a)).

## References

<a id="ref-BM2017a"></a>Barrington-Leigh, C. and Millard-Ball, A. (2017). The world's user-generated road map is more than 80% complete. *PLOS ONE*, 12(8), e0180698. [doi:10.1371/journal.pone.0180698](https://doi.org/10.1371/journal.pone.0180698)

<a id="ref-Boe2017a"></a>Boeing, G. (2017). OSMnx: new methods for acquiring, constructing, analyzing, and visualizing complex street networks. *Computers, Environment and Urban Systems*, 65, 126–139. [doi:10.1016/j.compenvurbsys.2017.05.004](https://doi.org/10.1016/j.compenvurbsys.2017.05.004)

<a id="ref-GDALOGRC2026b"></a>GDAL/OGR Contributors (2026). OSM: OpenStreetMap XML and PBF. [gdal.org/en/stable/drivers/vector/osm.html](https://gdal.org/en/stable/drivers/vector/osm.html)

<a id="ref-Geo2026a"></a>Geofabrik (2026). Geofabrik Download Server: OpenStreetMap Data Extracts. [download.geofabrik.de](https://download.geofabrik.de/)

<a id="ref-Hak2010a"></a>Haklay, M. (2010). How good is volunteered geographical information? A comparative study of OpenStreetMap and Ordnance Survey datasets. *Environment and Planning B: Planning and Design*, 37(4), 682–703. [doi:10.1068/b35097](https://doi.org/10.1068/b35097)

<a id="ref-HW2008a"></a>Haklay, M. and Weber, P. (2008). OpenStreetMap: user-generated street maps. *IEEE Pervasive Computing*, 7(4), 12–18. [doi:10.1109/MPRV.2008.80](https://doi.org/10.1109/MPRV.2008.80)

<a id="ref-Olb2026a"></a>Olbricht, R. (2026). Overpass API. Software, version 0.7.62, AGPL-3.0. [github.com/drolbr/Overpass-API](https://github.com/drolbr/Overpass-API)

<a id="ref-OSMWC2026d"></a>OpenStreetMap Wiki contributors (2026). Elements. [wiki.openstreetmap.org/wiki/Elements](https://wiki.openstreetmap.org/wiki/Elements)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Factsheet](factsheet.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overpass API and Overpass QL](overpass-api-and-overpass-ql.md) · [Geofabrik Downloads](geofabrik-downloads.md) · [OpenStreetMap Tags](openstreetmap-tags.md) · [Licence and Attribution](licence-and-attribution.md)
