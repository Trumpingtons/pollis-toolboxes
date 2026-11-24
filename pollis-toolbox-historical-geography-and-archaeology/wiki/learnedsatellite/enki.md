# Enki on Imagery of 1 m

## What Enki Is

Enki is a classifier of RGB satellite imagery for archaeological tells and mound-like features of the Ancient Near East, published by Paolo Rosati with its training data, its scripts and its trained model ([Rosati (2025a)](#ref-Ros2025a); [Rosati (2025b)](#ref-Ros2025b)). It answers one question of an image of a cell of about 350 by 350 m: does it hold a tell or a mound-like feature, positive, or not, negative. Its training images, more than 21,500, were cut from Google and Bing satellite imagery with the Atlas tool of QGIS, around the sites of the Ancient Near East site placemarks of [Pedersen (2007)](#ref-Ped2007a) and over other ground: agricultural, urban, desert, arable and wet land. Later versions of the dataset added tells off the centre of the image, images masked in grey to bring out the form of the mounds, and desaturated images. The model Learned Detection in Satellite Images reads is `enki0_0.keras`, the model of Enki's repository.

## The Network of Enki

Enki's network is EfficientNet-B0 of Keras, a convolutional network designed by searching for the best balance of depth, width and resolution ([Tan and Le (2019)](#ref-TL2019a)), started from its weights trained on ImageNet. It takes an image of 350 by 350 pixels in red, green and blue, from 0 to 255, and scales it as ImageNet's images were scaled, by the mean and standard deviation of each band, inside the network. A stem convolution and sixteen blocks of depthwise convolutions with squeeze and excitation bring the image to 11 by 11 positions of 1,280 channels. Enki averages each channel over the positions, drops 30% of them at random in training, and adds a layer of 256 units and a layer of two classes, whose softmax gives the share for positive. That share, in per cent, is what Enki's scripts report for each image.

## How Learned Detection in Satellite Images Runs Enki in Julia

Learned Detection in Satellite Images runs Enki in Julia, without Python or TensorFlow. ArchaeologicalDetection.jl downloads `enki0_0.keras` once, from a fixed commit of Enki's repository, and reads it as Keras saves it: a ZIP file whose `config.json` lists the layers and their settings, and whose `model.weights.h5` holds the weights, which JLD2.jl reads. Each batch normalisation is folded into the convolution before it, and the convolutions, depthwise convolutions and activations are those of NNlib.jl ([FluxML Contributors (2026)](#ref-FMLC2026a)). The asymmetric padding Keras gives the convolutions of stride 2 for an image of 350 pixels is read from `config.json` and kept. A cell of 350 m takes about a quarter of a second on a laptop's processor, several cells at once.

## How the Julia Version of Enki Was Checked

The Julia version of Enki was checked once against Keras 3.8.0, the version that saved `enki0_0.keras`, run on JAX in a separate Python environment. Eight images of Enki's validation set, four positive and four negative, went through both. The 1,280 averaged channels of the two agree to within 2.6e-6, where the channels reach about 1.9, and the shares for positive to within 1.2e-7. Keras gave the four positive images shares from 0.95 to 0.99999, and the four negative images shares under 0.001, as did Julia. Keras 3.15.1 could not load the file, so the check used the version that wrote it. The check covers the network and its weights, not Enki's accuracy, which is that of its author's own validation.

## The Grid of Cells of 350 m

Enki classifies whole images, so the area is cut into a grid of cells of 350 m, as Enki's README asks: a grid of cells of about 350 by 350 m, one image exported for each cell, each image classified, and the shares joined back to the grid in a GIS ([Rosati (2025b)](#ref-Ros2025b)). Learned Detection in Satellite Images reads an RGB image of the area at 1 m in the UTM zone of the area, from Esri World Imagery, Google's satellite tiles, a WMS or the user's own file, and cuts it into cells of 350 pixels from its north-west corner. Each cell is one image for Enki, and its share for a tell is the value of the cell. A cell that is black over half its area, without imagery, is left out. A tell smaller than a cell may lie across two or four cells, each showing part of it.

## The Threshold of 99% of Enki

Enki's README keeps as candidates the cells of a share of 99% or more. In its test between Syria and Iraq, mainly along the west bank of the Tigris, mountainous ground was first left out, and 1,744 of the remaining 14,117 cells reached 99%; 38 of the 41 known sites of the Ancient Near East placemarks in the area fell in them, and the other three in cells of about 98% ([Rosati (2025b)](#ref-Ros2025b)). The README reports a validation accuracy of 96.16%. A threshold of 99% leaves out most of the area while keeping most known tells; a lower one keeps more cells of uncertain ground. The features of Learned Detection in Satellite Images join the cells at or above the Threshold through their sides, each feature a cluster of cells. Enki Fine-Tuned on Known Sites keeps the Share of Cells of highest share instead: its last two layers, trained again on the known sites of the area, give shares on a scale of their own, to which the 99% of Enki's README does not apply.

## How Enki Fine-Tuned on Known Sites Trains Enki Again

Enki Fine-Tuned on Known Sites adapts Enki to the known sites of the area, as the first stage of Enki's own training script trained it: the network beneath is frozen, and only the layer of 256 units and the layer of two classes are trained. Each known site gives nine images of 350 m, centred on it and on the eight points the Shift away. The negatives are cells of the grid whose centre is at least the Distance from Sites from every known site, Negatives per Site Image of them for each image of a site. The network computes the 1,280 channels of each image once; the two layers then start from Enki's weights and are trained with Adam at a learning rate of 0.0001, on the cross-entropy of the two classes, in batches of 128, with a dropout of 30%. A fifth of the images is kept out, and the layers of the epoch with the lowest loss on them are kept.

## What Enki Fine-Tuned on Known Sites Leaves Out

Enki's training script has a second stage, which unfreezes the network beyond its first 75 layers and trains it with the two layers on top at a learning rate of 0.00001. Enki Fine-Tuned on Known Sites leaves that stage out: it would need the whole network to be run backwards for every image, for many images, and a few known sites are too few to train millions of weights. Enki's script also lowers the learning rate when the loss on the images kept out stops falling, and stops early after five epochs without improvement; here the epochs run to the end and the best is kept. With few known sites the two layers learn little beyond Enki's own, and the images of the known sites, which train them, are no test of them.

## What Enki Sees and What It Misses

Enki sees the form, texture and colour of a cell in RGB, and was trained on tells and mound-like features of arid and semi-arid ground in the Ancient Near East. Its README names its limits: two classes only, RGB only, mainly tells and mounds, and false positives in modern ground such as buildings, industrial areas, construction sites, quarries, roads and landforms that resemble mounds ([Rosati (2025b)](#ref-Ros2025b)). Outside the Ancient Near East, or on imagery unlike Google's and Bing's, its shares are less certain, which Enki Fine-Tuned on Known Sites can partly correct. Its cells are 350 m, so a feature shows where to look, not the outline of a site: the site is found on the imagery of the cell, older maps and the ground.

## How Enki Fine-Tuned on Known Sites Can Be Tested on Sites It Has Not Seen

The panel Enki on Held-Out Ground, in Archaeological Prospection, tests the training of Enki on new ground. It splits the area into two sides at the column of cells that halves the known sites, trains on one side and scores on the other: Enki as published, a random forest on the 1,280 channels of Enki's frozen network, and Enki with its last two layers trained again, as Enki Fine-Tuned on Known Sites trains them. Each is scored by the AUC on the held-out side and by the share of its known sites in the cells of highest share. Its images of the known sites are cut by `enki_examples` of ArchaeologicalDetection.jl: nine around each site, centred on it and 50 m from it in eight directions, and five cells at least 700 m from every known site for each of them.

## How a Head Trained Again Is Saved and Read Back

In Enki's network, with each batch normalisation folded into the convolution before it, the layers beneath the head hold 3,986,546 weights and the head 328,450. `enki_save` of ArchaeologicalDetection.jl writes only the head, its two dense layers, to a JLD2 file of about 1.3 MB: the network beneath it is Enki's own and unchanged. `enki_model(enki_weights(folder); head = path)` reads Enki's network from its Keras file again and puts the saved head on top of it, after checking that its layers have the sizes of Enki's. The model read back gives the same shares as the model saved, so a head trained on one region can be applied to imagery of the same region later, or shared without Enki's 52 MB. Save the Tuned Model of Enki on Held-Out Ground writes its Fine-Tuned Head in this way.

## References

<a id="ref-FMLC2026a"></a>FluxML Contributors (2026). NNlib.jl: neural network primitives with multiple backends. [github.com/FluxML/NNlib.jl](https://github.com/FluxML/NNlib.jl)

<a id="ref-Ped2007a"></a>Pedersen, O. (2007). ANE Site Placemarks for Google Earth. Dataset, Zenodo. [doi:10.5281/zenodo.6384045](https://doi.org/10.5281/zenodo.6384045)

<a id="ref-Ros2025a"></a>Rosati, P. (2025a). Enki: AI for Archaeology – Datasets for Automatic Site Recognition. Dataset, Zenodo. [doi:10.5281/zenodo.14950564](https://doi.org/10.5281/zenodo.14950564)

<a id="ref-Ros2025b"></a>Rosati, P. (2025b). Enki: AI-Assistant for Archaeological Discoveries. Software and trained model. [github.com/archeorosati/enki](https://github.com/archeorosati/enki)

<a id="ref-TL2019a"></a>Tan, M. and Le, Q. V. (2019). EfficientNet: Rethinking Model Scaling for Convolutional Neural Networks. *Proceedings of the 36th International Conference on Machine Learning*, Proceedings of Machine Learning Research 97, 6105–6114. [proceedings.mlr.press/v97/tan19a.html](https://proceedings.mlr.press/v97/tan19a.html)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Random Forest on Sentinel-2](random-forest.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
