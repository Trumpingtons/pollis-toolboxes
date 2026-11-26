# Learned Detection in Lidar — Overview

## What Learned Detection of Archaeological Features Is

Learned detection finds archaeological features in a lidar terrain model with a neural network trained on examples. Archaeologists outline features of known kinds on many images of the terrain, and the network learns, from thousands of such outlines, which patterns of relief belong to each kind. Once trained, the network is applied to new terrain and gives, at each cell, the probability that the cell belongs to a feature of a kind it learned. The Learned Detection in Lidar panel applies trained networks published with ADAF, the Automatic Detection of Archaeological Features tool ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). It also applies the tumulus detector of [Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a), which gives boxes around burial mounds. It trains no network: training needs labelled data of the kind of landscape searched and computing power far beyond a single computer's processor.

## What a Trained Model Knows

A trained model knows only what it was shown. ADAF's models learned from lidar of Ireland, at 0.5 m, outlined with barrows, enclosures and ringforts ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). They respond to round mounds, ring banks and ditches of the sizes common there. The Tumuli model learned from the burial mounds of Galicia and northern Portugal, as they appear in the Multi-Scale Relief Model of the Xunta de Galicia's 1 m terrain model ([Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a); [Xunta de Galicia (2026)](#ref-XG2026a)). There they are on average 15 to 20 m across and 1 to 1.5 m high. Forms they never saw, such as tells, terraces, field systems or the walls of buildings, give them nothing to recognise, or are mistaken for what they did see. The same holds for every trained model, whatever its data. ADAF's authors write that use outside Ireland needs new training data and expertise, and they provide code to fine-tune the models on it. The kind of feature, the landscape and the resolution of the data used in training say where a model's detections can be trusted.

## Learned Detection Beside Visual Inspection and Rule-Based Detection

The Archaeological Prospection menu holds three ways to look at a terrain model. Relief Visualisation computes images in which a person sees small forms of the ground ([Kokalj and Hesse (2017)](#ref-KH2017a)). Candidate Features applies explicit rules of height, area and shape, which work wherever the rules fit the features. Learned Detection in Lidar applies what a network learned from labelled examples. The three answer the same question in different ways: where in this area are there forms that may be archaeological? Each output is a list of places to check against maps, records and the ground, not a list of sites. Where a trained model fits the landscape, it can find features that are hard to describe by rules. Elsewhere, visual inspection and rules are the safer first look.

## What Learned Detection in Lidar Gives

Learned Detection in Lidar gives two results. The probability map, from Run the Network, is a raster on the grid of the terrain model, from 0 to 1 at each cell, which can be saved and opened in a GIS. The features, from Compute the Features, are the regions of the probability map at or above a threshold, each with its position, its area, its roundness and its highest probability. For the Tumuli model, the map gives at each cell the similarity of the best box over it, and the features are the boxes, each with its centre, its size and its similarity. In England, Features and Scheduled Monuments sets the features beside the scheduled monuments of the National Heritage List for England, read from Historic England's open web service ([Historic England (2026)](#ref-HE2026a)). A known monument that no feature meets shows a form the model missed. A feature that meets no monument is either an unrecorded site or a false alarm.

## Detections as Places to Check

ADAF's authors tested the tool along a road scheme in Ireland. It found 84% of the known archaeological sites, and 116 possible sites that people inspecting the data had not noticed ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). They also note that the outlines of a segmentation model are approximations, and that accepting more false alarms can keep important features from being overlooked. The authors of the Tumuli model checked 3,086 of its 10,527 detections in Galicia on aerial imagery, in open land ([Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a)). 324 were not tumuli: 225 rock outcrops, 33 roofs of isolated houses, 9 swimming pools and 57 other mound-shaped features, most of them made by people. They add that only a field survey or test pits can show that a detected mound is archaeological. A detection is thus a reason to look again at a place, on the relief images, older maps and aerial photographs, and on the ground. The probability of a feature measures how closely the place resembles the training examples, not how likely it is to be archaeological.

## References

<a id="ref-BOLCF...2021a"></a>Berganzo-Besga, I., Orengo, H. A., Lumbreras, F., Carrero-Pazos, M., Fonte, J. and Vilas-Estévez, B. (2021). Hybrid MSRM-based deep learning and multitemporal Sentinel 2-based machine learning algorithm detects near 10k archaeological tumuli in north-western Iberia. *Remote Sensing* 13(20), 4181. [doi:10.3390/rs13204181](https://doi.org/10.3390/rs13204181)

<a id="ref-CCCKK2026a"></a>Čož, N., Corns, A., Curran, S., Kocev, D. and Kokalj, Ž. (2026). Automatic detection of archaeological features from airborne laser scanning data using deep learning: development and evaluation of the ADAF tool. *Journal of Archaeological Science: Reports* 71, 105733. [doi:10.1016/j.jasrep.2026.105733](https://doi.org/10.1016/j.jasrep.2026.105733)

<a id="ref-HE2026a"></a>Historic England (2026). National Heritage List for England (NHLE). Dataset, updated continuously. [historicengland.org.uk/listing/the-list](https://historicengland.org.uk/listing/the-list/)

<a id="ref-KH2017a"></a>Kokalj, Ž. and Hesse, R. (2017). *Airborne laser scanning raster data visualization: a guide to good practice*. Prostor, kraj, čas. Založba ZRC, Ljubljana. [doi:10.3986/9789612549848](https://doi.org/10.3986/9789612549848)

<a id="ref-XG2026a"></a>Xunta de Galicia (2026). MDT_1m_h50: digital terrain model of Galicia at 1 m from lidar. Dataset. Instituto de Estudos do Territorio. [mapas.xunta.gal](https://mapas.xunta.gal/es/mapas/productos-cartograficos/relieve)

## See Also
- [Factsheet](factsheet.md) · [ADAF Models](adaf.md) · [Tumuli Model](tumuli.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
