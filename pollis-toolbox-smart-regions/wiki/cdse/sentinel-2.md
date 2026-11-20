# Sentinel-2 Bands

## The Bands of a Sentinel-2 Level-2A Product

The multispectral instrument of Sentinel-2 records 13 spectral bands, four at 10 m (blue, green, red and near infrared), six at 20 m (red edge, narrow near infrared and shortwave infrared) and three at 60 m for the atmosphere, over a swath of 290 km ([Drusch and 14 coauthors (2012)](#ref-DDCCF...2012a)). A Level-2A product holds the surface reflectance of a tile of 110 by 110 km, corrected for the atmosphere by the processor Sen2Cor, with each band also resampled to the coarser resolutions, and a scene classification ([Main-Knorn, Pflug, Louis, Debaecker, Müller-Wilm and Gascon (2017)](#ref-MPLDM...2017a)). The STAC catalogue names each band by its number and resolution, such as `B04_10m`, the input the Bands of Sentinel-2 Bands takes.

## How Sentinel-2 Bands Picks and Downloads a Scene

With Scene empty, Sentinel-2 Bands searches the STAC catalogue for the Level-2A scenes over the Area between the From and To dates with at most the Most Cloud, and takes the scene that covers the most of the area, the least cloudy among those; with an identifier in Scene, it takes that scene. It then downloads each of the Bands, a JPEG 2000 file of the whole tile, from the download service with an access token ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026b)), reads it with Rasters.jl through GDAL ([Schouten (2026)](#ref-Sch2026a); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)), and keeps only the cells of the area, in the tile's coordinate system, a zone of UTM.

## Surface Reflectance From the Stored Integers of Sentinel-2

A band of a Level-2A product stores integers, which turn into surface reflectance by the scale and offset its asset records in the STAC catalogue, `raster:scale` and `raster:offset`, with its no-data value as `nodata` ([Copernicus Data Space Ecosystem (2026)](#ref-CDSE2026a)). Sentinel-2 Bands applies them to each band that records them, so `bands` holds reflectance, mostly between 0 and 1, and leaves the cells of the no-data value out. The scene classification records no scale, so its cells keep their classes as integers.

## The Scene Classification Band of Sentinel-2

The band SCL of a Level-2A product classes each cell of 20 m as no data, saturated or defective, dark area or topographic shadow, cloud shadow, vegetation, not vegetated, water, unclassified, cloud of medium or high probability, thin cirrus, or snow ([Main-Knorn, Pflug, Louis, Debaecker, Müller-Wilm and Gascon (2017)](#ref-MPLDM...2017a)). Scene Classes over the Area counts these classes over the area, which the cloud cover of the whole scene does not give. NDVI over the Area leaves out the cells classed as cloud shadow, cloud, cirrus or snow when SCL_20m is among the Bands.

## NDVI From the Red and Near-Infrared Bands of Sentinel-2

The normalised difference vegetation index of a cell is the difference of its near-infrared and red reflectances divided by their sum, a value between -1 and 1 that is larger the more green vegetation there is; Tucker studied it among the combinations of red and infrared for monitoring vegetation ([Tucker (1979)](#ref-Tuc1979a)). NDVI over the Area computes it from `B04_10m`, red, and `B08_10m`, near infrared, both at 10 m, and leaves its result in `grid` for Show the Band on a Map and Plot the Band.

## References

<a id="ref-CDSE2026b"></a>Copernicus Data Space Ecosystem (2026). Access Token. [documentation.dataspace.copernicus.eu/APIs/Token.html](https://documentation.dataspace.copernicus.eu/APIs/Token.html)

<a id="ref-CDSE2026a"></a>Copernicus Data Space Ecosystem (2026). STAC Product Catalogue. [documentation.dataspace.copernicus.eu/APIs/STAC.html](https://documentation.dataspace.copernicus.eu/APIs/STAC.html)

<a id="ref-DDCCF...2012a"></a>Drusch, M., Del Bello, U., Carlier, S., Colin, O., Fernandez, V., Gascon, F., Hoersch, B., Isola, C., Laberinti, P., Martimort, P., Meygret, A., Spoto, F., Sy, O., Marchese, F. and Bargellini, P. (2012). Sentinel-2: ESA's Optical High-Resolution Mission for GMES Operational Services. *Remote Sensing of Environment*, 120, 25–36. [doi:10.1016/j.rse.2011.11.026](https://doi.org/10.1016/j.rse.2011.11.026)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-MPLDM...2017a"></a>Main-Knorn, M., Pflug, B., Louis, J., Debaecker, V., Müller-Wilm, U. and Gascon, F. (2017). Sen2Cor for Sentinel-2. *Proceedings of SPIE, Image and Signal Processing for Remote Sensing XXIII*, 10427, 1042704. [doi:10.1117/12.2278218](https://doi.org/10.1117/12.2278218)

<a id="ref-Sch2026a"></a>Schouten, R. (2026). Rasters.jl: Raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Tuc1979a"></a>Tucker, C. J. (1979). Red and photographic infrared linear combinations for monitoring vegetation. *Remote Sensing of Environment*, 8(2), 127–150. [doi:10.1016/0034-4257(79)90013-0](https://doi.org/10.1016/0034-4257(79)90013-0)

## See Also
- [Decision Guide](decision-guide.md) · [Searching the STAC Catalogue](stac-search.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
