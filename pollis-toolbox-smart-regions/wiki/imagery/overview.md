# Copernicus Imagery Layers — Overview

## What Copernicus Provides for Land

Copernicus is the Earth observation programme of the European Union. Its Sentinel-2 satellites carry a multispectral imager of 13 bands, from the visible to the shortwave infrared, at 10, 20 and 60 m, for land monitoring ([Drusch and 14 coauthors (2012)](#ref-DDCCF...2012a)). The Copernicus Land Monitoring Service, coordinated for its pan-European products by the European Environment Agency (EEA), turns such images into maps of land cover: CORINE Land Cover, mapped by national teams of the EEA's member and cooperating countries, and the High-Resolution Layers, which map single characteristics of the land at 10 or 20 m ([European Environment Agency (2019)](#ref-EEA2019a); [European Environment Agency (2020)](#ref-EEA2020a)). The Copernicus Imagery Layers panel shows these maps, and a mosaic of the Sentinel-2 images themselves, on a base map.

## The Three Tabs of the Copernicus Imagery Layers Panel

| Tab | What it shows | Years | Resolution |
|---|---|---|---|
| Sentinel-2 Mosaic | The ground in colour, from Sentinel-2 images with the clouds left out ([EOX IT Services GmbH (2026)](#ref-EOX2026a)) | Each year from 2016 | 10 m |
| CORINE Land Cover | 44 classes of land cover and land use ([European Environment Agency (2019)](#ref-EEA2019a)) | 1990, 2000, 2006, 2012, 2018 | Polygons of 25 ha or more |
| High-Resolution | Imperviousness Density, Tree Cover Density, Grassland, Water and Wetness ([European Environment Agency (2020)](#ref-EEA2020a); [European Environment Agency (2020)](#ref-EEA2020b); [European Environment Agency (2020)](#ref-EEA2020c); [European Environment Agency (2020)](#ref-EEA2020d)) | 2018 | 10 m |

The mosaics show what the ground looks like; CORINE says what the land is used for; the High-Resolution Layers measure how much of each 10 m pixel is sealed, wooded, grassy or wet.

## How Pollis Draws a Copernicus Imagery Layer

Every layer of the Copernicus Imagery Layers panel comes from a map service, a server that draws map tiles on request. The Sentinel-2 mosaics come from EOX's Web Map Tile Service (WMTS), whose tiles are addressed by zoom, row and column ([Open Geospatial Consortium (2010)](#ref-OGC2010a); [EOX IT Services GmbH (2026)](#ref-EOX2026a)). CORINE Land Cover comes from the export operation of the EEA's ArcGIS map services, and the High-Resolution Layers from the EEA's Web Map Services (WMS), both asked for one tile at a time by its box in Web Mercator ([Esri (2026)](#ref-Esr2026a); [Open Geospatial Consortium (2006)](#ref-OGC2006a)). MapLibre GL JS fetches the tiles of the area on screen and draws them under the labels of the OpenStreetMap base map ([MapLibre Contributors (2026)](#ref-MLC2026a)). No service of the panel asks for an account or an API key.

## Which Julia Packages the Copernicus Imagery Layers Panel Uses

The map itself needs no package: the address of the tiles and `Pollis.webmap` are enough. The Next Steps read what the services return. DuckDB.jl and DuckDB's spatial extension read the JSON descriptions of the services and the CORINE polygons, cut the polygons to a box, measure their areas and save them as a GeoPackage ([Raasveldt and Mühleisen (2026)](#ref-RM2026a); [DuckDB Labs and contributors (2026)](#ref-DDBL2026b)). Tables.jl turns the results of the queries into columns ([Quinn (2023)](#ref-Qui2023c)). ArchGDAL.jl reads the 10 m values of a High-Resolution Layer from a GeoTIFF, and saves the Sentinel-2 mosaic of a box through GDAL's WMS driver ([Ng (2026)](#ref-Ng2026a); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)). The standard library Downloads fetches every answer, with a User-Agent that names Pollis.

## References

<a id="ref-DDCCF...2012a"></a>Drusch, M., Del Bello, U., Carlier, S., Colin, O., Fernandez, V., Gascon, F., Hoersch, B., Isola, C., Laberinti, P., Martimort, P., Meygret, A., Spoto, F., Sy, O., Marchese, F. and Bargellini, P. (2012). Sentinel-2: ESA's Optical High-Resolution Mission for GMES Operational Services. *Remote Sensing of Environment*, 120, 25–36. [doi:10.1016/j.rse.2011.11.026](https://doi.org/10.1016/j.rse.2011.11.026)

<a id="ref-DDBL2026b"></a>DuckDB Labs and contributors (2026). duckdb-spatial: geospatial extension for DuckDB. [github.com/duckdb/duckdb-spatial](https://github.com/duckdb/duckdb-spatial)

<a id="ref-EOX2026a"></a>EOX IT Services GmbH (2026). EOxCloudless: Sentinel-2 cloudless mosaics. [cloudless.eox.at](https://cloudless.eox.at)

<a id="ref-Esr2026a"></a>Esri (2026). ArcGIS REST APIs: map services and image services. [developers.arcgis.com/rest/services-reference/enterprise](https://developers.arcgis.com/rest/services-reference/enterprise/)

<a id="ref-EEA2019a"></a>European Environment Agency (2019). CORINE Land Cover 2018 (vector), Europe, 6-yearly - version 2020_20u1, May 2020. [doi:10.2909/71c95a07-e296-44fc-b22b-415f42acfdf0](https://doi.org/10.2909/71c95a07-e296-44fc-b22b-415f42acfdf0)

<a id="ref-EEA2020c"></a>European Environment Agency (2020). Grassland 2018 (raster 10 m), Europe, 3-yearly, Aug. 2020. [doi:10.2909/60639d5b-9164-4135-ae93-fb4132bb6d83](https://doi.org/10.2909/60639d5b-9164-4135-ae93-fb4132bb6d83)

<a id="ref-EEA2020a"></a>European Environment Agency (2020). Imperviousness Density 2018 (raster 10 m), Europe, 3-yearly, Aug. 2020. [doi:10.2909/3bf542bd-eebd-4d73-b53c-a0243f2ed862](https://doi.org/10.2909/3bf542bd-eebd-4d73-b53c-a0243f2ed862)

<a id="ref-EEA2020b"></a>European Environment Agency (2020). Tree Cover Density 2018 (raster 10 m), Europe, 3-yearly, Sep. 2020. [doi:10.2909/486f77da-d605-423e-93a9-680760ab6791](https://doi.org/10.2909/486f77da-d605-423e-93a9-680760ab6791)

<a id="ref-EEA2020d"></a>European Environment Agency (2020). Water and Wetness 2018 (raster 10 m), Europe, 3-yearly - version 2, Nov. 2020. [doi:10.2909/7992f641-bf77-47b7-b0c1-74fc832b78b1](https://doi.org/10.2909/7992f641-bf77-47b7-b0c1-74fc832b78b1)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-OGC2006a"></a>Open Geospatial Consortium (2006). OpenGIS Web Map Service (WMS) Implementation Specification, Version 1.3.0 (OGC 06-042). [portal.ogc.org/files/?artifact_id=14416](https://portal.ogc.org/files/?artifact_id=14416)

<a id="ref-OGC2010a"></a>Open Geospatial Consortium (2010). OpenGIS Web Map Tile Service Implementation Standard, Version 1.0.0 (OGC 07-057r7). [portal.ogc.org/files/?artifact_id=35326](https://portal.ogc.org/files/?artifact_id=35326)

<a id="ref-Qui2023c"></a>Quinn, J. (2023). Tables.jl: an interface for tables in Julia. [github.com/JuliaData/Tables.jl](https://github.com/JuliaData/Tables.jl)

<a id="ref-RM2026a"></a>Raasveldt, M. and Mühleisen, H. (2026). DuckDB.jl: the DuckDB Julia package. [github.com/duckdb/DuckDB.jl](https://github.com/duckdb/DuckDB.jl)

## See Also
- [Factsheet](factsheet.md) · [Map Services](map-services.md) · [Decision Guide](decision-guide.md) · [Sentinel-2 Mosaic](sentinel2.md) · [CORINE Land Cover](corine.md) · [High-Resolution Layers](hrl.md)
