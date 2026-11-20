# High-Resolution Layers

## What Are the High-Resolution Layers?

The High-Resolution Layers of the Copernicus Land Monitoring Service map single characteristics of the land, each at 10 m for the reference year 2018, over the member and cooperating countries of the European Environment Agency and the United Kingdom ([European Environment Agency (2020)](#ref-EEA2020a); [European Environment Agency (2020)](#ref-EEA2020b); [European Environment Agency (2020)](#ref-EEA2020c); [European Environment Agency (2020)](#ref-EEA2020d)). Where CORINE Land Cover gives each polygon of 25 hectares or more one class, a High-Resolution Layer gives every pixel a value. The High-Resolution tab of the Copernicus Imagery Layers panel draws the layer chosen in the Layer input from the European Environment Agency's Web Map Service of that layer, and reads its values from the image service behind it.

## The Four High-Resolution Layers of 2018

| Layer | Values |
|---|---|
| Imperviousness Density | The degree of soil sealing in each pixel, from 0 to 100 %, derived from a calibrated vegetation index ([European Environment Agency (2020)](#ref-EEA2020a)) |
| Tree Cover Density | The share of each pixel covered by the vertical projection of tree crowns, from 0 to 100 % ([European Environment Agency (2020)](#ref-EEA2020b)) |
| Grassland | Grassland or non-grassland: managed, semi-natural and natural grassy vegetation ([European Environment Agency (2020)](#ref-EEA2020c)) |
| Water and Wetness | Permanent water, temporary water, permanent wetness and temporary wetness, over 2012 to 2018 ([European Environment Agency (2020)](#ref-EEA2020d)) |

Imperviousness Density also exists for 2006, 2009, 2012 and 2015, with change layers between them ([European Environment Agency (2020)](#ref-EEA2020a)). Lefebvre, Sannier and Corpetti show how Sentinel-2 images can update it ([Lefebvre, Sannier and Corpetti (2016)](#ref-LSC2016a)).

## Inputs of the High-Resolution Tab

| Input | What it sets |
|---|---|
| Layer | Imperviousness Density, Tree Cover Density, Grassland, or Water and Wetness |
| Opacity | From 0, transparent, to 1, opaque: below 1 the base map shows through |
| Style | The base map, whose labels are drawn over the layer |
| Place Name, Longitude, Latitude, Zoom | The place the map opens on, and how far in |
| Box Side (km) | The square around the place that the Next Steps measure and save |

The legend shows the classes of Grassland and of Water and Wetness; the two densities run from 0 to 100 %.

## Reading the Values of a High-Resolution Layer

Values at Points asks the layer's image service, through its identify operation, for the value of the pixel under the place and under four points around it, and names it with the service's raster attribute table, such as a density or a class of water ([Esri (2026)](#ref-Esr2026a)). Summary of the Box asks the exportImage operation for the pixels of the box in EPSG:3035 at 10 m, as a GeoTIFF, and reads them with ArchGDAL.jl: the mean density and the share of pixels above 0 and at 80 % or more, or the share of each class ([Ng (2026)](#ref-Ng2026a)). Summary of the Box counts the values up to 253 only, leaving out 254 and 255, which Water and Wetness uses for pixels that could not be classified and pixels outside the area mapped. Save the Values keeps the GeoTIFF in the Folder.

## References

<a id="ref-Esr2026a"></a>Esri (2026). ArcGIS REST APIs: map services and image services. [developers.arcgis.com/rest/services-reference/enterprise](https://developers.arcgis.com/rest/services-reference/enterprise/)

<a id="ref-EEA2020c"></a>European Environment Agency (2020). Grassland 2018 (raster 10 m), Europe, 3-yearly, Aug. 2020. [doi:10.2909/60639d5b-9164-4135-ae93-fb4132bb6d83](https://doi.org/10.2909/60639d5b-9164-4135-ae93-fb4132bb6d83)

<a id="ref-EEA2020a"></a>European Environment Agency (2020). Imperviousness Density 2018 (raster 10 m), Europe, 3-yearly, Aug. 2020. [doi:10.2909/3bf542bd-eebd-4d73-b53c-a0243f2ed862](https://doi.org/10.2909/3bf542bd-eebd-4d73-b53c-a0243f2ed862)

<a id="ref-EEA2020b"></a>European Environment Agency (2020). Tree Cover Density 2018 (raster 10 m), Europe, 3-yearly, Sep. 2020. [doi:10.2909/486f77da-d605-423e-93a9-680760ab6791](https://doi.org/10.2909/486f77da-d605-423e-93a9-680760ab6791)

<a id="ref-EEA2020d"></a>European Environment Agency (2020). Water and Wetness 2018 (raster 10 m), Europe, 3-yearly - version 2, Nov. 2020. [doi:10.2909/7992f641-bf77-47b7-b0c1-74fc832b78b1](https://doi.org/10.2909/7992f641-bf77-47b7-b0c1-74fc832b78b1)

<a id="ref-LSC2016a"></a>Lefebvre, A., Sannier, C. and Corpetti, T. (2016). Monitoring Urban Areas with Sentinel-2A Data: Application to the Update of the Copernicus High Resolution Layer Imperviousness Degree. *Remote Sensing*, 8(7), 606. [doi:10.3390/rs8070606](https://doi.org/10.3390/rs8070606)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Map Services](map-services.md) · [Decision Guide](decision-guide.md) · [CORINE Nomenclature](corine-nomenclature.md)
