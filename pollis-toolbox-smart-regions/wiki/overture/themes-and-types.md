# Themes and Types

## The Six Themes of Overture

An Overture release is organised in themes, each with one or more feature types: addresses (address); base (bathymetry, infrastructure, land, land cover, land use and water); buildings (building and building part); divisions (division, division area and division boundary); places (place); and transportation (segment and connector) ([Overture Maps Foundation (2026)](#ref-OMF2026a)). The files of a release are partitioned by theme and type, as theme=places/type=place, and every feature carries the columns id, geometry, bbox, version and sources besides those of its type.

## Places

A place is a point for a concrete, physically identifiable, stationary destination in a publicly observable space: a school, a business, a hospital, a landmark ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Places are classified by the Overture Place Categories taxonomy, of about 2,300 categories with broader and narrower relationships, in the columns taxonomy and basic_category; the older column categories was removed in September 2026. Each place has a confidence between 0 and 1 that it exists, names, and where known addresses, websites, phones, a brand and an operating status. The Places tab of the Overture Maps panel reads the type place.

## Buildings

A building is the outermost footprint of a building, or the roofprint when traced from satellite or aerial imagery; a building part is one part of a building, linked to it by building_id, and a building with parts has has_parts true ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Buildings may carry a subtype and class, height, number of floors, and roof and facade properties. The Buildings tab of the Overture Maps panel reads the type building and adds each footprint's area in square metres.

## Transportation

The transportation theme models roads, railways and waterways as segments, LineStrings along the centre line of a path, joined at connectors, points where two or more segments meet ([Overture Maps Foundation (2026)](#ref-OMF2026a)). A segment's subtype is road, rail or water, and roads and railways have a class, such as residential or primary; a change of class splits a road into two segments. Each segment lists its connectors with a linear reference, at, from 0 at its start to 1 at its end, and many properties, such as speed limits or surfaces, apply to a range of the segment given the same way. The Transportation tab of the Overture Maps panel reads the type segment of the Network chosen.

## Divisions

A division is an official or non-official organisation of people, such as a country, region, county, city or neighbourhood, as seen from a given political perspective, with a point for its usual location ([Overture Maps Foundation (2026)](#ref-OMF2026a)). A division area is the polygon of its land, or of its land and territorial sea, and a division boundary the line of a border shared by two divisions. The subtype gives the level, from country and region through county and locality to macrohood, neighborhood and microhood. The Divisions tab of the Overture Maps panel reads the type division_area of the Subtype chosen.

## Addresses

The addresses theme holds address points, with street, number, unit, postcode, postal city and a list of address levels such as a municipality or region ([Overture Maps Foundation (2026)](#ref-OMF2026a)). Its data come from national and regional address registers and other open sources, each under its own open licence. The Addresses tab of the Overture Maps panel reads the type address.

## References

<a id="ref-OMF2026a"></a>Overture Maps Foundation (2026). Overture Maps Documentation. [docs.overturemaps.org](https://docs.overturemaps.org/)

## See Also
- [Overview](overview.md) · [Sources and Licences](sources-and-licences.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
