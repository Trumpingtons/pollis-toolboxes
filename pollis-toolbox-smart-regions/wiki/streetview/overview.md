# Overview

## Looking at a Place from the Street in Pollis

The Mapillary Street-Level Viewer panel brings the street-level images of Mapillary into Pollis's browser. Mapillary's images are photographs taken by its contributors, each with the time it was captured, its position and the direction of its camera; images captured one after another form a sequence ([Mapillary (2026)](#ref-Map2026a)). The panel looks for them around a point with the image search of the Mapillary API, keeps them in a table, and opens one in a viewer in which the user looks around, steps along the street and turns at crossings. Map and Viewer adds a map of where the images are, so that the walk can be followed street by street.

## MapillaryJS

MapillaryJS is the JavaScript library Mapillary publishes for interactive street imagery on the web: it takes spatial, semantic and texture data and renders it with WebGL, and it can be extended with camera controls, interaction and data providers of one's own ([Mapillary (2023)](#ref-Map2023a)). Pollis ships version 4.1.2 of the library inside its Julia extension, beside MapLibre GL JS, and loads it only when an output of `Pollis.streetview` is shown. Showing the images of the Mapillary platform needs a client access token; images supplied through a data provider of one's own need none, according to the library's documentation.

## Street-Level Images in Research on Cities

A systematic review of more than 600 studies of the built environment found street view imagery to be a standing source of urban analytics and GIScience, applied to subjects from greenery and transport to health and socio-economic conditions, and taken mostly from Google Street View ([Biljecki and Ito (2021)](#ref-BI2021a)). The review also pointed to the crowdsourced services, Mapillary among them, as a way to reach places and times that other services leave out. Whatever a study measures from the images, looking at an image of a place remains the way to see what the measure stands for there.

## How Complete the Coverage of Mapillary Is

The coverage of Mapillary depends on where its contributors go. Against a reference road network, Juhász and Hochmair found Google Street View generally more complete on almost all categories of road, with exceptions for pedestrian and cycle paths in some cities ([Juhász and Hochmair (2016)](#ref-JH2016a)). In four metropolitan areas of the United States, Mahabir, Schuchard, Crooks, Croitoru and Stefanidis found contributions concentrated along local roads and in populated areas, most of them from a few users and captured in the morning, at lunchtime and in the late afternoon ([Mahabir, Schuchard, Crooks, Croitoru and Stefanidis (2020)](#ref-MSCCS2020a)). The image nearest a point is therefore not always recent, nor taken from the side of the street one wants.

## Mapillary Images in Computer Vision

The images of Mapillary are also the source of datasets for computer vision. The Mapillary Vistas Dataset holds 25,000 high-resolution street-level images from around the world, annotated with polygons into 66 object categories, with labels for each instance in 37 of them ([Neuhold, Ollmann, Rota Bulò and Kontschieder (2017)](#ref-NORK2017a)). Its images come from mobile phones, tablets, action cameras and professional capturing rigs, taken in different weather, seasons and times of day by photographers of different experience. The same variety of devices and conditions meets a user of the viewer from one image to the next.

## References

<a id="ref-BI2021a"></a>Biljecki, F. and Ito, K. (2021). Street view imagery in urban analytics and GIS: A review. *Landscape and Urban Planning*, 215, 104217. [doi:10.1016/j.landurbplan.2021.104217](https://doi.org/10.1016/j.landurbplan.2021.104217)

<a id="ref-JH2016a"></a>Juhász, L. and Hochmair, H. H. (2016). User Contribution Patterns and Completeness Evaluation of Mapillary, a Crowdsourced Street Level Photo Service. *Transactions in GIS*, 20(6), 925–947. [doi:10.1111/tgis.12190](https://doi.org/10.1111/tgis.12190)

<a id="ref-MSCCS2020a"></a>Mahabir, R., Schuchard, R., Crooks, A., Croitoru, A. and Stefanidis, A. (2020). Crowdsourcing Street View Imagery: A Comparison of Mapillary and OpenStreetCam. *ISPRS International Journal of Geo-Information*, 9(6), 341. [doi:10.3390/ijgi9060341](https://doi.org/10.3390/ijgi9060341)

<a id="ref-Map2023a"></a>Mapillary (2023). MapillaryJS: Interactive, Extendable Street Imagery Map Experiences in the Browser. Version 4.1.2. [github.com/mapillary/mapillary-js](https://github.com/mapillary/mapillary-js)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

<a id="ref-NORK2017a"></a>Neuhold, G., Ollmann, T., Rota Bulò, S. and Kontschieder, P. (2017). The Mapillary Vistas Dataset for Semantic Understanding of Street Scenes. *Proceedings of the IEEE International Conference on Computer Vision (ICCV)*, 5000–5009. [doi:10.1109/ICCV.2017.534](https://doi.org/10.1109/ICCV.2017.534)

## See Also
- [Factsheet](factsheet.md) · [Using the Viewer](viewer.md) · [Finding an Image](finding-an-image.md) · [Access Token](access-token.md) · [Decision Guide](decision-guide.md)
