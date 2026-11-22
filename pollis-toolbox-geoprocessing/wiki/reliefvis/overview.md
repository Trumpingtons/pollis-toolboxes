# Relief Visualisation — Overview

## Why Archaeologists Look at a Lidar Terrain Model Through Visualisations

Airborne laser scanning (lidar) sends pulses from an aircraft and records where they return. Some pulses pass between leaves and reach the ground, so a terrain model built from them shows earthworks under woodland as well as in open fields ([Devereux, Amable and Crow (2008)](#ref-DAC2008a)). The earthworks themselves are small: a ploughed-down barrow or the ditch of an enclosure may differ from the ground around it by a few tens of centimetres, on a landscape whose heights span tens of metres. A map of heights in colour spends its range on the hills and valleys, and the earthworks vanish within one shade. Relief visualisations take away the broad shape of the land, or measure the form of the ground around each cell, so that the small features carry the contrast of the image ([Kokalj and Hesse (2017)](#ref-KH2017a)).

## The Bare-Earth Terrain Model Behind the Visualisations

The visualisations of the Relief Visualisation panel start from a bare-earth digital terrain model (DTM): a grid of ground heights from which buildings, trees and other objects have been removed. A digital surface model keeps those objects and is not the input. The Environment Agency's LIDAR Composite DTM of England, for example, is built from the last or only return of each pulse, with surface objects removed by algorithms and manual editing, on cells of 1 m ([Environment Agency (2022)](#ref-EA2022a)). The cell size sets the smallest feature a visualisation can show: a bank one cell wide is barely seen, while one five cells wide is clear. The quality of the removal matters as much: objects left in the model, or ground removed with them, become false features in every visualisation.

## The Families of Relief Visualisation

| Family | What each cell shows | Needs a light | Tab |
|---|---|---|---|
| Local relief model | Height above or below the local trend, in metres ([Hesse (2010)](#ref-Hes2010a)) | No | Local Relief Model |
| Sky-view factor | Share of the sky seen within a radius ([Zakšek, Oštir and Kokalj (2011)](#ref-ZOK2011a)) | No | Sky-View and Openness |
| Openness | Mean angle to the horizon, from above or from below ([Yokoyama, Shirasawa and Pike (2002)](#ref-YSP2002a)) | No | Sky-View and Openness |
| Hillshade | Brightness under a distant light ([Horn (1981)](#ref-Hor1981a)) | Yes | Shaded Relief |
| Slope | Steepness, in degrees | No | Shaded Relief |
| Combined image | Several of the above blended ([Kokalj and Somrak (2019)](#ref-KS2019a)) | Partly | Layered Image |

## From a Visualisation to an Archaeological Site

A visualisation shows forms, not sites. Interpreters map the features they see on screen, compare them with the records of known sites, and visit those that remain ([Kokalj and Hesse (2017)](#ref-KH2017a)). In England, the National Heritage List for England holds the scheduled monuments with their boundaries, published as open data and web services ([Historic England (2026)](#ref-HE2026a)); Scheduled Monuments in the Area of the Relief Visualisation panel lists those within the terrain model, so that features already known can be set aside and new ones stand out. Several visualisations side by side reduce the chance of missing a feature that one of them hides.

## Visualisations as the Input of Learned Detection

Machine learning models that detect archaeological features in lidar usually see a visualisation rather than raw heights. The Automatic Detection of Archaeological Features (ADAF) tool was trained on the simple local relief model computed with RVT, with a trend radius of 10 m, its values stretched from −0.5 to 0.5 m onto 0 to 1, on cells of 0.5 m, to find barrows, enclosures and ringforts in Ireland ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). Its authors report that other visualisations were also tested, and that the simple local relief model gave consistently robust results across models at a low cost in computing. The settings of a visualisation used for training must be the same when the model is applied to new ground.

## References

<a id="ref-CCCKK2026a"></a>Čož, N., Corns, A., Curran, S., Kocev, D. and Kokalj, Ž. (2026). Automatic detection of archaeological features from airborne laser scanning data using deep learning: development and evaluation of the ADAF tool. *Journal of Archaeological Science: Reports* 71, 105733. [doi:10.1016/j.jasrep.2026.105733](https://doi.org/10.1016/j.jasrep.2026.105733)

<a id="ref-DAC2008a"></a>Devereux, B. J., Amable, G. S. and Crow, P. (2008). Visualisation of LiDAR terrain models for archaeological feature detection. *Antiquity* 82(316), 470–479. [doi:10.1017/S0003598X00096952](https://doi.org/10.1017/S0003598X00096952)

<a id="ref-EA2022a"></a>Environment Agency (2022). LIDAR Composite Digital Terrain Model (DTM) – 1m. Dataset. [environment.data.gov.uk](https://environment.data.gov.uk/dataset/13787b9a-26a4-4775-8523-806d13af58fc)

<a id="ref-HE2026a"></a>Historic England (2026). National Heritage List for England (NHLE). Dataset, updated continuously. [historicengland.org.uk/listing/the-list](https://historicengland.org.uk/listing/the-list/)

<a id="ref-Hes2010a"></a>Hesse, R. (2010). LiDAR-derived local relief models – a new tool for archaeological prospection. *Archaeological Prospection* 17(2), 67–72. [doi:10.1002/arp.374](https://doi.org/10.1002/arp.374)

<a id="ref-Hor1981a"></a>Horn, B. K. P. (1981). Hill shading and the reflectance map. *Proceedings of the IEEE* 69(1), 14–47. [doi:10.1109/PROC.1981.11918](https://doi.org/10.1109/PROC.1981.11918)

<a id="ref-KH2017a"></a>Kokalj, Ž. and Hesse, R. (2017). *Airborne laser scanning raster data visualization: a guide to good practice*. Prostor, kraj, čas. Založba ZRC, Ljubljana. [doi:10.3986/9789612549848](https://doi.org/10.3986/9789612549848)

<a id="ref-KS2019a"></a>Kokalj, Ž. and Somrak, M. (2019). Why not a single image? Combining visualizations to facilitate fieldwork and on-screen mapping. *Remote Sensing* 11(7), 747. [doi:10.3390/rs11070747](https://doi.org/10.3390/rs11070747)

<a id="ref-YSP2002a"></a>Yokoyama, R., Shirasawa, M. and Pike, R. J. (2002). Visualizing topography by openness: a new application of image processing to digital elevation models. *Photogrammetric Engineering and Remote Sensing* 68(3), 257–265.

<a id="ref-ZOK2011a"></a>Zakšek, K., Oštir, K. and Kokalj, Ž. (2011). Sky-view factor as a relief visualization technique. *Remote Sensing* 3(2), 398–415. [doi:10.3390/rs3020398](https://doi.org/10.3390/rs3020398)

## See Also
- [Factsheet](factsheet.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Local Relief Model](local-relief.md) · [Sky-View Factor and Openness](sky-view-openness.md) · [Shaded Relief](shaded-relief.md) · [Layered Image](layered-image.md)
