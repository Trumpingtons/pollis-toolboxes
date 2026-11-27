# Tumuli Model

## What the Tumuli Model Is

The Tumuli model is the detector of burial mounds of [Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a). They applied it to the whole of Galicia, 29,574 km², and it found 10,527 tumuli. It joins two models. A YOLOv3 object detection network finds tumuli in the Multi-Scale Relief Model of a lidar terrain model ([Redmon and Farhadi (2018)](#ref-RF2018a); [Orengo and Petrie (2018)](#ref-OP2018a)). A random forest classifies multitemporal Sentinel-2 imagery into land where tumuli can be found and land where they cannot, such as towns, roads, water and rock ([Breiman (2001)](#ref-Bre2001a); [Drusch and 14 coauthors (2012)](#ref-DDCCF...2012a)). The relief model is set to 0 on the second kind of land before the network reads it. Trained Network Model, Step 2 of the Learned Detection in Lidar panel, lists the detector beside ADAF's eight models as YOLOv3 Object Detection: Tumuli. Input Image, Step 3, applies the soil mask.

## How the Tumuli Model Was Trained

The authors trained the network on the known burial mounds of studies in Galicia, by Carrero-Pazos and Vilas-Estévez, and in northern Portugal, by Fonte ([Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a)). At first, 306 tumuli were used: 200 for training and 106 for validation, on images of 1024 by 1024 cells of a terrain model at 1 m.

The training was then refined in three ways:
- Copies of the training images, scaled to 75% and 50%, added smaller mounds, which were few in the data.
- A second training added 278 tumuli the first had missed, and 88 of its false detections as examples of the background.
- A last training read the relief model multiplied by the soil mask. The mask left out 24 of the known tumuli; of the 560 left, 456 were used for training and 104 for validation.

The network was trained for one class on images of one band, 832 by 832 cells, and is applied to tiles of 1024 by 1024 cells. On the authors' test data, it found 64% of the known tumuli, and 97% of its detections were tumuli.

## The Multi-Scale Relief Model the Tumuli Model Reads

The network does not read heights. It reads the Multi-Scale Relief Model (MSRM) of the terrain model ([Orengo and Petrie (2018)](#ref-OP2018a)). The MSRM smooths the terrain model with mean filters over squares of growing size, and averages the differences between successive smoothed surfaces. Forms within a range of sizes thus stand out alike, whatever their size within it.

The authors set the range from 1 m to 19 m in steps that grow as squares (x = 2), which on a terrain model of 1 m gives squares of radius 0, 1, 4 and 9 cells. They compared the MSRM with the terrain model itself, the slope and the simple local relief model. The MSRM gave the best detections: an average precision of 63%, against 22% for the terrain model ([Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a)). They found that it gave tumuli more consistent shapes, whatever their size.

`msrm` of ArchaeologicalDetection.jl computes the MSRM as the authors' Earth Engine script does, rounded to the millimetre. `tumuli_input` sets it to 0 where it is 0 or below, and turns it into the grey levels of the authors' images. The authors converted their images to JPEG and PNG without stating the stretch. The stretch of `tumuli_input`, a square root, was therefore estimated from the grey levels of their 30 validation images.

## The YOLOv3 Network Behind the Tumuli Model

YOLOv3 is a convolutional object detection network on the Darknet-53 backbone ([Redmon and Farhadi (2018)](#ref-RF2018a)). It predicts boxes at three scales, as a feature pyramid network does, so that small objects are found as well as large ones. Its boxes start from anchor boxes found by k-means clustering of the training boxes. Its classes are predicted by independent logistic classifiers.

The authors chose YOLOv3 for its speed beside other networks such as Faster R-CNN ([Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a)). Each box has a confidence, which the authors call its similarity, from 0 to 1: how closely what lies in the box resembles the tumuli of training. Darknet keeps the boxes of similarity above 25% by default, and the authors show tumuli found with similarities from 100% down to 25%. Of two boxes of one tile whose intersection is more than 45% of their union, Darknet keeps the more similar.

## The Soil Mask of the Tumuli Model

The authors' soil mask follows the multitemporal classification of [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a). In Google Earth Engine, they took the Sentinel-2 Level-1C scenes over Galicia from 23 June 2015 to 5 June 2020 with under 20% of clouds. They masked the clouds of each scene and took the mean of each of 10 bands: the visible, red-edge and near-infrared bands, and the two short-wave infrared bands ([Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a)).

They drew 32 polygons and labelled the cells within them:
- 19 polygons of land where tumuli can be found, in grasslands, fields and forests (class 1);
- 13 polygons of land where they cannot, such as roofs, roads, swimming pools, water, rock, quarries and industrial areas (class 0).

A random forest of 128 trees, trained on 4,398 cells of these polygons, classified every cell, and the MSRM was multiplied by the class. With the mask, the network found 1,538 more tumuli than without it, with fewer false detections and fewer missed tumuli. The mask removed all urban areas and road infrastructure, roundabouts among them.

The soil mask of Learned Detection in Lidar uses the authors' polygons, from their supplementary material, and the same 10 bands. It reads Sentinel-2 Level-2A scenes, of surface reflectance, from Element 84's Earth Search, which needs no account and starts in November 2016 ([Element 84 (2026)](#ref-E2026a)). Its composite is therefore the mean of other scenes than the authors', from November 2016 to 5 June 2020, each cell where the scene classification finds it clear. The random forest of `tumuli_soil_model`, in DecisionTree.jl, has 128 trees, and a cell is of class 1 where most of them vote for it, as in Earth Engine ([JuliaAI Contributors (2026)](#ref-JAIC2026a)). `tumuli_soil` classifies the composite and brings the classes onto the grid of the terrain model.

## How ArchaeologicalDetection.jl Runs the Tumuli Model in Julia

`tumuli_weights` downloads the authors' trained weights, about 246 MB, once from their link, and checks them by their SHA-256 digest. It keeps the network's configuration, from the authors' Darknet repository, beside them. `tumuli_model` reads both and builds the network with NNlib.jl's convolutions, each batch normalisation folded into the convolution before it ([FluxML Contributors (2026)](#ref-FMLC2026a)). `tumuli_boxes` cuts the image into tiles of 1024 by 1024 cells from the north-west corner, as the authors cut the terrain model of Galicia, and fills the area beyond the last tile with 0. It keeps the boxes of each tile as Darknet keeps them.

The Julia network was checked against Darknet itself, built from the authors' repository, on the authors' 30 validation images, 15 of Galicia and 15 of Laboreiro in Portugal. Both find the same 72 tumuli. 71 have the same centre and size to the cell and the same similarity to the percent Darknet prints. The last has a similarity of 95.5%, which Darknet prints as 95% and Julia rounds to 96%.

The panel's steps were also run on the Xunta de Galicia's terrain model of the authors' tile 41722, a square kilometre of Calvos de Randín, without the soil mask ([Xunta de Galicia (2026)](#ref-XG2026a)). They find 59 of the 60 tumuli the authors list in that tile, a median of 0.75 m from the authors' positions. The tumulus missed is one of similarity 29% in the authors' list.

## From Boxes to Tumuli

`tumuli_features` keeps the boxes of at least the Minimum Similarity of Compute the Features, Step 6, 0.25 by default. Each box is a tumulus, at the centre of the box, with a size, the larger side of the box, and its similarity, as the authors list their tumuli. The boxes are not joined, as the boxes of ADAF's Faster R-CNN models are, and no area or roundness is measured. The map Similarity of the Best Box gives each cell the similarity of the most similar box over it, and 0 outside every box. Save Features writes each box as an outline.

## References

<a id="ref-BOLCF...2021a"></a>Berganzo-Besga, I., Orengo, H. A., Lumbreras, F., Carrero-Pazos, M., Fonte, J. and Vilas-Estévez, B. (2021). Hybrid MSRM-based deep learning and multitemporal Sentinel 2-based machine learning algorithm detects near 10k archaeological tumuli in north-western Iberia. *Remote Sensing* 13(20), 4181. [doi:10.3390/rs13204181](https://doi.org/10.3390/rs13204181)

<a id="ref-Bre2001a"></a>Breiman, L. (2001). Random forests. *Machine Learning* 45(1), 5–32. [doi:10.1023/A:1010933404324](https://doi.org/10.1023/A:1010933404324)

<a id="ref-DDCCF...2012a"></a>Drusch, M. and 14 coauthors (2012). Sentinel-2: ESA's optical high-resolution mission for GMES operational services. *Remote Sensing of Environment* 120, 25–36. [doi:10.1016/j.rse.2011.11.026](https://doi.org/10.1016/j.rse.2011.11.026)

<a id="ref-E2026a"></a>Element 84 (2026). Earth Search: Sentinel-2 Level-2A. Dataset, updated continuously. [element84.com/earth-search](https://element84.com/earth-search/)

<a id="ref-FMLC2026a"></a>FluxML Contributors (2026). NNlib.jl: neural network primitives with multiple backends. [github.com/FluxML/NNlib.jl](https://github.com/FluxML/NNlib.jl)

<a id="ref-JAIC2026a"></a>JuliaAI Contributors (2026). DecisionTree.jl: Julia implementation of Decision Tree (CART) and Random Forest algorithms. [github.com/JuliaAI/DecisionTree.jl](https://github.com/JuliaAI/DecisionTree.jl)

<a id="ref-OCGLG...2020a"></a>Orengo, H. A., Conesa, F. C., Garcia-Molsosa, A., Lobo, A., Green, A. S., Madella, M. and Petrie, C. A. (2020). Automated detection of archaeological mounds using machine-learning classification of multisensor and multitemporal satellite data. *Proceedings of the National Academy of Sciences* 117(31), 18240–18250. [doi:10.1073/pnas.2005583117](https://doi.org/10.1073/pnas.2005583117)

<a id="ref-OP2018a"></a>Orengo, H. A. and Petrie, C. A. (2018). Multi-scale relief model (MSRM): a new algorithm for the visualization of subtle topographic change of variable size in digital elevation models. *Earth Surface Processes and Landforms* 43(6), 1361–1369. [doi:10.1002/esp.4317](https://doi.org/10.1002/esp.4317)

<a id="ref-RF2018a"></a>Redmon, J. and Farhadi, A. (2018). YOLOv3: an incremental improvement. [arXiv:1804.02767](https://arxiv.org/abs/1804.02767)

<a id="ref-XG2026a"></a>Xunta de Galicia (2026). MDT_1m_h50: digital terrain model of Galicia at 1 m from lidar. Dataset. Instituto de Estudos do Territorio. [mapas.xunta.gal](https://mapas.xunta.gal/es/mapas/productos-cartograficos/relieve)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [ADAF Models](adaf.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
