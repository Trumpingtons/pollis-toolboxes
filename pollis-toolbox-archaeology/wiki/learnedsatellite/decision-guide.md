# Learned Detection in Satellite Images — Decision Guide

## Choosing the Model of Learned Detection in Satellite Images

Random Forest on Sentinel-2 suits sites large enough to cover many cells of 10 m, whose ground differs from the ground around them over the years, in an area where some are known: it learns their reflectance anew in each area ([Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a)). Enki suits tells and mound-like features that show as a form on imagery of 1 m, in the arid and semi-arid land of the kind it was trained on ([Rosati (2025b)](#ref-Ros2025b)). Enki as Published needs no known sites, and is the one to start with where none are known, or to see what Enki finds before adapting it. Enki Fine-Tuned on Known Sites adapts Enki's last two layers to the sites known in the area, which helps where the imagery or the landscape differ from Enki's training images, and needs a good number of known sites.

## Choosing the Area of Learned Detection in Satellite Images

The Area of Learned Detection in Satellite Images is a box of west, south, east and north in degrees. It should hold the known sites and the ground to search, and enough ground away from the sites to draw the negatives from: an area barely larger than the sites leaves no cells at the Distance from Sites. The random forest learns what tells the sites from the rest of this area only, so an area of one kind of landscape, one geology and one land use gives it a clearer task than an area that mixes uplands, valleys and towns. Each scene is read for the area only, and a larger area takes proportionally longer.

## Choosing the Years and the Maximum Cloud

More scenes give a steadier mean, in which crops, ploughing and wet or dry spells average out. [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) averaged six years of Sentinel-2. Two or three years are a good start, with more for ground that changes a lot from year to year. The Maximum Cloud of Step 1 leaves out whole scenes that are mostly cloud, which would add little but time; the clouds of the scenes kept are left out cell by cell in Step 2. In a cloudy climate, a higher Maximum Cloud keeps scenes with clear parts over the area, at the cost of reading more scenes.

## Choosing the Known Sites

The known sites teach the random forest what a site looks like, so they should be sites of the kind sought, recorded with their true extent, and visible at 10 m. [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) chose mounds that could be clearly identified and located on imagery, and trained on five of them. Polygons of the sites' extent are better than points, since every cell inside is a positive; for points, the Radius gives each site a size, which should match the sites' own. Sites of different kinds, a hillfort beside a villa, teach a mixture, and one kind at a time is clearer. Keep some known sites out of the file, to check afterwards whether features meet them.

## Choosing the Imagery of Enki

Enki was trained on Google's and Bing's satellite imagery at about 1 m, so imagery of that kind and resolution suits it best. Esri World Imagery and Google's satellite tiles need the user's own key, and their imagery comes under their terms, which are the user's to follow; their servers learn where the area is. A WMS or a raster file of the user's own, such as a national orthophoto, serves as well when it is in true colour at about 1 m. Imagery of 25 cm is warped to 1 m bilinearly; imagery coarser than 1 m is enlarged, and Enki then sees a blurred image unlike its training images. The Image File keeps the image read, so a new source needs a new file name.

## Choosing the Negatives and the Distance from Sites

The negatives are the random forest's examples of ground that is not a site, drawn at random from the area. The Distance from Sites keeps them away from the known sites, so that the edges of a site and its surroundings, which may share its soil, are not taught as not a site. It should be larger than the uncertainty of the sites' outlines and smaller than the gaps between them. Negatives per Site Cell sets how many: more negatives teach a stricter model, which gives high probabilities to fewer cells. Since the negatives are drawn at random, unknown sites may be among them; with many negatives they are few, and the random forest learns little from them.

## Choosing the Shift and the Negatives of Enki Fine-Tuned on Known Sites

Enki Fine-Tuned on Known Sites trains Enki's last two layers on nine images of each known site, centred on it and on the eight points the Shift away, and on cells of the grid away from the sites. The Shift teaches Enki sites off the centre of a cell, as the cells of the grid have them; it should stay well under half a cell, 175 m, so that the site stays inside the image. Negatives per Site Image sets how many cells away from the sites are drawn for each image of a site. The Distance from Sites should be more than half a cell plus the Shift plus the size of the sites, so that no negative cell shows part of a known site. Unknown tells may be among the negatives, and teach Enki that they are not tells; few negatives keep that rare.

## Choosing the Threshold

The Threshold is the share of trees that must vote for a site at a cell for the cell to belong to a feature. [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) chose 0.55 by looking at the results on high-resolution imagery: higher thresholds outlined large and clear mounds better but lost small or partly covered ones. A higher Threshold gives fewer, smaller features, closer to the training sites in every band. A lower one gives more features, among them ground that resembles the sites in some bands only. The probability map saved in Step 6 can be opened in a GIS to choose a threshold by eye before computing the features. For Enki, the Threshold is the share of its last layer for a tell. Its README keeps cells of 99% or more as candidates, and found most known tells of its test area above it, with the rest at about 98% ([Rosati (2025b)](#ref-Ros2025b)). A threshold just below 99% keeps those near misses, at the cost of more cells to look at. For Enki Fine-Tuned on Known Sites, the Share of Cells sets instead how much of the area the features cover, 0.1 keeping a tenth of the cells with imagery. A larger share keeps more cells to look at, among them sites ranked lower; a smaller one keeps only the cells ranked highest.

## Choosing the Minimum Area and the Minimum Roundness

A probability map of a random forest has many single cells and small clusters above the threshold, from soils that happen to resemble the sites. [Orengo and 6 coauthors (2020)](#ref-OCGLG...2020a) found their false positives were mainly such scattered, isolated cells. A Minimum Area of a few cells, some hundreds of square metres, leaves them out; a Minimum Area near the size of the smallest site sought leaves out more. A cell of the composite is 100 m², and a cell of Enki 122,500 m², so that for Enki a Minimum Area of one cell keeps the features of two cells or more. The Minimum Roundness leaves out long, thin features, such as the edges of fields and the banks of streams, when the sites sought are compact, as hillforts and mounds are.

## References

<a id="ref-OCGLG...2020a"></a>Orengo, H. A., Conesa, F. C., Garcia-Molsosa, A., Lobo, A., Green, A. S., Madella, M. and Petrie, C. A. (2020). Automated detection of archaeological mounds using machine-learning classification of multisensor and multitemporal satellite data. *Proceedings of the National Academy of Sciences* 117(31), 18240–18250. [doi:10.1073/pnas.2005583117](https://doi.org/10.1073/pnas.2005583117)

<a id="ref-Ros2025b"></a>Rosati, P. (2025b). Enki: AI-Assistant for Archaeological Discoveries. Software and trained model. [github.com/archeorosati/enki](https://github.com/archeorosati/enki)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Random Forest on Sentinel-2](random-forest.md) · [Enki on Imagery of 1 m](enki.md) · [Diagnostics](diagnostics.md)
