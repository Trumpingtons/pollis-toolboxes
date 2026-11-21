# Landsat Collection 2 Level-2

## The Level-2 Products of Landsat 8 and Landsat 9

The Collection 2 Level-2 science products of Landsat 8 and Landsat 9 hold surface reflectance, from the Land Surface Reflectance Code, and surface temperature, from the thermal band, with quality assessment bands ([U.S. Geological Survey (2024)](#ref-USGS2024a)). Surface reflectance is the reflectance at the top of the atmosphere corrected for the scattering and absorption of atmospheric gases and aerosols, which products for monitoring the land surface need; Vermote, Justice, Claverie and Franch assessed this correction for the Operational Land Imager of Landsat 8 ([Vermote, Justice, Claverie and Franch (2016)](#ref-VJCF2016a)). Landsat Download reads the dataset `landsat_ot_c2_l2` of EarthExplorer, which holds both satellites ([Earth Resources Observation and Science (EROS) Center (2020)](#ref-EROSC2020a)).

## The Bands of a Landsat 8-9 Level-2 Scene

| File ending | What it holds |
|---|---|
| `SR_B1` to `SR_B7` | Surface reflectance of the bands of the Operational Land Imager: coastal aerosol, blue, green, red, near infrared and two shortwave infrared, at 30 m |
| `ST_B10` | Surface temperature from band 10 of the Thermal Infrared Sensor, in kelvin once scaled |
| `QA_PIXEL` | The quality of each cell as bits |

The names and contents of the files are those of the Level-2 product guide ([U.S. Geological Survey (2024)](#ref-USGS2024a)). The Bands input of Landsat Download takes these endings, separated by commas: SR_B4 is red and SR_B5 near infrared.

## Surface Reflectance and Temperature From the Stored Integers of Landsat

A band of a Level-2 product stores integers, which turn into physical values by the scale factor and offset of the product guide: surface reflectance is the stored value times 0.0000275 minus 0.2, and surface temperature, in kelvin, the stored value times 0.00341802 plus 149.0, with 0 as the fill value of both ([U.S. Geological Survey (2024)](#ref-USGS2024a)). Landsat Download applies them to every SR_ and ST_ band, so `bands` holds reflectance and kelvin, and leaves the fill cells out. QA_PIXEL keeps its integers, whose bits Cloud Mask over the Area reads. Surface Temperature turns kelvin into degrees Celsius.

## The QA_PIXEL Band and the CFMask Algorithm

| Bit of QA_PIXEL | Set when the cell is |
|---|---|
| 0 | Fill, outside the scene |
| 1 | Dilated cloud, next to a cloud |
| 2 | Cirrus |
| 3 | Cloud |
| 4 | Cloud shadow |
| 5 | Snow |
| 6 | Clear |
| 7 | Water |

The bits are those of the product guide ([U.S. Geological Survey (2024)](#ref-USGS2024a)). The cloud, cloud shadow and snow bits come from CFMask, which Foga and 9 coauthors chose for the operational Landsat products after comparing cloud detection algorithms with manual masks ([Foga and 9 coauthors (2017)](#ref-FSGZD...2017a)). NDVI over the Area leaves out the cells with bits 1, 3, 4 or 5 set when QA_PIXEL is among the Bands.

## The Display Identifier of a Landsat Scene

A Landsat scene is named by its display identifier, such as `LC09_L2SP_014032_20260715_20260717_02_T1`: the sensor and satellite, LC08 or LC09 for the Operational Land Imager and the Thermal Infrared Sensor of Landsat 8 or 9; the processing level, L2SP for surface reflectance and temperature; the path and row of the Worldwide Reference System; the dates of acquisition and of processing; the collection, 02; and the tier, T1 or T2, by the quality of the scene's geometry ([U.S. Geological Survey (2024)](#ref-USGS2024a)). Each band's file is the identifier followed by the band's ending. The Scene input of Landsat Download takes this identifier.

## NDVI From the Red and Near-Infrared Bands of Landsat

The normalised difference vegetation index of a cell is the difference of its near-infrared and red reflectances divided by their sum, a value between -1 and 1 that is larger the more green vegetation there is; Tucker studied it among the combinations of red and infrared for monitoring vegetation ([Tucker (1979)](#ref-Tuc1979a)). NDVI over the Area computes it from SR_B5, near infrared, and SR_B4, red, both at 30 m, and leaves its result in `grid` for Show the Band on a Map and Plot the Band.

## References

<a id="ref-EROSC2020a"></a>Earth Resources Observation and Science (EROS) Center (2020). Landsat 8-9 Operational Land Imager / Thermal Infrared Sensor Level-2, Collection 2. [doi:10.5066/P9OGBGM6](https://doi.org/10.5066/P9OGBGM6)

<a id="ref-FSGZD...2017a"></a>Foga, S., Scaramuzza, P. L., Guo, S., Zhu, Z., Dilley, R. D., Beckmann, T., Schmidt, G. L., Dwyer, J. L., Joseph Hughes, M. and Laue, B. (2017). Cloud detection algorithm comparison and validation for operational Landsat data products. *Remote Sensing of Environment*, 194, 379–390. [doi:10.1016/j.rse.2017.03.026](https://doi.org/10.1016/j.rse.2017.03.026)

<a id="ref-Tuc1979a"></a>Tucker, C. J. (1979). Red and photographic infrared linear combinations for monitoring vegetation. *Remote Sensing of Environment*, 8(2), 127–150. [doi:10.1016/0034-4257(79)90013-0](https://doi.org/10.1016/0034-4257(79)90013-0)

<a id="ref-USGS2024a"></a>U.S. Geological Survey (2024). Landsat 8-9 Collection 2 (C2) Level 2 Science Product (L2SP) Guide, version 6.0, LSDS-1619. [www.usgs.gov/media/files/landsat-8-collection-2-level-2-science-product-guide](https://www.usgs.gov/media/files/landsat-8-collection-2-level-2-science-product-guide)

<a id="ref-VJCF2016a"></a>Vermote, E., Justice, C., Claverie, M. and Franch, B. (2016). Preliminary analysis of the performance of the Landsat 8/OLI land surface reflectance product. *Remote Sensing of Environment*, 185, 46–56. [doi:10.1016/j.rse.2016.04.008](https://doi.org/10.1016/j.rse.2016.04.008)

## See Also
- [Overview](overview.md) · [The M2M API](m2m-api.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Factsheet](factsheet.md)
