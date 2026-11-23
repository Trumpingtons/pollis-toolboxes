# Learned Detection in Lidar — Decision Guide

## Choosing an ADAF Model

| Model | Trained to find | Suits |
|---|---|---|
| All Archaeology | Barrows, enclosures and ringforts as one class | A first look for any of the three |
| Barrows | Burial mounds, ring barrows and ring ditches | Round mounds and small circular ditches |
| Enclosures | Banks and ditches enclosing an area | Larger enclosed sites of irregular outline |
| Ringforts | Circular enclosures of one or more banks | Round enclosed farmsteads, as in Ireland |

Each model is trained for one class, and a cell can have a high probability in several of them ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). The All Archaeology model is the usual first choice. The others separate the kinds once something has been found, and are downloaded only when chosen ([Kostovska, Kocev, Čož, Kokalj, Curran and Corns (2025)](#ref-KKCKC...2025a)).

## Choosing Between HRNet Segmentation and Faster R-CNN Object Detection

Each of the four classes has two ADAF models: an HRNet segmentation model and a Faster R-CNN object detection model ([Kostovska, Kocev, Čož, Kokalj, Curran and Corns (2025)](#ref-KKCKC...2025a)). The segmentation model gives a probability at each cell, so its features follow the outline of what it found, and their area and roundness describe that outline. The detection model gives boxes with scores ([Ren, He, Girshick and Sun (2017)](#ref-RHGS2017a)), so its features are rectangles or unions of rectangles: their area is that of the boxes, and their roundness is near 0.785, that of a square, whatever their form. The Minimum Roundness therefore sorts only the features of a segmentation model. A detection model's score measures how closely the content of the box resembles the training examples, as a segmentation model's probability does for a cell.

## Is the Terrain Model Suited to the ADAF Models?

The ADAF models were trained on bare-earth terrain models at 0.5 m, made from lidar of Ireland, and their authors report the best results on data like it ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). A terrain model at 1 m shows every feature at half the number of cells, so that a barrow looks to the model like one of half the size, and the smallest features shrink to a few cells. A terrain model with buildings or vegetation left in, a digital surface model, shows forms the models never saw. The features sought matter most: forms outside the three classes, or monuments of other shapes and sizes, are outside what the models learned, however good the terrain model.

## Setting the Threshold of Learned Detection in Lidar

The Threshold of Compute the Features, Step 6, is the probability a cell must reach to belong to a feature. ADAF uses 0.5 ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). A lower threshold, such as 0.3, gives larger features and more of them, among them faint or partial ones and more false alarms. A higher threshold, such as 0.7, keeps the places the model is surest of, with tighter outlines. The map Probability of a Feature, in Zoom and Pan, shows the whole area, from which a threshold can be chosen by eye: features that stand out as bright, compact patches keep their shape over a range of thresholds, while noise appears and disappears. The probability map itself does not depend on the threshold, so Save the Network's Output saves it before any threshold, to be thresholded again in a GIS.

## Setting the Minimum Area and Minimum Roundness

The Minimum Area and the Minimum Roundness remove features after the threshold. ADAF applies neither by default, and its authors advise setting them case by case, after looking at the results ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). A Minimum Area of a few tens of square metres removes the scatter of small patches that most probability maps hold. It should stay below the area of the smallest feature sought, measured at the resolution of the terrain model. Roundness is 1 for a circle and 0.785 for a square. A Minimum Roundness near 0.6 keeps barrows and ringforts and drops long, ragged patches along field boundaries and tracks. It also drops enclosures of irregular outline and features cut by the edge of a tile.

## References

<a id="ref-CCCKK2026a"></a>Čož, N., Corns, A., Curran, S., Kocev, D. and Kokalj, Ž. (2026). Automatic detection of archaeological features from airborne laser scanning data using deep learning: development and evaluation of the ADAF tool. *Journal of Archaeological Science: Reports* 71, 105733. [doi:10.1016/j.jasrep.2026.105733](https://doi.org/10.1016/j.jasrep.2026.105733)

<a id="ref-KKCKC...2025a"></a>Kostovska, A., Kocev, D., Čož, N., Kokalj, Ž., Curran, S. and Corns, A. (2025). ADAF machine learning model weights. Dataset, version 1.0.0. [doi:10.5281/zenodo.15848663](https://doi.org/10.5281/zenodo.15848663)

<a id="ref-RHGS2017a"></a>Ren, S., He, K., Girshick, R. and Sun, J. (2017). Faster R-CNN: towards real-time object detection with region proposal networks. *IEEE Transactions on Pattern Analysis and Machine Intelligence* 39(6), 1137–1149. [doi:10.1109/TPAMI.2016.2577031](https://doi.org/10.1109/TPAMI.2016.2577031)

## See Also
- [Overview](overview.md) · [ADAF Models](adaf.md) · [Diagnostics](diagnostics.md)
