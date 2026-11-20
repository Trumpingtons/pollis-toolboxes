# Diagnostics

## The Coordinate System of a City Model

CityGML is a 3D standard, so its geometries are associated with a 3D coordinate system, named by the srsName attribute ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). A geometry without srsName takes the coordinate system of its context, and the srsName of the Envelope that bounds a feature or a collection is inherited by the geometries in it. A CityGML file may therefore record its coordinate system once, on the envelope of the whole model. A CityJSON file gives one coordinate system for all its objects, as a URL of the form `https://www.opengis.net/def/crs/EPSG/0/7415` in metadata.referenceSystem, which should be a 3D one ([Ledoux and Dukai (2024)](#ref-LD2024a)). The CityGML tab recognises an EPSG code in the srsName, and the names of the German surveying authorities, such as `urn:adv:crs:ETRS89_UTM33*DE_DHHN2016_NH` for ETRS89 / UTM zone 33N. When a file records none, or a name of another kind, the File Coordinate System input of the City Model Files panel gives it.

## Objects Without Geometry

File Contents and Geometry Check of the City Model Files panel count the objects without geometry. In CityGML, from LoD2, the facade of a building is divided into boundary surfaces, WallSurface, RoofSurface and GroundSurface among them, each with its own geometry ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). The CityGML tab reads these, and the geometry of building parts, as part of the building. A geometry property given only as xlink:href references to polygons holds none of its own, so the tab reads the polygons where they are written. In CityJSON, a city object may have no geometry member, or an empty one, and its children, such as the parts of a building, may carry the geometry instead ([Ledoux and Dukai (2024)](#ref-LD2024a)).

## Solids, Surfaces and Their Faces

The City Model Files panel reads every geometry as a MultiPolygon Z, one polygon per planar face, whatever its type in the file: a solid's shell, a composite surface or a multi-surface. Geometry Check counts, for each object, its faces, how many are vertical walls, whose area in plan is zero, and how many have an area in plan: floors, roofs and slopes. An object whose faces are all vertical has no footprint, which Geometry Check reports. A block in LoD1 has six faces, four walls, a floor and a roof; LoD2 buildings, with their differentiated roof structures, have more ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). Polygons are kept as the file gives them, so faces are not checked for planarity or closure.

## Comparing the Measured Height With the Geometry

CityGML 2.0 gives buildings a measuredHeight attribute, beside the geometry, and a number and heights of storeys ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). Heights Side by Side in the City Model Files panel prints, for each object, measuredHeight beside the height of its geometry, from its lowest to its highest point, and their difference. The two need not agree: the attribute may come from a cadastre and the geometry from another survey, and the geometric height includes everything the geometry has, from the ground surface to the highest point of the roof. A large difference points to a wrong attribute, a geometry at another level of detail, or a unit that is not metres.

## Attributes and Their Types

The CityGML tab reads as attributes the elements of a city object that hold text only, such as function or measuredHeight, and the generic attributes of CityGML 2.0 and 3.0, each with its name and value ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). XML carries no types, so the values are kept as text, and SQL casts them where a number is needed, as Heights Side by Side does with `TRY_CAST`. In CityJSON, the attributes of an object are a JSON object whose members are not prescribed, so a file may have any attributes ([Ledoux and Dukai (2024)](#ref-LD2024a)). Both tabs keep the attributes as JSON in the column `attributes`, and Attribute Summary counts how many objects have each.

## References

<a id="ref-LD2024a"></a>Ledoux, H. and Dukai, B. (2024). CityJSON Specifications 2.0.1. [cityjson.org/specs/2.0.1](https://www.cityjson.org/specs/2.0.1/)

<a id="ref-OGC2012a"></a>Open Geospatial Consortium (2012). OGC City Geography Markup Language (CityGML) Encoding Standard, Version 2.0.0 (OGC 12-019). [docs.ogc.org/is/12-019/12-019.pdf](https://docs.ogc.org/is/12-019/12-019.pdf)

## See Also
- [Factsheet](factsheet.md) · [CityGML](citygml.md) · [CityJSON](cityjson.md) · [Measuring Buildings](measuring-buildings.md) · [Levels of Detail](levels-of-detail.md)
