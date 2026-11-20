# Sentinel-2 Mosaic

## What Is the Sentinel-2 Cloudless Mosaic?

The Sentinel-2 cloudless mosaics of EOX IT Services, known as EOxCloudless, are global, cloud-free satellite imagery derived from Copernicus Sentinel-2 data and processed each year ([EOX IT Services GmbH (2026)](#ref-EOX2026a)). Sentinel-2 images the land every few days at 10 m in its visible bands ([Drusch and 14 coauthors (2012)](#ref-DDCCF...2012a)); a mosaic of one year combines the images of that year so that each place shows ground rather than cloud. The Sentinel-2 Mosaic tab of the Copernicus Imagery Layers panel draws the mosaic of the year chosen in the Year input, from 2016 on, on an OpenStreetMap base map whose labels stay above it. The attribution the service asks for names the Sentinel-2 data of the year.

## Inputs of the Sentinel-2 Mosaic Tab

| Input | What it sets |
|---|---|
| Year | The year of the mosaic, from 2016 to the latest the service has |
| Style | The base map, whose labels are drawn over the mosaic |
| Place Name, Longitude, Latitude, Zoom | The place the map opens on, and how far in |
| Box Side (km) | The square around the place that Save as GeoTIFF writes |
| Folder | Where Save as GeoTIFF writes |

The mosaics have tiles to zoom 17; beyond it the map enlarges them. Service Description prints the years the service has and the description of the chosen year's layer, which states the terms of its use ([Open Geospatial Consortium (2010)](#ref-OGC2010a)).

## Pixel Size and Zoom on the Sentinel-2 Mosaic

A pixel of Sentinel-2's visible bands covers 10 m of ground ([Drusch and 14 coauthors (2012)](#ref-DDCCF...2012a)). A screen pixel of a web map covers less ground at each zoom level up, half as much per level, and less at higher latitudes, since Web Mercator stretches the map away from the equator ([MapLibre Contributors (2026)](#ref-MLC2026a)). At the zoom where the two match, each pixel of the mosaic fills one pixel of the screen; further in, the map only enlarges the pixels, and no further detail appears. Pixel Size and Zoom prints the ground a screen pixel covers at the place's latitude and zoom, and the zoom at which it equals 10 m.

## Saving the Sentinel-2 Mosaic as a GeoTIFF

Save as GeoTIFF writes the mosaic of the box around the place to a GeoTIFF in the Folder, in longitude and latitude, with about 10 m to a pixel. It reads the mosaic through the WMS driver of GDAL, which asks EOX's Web Map Service for the area and writes the result with its coordinates ([GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a); [Ng (2026)](#ref-Ng2026a); [Open Geospatial Consortium (2006)](#ref-OGC2006a)). The file is a picture in three colour bands, for a map or a figure; the reflectances of Sentinel-2's 13 bands are in its products, not in the mosaic.

## References

<a id="ref-DDCCF...2012a"></a>Drusch, M., Del Bello, U., Carlier, S., Colin, O., Fernandez, V., Gascon, F., Hoersch, B., Isola, C., Laberinti, P., Martimort, P., Meygret, A., Spoto, F., Sy, O., Marchese, F. and Bargellini, P. (2012). Sentinel-2: ESA's Optical High-Resolution Mission for GMES Operational Services. *Remote Sensing of Environment*, 120, 25–36. [doi:10.1016/j.rse.2011.11.026](https://doi.org/10.1016/j.rse.2011.11.026)

<a id="ref-EOX2026a"></a>EOX IT Services GmbH (2026). EOxCloudless: Sentinel-2 cloudless mosaics. [cloudless.eox.at](https://cloudless.eox.at)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-MLC2026a"></a>MapLibre Contributors (2026). MapLibre GL JS: interactive vector tile maps in the browser. [github.com/maplibre/maplibre-gl-js](https://github.com/maplibre/maplibre-gl-js)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-OGC2006a"></a>Open Geospatial Consortium (2006). OpenGIS Web Map Service (WMS) Implementation Specification, Version 1.3.0 (OGC 06-042). [portal.ogc.org/files/?artifact_id=14416](https://portal.ogc.org/files/?artifact_id=14416)

<a id="ref-OGC2010a"></a>Open Geospatial Consortium (2010). OpenGIS Web Map Tile Service Implementation Standard, Version 1.0.0 (OGC 07-057r7). [portal.ogc.org/files/?artifact_id=35326](https://portal.ogc.org/files/?artifact_id=35326)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Map Services](map-services.md) · [Decision Guide](decision-guide.md)
