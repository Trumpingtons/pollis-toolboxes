# Geofabrik Downloads

## Geofabrik's Download Server

Geofabrik's free download server has extracts of OpenStreetMap data, normally updated every day, offered free of charge by Geofabrik GmbH ([Geofabrik (2026)](#ref-Geo2026a)). The data is organised by region: the root has a file for each continent, and every continent but Antarctica has files for its countries; some countries have files for their administrative subdivisions, such as all the Bundesländer of Germany, all the counties of England and the historic départements of France. Once a day, around 21:00 CET, Geofabrik updates its copy of the planet file and splits it into the regions, cutting with polygons that follow country borders with a buffer, and keeps the ways and multipolygon relations that cross a border complete.

## The JSON Index of Regions

Geofabrik publishes a machine-readable list of all its files, index-v1.json, and a smaller one without the boundary geometries, index-v1-nogeom.json ([Geofabrik (2026)](#ref-Geo2026a)). Each region in it has an id, made of letters, digits and possibly - and /; the id of its parent, the next larger extract that contains it; its name; and links to its files, among them pbf, the latest .osm.pbf file, and shp, the latest shape file. Geofabrik says that the structure of the index will remain stable, and that a change would come under a new version number. The Geofabrik tabs of the OpenStreetMap Data panel read this index to find the files of the Region input.

## The .osm.pbf Files

Geofabrik's .osm.pbf files are pure, un-filtered OpenStreetMap data, with all the data and metadata available in OpenStreetMap for the region, but without its history ([Geofabrik (2026)](#ref-Geo2026a)); on the public server, they do not contain the user names, user ids and changeset ids of the elements, which are treated as personal data. PBF is the binary format of OpenStreetMap data, smaller and faster to read than its XML format ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026a)). The Geofabrik Full Extract tab of the OpenStreetMap Data panel reads the region's .osm.pbf with GDAL's OSM driver, which reconstructs points, lines and polygons and is slow for files of more than a few megabytes ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026b)).

## The Layers: Shape Files and GeoPackages

Geofabrik's shape files are not complete: Geofabrik has made a selection of features and attributes, in layers such as the road and railway network, forests, water areas and many points of interest, and offers them only for smaller areas ([Geofabrik (2026)](#ref-Geo2026a)). The same layers come as GeoPackages. Reichert and Ramm describe the mapping: coordinates in WGS 84 (EPSG:4326), strings in UTF-8, and, in most layers, the columns osm_id, code, a four-digit code of the feature class, fclass, the class name, and name, the name in OpenStreetMap's name tag ([Reichert and Ramm (2026)](#ref-RR2026a)). Layers of features drawn as areas have the suffix _a. The Geofabrik Layers tab of the OpenStreetMap Data panel reads the GeoPackage of the region, without unpacking its zip file.

## Why the Layers Have Fewer Tags

The mapping from OpenStreetMap to GIS layers is not an exact science: OpenStreetMap's rules on how to map features are often not well defined, and the mapping Reichert and Ramm describe is one general-use mapping of basic features among many possible ones ([Reichert and Ramm (2026)](#ref-RR2026a)). Each layer keeps the common columns and a few of its own, such as the population of places; other tags are left out. The Geofabrik Full Extract tab of the OpenStreetMap Data panel reads the .osm.pbf instead, with every tag of each feature.

## Older Files

Geofabrik keeps files of 1 January of each year on its download server, as .osm.pbf or shape files, listed in the raw directory index of each region ([Ramm (2024)](#ref-Ram2024a)). When Geofabrik has split a country into smaller regions at some point, older files may exist only for the whole country. Then and Now in the Geofabrik tabs of the OpenStreetMap Data panel reads the file of 1 January of the Earlier Year, the .osm.pbf for the Full Extract and the shape file for the Layers, and lists the years the region has when the year chosen is missing.

## What Older Files Show

Ramm notes that an OpenStreetMap data set of a date tells what OpenStreetMap knew about the world at that time, and not what the world was like: a building that has stood for 100 years but was added to OpenStreetMap in 2020 is missing from the data set of 2018 ([Ramm (2024)](#ref-Ram2024a)). OpenStreetMap had about 450,000 building objects in Spain in 2014 and about 4.5 million ten years later, which only means that OpenStreetMap was much smaller in 2014. OpenStreetMap began in 2004, and the licence change of 2012 removed some data, so Ramm does not recommend going back further than 2012 for most uses.

## References

<a id="ref-GDALOGRC2026b"></a>GDAL/OGR Contributors (2026). OSM: OpenStreetMap XML and PBF. [gdal.org/en/stable/drivers/vector/osm.html](https://gdal.org/en/stable/drivers/vector/osm.html)

<a id="ref-Geo2026a"></a>Geofabrik (2026). Geofabrik Download Server: OpenStreetMap Data Extracts. [download.geofabrik.de](https://download.geofabrik.de/)

<a id="ref-OSMWC2026a"></a>OpenStreetMap Wiki contributors (2026). PBF Format. [wiki.openstreetmap.org/wiki/PBF_Format](https://wiki.openstreetmap.org/wiki/PBF_Format)

<a id="ref-Ram2024a"></a>Ramm, F. (2024). Historic OpenStreetMap data. Geofabrik blog. [blog.geofabrik.de/index.php/2024/11/13/historic-openstreetmap-data](https://blog.geofabrik.de/index.php/2024/11/13/historic-openstreetmap-data/)

<a id="ref-RR2026a"></a>Reichert, M. and Ramm, F. (2026). OpenStreetMap Data in Layered GIS Format: Free Shapefiles and GeoPackages. Geofabrik, version of 2026-04-02. [download.geofabrik.de/osm-data-in-gis-formats-free.pdf](https://download.geofabrik.de/osm-data-in-gis-formats-free.pdf)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overpass API and Overpass QL](overpass-api-and-overpass-ql.md) · [OpenStreetMap Tags](openstreetmap-tags.md) · [Licence and Attribution](licence-and-attribution.md)
