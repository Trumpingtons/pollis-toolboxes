# Levels of Detail

## The Five Levels of Detail of CityGML 2.0

CityGML 2.0 defines five levels of detail, LoD0 to LoD4 ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). LoD0 is essentially a two-and-a-half-dimensional terrain model, on which buildings can be footprint or roof edge polygons. LoD1 is the blocks model, buildings as prisms with flat roofs. A building in LoD2 has differentiated roof structures and thematic boundary surfaces. LoD3 is the architectural model, with detailed walls and roofs and possibly doors and windows. LoD4 adds the interior: rooms, interior doors, stairs and furniture. The levels reflect separate ways of collecting data for different applications, and make visualisation and analysis efficient at each scale.

## How Accurate Is Each Level of Detail?

The CityGML 2.0 standard proposes an accuracy and a smallest object for each level of detail, as figures for discussion rather than requirements ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). In LoD1, positions and heights should be accurate to 5 m or less, and objects with a footprint of at least 6 m by 6 m should be included. LoD2 is proposed at 2 m or better, with objects of at least 4 m by 4 m. LoD3 should be accurate to 0.5 m, with a smallest footprint of 2 m by 2 m, and LoD4 to 0.2 m or less. The standard suggests these figures can be used to assess the quality of 3D city model datasets and make them comparable.

## Buildings at Each Level of Detail

In the building model of CityGML 2.0, an LoD0 building is a set of horizontal 3D surfaces, its footprint, usually at the lowest elevation of the ground, and separately its roof edge ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). In LoD1, it is a generalised geometry of the outer shell. LoD2 refines that shell with further surfaces and curves for details such as roof overhangs, columns or antennas, and divides the facade into boundary surfaces: WallSurface, RoofSurface, GroundSurface, OuterFloorSurface, OuterCeilingSurface and ClosureSurface. From LoD3, openings in the boundary surfaces, doors and windows, are objects of their own, and LoD4 adds rooms.

## Several Levels of Detail in One Dataset

In a CityGML dataset, the same object may be represented at several levels of detail at once, so it can be analysed and shown at different resolutions ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). In CityJSON, an object's geometry member is an array of geometry objects, and more than one is used to represent several levels of detail of the same object; the geometries of an object need not all be of different levels ([Ledoux and Dukai (2024)](#ref-LD2024a)). File Contents in the City Model Files panel lists, for each type of object, the levels of detail its geometries have, and the Level of Detail input keeps the highest or the lowest of each object.

## Refined Levels of Detail: LoD1.2, LoD2.2

Biljecki, Ledoux and Stoter proposed an improved specification of levels of detail for 3D building models, which divides each of the levels of CityGML into finer ones ([Biljecki, Ledoux and Stoter (2016)](#ref-BLS2016a)). CityJSON writes a geometry's level of detail as a string, either a single digit following the CityGML standards, or a value of the form "X.Y" when these improved levels from TU Delft are used ([Ledoux and Dukai (2024)](#ref-LD2024a)). The CityJSON tab of the City Model Files panel orders levels of detail as numbers, so "2.2" counts as higher than "2" and "1.3" as higher than "1.2".

## Levels of Detail in CityGML 3.0

CityGML 3.0 revises the level-of-detail concept of CityGML 2.0, together with a new space concept, building units and storeys, and city objects represented by point clouds ([Kutzner, Chaturvedi and Kolbe (2020)](#ref-KCK2020a)). CityJSON 2.0 implements part of the CityGML 3.0 data model ([Ledoux and Dukai (2024)](#ref-LD2024a)). In all versions, geometry properties carry the level in their names, such as lod2MultiSurface, and the CityGML tab of the City Model Files panel reads the level from these names; File Contents prints the namespace of a CityGML file, which gives its version.

## References

<a id="ref-BLS2016a"></a>Biljecki, F., Ledoux, H. and Stoter, J. (2016). An improved LOD specification for 3D building models. *Computers, Environment and Urban Systems*, 59, 25–37. [doi:10.1016/j.compenvurbsys.2016.04.005](https://doi.org/10.1016/j.compenvurbsys.2016.04.005)

<a id="ref-KCK2020a"></a>Kutzner, T., Chaturvedi, K. and Kolbe, T. H. (2020). CityGML 3.0: new functions open up new applications. *PFG – Journal of Photogrammetry, Remote Sensing and Geoinformation Science*, 88(1), 43–61. [doi:10.1007/s41064-020-00095-z](https://doi.org/10.1007/s41064-020-00095-z)

<a id="ref-LD2024a"></a>Ledoux, H. and Dukai, B. (2024). CityJSON Specifications 2.0.1. [cityjson.org/specs/2.0.1](https://www.cityjson.org/specs/2.0.1/)

<a id="ref-OGC2012a"></a>Open Geospatial Consortium (2012). OGC City Geography Markup Language (CityGML) Encoding Standard, Version 2.0.0 (OGC 12-019). [docs.ogc.org/is/12-019/12-019.pdf](https://docs.ogc.org/is/12-019/12-019.pdf)

## See Also
- [Overview](overview.md) · [Measuring Buildings](measuring-buildings.md) · [Decision Guide](decision-guide.md) · [CityGML](citygml.md) · [CityJSON](cityjson.md)
