# OpenStreetMap Tags

## What a Tag Is

Tags are attributes of OpenStreetMap's elements, nodes, ways and relations, that describe the properties of the features they represent: a tag consists of a key and a value, separated by an equals sign, both free-format text ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026c)). An element may have any number of tags, but each key only once: an element cannot be both amenity=restaurant and amenity=bar ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026d)). Keys and values are Unicode strings of up to 255 characters. The Overpass API and Geofabrik Full Extract tabs of the OpenStreetMap Data panel keep every tag of each feature, as JSON in the column tags.

## Keys and Values

The key describes a topic, category or type of feature, such as highway or name, and can be qualified with prefixes or suffixes, usually separated by a colon, to form namespaces, such as name:de or maxspeed:forward ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026c)). The value gives detail: free-form text, as in name=Park Avenue; one of a set of distinct values, as in highway=motorway; several values separated by semicolons; or a number, as in maxspeed=50, where km/h is implied. The Tag input of the OpenStreetMap Data panel takes key=value, or a key alone for every value of the key.

## No Fixed Dictionary

There is no fixed dictionary of tags, but there are conventions documented on the OpenStreetMap wiki, starting with its Map Features page ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026d)). In some cases there are competing views of what tags mean, or mappers use them in different ways; as of May 2026, OpenStreetMap contained over 100 thousand distinct keys and over 190 million distinct tags ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026c)). Taginfo measures the use of tags, including those not documented, and when there is more than one way to tag a feature, the wiki suggests the most common. Counts by Value in the OpenStreetMap Data panel shows the values of the key read, and Tag Completeness the other tags the features carry.

## Untagged Elements

Not all elements have tags: nodes are often untagged when they are part of ways, and ways and nodes may be untagged when they are members of a relation ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026d)). The nodes of a way define its shape, and only some of them carry tags of their own, such as highway=traffic_signals on a road. GDAL's OSM driver puts in its points layer only the nodes that have significant tags ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026b)).

## Tags With Columns of Their Own

GDAL's OSM driver writes the tags its configuration file osmconf.ini names for a layer as columns of their own, such as name, highway and building, and every other tag in the field other_tags, which the open option TAGS_FORMAT=JSON writes as JSON ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026b)). The Overpass API and Geofabrik Full Extract tabs of the OpenStreetMap Data panel merge both into one JSON object per feature, so the column tags holds every tag of the element whatever its layer.

## Tags in Geofabrik's Layers

Geofabrik's layers replace the tags with a class: each feature has a four-digit code and its class name, fclass, which carry the same information, and the tags that decide the class are listed for each class in Geofabrik's documentation ([Reichert and Ramm (2026)](#ref-RR2026a)). A point of interest tagged amenity=school, for instance, has the class school. The value column of the Geofabrik Layers tab of the OpenStreetMap Data panel holds fclass.

## References

<a id="ref-GDALOGRC2026b"></a>GDAL/OGR Contributors (2026). OSM: OpenStreetMap XML and PBF. [gdal.org/en/stable/drivers/vector/osm.html](https://gdal.org/en/stable/drivers/vector/osm.html)

<a id="ref-OSMWC2026d"></a>OpenStreetMap Wiki contributors (2026). Elements. [wiki.openstreetmap.org/wiki/Elements](https://wiki.openstreetmap.org/wiki/Elements)

<a id="ref-OSMWC2026c"></a>OpenStreetMap Wiki contributors (2026). Tags. [wiki.openstreetmap.org/wiki/Tags](https://wiki.openstreetmap.org/wiki/Tags)

<a id="ref-RR2026a"></a>Reichert, M. and Ramm, F. (2026). OpenStreetMap Data in Layered GIS Format: Free Shapefiles and GeoPackages. Geofabrik, version of 2026-04-02. [download.geofabrik.de/osm-data-in-gis-formats-free.pdf](https://download.geofabrik.de/osm-data-in-gis-formats-free.pdf)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overpass API and Overpass QL](overpass-api-and-overpass-ql.md) · [Geofabrik Downloads](geofabrik-downloads.md) · [Licence and Attribution](licence-and-attribution.md)
