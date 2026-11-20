# Copernicus Imagery Layers — Decision Guide

## Which Tab of the Copernicus Imagery Layers Panel to Use

| Question | Tab | Why |
|---|---|---|
| What does the place look like from above? | Sentinel-2 Mosaic | A picture of the ground in one year, without clouds ([EOX IT Services GmbH (2026)](#ref-EOX2026a)) |
| What was here before? | Sentinel-2 Mosaic or CORINE Land Cover | Mosaics from 2016, CORINE from 1990 |
| Is this land urban, farmed, wooded or wet? | CORINE Land Cover | 44 classes of land cover and land use ([European Environment Agency (2019)](#ref-EEA2019a)) |
| How much of the soil is sealed? | High-Resolution, Imperviousness Density | Sealing from 0 to 100 % in each 10 m pixel ([European Environment Agency (2020)](#ref-EEA2020a)) |
| How much tree cover is there? | High-Resolution, Tree Cover Density | Crown cover from 0 to 100 % in each 10 m pixel ([European Environment Agency (2020)](#ref-EEA2020b)) |
| Where is grassland, water or wet ground? | High-Resolution, Grassland or Water and Wetness | Classes at 10 m ([European Environment Agency (2020)](#ref-EEA2020c); [European Environment Agency (2020)](#ref-EEA2020d)) |

## Drawing a Layer or Downloading Its Data

A tile is a picture the service draws: it shows where the land is of one kind or another, but its colours are not the data. To count, measure or model, the data behind the picture must be fetched. The query operation of the CORINE map services returns the polygons themselves, which Land Cover Shares measures and Save the Polygons writes to a GeoPackage ([Esri (2026)](#ref-Esr2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). The exportImage operation of the High-Resolution Layers returns the 10 m values as a GeoTIFF, which Summary of the Box reads with ArchGDAL.jl and Save the Values keeps ([Ng (2026)](#ref-Ng2026a)). The Sentinel-2 mosaics are pictures in colour: Save as GeoTIFF keeps one with its coordinates, for a map, not for the bands of Sentinel-2, which the Copernicus Data Space Ecosystem panel reads ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

## Measuring Areas from Copernicus Imagery Layers

Web maps are drawn in Web Mercator, which enlarges areas more and more away from the equator, so areas must never be read from the screen. Land Cover Shares cuts the CORINE polygons to the box and measures them in EPSG:3035, the Lambert azimuthal equal-area projection of Europe, with DuckDB's spatial extension ([DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Summary of the Box asks the image service for the pixels in EPSG:3035 at 10 m, so that every pixel covers the same ground. The box the Next Steps use is a square of the side given in Box Side (km), centred on the place; the services cap what one request returns, so a large box can come back incomplete, and Land Cover Shares says when it does.

## References

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-EOX2026a"></a>EOX IT Services GmbH (2026). EOxCloudless: Sentinel-2 cloudless mosaics. [cloudless.eox.at](https://cloudless.eox.at)

<a id="ref-Esr2026a"></a>Esri (2026). ArcGIS REST APIs: map services and image services. [developers.arcgis.com/rest/services-reference/enterprise](https://developers.arcgis.com/rest/services-reference/enterprise/)

<a id="ref-EEA2019a"></a>European Environment Agency (2019). CORINE Land Cover 2018 (vector), Europe, 6-yearly - version 2020_20u1, May 2020. [doi:10.2909/71c95a07-e296-44fc-b22b-415f42acfdf0](https://doi.org/10.2909/71c95a07-e296-44fc-b22b-415f42acfdf0)

<a id="ref-EEA2020c"></a>European Environment Agency (2020). Grassland 2018 (raster 10 m), Europe, 3-yearly, Aug. 2020. [doi:10.2909/60639d5b-9164-4135-ae93-fb4132bb6d83](https://doi.org/10.2909/60639d5b-9164-4135-ae93-fb4132bb6d83)

<a id="ref-EEA2020a"></a>European Environment Agency (2020). Imperviousness Density 2018 (raster 10 m), Europe, 3-yearly, Aug. 2020. [doi:10.2909/3bf542bd-eebd-4d73-b53c-a0243f2ed862](https://doi.org/10.2909/3bf542bd-eebd-4d73-b53c-a0243f2ed862)

<a id="ref-EEA2020b"></a>European Environment Agency (2020). Tree Cover Density 2018 (raster 10 m), Europe, 3-yearly, Sep. 2020. [doi:10.2909/486f77da-d605-423e-93a9-680760ab6791](https://doi.org/10.2909/486f77da-d605-423e-93a9-680760ab6791)

<a id="ref-EEA2020d"></a>European Environment Agency (2020). Water and Wetness 2018 (raster 10 m), Europe, 3-yearly - version 2, Nov. 2020. [doi:10.2909/7992f641-bf77-47b7-b0c1-74fc832b78b1](https://doi.org/10.2909/7992f641-bf77-47b7-b0c1-74fc832b78b1)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Map Services](map-services.md) · [CORINE Nomenclature](corine-nomenclature.md)
