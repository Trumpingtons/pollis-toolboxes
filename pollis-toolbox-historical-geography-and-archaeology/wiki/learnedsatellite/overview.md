# Learned Detection in Satellite Images — Overview

## What Learned Detection of Sites in Satellite Images Is

Learned detection in satellite images finds archaeological sites with a model trained on sites already known in the same area. The known sites mark cells of an image as sites, and cells away from them as not. A classifier learns which values of the image's bands tell the two apart, and is then applied to every cell of the image, giving the probability that the cell is a site. [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) found hundreds of mounded Indus settlements in the Cholistan Desert of Pakistan in this way. They trained a random forest on mounds already known there, in a composite of thousands of Sentinel-1 and Sentinel-2 scenes. The Learned Detection in Satellite Images panel applies the same method to the Sentinel-2 part of such a composite. It also offers Enki, a network trained by [Rosati (2025b)](#ref-Ros2025b) on tells across the Ancient Near East, which reads imagery of 1 m and can be adapted to the known sites of the area.

## What a Multitemporal Composite of Sentinel-2 Shows

A single satellite scene shows the ground on one day: under one crop, after rain or in drought, with clouds over parts of it. A multitemporal composite takes the mean of each band over many scenes, years of them, each without its cloudy cells. What changes from one scene to the next averages out, and what persists remains: the soil, the moisture it holds and the vegetation it carries on average. An archaeological mound or the earthworks of a hillfort have their own sediments and drainage, so their ground can differ from the ground around them in the mean of the years, even where no single scene shows it. Sentinel-2 records ten bands at 10 and 20 m that reach from the visible to the short-wave infrared ([Drusch and 14 coauthors (2012)](#ref-DDCCF...2012a)).

## What the Random Forest of Learned Detection in Satellite Images Learns

The random forest learns the reflectance of the ground of the known sites, in the ten bands of the composite, against the reflectance of ground away from them. It sees no shape: each cell is judged on its own values. It therefore finds ground like that of the known sites wherever it is, which may be another site, or a field, a quarry or a farmyard with soil of the same kind. And it misses sites whose ground looks like the ground around them. The model is trained anew for each area, on the sites known there, and is not carried to another area. Its probability says how much a cell resembles the training sites, not how likely it is to be archaeological.

## What Sites a Composite at 10 m Can Show

A cell of the composite is 10 m across, and the red edge and short-wave infrared bands are 20 m. A site must therefore cover several cells to be seen: the mounds [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) detected range from under 5 ha to over 30 ha, a hectare being a square of 100 m. Their mounds are made of accumulated debris, mud bricks and pottery, which gives them a soil of their own colour and texture. Hillforts, enclosures of tens of hectares, tells and mounded settlements, and the soils of large abandoned settlements are of that size. Barrows, pits, walls and most earthworks are not, and are the business of lidar: the Learned Detection in Lidar and Candidate Features panels look for them in a terrain model. Arid and open ground, where soils are seen directly, suits the method better than woodland, where the canopy hides them.

## What Enki Learns from Imagery of 1 m

Enki learns from images of 350 by 350 m at about 1 m, where a tell is a shape: a mound whose form, colour and texture stand out from the ground around it. Its network sees the form and the texture of the whole cell, not the values of single cells as the random forest does, and it was trained by its author on thousands of tells and other ground across the Ancient Near East rather than on the sites of one area ([Rosati (2025a)](#ref-Ros2025a)). It can therefore be used where no sites are known, as Enki as Published. Its knowledge is of tells and mound-like features in arid and semi-arid land, seen on Google's and Bing's imagery; elsewhere, Enki Fine-Tuned on Known Sites trains its last two layers on the sites known in the area, while the network beneath, which reads the form of the ground, is kept.

## Detections as Places to Check

The features of Learned Detection in Satellite Images are places where the ground resembles that of the known sites. [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) checked theirs on high-resolution imagery and trained their random forest three times, the last two to bring down the high probabilities of ground that was not a mound, before mapping the clusters above the threshold. A feature away from the known sites is a reason to look at the place on aerial photographs, older maps, lidar and the ground. A feature on a known site shows only that the model learned its training cells, so the features to look at are those away from them. The cells of Enki are 350 m across: a feature of Enki says which cells to look at closely, not where the site's edges are.

## References

<a id="ref-DDCCF...2012a"></a>Drusch, M., Del Bello, U., Carlier, S., Colin, O., Fernandez, V., Gascon, F., Hoersch, B., Isola, C., Laberinti, P., Martimort, P., Meygret, A., Spoto, F., Sy, O., Marchese, F. and Bargellini, P. (2012). Sentinel-2: ESA's Optical High-Resolution Mission for GMES Operational Services. *Remote Sensing of Environment* 120, 25–36. [doi:10.1016/j.rse.2011.11.026](https://doi.org/10.1016/j.rse.2011.11.026)

<a id="ref-OCGLG...2020a"></a>Orengo, H. A., Conesa, F. C., Garcia-Molsosa, A., Lobo, A., Green, A. S., Madella, M. and Petrie, C. A. (2020). Automated detection of archaeological mounds using machine-learning classification of multisensor and multitemporal satellite data. *Proceedings of the National Academy of Sciences* 117(31), 18240–18250. [doi:10.1073/pnas.2005583117](https://doi.org/10.1073/pnas.2005583117)

<a id="ref-Ros2025a"></a>Rosati, P. (2025a). Enki: AI for Archaeology – Datasets for Automatic Site Recognition. Dataset, Zenodo. [doi:10.5281/zenodo.14950564](https://doi.org/10.5281/zenodo.14950564)

<a id="ref-Ros2025b"></a>Rosati, P. (2025b). Enki: AI-Assistant for Archaeological Discoveries. Software and trained model. [github.com/archeorosati/enki](https://github.com/archeorosati/enki)

## See Also
- [Factsheet](factsheet.md) · [Random Forest on Sentinel-2](random-forest.md) · [Enki on Imagery of 1 m](enki.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
