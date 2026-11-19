# Overpass API and Overpass QL

## What the Overpass API Is

The Overpass API is a database engine to query the OpenStreetMap data, written by Roland Olbricht and distributed under the AGPL-3.0 ([Olbricht (2026)](#ref-Olb2026a)). Public instances answer queries for anyone, and anyone can run an instance of their own; its manual says that one of the project's goals is to make running one's own instance really simple ([Olbricht (2026)](#ref-Olb2026b)). The Server input of the Overpass API tab of the OpenStreetMap Data panel takes the address of any instance, by default the public one at overpass-api.de.

## Overpass QL Queries

Overpass QL is the query language of the Overpass API: a query is a sequence of statements, and the query statement consists of a type specifier, node, way, relation or nwr (nodes, ways or relations), followed by one or more filters, such as a tag and a bounding box; its result is the set of elements that match all the filters ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026b)). A bounding box is written as south, west, north, east, in decimal degrees. The Overpass API tab of the OpenStreetMap Data panel sends one query statement, nwr with the tag of the Tag input in the bounding box of the Area input, given there as west, south, east, north.

## Recursing Down to the Nodes

A way refers to its nodes, and a relation to its members, without their coordinates. The recurse down statement of Overpass QL, written >, returns the nodes of the ways in its input set, the nodes and ways that are members of its relations, and the nodes of those ways; the idiom (._; >;); joins the input set with that result ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026b)). The Overpass API tab of the OpenStreetMap Data panel adds it to its query, so that GDAL's OSM driver can build the geometry of every way and relation selected, and then keeps only the features with the tag.

## Timeout and Memory

The timeout setting of Overpass QL gives the maximum run time of a query in seconds, 180 by default; a query that runs longer may be aborted, and the higher the value, the more likely the server is to refuse the query before running it ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026b)). The maxsize setting gives the maximum memory, 512 MB by default. The public instances admit a query only if both take at most half of the resources still available, and answer HTTP status 504 otherwise ([Olbricht (2026)](#ref-Olb2026b)). The Overpass API tab of the OpenStreetMap Data panel sets [timeout:180]; a large area or a common tag may need a smaller area.

## Rate Limits of the Public Instances

The Overpass API's manual describes the public instances as shared by about 30,000 daily users, with two servers behind overpass-api.de, each able to answer about a million requests a day ([Olbricht (2026)](#ref-Olb2026b)). Each request occupies one of its user's slots for its run time and a cool-down time that grows with the server's load; a request waits up to 15 seconds for a free slot, and is refused with HTTP status 429 otherwise. As a broad guideline, users are expected to send at most about 10,000 requests a day and to download less than about 1 GB a day; above that, the manual recommends running one's own instance. When all its workers are busy, the public instance answers with HTTP status 502 and asks clients to retry with exponential backoff. The Overpass API tab of the OpenStreetMap Data panel retries up to five times, waiting twice as long each time.

## Querying an Earlier Date

The date setting of Overpass QL, as [date:"2015-10-28T19:20:00Z"], runs the query against attic data, the OpenStreetMap database as of the date given ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026b)). There is no attic data earlier than 2012-09-12T06:55:00Z, the first change included in the ODbL-compliant planet file; an earlier date returns the database as of that moment. Then and Now in the Overpass API tab of the OpenStreetMap Data panel runs the same query with the Earlier Date input at midnight UTC.

## Output Formats

The out setting of Overpass QL chooses the format of the answer, such as XML, JSON or CSV ([OpenStreetMap Wiki contributors (2026)](#ref-OSMWC2026b)). The Overpass API tab of the OpenStreetMap Data panel asks for OpenStreetMap XML, [out:xml], which GDAL's OSM driver reads into points, lines and polygons ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026b)).

## References

<a id="ref-GDALOGRC2026b"></a>GDAL/OGR Contributors (2026). OSM: OpenStreetMap XML and PBF. [gdal.org/en/stable/drivers/vector/osm.html](https://gdal.org/en/stable/drivers/vector/osm.html)

<a id="ref-Olb2026a"></a>Olbricht, R. (2026). Overpass API. Software, version 0.7.62, AGPL-3.0. [github.com/drolbr/Overpass-API](https://github.com/drolbr/Overpass-API)

<a id="ref-Olb2026b"></a>Olbricht, R. (2026). Overpass API User's Manual. [dev.overpass-api.de/overpass-doc/en](https://dev.overpass-api.de/overpass-doc/en/)

<a id="ref-OSMWC2026b"></a>OpenStreetMap Wiki contributors (2026). Overpass API/Overpass QL. [wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Geofabrik Downloads](geofabrik-downloads.md) · [OpenStreetMap Tags](openstreetmap-tags.md) · [Licence and Attribution](licence-and-attribution.md)
