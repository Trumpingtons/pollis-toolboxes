# Learned Detection in Lidar — Diagnostics

## No Features, or Very Few

A probability map with no cell at the Threshold means that nothing in the terrain model resembles what the model learned, or that the input does not look like its training data. Features and Scheduled Monuments shows whether known monuments of the area were missed. If they were, three causes are common. The monuments may be of kinds the model never saw. The terrain model may be coarser than the 0.5 m of training, so that small features cover too few cells ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). Or the input may not be a bare-earth terrain model. Lowering the Threshold shows whether the model responds weakly at the monuments or not at all. The map Probability of a Feature, in Zoom and Pan, shows the same over the whole area.

## Too Many Features

Many small features scattered over the area are the usual output of a model applied to ground that differs from its training. Field boundaries, drainage ditches, tracks, spoil heaps and the hummocks of rough ground all have local relief that can resemble banks and mounds. The Minimum Area removes the smallest of them, and the Minimum Roundness the long and ragged ones. Compute the Features lists first the features the model is surest of, which are usually the clearest forms. Features in straight lines or regular grids are likely to follow modern boundaries or artefacts of the terrain model, which Zoom and Pan shows on the image the model reads.

## Features Cut Along Straight Lines

The probability map is computed on tiles of 1024 by 1024 cells, counted from the north-west corner of the terrain model, and for an HRNet model ADAF leaves out the 8 cells along each edge of a tile when it draws features ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). A feature crossing the edge of a tile is therefore cut along a straight line, or split into two features, each smaller and less round than the whole. Compute the Features does the same, so that its features match ADAF's. The probability map has no such gaps. A terrain model whose area of interest lies away from the edges of the tiles avoids the problem, as does thresholding the saved probability map in a GIS.

## Features Near the Edge or a Gap of the Terrain Model

The local relief model needs heights within 10 m or 10 cells of each cell. Close to the edge of the terrain model, or to a gap in it such as water or missing data, the relief is undefined and set to 0 ([Hesse (2010)](#ref-Hes2010a)). The model then sees a flat band of uniform grey, unlike any training patch, and the edge of that band itself can look like a bank or a ditch. Features along the edge of the terrain model, or around its gaps, should be read with that in mind. A terrain model that extends some way beyond the area of interest keeps its edges out of the search.

## Features That Are Not Archaeological

A trained model gives a probability of resemblance, not of archaeology ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). Natural forms such as glacial mounds, sinkholes and the scars of springs, and modern ones such as reservoirs, roundabouts, landscaped mounds and the bunkers of golf courses, can resemble barrows and ringforts closely. These false alarms are expected, and each feature is a place to check. In England, Features and Scheduled Monuments sets the features beside the recorded monuments ([Historic England (2026)](#ref-HE2026a)). Older maps, aerial photographs and visits to the ground decide the rest.

## Few Tumuli on Another Terrain Model

The Tumuli model learned tumuli as they appear in the Multi-Scale Relief Model of one terrain model: the Xunta de Galicia's 1 m model, made from the lidar flights of 2015 and 2016, its points classified by hand ([Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a); [Xunta de Galicia (2026)](#ref-XG2026a)).

The same square kilometre of Calvos de Randín was read from two terrain models:
- On the Xunta's model of the authors' tile 41722, the model finds 59 of the 60 tumuli the authors list there.
- On a terrain model made from PNOA's lidar point clouds of 2016 or of 2024, by inverse distance weighting or by triangulation alike, it finds 6 and 1 of them ([Instituto Geográfico Nacional (2026)](#ref-IGN2026b)).

In those models, the highest local relief within 2 m of half of the authors' tumuli is less than 0.25 m (2016) or 0.2 m (2024). Few tumuli on a terrain model made otherwise, from another survey, by another classification or at another resolution, may come from the terrain model and not from the ground. In Galicia, the Xunta's sheets, `MDT_1m_h50_<sheet>.zip`, are the terrain model the detector learned from.

## Tumuli Removed by the Soil Mask

The soil mask sets the image to 0 on land where its random forest finds no tumuli can be, and no tumulus is found there. The authors' mask removed 24 of their known tumuli from the training data ([Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a)). The classes are of cells of 10 m, the cells of Sentinel-2, so a tumulus of 15 to 20 m covers few of them. Input Image, Step 3, prints the share of cells on land where tumuli can be found. Running it again with the Soil Mask set to None, and the steps after it, shows which tumuli the mask removed.

## Rock Outcrops, Roofs and Pools Found as Tumuli

Tumular forms that are not tumuli are the usual false detections of mound detectors. The authors' soil mask removed all urban areas and road infrastructure in Galicia, roundabouts among them, but not every false detection ([Berganzo-Besga, Orengo, Lumbreras, Carrero-Pazos, Fonte and Vilas-Estévez (2021)](#ref-BOLCF...2021a)). Of 3,086 detections they checked on aerial imagery, 324 were not tumuli: 225 rock outcrops, 33 roofs of isolated houses, 9 swimming pools and 57 other mound-shaped features. Some, such as mounds on golf courses, were told apart only by where they lay. The imagery beside the maps in Zoom and Pan, Look at the Features, shows the land at each tumulus found.

## References

<a id="ref-BOLCF...2021a"></a>Berganzo-Besga, I., Orengo, H. A., Lumbreras, F., Carrero-Pazos, M., Fonte, J. and Vilas-Estévez, B. (2021). Hybrid MSRM-based deep learning and multitemporal Sentinel 2-based machine learning algorithm detects near 10k archaeological tumuli in north-western Iberia. *Remote Sensing* 13(20), 4181. [doi:10.3390/rs13204181](https://doi.org/10.3390/rs13204181)


<a id="ref-CCCKK2026a"></a>Čož, N., Corns, A., Curran, S., Kocev, D. and Kokalj, Ž. (2026). Automatic detection of archaeological features from airborne laser scanning data using deep learning: development and evaluation of the ADAF tool. *Journal of Archaeological Science: Reports* 71, 105733. [doi:10.1016/j.jasrep.2026.105733](https://doi.org/10.1016/j.jasrep.2026.105733)

<a id="ref-Hes2010a"></a>Hesse, R. (2010). LiDAR-derived local relief models – a new tool for archaeological prospection. *Archaeological Prospection* 17(2), 67–72. [doi:10.1002/arp.374](https://doi.org/10.1002/arp.374)

<a id="ref-HE2026a"></a>Historic England (2026). National Heritage List for England (NHLE). Dataset, updated continuously. [historicengland.org.uk/listing/the-list](https://historicengland.org.uk/listing/the-list/)

<a id="ref-IGN2026b"></a>Instituto Geográfico Nacional (2026). PNOA-LiDAR. Dataset. Centro Nacional de Información Geográfica. [pnoa.ign.es](https://pnoa.ign.es/web/portal/pnoa-lidar/presentacion)

<a id="ref-XG2026a"></a>Xunta de Galicia (2026). MDT_1m_h50: digital terrain model of Galicia at 1 m from lidar. Dataset. Instituto de Estudos do Territorio. [mapas.xunta.gal](https://mapas.xunta.gal/es/mapas/productos-cartograficos/relieve)

## See Also
- [Overview](overview.md) · [ADAF Models](adaf.md) · [Tumuli Model](tumuli.md) · [Decision Guide](decision-guide.md)
