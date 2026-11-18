# Measuring Buildings

## The Footprint of a Building From Its Faces

Building Measures in the City Model Files panel computes a footprint from the faces of an object's geometry, in SQL with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). `ST_Dump` splits the MultiPolygon Z into its faces, `ST_Force2D` drops their heights, and faces whose area in plan is zero, the vertical walls, are left out. `ST_Union_Agg` unites the rest, floors, roofs and slopes, into one polygon: the outline of the building in plan. For a block in LoD1, the footprint is the floor; for a building in LoD2, it is the outline of its ground surface and roof planes together, so a roof overhang widens it.

## The Footprint in LoD0

In CityGML 2.0, a building in LoD0 can be represented by horizontal 3D surfaces: its footprint, usually at the lowest elevation of the ground surface, and separately its roof edge, at roof level ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). The standard notes that cadastral data typically depict the footprint and topographic data often mix footprints and roof edges. When the Level of Detail input keeps an object's LoD0 geometry, Building Measures unites footprint and roof edge into one outline, and the height is the difference between their levels, or zero for a footprint alone.

## The Height of a Building From Its Geometry

Building Measures takes as the height of an object the difference between the highest and the lowest point of its geometry, `ST_ZMax` minus `ST_ZMin` ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). For an LoD1 block, that is the height of the prism. For an LoD2 building, it runs from the lowest point of the ground surface to the ridge, the highest point of the roof. CityGML 2.0 also gives buildings a measuredHeight attribute and the heights of their storeys ([Open Geospatial Consortium (2012)](#ref-OGC2012a)), which Heights Side by Side compares with the height of the geometry. On sloping ground, the lowest point of the geometry is on the downhill side, and the height counts from there.

## The Volume of a Prism

The prism volume of Building Measures is the footprint area times the height. For an LoD1 block, a prism with a flat roof by definition, it is the volume of the block ([Open Geospatial Consortium (2012)](#ref-OGC2012a)). For an LoD2 building with a pitched roof, the prism reaches the ridge everywhere, so it is larger than the volume under the roof: a gabled building whose walls reach 20 m and whose ridge reaches 24.5 m has a prism volume of the footprint times 24.5 m, and a true volume of the footprint times 20 m plus the roof's triangular prism. A volume of the closed solid itself needs a valid, closed shell.

## Areas and Volumes in the Units of the Coordinate System

Areas and volumes are computed in the coordinates of the file, so they are square and cubic metres only in a projected coordinate system whose units are metres. CityGML geometries are given in a 3D coordinate system, named by an srsName, and a CityJSON file gives one coordinate system for all its objects, in metadata.referenceSystem ([Open Geospatial Consortium (2012)](#ref-OGC2012a); [Ledoux and Dukai (2024)](#ref-LD2024a)). Show on a Map transforms footprints to longitude and latitude for the base map only; Building Measures and the saved files keep the coordinates of the file. The totals at the end of Building Measures sum the footprints and prism volumes of every object of the class read.

## Uses of Building Measures

Footprints, heights and volumes are among the measures that 3D city models serve, beyond visualisation, in the use cases and applications that Biljecki, Stoter, Ledoux, Zlatanova and Çöltekin inventoried: at least 29 use cases, part of more than 100 applications ([Biljecki, Stoter, Ledoux, Zlatanova and Çöltekin (2015)](#ref-BSLZC2015a)). Save Footprints as GeoPackage writes footprints with height and area for other tools, and the Geospatial Vector Files panel of the Smart Regions Toolbox can then join them with census areas or parcels. Measures from LoD2 differ from those of LoD1 for the same building, so measures compared across a model should come from one level of detail.

## References

<a id="ref-BSLZC2015a"></a>Biljecki, F., Stoter, J., Ledoux, H., Zlatanova, S. and Çöltekin, A. (2015). Applications of 3D city models: state of the art review. *ISPRS International Journal of Geo-Information*, 4(4), 2842–2889. [doi:10.3390/ijgi4042842](https://doi.org/10.3390/ijgi4042842)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-LD2024a"></a>Ledoux, H. and Dukai, B. (2024). CityJSON Specifications 2.0.1. [cityjson.org/specs/2.0.1](https://www.cityjson.org/specs/2.0.1/)

<a id="ref-OGC2012a"></a>Open Geospatial Consortium (2012). OGC City Geography Markup Language (CityGML) Encoding Standard, Version 2.0.0 (OGC 12-019). [docs.ogc.org/is/12-019/12-019.pdf](https://docs.ogc.org/is/12-019/12-019.pdf)

## See Also
- [Levels of Detail](levels-of-detail.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Factsheet](factsheet.md)
