# Terrain Model from Point Cloud — Overview

## What a Lidar Point Cloud Holds

A lidar survey sends laser pulses from an aircraft or a drone and records where each pulse is reflected. A pulse that meets a tree can return several times: from the canopy, from branches, from the undergrowth and, if part of it gets through, from the ground. Each return becomes a point with its position, x, y and z, its intensity, its return number and the number of returns of its pulse. A point cloud is the set of all these points, often tens or hundreds of millions for a few square kilometres. The LAS format, defined by the American Society for Photogrammetry and Remote Sensing, keeps them with a class for each point, such as ground, vegetation, building or noise ([American Society for Photogrammetry and Remote Sensing (2025)](#ref-ASPRS2025a)).

## What a Bare-Earth Terrain Model Is

A bare-earth terrain model, a digital terrain model, is a grid of the height of the ground alone, with vegetation, buildings and other objects taken away. A digital surface model, by contrast, follows the top of whatever the pulses met first, the canopy of a forest or the roofs of a town. Making a terrain model from a point cloud takes two tasks: deciding which points are ground, the task of a ground filter, and turning the scattered ground points into a grid, which leaves cells without a ground point to be filled from the cells around them. Ground filters of many kinds have been compared experimentally on the same point clouds ([Sithole and Vosselman (2004)](#ref-SV2004a)).

## Why Archaeologists Make Their Own Terrain Model

The ground filter, the cell size and the filling of gaps decide which small forms of the ground survive into a terrain model. Banks, ditches, mounds, terraces and platforms often stand less than a metre above their surroundings, and a filter set for flooding or planning can smooth them away or leave vegetation as false mounds. Štular and Lozić compared nine ground filters on archaeological sites, and found that no filter was outstanding, and that the best one depends on the density of the data, the type of landscape and the type of archaeological features ([Štular and Lozić (2020)](#ref-SL2020a)). Making the terrain model from the points lets the choice be made for the features searched.

## Lidar Under Forest in Archaeology

Lidar reaches the ground through gaps in a forest canopy, which aerial photography cannot. Surveys of the Maya lowlands have mapped natural terrain and archaeological features beneath tropical forest over large areas, revealing interconnected settlement and landscapes with extensive infrastructure ([Canuto and 17 coauthors (2018)](#ref-CEGHA...2018a)). An airborne lidar survey and excavations brought to light the site of Aguada Fénix, in Tabasco, Mexico, with an artificial plateau 1,400 m long and 10 to 15 m high and causeways radiating out from it ([Inomata and 10 coauthors (2020)](#ref-ITLFO...2020a)). Under forest, fewer pulses reach the ground, so the terrain model there rests on fewer points, which the Terrain Model from Point Cloud panel shows in Check the Terrain Model.

## Terrain Model from Point Cloud Beside the Other Panels of Archaeological Prospection

Terrain Model from Point Cloud makes the terrain model that the other panels of Archaeological Prospection read. Relief Visualisation computes from it the images in which a person sees small forms of the ground ([Kokalj and Hesse (2017)](#ref-KH2017a)), such as the local relief model ([Hesse (2010)](#ref-Hes2010a)). Candidate Features finds places whose shape fits rules of height, area and roundness. Learned Detection in Lidar applies networks trained on labelled terrain models. The terrain model is saved as a Cloud-Optimised GeoTIFF in the Folder, and its file name is the Terrain Model of each of those panels, with the same Folder.

## References

<a id="ref-ASPRS2025a"></a>American Society for Photogrammetry and Remote Sensing (2025). LAS Specification 1.4, Revision 16. [github.com/ASPRSorg/LAS](https://github.com/ASPRSorg/LAS/releases/tag/1.4.R16)

<a id="ref-CEGHA...2018a"></a>Canuto, M. A., Estrada-Belli, F., Garrison, T. G., Houston, S. D., Acuña, M. J., Kováč, M., Marken, D., Nondédéo, P., Auld-Thomas, L., Castanet, C., Chatelain, D., Chiriboga, C. R., Drápela, T., Lieskovský, T., Tokovinine, A., Velasquez, A., Fernández-Díaz, J. C. and Shrestha, R. (2018). Ancient lowland Maya complexity as revealed by airborne laser scanning of northern Guatemala. *Science* 361(6409), eaau0137. [doi:10.1126/science.aau0137](https://doi.org/10.1126/science.aau0137)

<a id="ref-Hes2010a"></a>Hesse, R. (2010). LiDAR-derived local relief models – a new tool for archaeological prospection. *Archaeological Prospection* 17(2), 67–72. [doi:10.1002/arp.374](https://doi.org/10.1002/arp.374)

<a id="ref-ITLFO...2020a"></a>Inomata, T., Triadan, D., Vázquez López, V. A., Fernandez-Diaz, J. C., Omori, T., Méndez Bauer, M. B., García Hernández, M., Beach, T., Cagnato, C., Aoyama, K. and Nasu, H. (2020). Monumental architecture at Aguada Fénix and the rise of Maya civilization. *Nature* 582(7813), 530–533. [doi:10.1038/s41586-020-2343-4](https://doi.org/10.1038/s41586-020-2343-4)

<a id="ref-KH2017a"></a>Kokalj, Ž. and Hesse, R. (2017). *Airborne laser scanning raster data visualization: a guide to good practice*. Prostor, kraj, čas. Založba ZRC, Ljubljana. [doi:10.3986/9789612549848](https://doi.org/10.3986/9789612549848)

<a id="ref-SV2004a"></a>Sithole, G. and Vosselman, G. (2004). Experimental comparison of filter algorithms for bare-Earth extraction from airborne laser scanning point clouds. *ISPRS Journal of Photogrammetry and Remote Sensing* 59(1–2), 85–101. [doi:10.1016/j.isprsjprs.2004.05.004](https://doi.org/10.1016/j.isprsjprs.2004.05.004)

<a id="ref-SL2020a"></a>Štular, B. and Lozić, E. (2020). Comparison of filters for archaeology-specific ground extraction from airborne LiDAR point clouds. *Remote Sensing* 12(18), 3025. [doi:10.3390/rs12183025](https://doi.org/10.3390/rs12183025)

## See Also
- [Factsheet](factsheet.md) · [Ground Filters](ground-filters.md) · [Filling the Gaps](gap-filling.md) · [Point Cloud Files](point-cloud-files.md) · [Decision Guide](decision-guide.md) · [Diagnostics](diagnostics.md)
