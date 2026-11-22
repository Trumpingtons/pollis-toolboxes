# Learned Detection in Lidar — Diagnostics

## No Features, or Very Few

A probability map with no cell at the Threshold means that nothing in the terrain model resembles what the model learned, or that the input does not look like its training data. Features and Scheduled Monuments shows whether known monuments of the area were missed. If they were, three causes are common. The monuments may be of kinds the model never saw. The terrain model may be coarser than the 0.5 m of training, so that small features cover too few cells ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). Or the input may not be a bare-earth terrain model. Lowering the Threshold shows whether the model responds weakly at the monuments or not at all. Probability on the Image shows the same over the whole area.

## Too Many Features

Many small features scattered over the area are the usual output of a model applied to ground that differs from its training. Field boundaries, drainage ditches, tracks, spoil heaps and the hummocks of rough ground all have local relief that can resemble banks and mounds. The Minimum Area removes the smallest of them, and the Minimum Roundness the long and ragged ones. Compute the Features lists first the features the model is surest of, which are usually the clearest forms. Features in straight lines or regular grids are likely to follow modern boundaries or artefacts of the terrain model, which Zoom on a Place shows on the image the model reads.

## Features Cut Along Straight Lines

The probability map is computed on tiles of 1024 by 1024 cells, counted from the north-west corner of the terrain model, and ADAF leaves out the 8 cells along each edge of a tile when it draws features ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). A feature crossing the edge of a tile is therefore cut along a straight line, or split into two features, each smaller and less round than the whole. Compute the Features does the same, so that its features match ADAF's. The probability map has no such gaps. A terrain model whose area of interest lies away from the edges of the tiles avoids the problem, as does thresholding the saved probability map in a GIS.

## Features Near the Edge or a Gap of the Terrain Model

The local relief model needs heights within 10 m or 10 cells of each cell. Close to the edge of the terrain model, or to a gap in it such as water or missing data, the relief is undefined and set to 0 ([Hesse (2010)](#ref-Hes2010a)). The model then sees a flat band of uniform grey, unlike any training patch, and the edge of that band itself can look like a bank or a ditch. Features along the edge of the terrain model, or around its gaps, should be read with that in mind. A terrain model that extends some way beyond the area of interest keeps its edges out of the search.

## Features That Are Not Archaeological

A trained model gives a probability of resemblance, not of archaeology ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). Natural forms such as glacial mounds, sinkholes and the scars of springs, and modern ones such as reservoirs, roundabouts, landscaped mounds and the bunkers of golf courses, can resemble barrows and ringforts closely. These false alarms are expected, and each feature is a place to check. In England, Features and Scheduled Monuments sets the features beside the recorded monuments ([Historic England (2026)](#ref-HE2026a)). Older maps, aerial photographs and visits to the ground decide the rest.

## References

<a id="ref-CCCKK2026a"></a>Čož, N., Corns, A., Curran, S., Kocev, D. and Kokalj, Ž. (2026). Automatic detection of archaeological features from airborne laser scanning data using deep learning: development and evaluation of the ADAF tool. *Journal of Archaeological Science: Reports* 71, 105733. [doi:10.1016/j.jasrep.2026.105733](https://doi.org/10.1016/j.jasrep.2026.105733)

<a id="ref-Hes2010a"></a>Hesse, R. (2010). LiDAR-derived local relief models – a new tool for archaeological prospection. *Archaeological Prospection* 17(2), 67–72. [doi:10.1002/arp.374](https://doi.org/10.1002/arp.374)

<a id="ref-HE2026a"></a>Historic England (2026). National Heritage List for England (NHLE). Dataset, updated continuously. [historicengland.org.uk/listing/the-list](https://historicengland.org.uk/listing/the-list/)

## See Also
- [Overview](overview.md) · [ADAF Models](adaf.md) · [Decision Guide](decision-guide.md)
