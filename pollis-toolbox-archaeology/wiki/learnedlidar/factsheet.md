# Learned Detection in Lidar — Factsheet

**Learned detection** applies neural networks trained on labelled lidar data to find archaeological features in a terrain model. The Learned Detection in Lidar panel of the Archaeology Toolbox applies published trained models in Julia, in eight steps. It offers the segmentation and object detection models of ADAF, the Automatic Detection of Archaeological Features tool ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a); [Kostovska, Kocev, Čož, Kokalj, Curran and Corns (2025)](#ref-KKCKC...2025a)). It also offers the YOLOv3 tumulus detector of [Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a), with its Sentinel-2 soil mask. ArchaeologicalDetection.jl builds the networks with NNlib.jl, reads ADAF's weights with Pickle.jl and trains the soil mask's random forest with DecisionTree.jl, on a grid read with Rasters.jl and ArchGDAL.jl ([JuliaAI Contributors (2026)](#ref-JAIC2026a)) ([FluxML Contributors (2026)](#ref-FMLC2026a); [Pickle.jl Contributors (2026)](#ref-PJC2026a); [Schouten (2026a)](#ref-Sch2026a); [Ng (2026)](#ref-Ng2026a); [GDAL/OGR Contributors (2026)](#ref-GDALOGRC2026a)).

| Item | Learned Detection in Lidar panel |
|---|---|
| **Purpose** | Apply trained models to a lidar terrain model to find archaeological features of the kinds they learned |
| **Input** | A GeoTIFF of a bare-earth terrain model in metres, in a projected coordinate system with square cells; best like the terrain model of training: 0.5 m for ADAF's models, the Xunta de Galicia's 1 m model for the Tumuli model |
| **Core packages** | [ArchaeologicalDetection.jl](https://github.com/Trumpingtons/ArchaeologicalDetection.jl), [SmartRegions.jl](https://github.com/Trumpingtons/SmartRegions.jl), [NNlib.jl](https://github.com/FluxML/NNlib.jl), [Pickle.jl](https://github.com/chengchingwen/Pickle.jl), [DecisionTree.jl](https://github.com/JuliaAI/DecisionTree.jl), [Rasters.jl](https://github.com/rafaqz/Rasters.jl), [ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl) |
| **Steps** | Terrain Model; Trained Network Model; Input Image; Run the Network; Save the Network's Output; Compute the Features; Look at the Features; Save Features |
| **Output** | `probability`, a `Raster` from 0 to 1 on the grid of the terrain model; `candidates`, one named tuple for each feature, ranked by probability, or for the Tumuli model by similarity; `found.labels`, a `Raster` of the feature each cell belongs to; and their files: a Cloud-Optimised GeoTIFF and a GeoPackage |
| **Key choices** | The model; for ADAF's models, the threshold, the minimum area and the minimum roundness; for the Tumuli model, the soil mask and the minimum similarity |

## How Learned Detection in Lidar Computes the Probability Map

| Step | Function | Computation |
|---|---|---|
| 1. Terrain Model | `Raster` | The terrain model read, with its coordinate system, grid and cell size checked |
| 2. Trained Network Model | `adaf_weights`, `adaf_model`; `tumuli_weights`, `tumuli_model` | One of ADAF's eight models, four HRNet segmentation and four Faster R-CNN object detection, downloaded once from Zenodo; or the Tumuli model, downloaded once from its authors' link; each built with NNlib.jl |
| 3. Input Image | `adaf_input`; `sentinel_scenes`, `sentinel_composite`, `tumuli_soil_model`, `tumuli_soil`, `tumuli_input` | For ADAF, the simple local relief model with a radius of 10 cells or 10 m, clipped to −0.5 to 0.5 m and stretched onto 0 to 1. For the Tumuli model, the Multi-Scale Relief Model, 0 where it is 0 or below and, with the soil mask, where a random forest on the mean of Sentinel-2 scenes finds no land where tumuli can be found |
| 4. Run the Network | `adaf_probability`; `tumuli_boxes`, `tumuli_features` | The network on tiles of 1024 by 1024 cells from the north-west corner: for HRNet, the sigmoid of its output; for Faster R-CNN, the score of the best box over each cell; for the Tumuli model, the boxes of similarity above 25% and the similarity of the best box over each cell |

The network is that of AiTLAS, the toolbox that runs ADAF's models, on the HRNet backbone of PyTorch Image Models ([Dimitrovski, Kitanovski, Panov, Kostovska, Simidjievski and Kocev (2023)](#ref-DKPKS...2023a); [Wightman (2019)](#ref-Wig2019a)). The object detection network is torchvision's Faster R-CNN ([Ren, He, Girshick and Sun (2017)](#ref-RHGS2017a)). The Tumuli model is a YOLOv3 network of Darknet, reading the Multi-Scale Relief Model, and its soil mask a random forest of 128 trees ([Redmon and Farhadi (2018)](#ref-RF2018a); [Orengo and Petrie (2018)](#ref-OP2018a); [Breiman (2001)](#ref-Bre2001a)).

## How Learned Detection in Lidar Computes, Shows and Saves Its Results

| Step | Function | Computation |
|---|---|---|
| 5. Save the Network's Output | `write` | The probability map, before any threshold, as a Cloud-Optimised GeoTIFF |
| 6. Compute the Features | `adaf_features`; `tumuli_features` | For ADAF, the cells at or above the Threshold, without the 8 cells along each tile's edges for HRNet, joined through their sides, filtered by the Minimum Area and the Minimum Roundness, ranked by highest probability. For the Tumuli model, the boxes of at least the Minimum Similarity, ranked by similarity |
| 7. Look at the Features | `terrain_maps` | Zoom and Pan: the local relief the model reads, the probability and imagery of the same ground, side by side with a scale bar, moving together, with each feature outlined in yellow, on the whole area, with a button that goes to the square of the Zoom Size around the Zoom Centre and back. The imagery comes from Google or Esri, with the user's own key, or from EOX's Sentinel-2 cloudless of 2016, open but in cells of 10 m, as Imagery chooses; its server learns where the terrain model is. |
| 8. Save Features | `save_candidates` | The outline of each feature with its measures, as a GeoPackage in the coordinate system of the terrain model |

## How the Steps of Learned Detection in Lidar Run

Each step of Learned Detection in Lidar has its inputs and its code, and the code of a step uses the results of the steps before it. Julia REPL first runs the earlier steps that have not run in the session as they are now, starting from the first one that changed. A new Threshold therefore runs Compute the Features again and leaves the network's probability map as it is, while a new Terrain Model runs every step from the first. Looking at the results and saving them are run only when asked. Editor, Jupyter and Pluto receive the code of all the earlier steps, then that of the step.

## What the Next Step of the Learned Detection in Lidar Panel Does

Interpret has one action, Features and Scheduled Monuments, for a terrain model in England. It reads the scheduled monuments within the area from Historic England's National Heritage List for England ([Historic England (2026)](#ref-HE2026a)). It lists each monument with the number of features that meet it, and counts the features that meet no monument. A monument that no feature meets is a form the model missed. A feature that meets no monument is a place to check, since it may be an unrecorded site or a false alarm.

## What a Feature of Learned Detection in Lidar Records

Each feature is a named tuple. `id` numbers it, and `x` and `y` give its centre in the coordinates of the terrain model. `area` is in square units of the coordinates. `roundness` is ADAF's measure: 4π times the area over the squared perimeter of the convex hull. `probability` is the highest probability of a cell within the feature. Features at or below the Minimum Area or the Minimum Roundness are left out, as ADAF leaves them out. A tumulus of the Tumuli model has its `id`, the centre of its box at `x` and `y`, its `size`, the larger side of the box in metres, and its `similarity`, as [Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a) list their tumuli.

## How Long Learned Detection in Lidar Takes

The first run downloads the chosen model to the Folder, and later runs read it from there: an HRNet model of ADAF, about 860 MB, or a Faster R-CNN model, about 520 MB, to its adaf folder, and the Tumuli model, about 250 MB, to its tumuli folder. The soil mask of the Tumuli model reads the Sentinel-2 scenes over the terrain model once, some minutes for the 100 to 200 scenes of a small area, and saves their mean beside it as `<terrain model>-sentinel.tif`. Loading the model and compiling the network take about a minute in a new Julia session. The network then runs on the processor, tile by tile, each tile of 1024 by 1024 cells taking several seconds to tens of seconds, depending on the computer. ADAF's authors report under a minute for one square kilometre at 0.5 m on a laptop without a graphics processor ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)).

## Where the Example Data of the Learned Detection in Lidar Panel Comes From

With the default file, Step 1, Terrain Model, downloads a 1 m terrain model from the Web Coverage Service of the Environment Agency's LIDAR Composite DTM, unless the folder already holds the file ([Environment Agency (2022)](#ref-EA2022a)). Its resolution is half that of ADAF's training data. The Tumuli model was trained on the Xunta de Galicia's 1 m terrain model, whose sheets of the 1:50,000 map, `MDT_1m_h50_<sheet>.zip`, are downloaded from Información Xeográfica de Galicia ([Xunta de Galicia (2026)](#ref-XG2026a)); its soil mask reads Sentinel-2 Level-2A scenes from Element 84's Earth Search ([Element 84 (2026)](#ref-E2026a)). Features and Scheduled Monuments reads the boundaries of scheduled monuments from Historic England's open web service, for any terrain model in England ([Historic England (2026)](#ref-HE2026a)).

## References

<a id="ref-BOLCF...2021a"></a>Berganzo-Besga, I., Orengo, H. A., Lumbreras, F., Carrero-Pazos, M., Fonte, J. and Vilas-Estévez, B. (2021). Hybrid MSRM-based deep learning and multitemporal Sentinel 2-based machine learning algorithm detects near 10k archaeological tumuli in north-western Iberia. *Remote Sensing* 13(20), 4181. [doi:10.3390/rs13204181](https://doi.org/10.3390/rs13204181)

<a id="ref-Bre2001a"></a>Breiman, L. (2001). Random forests. *Machine Learning* 45(1), 5–32. [doi:10.1023/A:1010933404324](https://doi.org/10.1023/A:1010933404324)

<a id="ref-CCCKK2026a"></a>Čož, N., Corns, A., Curran, S., Kocev, D. and Kokalj, Ž. (2026). Automatic detection of archaeological features from airborne laser scanning data using deep learning: development and evaluation of the ADAF tool. *Journal of Archaeological Science: Reports* 71, 105733. [doi:10.1016/j.jasrep.2026.105733](https://doi.org/10.1016/j.jasrep.2026.105733)

<a id="ref-DKPKS...2023a"></a>Dimitrovski, I., Kitanovski, I., Panov, P., Kostovska, A., Simidjievski, N. and Kocev, D. (2023). AiTLAS: artificial intelligence toolbox for Earth observation. *Remote Sensing* 15(9), 2343. [doi:10.3390/rs15092343](https://doi.org/10.3390/rs15092343)

<a id="ref-E2026a"></a>Element 84 (2026). Earth Search: Sentinel-2 Level-2A. Dataset, updated continuously. [element84.com/earth-search](https://element84.com/earth-search/)

<a id="ref-EA2022a"></a>Environment Agency (2022). LIDAR Composite Digital Terrain Model (DTM) – 1m. Dataset. [environment.data.gov.uk](https://environment.data.gov.uk/dataset/13787b9a-26a4-4775-8523-806d13af58fc)

<a id="ref-FMLC2026a"></a>FluxML Contributors (2026). NNlib.jl: neural network primitives with multiple backends. [github.com/FluxML/NNlib.jl](https://github.com/FluxML/NNlib.jl)

<a id="ref-GDALOGRC2026a"></a>GDAL/OGR Contributors (2026). GDAL: Geospatial Data Abstraction Library. [github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

<a id="ref-HE2026a"></a>Historic England (2026). National Heritage List for England (NHLE). Dataset, updated continuously. [historicengland.org.uk/listing/the-list](https://historicengland.org.uk/listing/the-list/)

<a id="ref-JAIC2026a"></a>JuliaAI Contributors (2026). DecisionTree.jl: Julia implementation of Decision Tree (CART) and Random Forest algorithms. [github.com/JuliaAI/DecisionTree.jl](https://github.com/JuliaAI/DecisionTree.jl)

<a id="ref-KKCKC...2025a"></a>Kostovska, A., Kocev, D., Čož, N., Kokalj, Ž., Curran, S. and Corns, A. (2025). ADAF machine learning model weights. Dataset, version 1.0.0. [doi:10.5281/zenodo.15848663](https://doi.org/10.5281/zenodo.15848663)

<a id="ref-Ng2026a"></a>Ng, Y. (2026). ArchGDAL.jl: a high level API for GDAL, the Geospatial Data Abstraction Library. [github.com/yeesian/ArchGDAL.jl](https://github.com/yeesian/ArchGDAL.jl)

<a id="ref-OP2018a"></a>Orengo, H. A. and Petrie, C. A. (2018). Multi-scale relief model (MSRM): a new algorithm for the visualization of subtle topographic change of variable size in digital elevation models. *Earth Surface Processes and Landforms* 43(6), 1361–1369. [doi:10.1002/esp.4317](https://doi.org/10.1002/esp.4317)

<a id="ref-PJC2026a"></a>Pickle.jl Contributors (2026). Pickle.jl: loading and saving objects in Python's Pickle format. [github.com/chengchingwen/Pickle.jl](https://github.com/chengchingwen/Pickle.jl)

<a id="ref-RF2018a"></a>Redmon, J. and Farhadi, A. (2018). YOLOv3: an incremental improvement. [arXiv:1804.02767](https://arxiv.org/abs/1804.02767)

<a id="ref-RHGS2017a"></a>Ren, S., He, K., Girshick, R. and Sun, J. (2017). Faster R-CNN: towards real-time object detection with region proposal networks. *IEEE Transactions on Pattern Analysis and Machine Intelligence* 39(6), 1137–1149. [doi:10.1109/TPAMI.2016.2577031](https://doi.org/10.1109/TPAMI.2016.2577031)

<a id="ref-Sch2026a"></a>Schouten, R. (2026a). Rasters.jl: raster manipulation for the Julia language. [github.com/rafaqz/Rasters.jl](https://github.com/rafaqz/Rasters.jl)

<a id="ref-Wig2019a"></a>Wightman, R. (2019). PyTorch Image Models. [doi:10.5281/zenodo.4414861](https://doi.org/10.5281/zenodo.4414861)

<a id="ref-XG2026a"></a>Xunta de Galicia (2026). MDT_1m_h50: digital terrain model of Galicia at 1 m from lidar. Dataset. Instituto de Estudos do Territorio. [mapas.xunta.gal](https://mapas.xunta.gal/es/mapas/productos-cartograficos/relieve)

## See Also
- [Overview](overview.md) · [ADAF Models](adaf.md) · [Tumuli Model](tumuli.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
