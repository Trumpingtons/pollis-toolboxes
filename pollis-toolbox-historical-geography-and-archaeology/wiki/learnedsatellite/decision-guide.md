# Learned Detection in Satellite Images — Decision Guide

## Choosing the Area of Learned Detection in Satellite Images

The Area of Learned Detection in Satellite Images is a box of west, south, east and north in degrees. It should hold the known sites and the ground to search, and enough ground away from the sites to draw the negatives from: an area barely larger than the sites leaves no cells at the Distance from Sites. The random forest learns what tells the sites from the rest of this area only, so an area of one kind of landscape, one geology and one land use gives it a clearer task than an area that mixes uplands, valleys and towns. Each scene is read for the area only, and a larger area takes proportionally longer.

## Choosing the Years and the Maximum Cloud

More scenes give a steadier mean, in which crops, ploughing and wet or dry spells average out. [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) averaged six years of Sentinel-2. Two or three years are a good start, with more for ground that changes a lot from year to year. The Maximum Cloud of Step 1 leaves out whole scenes that are mostly cloud, which would add little but time; the clouds of the scenes kept are left out cell by cell in Step 2. In a cloudy climate, a higher Maximum Cloud keeps scenes with clear parts over the area, at the cost of reading more scenes.

## Choosing the Known Sites

The known sites teach the random forest what a site looks like, so they should be sites of the kind sought, recorded with their true extent, and visible at 10 m. [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) chose mounds that could be clearly identified and located on imagery, and trained on five of them. Polygons of the sites' extent are better than points, since every cell inside is a positive; for points, the Radius gives each site a size, which should match the sites' own. Sites of different kinds, a hillfort beside a villa, teach a mixture, and one kind at a time is clearer. Keep some known sites out of the file, to check afterwards whether features meet them.

## Choosing the Negatives and the Distance from Sites

The negatives are the random forest's examples of ground that is not a site, drawn at random from the area. The Distance from Sites keeps them away from the known sites, so that the edges of a site and its surroundings, which may share its soil, are not taught as not a site. It should be larger than the uncertainty of the sites' outlines and smaller than the gaps between them. Negatives per Site Cell sets how many: more negatives teach a stricter model, which gives high probabilities to fewer cells. Since the negatives are drawn at random, unknown sites may be among them; with many negatives they are few, and the random forest learns little from them.

## Choosing the Threshold

The Threshold is the share of trees that must vote for a site at a cell for the cell to belong to a feature. [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) chose 0.55 by looking at the results on high-resolution imagery: higher thresholds outlined large and clear mounds better but lost small or partly covered ones. A higher Threshold gives fewer, smaller features, closer to the training sites in every band. A lower one gives more features, among them ground that resembles the sites in some bands only. The probability map saved in Step 6 can be opened in a GIS to choose a threshold by eye before computing the features.

## Choosing the Minimum Area and the Minimum Roundness

A probability map of a random forest has many single cells and small clusters above the threshold, from soils that happen to resemble the sites. [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) found their false positives were mainly such scattered, isolated cells. A Minimum Area of a few cells, some hundreds of square metres, leaves them out; a Minimum Area near the size of the smallest site sought leaves out more. A cell of the composite is 100 m². The Minimum Roundness leaves out long, thin features, such as the edges of fields and the banks of streams, when the sites sought are compact, as hillforts and mounds are.

## References

<a id="ref-OCGLG...2020a"></a>Orengo, H. A., Conesa, F. C., Garcia-Molsosa, A., Lobo, A., Green, A. S., Madella, M. and Petrie, C. A. (2020). Automated detection of archaeological mounds using machine-learning classification of multisensor and multitemporal satellite data. *Proceedings of the National Academy of Sciences* 117(31), 18240–18250. [doi:10.1073/pnas.2005583117](https://doi.org/10.1073/pnas.2005583117)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Random Forest on Sentinel-2](random-forest.md) · [Diagnostics](diagnostics.md)
