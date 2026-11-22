# Candidate Features — Overview

## What a Candidate Feature Is

A candidate feature is a place in a terrain model whose form matches a rule written for an earthwork. A burial mound rises as a low, round dome; a pit sinks as a round hollow; a ring ditch is a narrow circle of lower ground; a bank or a ditch is a long, narrow strip above or below its surroundings. Each rule turns one of these descriptions into a test on the heights, and each place that passes becomes a candidate, with its position and measures of its size and shape. A candidate is a place to look at, not a site. Field drains, quarries, tree throws, spoil heaps and errors of the terrain model can pass the same tests. Each candidate is checked against maps, records and the ground before it is called archaeological ([Kokalj and Hesse (2017)](#ref-KH2017a)).

## Rule-Based Detection of Earthworks in Lidar Terrain Models

Airborne lidar measures the ground beneath trees and crops, and the terrain model made from it shows earthworks a few tens of centimetres high over whole landscapes. Looking at every square kilometre of such a model takes time, and small features are easy to miss. Rule-based detection searches the model with explicit tests of height, area and shape. Trier and Pilø (2012) matched a template to find pits from iron production and hunting in Norway, and found that automatic detection found more of the small pits than visual inspection ([Trier and Pilø (2012)](#ref-TP2012a)). Freeland, Heung, Burley, Clark and Knudby (2016) turned the terrain model upside down and filled its depressions to find the earth mounds of Tonga ([Freeland, Heung, Burley, Clark and Knudby (2016)](#ref-FHBCK2016a)). Because their rules are explicit, rule-based methods can be read, set and repeated on new areas without training data.

## The Four Methods of the Candidate Features Panel

The four tabs of the Candidate Features panel are four ways of writing the rules. Mounds and Pits and Hollows fill depressions: a pit is a depression of the surface, and a mound is a depression of the surface turned upside down. Each region filled deeper than a minimum is kept when its area and roundness lie within limits. Template Matching compares the ground around every cell with a small model of a mound, a pit or a ring ditch, and keeps the places that match closely, whatever their height. Threshold and Shape marks the ground that lies more than a threshold above or below the local trend and keeps the regions of the right area that are round or long. Davis, Lipo and Sanger (2019) compared inverse depression analysis, template matching and segmentation on the same lidar data and found no method consistently better than the others ([Davis, Lipo and Sanger (2019)](#ref-DLS2019a)).

## Why the Candidate Features Panel Searches the Local Relief Model

Earthworks are small forms on a larger landform. A barrow on a hilltop is the summit of the hill, and a pit on a slope is open on its downhill side. On the terrain model itself, filling the upside-down hill swallows the barrow, and the pit has no rim to fill to. The local relief model subtracts the mean height in a window around each cell, so that the landform is removed and the feature stands alone above or below zero ([Hesse (2010)](#ref-Hes2010a)). Template Matching and Threshold and Shape always search the local relief model. The two depression tabs search it by default, and keep the terrain model as an option through the Surface input, the surface to which Freeland, Heung, Burley, Clark and Knudby (2016) applied inverse depression analysis.

## Rule-Based and Learned Detection of Archaeological Features

Learned detection trains a model, usually a convolutional neural network, on examples of features marked by archaeologists. The trained model then finds new examples in visualisations of the terrain model. The Automatic Detection of Archaeological Features (ADAF) tool, for instance, runs models trained on enclosures, ringforts and barrows labelled by experts in Ireland, over visualisations computed with RVT ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). Learned detection can recognise forms that are hard to put into rules, but it needs labelled examples and behaves less predictably on landscapes unlike those it was trained on. Rule-based detection needs no examples, and its thresholds say plainly what was searched for. The two are often combined: rules propose candidates, and people or a trained model sort them.

## From Candidates to Known Sites

A list of candidates becomes useful when it is set beside what is already known. In England, the National Heritage List for England records the scheduled monuments, with their boundaries, and Historic England serves them openly on the web ([Historic England (2026)](#ref-HE2026a)). Candidates and Scheduled Monuments counts the candidates inside each monument and those outside every monument. A monument with no candidate inside shows a form the rules miss. A candidate outside every monument is either an unrecorded feature or a false alarm. Only records, older maps and visits to the ground tell the two apart. Save the Candidates as GeoPackage writes the list for a GIS, where each candidate can be checked against those sources.

## References

<a id="ref-CCCKK2026a"></a>Čož, N., Corns, A., Curran, S., Kocev, D. and Kokalj, Ž. (2026). Automatic detection of archaeological features from airborne laser scanning data using deep learning: development and evaluation of the ADAF tool. *Journal of Archaeological Science: Reports* 71, 105733. [doi:10.1016/j.jasrep.2026.105733](https://doi.org/10.1016/j.jasrep.2026.105733)

<a id="ref-DLS2019a"></a>Davis, D. S., Lipo, C. P. and Sanger, M. C. (2019). A comparison of automated object extraction methods for mound and shell-ring identification in coastal South Carolina. *Journal of Archaeological Science: Reports* 23, 166–177. [doi:10.1016/j.jasrep.2018.10.035](https://doi.org/10.1016/j.jasrep.2018.10.035)

<a id="ref-FHBCK2016a"></a>Freeland, T., Heung, B., Burley, D. V., Clark, G. and Knudby, A. (2016). Automated feature extraction for prospection and analysis of monumental earthworks from aerial LiDAR in the Kingdom of Tonga. *Journal of Archaeological Science* 69, 64–74. [doi:10.1016/j.jas.2016.04.011](https://doi.org/10.1016/j.jas.2016.04.011)

<a id="ref-Hes2010a"></a>Hesse, R. (2010). LiDAR-derived local relief models – a new tool for archaeological prospection. *Archaeological Prospection* 17(2), 67–72. [doi:10.1002/arp.374](https://doi.org/10.1002/arp.374)

<a id="ref-HE2026a"></a>Historic England (2026). National Heritage List for England (NHLE). Dataset, updated continuously. [historicengland.org.uk/listing/the-list](https://historicengland.org.uk/listing/the-list/)

<a id="ref-KH2017a"></a>Kokalj, Ž. and Hesse, R. (2017). *Airborne laser scanning raster data visualization: a guide to good practice*. Prostor, kraj, čas. Založba ZRC, Ljubljana. [doi:10.3986/9789612549848](https://doi.org/10.3986/9789612549848)

<a id="ref-TP2012a"></a>Trier, Ø. D. and Pilø, L. H. (2012). Automatic detection of pit structures in airborne laser scanning data. *Archaeological Prospection* 19(2), 103–121. [doi:10.1002/arp.1421](https://doi.org/10.1002/arp.1421)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md) · [Depressions: Mounds and Pits](depressions.md) · [Template Matching](template-matching.md) · [Threshold and Shape](threshold-shape.md)
