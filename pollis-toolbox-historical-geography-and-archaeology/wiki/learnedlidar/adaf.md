# ADAF Models

## What the ADAF Models Are

ADAF, the Automatic Detection of Archaeological Features tool, finds archaeological features in airborne laser scanning data with trained neural networks ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). Its authors published eight trained models: four for semantic segmentation and four for object detection, each for one class: all archaeology, barrows, enclosures or ringforts ([Kostovska, Kocev, Čož, Kokalj, Curran and Corns (2025)](#ref-KKCKC...2025a)). A segmentation model gives the probability that each cell of the terrain model belongs to a feature of its class. A detection model gives boxes around the features. Trained Network Model, Step 2 of the Learned Detection in Lidar panel, lists all eight and applies any of them. The models run in ADAF through AiTLAS, a Python toolbox of deep-learning models for Earth observation ([Dimitrovski, Kitanovski, Panov, Kostovska, Simidjievski and Kocev (2023)](#ref-DKPKS...2023a)).

## How the ADAF Models Were Trained

The models learned from the ML-ALS-IE dataset: airborne laser scanning data of Ireland on which experts outlined enclosures, ringforts and barrows ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). The dataset holds 23,100 labelled patches of 512 by 512 cells, each 256 by 256 m, at a resolution of 0.5 m. The patches were split by place into training, validation and test sets, so that the models were tested on ground they had not seen. Each model started from weights trained on the photographs of ImageNet and was trained for 50 epochs, with random flips and rotations of the patches. The authors report the best results on terrain models like those of training: 0.5 m cells, bare earth, and the forms of Irish monuments.

## The Input of the ADAF Models

An ADAF model does not read heights. It reads the simple local relief model: the terrain model less its mean within 10 m of each cell, in a square window ([Hesse (2010)](#ref-Hes2010a); [ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)). The relief is clipped to −0.5 to 0.5 m and stretched onto 0 to 1, and cells with no value are set to 0 ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). The model takes three bands, as networks made for photographs do, and receives the relief three times. `adaf_input` of ArchaeologicalDetection.jl computes this image from a terrain model. The window is 10 cells wide on each side for cells of 1 m or more, and 10 m for finer cells, as in ADAF. Features rising or sinking more than half a metre all look alike to the model, which sees their shape, not their height.

## The HRNet Network Behind the ADAF Models

The segmentation models of ADAF are High-Resolution Networks (HRNet), in the version with 48 channels in its finest branch ([Wang and 11 coauthors (2021)](#ref-WSCJD...2021a)). Most networks shrink an image step by step and enlarge it again at the end. HRNet keeps a branch at a quarter of the input's resolution throughout, adds branches at an eighth, a sixteenth and a thirty-second, and exchanges information between them repeatedly. The backbone is that of PyTorch Image Models ([Wightman (2019)](#ref-Wig2019a)). AiTLAS adds a head that brings all branches to 120 by 120 cells, joins them, and gives two outputs, of which the second, through a sigmoid, is the probability of the feature. The result is enlarged back to the size of the tile by bilinear interpolation.

## The Faster R-CNN Network Behind the ADAF Detection Models

The object detection models of ADAF are torchvision's improved Faster R-CNN, with two classes: the feature and the background ([Ren, He, Girshick and Sun (2017)](#ref-RHGS2017a)). A ResNet-50 ([He, Zhang, Ren and Sun (2016)](#ref-HZRS2016a)) under a feature pyramid of five levels ([Lin, Dollár, Girshick, He, Hariharan and Belongie (2017)](#ref-LDGHH...2017a)) describes the image at several scales. A region proposal network marks anchors, boxes of 32 to 512 cells in three shapes, that may hold a feature, and the best 1,000 of each level go on. RoIAlign pools each proposed box to 7 by 7 cells for a box head of four convolutions and a layer of 1,024, which scores the box and refines its sides. Boxes of overlapping proposals are suppressed, those scoring above 0.05 kept, at most 100 per tile, and AiTLAS suppresses boxes overlapping by more than 0.2 ([Dimitrovski, Kitanovski, Panov, Kostovska, Simidjievski and Kocev (2023)](#ref-DKPKS...2023a)).

## How ArchaeologicalDetection.jl Runs the ADAF Models in Julia

`adaf_model` of ArchaeologicalDetection.jl reads ADAF's PyTorch checkpoint with Pickle.jl, which reads the stored tensors without running any Python ([Pickle.jl Contributors (2026)](#ref-PJC2026a)). It builds the same network from NNlib.jl's convolutions ([FluxML Contributors (2026)](#ref-FMLC2026a)), with each batch normalisation folded into the convolution before it, as is usual for a network that is only applied. `adaf_probability` runs it as ADAF does: on tiles of 1024 by 1024 cells from the north-west corner of the terrain model, the area beyond the last tile filled with 0. On a tile of 1024 by 1024 cells of a lidar terrain model, the Julia network's probabilities differ from those of AiTLAS's PyTorch network by less than 0.0001 at every cell. The same cells reach a probability of 0.5 in both. For the Faster R-CNN models, `adaf_model` builds the network from the same convolutions, and `adaf_boxes` gives the boxes of each tile with their scores. On the same tile, the Julia network finds the same boxes as torchvision, their sides within 0.0001 cells and their scores within 0.00001.

## From Probabilities to Features in ADAF

ADAF draws features from the probability map in a fixed way, which `adaf_features` of ArchaeologicalDetection.jl follows ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). The cells with a probability at least the Threshold, 0.5 by default, are kept, except the 8 cells along the edges of each tile, where the network saw too little around them. The kept cells are joined into features through the sides they share, not through their corners. Each feature is measured by its area and by its roundness: 4π times the area over the squared perimeter of its convex hull, 1 for a circle and 0.785 for a square. The Minimum Area and the Minimum Roundness then remove features at or below them. ADAF's authors advise setting both case by case, by inspecting the results.

## From Boxes to Features in ADAF

A Faster R-CNN model of ADAF gives boxes, not a probability at each cell. ADAF keeps the boxes scoring above the Threshold and joins those that overlap into one feature, with the highest score of its boxes ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). `adaf_probability` of ArchaeologicalDetection.jl turns the boxes into a map: each cell takes the score of the best box over it, the boxes rounded to whole cells as ADAF rounds them. The cells at or above the Threshold are then exactly the cells of the boxes kept, and `adaf_features` with `margin = 0` joins them into the same features, leaving no cells out along the edges of the tiles. Two boxes that touch across the edge of a tile become one feature, where ADAF keeps two. A feature drawn from boxes is a rectangle or a union of rectangles, so its roundness is near 0.785, that of a square, whatever the form inside.

## References

<a id="ref-CCCKK2026a"></a>Čož, N., Corns, A., Curran, S., Kocev, D. and Kokalj, Ž. (2026). Automatic detection of archaeological features from airborne laser scanning data using deep learning: development and evaluation of the ADAF tool. *Journal of Archaeological Science: Reports* 71, 105733. [doi:10.1016/j.jasrep.2026.105733](https://doi.org/10.1016/j.jasrep.2026.105733)

<a id="ref-DKPKS...2023a"></a>Dimitrovski, I., Kitanovski, I., Panov, P., Kostovska, A., Simidjievski, N. and Kocev, D. (2023). AiTLAS: artificial intelligence toolbox for Earth observation. *Remote Sensing* 15(9), 2343. [doi:10.3390/rs15092343](https://doi.org/10.3390/rs15092343)

<a id="ref-FMLC2026a"></a>FluxML Contributors (2026). NNlib.jl: neural network primitives with multiple backends. [github.com/FluxML/NNlib.jl](https://github.com/FluxML/NNlib.jl)

<a id="ref-HZRS2016a"></a>He, K., Zhang, X., Ren, S. and Sun, J. (2016). Deep residual learning for image recognition. *CVPR*. [arXiv:1512.03385](https://arxiv.org/abs/1512.03385)

<a id="ref-Hes2010a"></a>Hesse, R. (2010). LiDAR-derived local relief models – a new tool for archaeological prospection. *Archaeological Prospection* 17(2), 67–72. [doi:10.1002/arp.374](https://doi.org/10.1002/arp.374)

<a id="ref-KKCKC...2025a"></a>Kostovska, A., Kocev, D., Čož, N., Kokalj, Ž., Curran, S. and Corns, A. (2025). ADAF machine learning model weights. Dataset, version 1.0.0. [doi:10.5281/zenodo.15848663](https://doi.org/10.5281/zenodo.15848663)

<a id="ref-LDGHH...2017a"></a>Lin, T.-Y., Dollár, P., Girshick, R., He, K., Hariharan, B. and Belongie, S. (2017). Feature pyramid networks for object detection. *2017 IEEE Conference on Computer Vision and Pattern Recognition (CVPR)*, 936–944. [doi:10.1109/CVPR.2017.106](https://doi.org/10.1109/CVPR.2017.106)

<a id="ref-PJC2026a"></a>Pickle.jl Contributors (2026). Pickle.jl: loading and saving objects in Python's Pickle format. [github.com/chengchingwen/Pickle.jl](https://github.com/chengchingwen/Pickle.jl)

<a id="ref-RHGS2017a"></a>Ren, S., He, K., Girshick, R. and Sun, J. (2017). Faster R-CNN: towards real-time object detection with region proposal networks. *IEEE Transactions on Pattern Analysis and Machine Intelligence* 39(6), 1137–1149. [doi:10.1109/TPAMI.2016.2577031](https://doi.org/10.1109/TPAMI.2016.2577031)

<a id="ref-WSCJD...2021a"></a>Wang, J. and 11 coauthors (2021). Deep high-resolution representation learning for visual recognition. *IEEE Transactions on Pattern Analysis and Machine Intelligence* 43(10), 3349–3364. [doi:10.1109/TPAMI.2020.2983686](https://doi.org/10.1109/TPAMI.2020.2983686)

<a id="ref-Wig2019a"></a>Wightman, R. (2019). PyTorch Image Models. [doi:10.5281/zenodo.4414861](https://doi.org/10.5281/zenodo.4414861)

<a id="ref-ZRCUL2025a"></a>ZRC SAZU and University of Ljubljana (UL FGG) (2025). RVT: Relief Visualization Toolbox in Python (rvt-py), version 2.2.3. [github.com/EarthObservation/RVT_py](https://github.com/EarthObservation/RVT_py)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
