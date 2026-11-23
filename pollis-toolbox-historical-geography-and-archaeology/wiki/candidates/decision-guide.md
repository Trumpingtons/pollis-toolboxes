# Candidate Features — Decision Guide

## Choosing a Tab of the Candidate Features Panel by the Form of the Feature

| Feature sought | Tab | Why |
|---|---|---|
| Mounds, barrows, spoil heaps | Mounds | Measures each mound's height above the level at which it spills, whatever its size |
| Pits, hollows, shafts, kiln bowls | Pits and Hollows | Measures each pit's depth below its rim |
| Pits or mounds of one known size | Template Matching | Scores the shape, so faint features of the right form are found |
| Ring ditches | Template Matching, Ring Ditch | The only tab with a model of a ring |
| Banks, ditches, hollow ways | Threshold and Shape, Long | Needs no closed form, and keeps long regions |
| Any raised or sunken form | Threshold and Shape, Any | One threshold, every region within the areas |

Davis, Lipo and Sanger (2019) compared inverse depression analysis, template matching and segmentation for mounds and shell rings, found no method consistently better than the others, and found a combination of methods the most effective ([Davis, Lipo and Sanger (2019)](#ref-DLS2019a)). Running two tabs and keeping the candidates both find, or either finds, is a choice between fewer false alarms and fewer misses.

## Local Relief Model or Terrain Model as the Surface

The Surface input of the Mounds and Pits and Hollows tabs chooses the surface whose depressions are filled. Local Relief Model removes the landform first, so that a mound on a hilltop or a ridge, and a pit on a slope, keep their own height and depth ([Hesse (2010)](#ref-Hes2010a)). Terrain Model fills the heights themselves, as Freeland, Heung, Burley, Clark and Knudby (2016) did on Tongatapu ([Freeland, Heung, Burley, Clark and Knudby (2016)](#ref-FHBCK2016a)). On level ground the two give similar candidates, and the terrain model gives heights from the true foot of each mound. On rolling ground the terrain model merges mounds into the hills they stand on and finds natural hollows as pits. There, Local Relief Model is the better choice.

## Setting the Trend Radius for Candidate Features

The Trend Radius sets the window of the local relief model, which all four tabs search except the depression tabs with Surface set to Terrain Model. A feature narrower than about twice the radius keeps its form, while a wider one is partly taken into the trend and loses height. The radius should therefore exceed the radius of the largest feature sought. Barrows and pits a few metres to 20 m across are kept by the default of 20 m. Large enclosures and platform mounds need 40 m or more. A larger radius also lets more of the natural landform through, such as the crests of ridges and the floors of small valleys, which then appear as raised or sunken regions.

## Setting the Minimum Height and the Threshold

The Minimum Height of the depression tabs and the Threshold of Threshold and Shape both set how high or deep a feature must be, in metres. A low value finds faint, ploughed-down features, and also the hummocks and hollows of the ground and the noise of the terrain model. A high value finds only well-preserved earthworks, and each of them as a smaller region, since only their upper or lower part passes. The default of 0.2 m for the depression tabs and 0.25 m for Threshold and Shape suits a 1 m terrain model of farmland. In woodland, where fewer lidar returns reach the ground and the terrain model is rougher, a higher value removes more of the noise.

## Setting the Areas and the Roundness

The Minimum Area and Maximum Area, in square metres, bound the size of a candidate. A region of a few cells is more often noise or a tree throw than a feature, and the default minimum of 20 m² drops it. Very large regions are usually landforms, and the default maximum of 5,000 m² drops them, while still keeping a round mound nearly 80 m across. The Minimum Roundness of the depression tabs keeps compact forms: 0.5 keeps regions up to twice as long as they are wide. A lower value adds oval mounds and linear hollows. A higher one keeps only near circles, at the cost of features that are damaged or joined to others.

## Setting the Template, Radii and Minimum Score

The Template input of the Template Matching tab sets the shape: Mound, Pit or Ring Ditch. The Radii, in metres, should span the radii of the features sought, a little below the smallest and a little above the largest, since each candidate keeps the radius that fits it best. Four or five radii are usually enough, as a template still matches features somewhat smaller or larger than itself. The Minimum Score sets how closely a place must match: 0.7 keeps clear domes and hollows, 0.5 adds damaged ones and much natural ground. Ring ditches, narrow and seldom complete, rarely score as high as domes and hollows, and need a Minimum Score near 0.5.

## References

<a id="ref-DLS2019a"></a>Davis, D. S., Lipo, C. P. and Sanger, M. C. (2019). A comparison of automated object extraction methods for mound and shell-ring identification in coastal South Carolina. *Journal of Archaeological Science: Reports* 23, 166–177. [doi:10.1016/j.jasrep.2018.10.035](https://doi.org/10.1016/j.jasrep.2018.10.035)

<a id="ref-FHBCK2016a"></a>Freeland, T., Heung, B., Burley, D. V., Clark, G. and Knudby, A. (2016). Automated feature extraction for prospection and analysis of monumental earthworks from aerial LiDAR in the Kingdom of Tonga. *Journal of Archaeological Science* 69, 64–74. [doi:10.1016/j.jas.2016.04.011](https://doi.org/10.1016/j.jas.2016.04.011)

<a id="ref-Hes2010a"></a>Hesse, R. (2010). LiDAR-derived local relief models – a new tool for archaeological prospection. *Archaeological Prospection* 17(2), 67–72. [doi:10.1002/arp.374](https://doi.org/10.1002/arp.374)

## See Also
- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Depressions: Mounds and Pits](depressions.md) · [Template Matching](template-matching.md) · [Threshold and Shape](threshold-shape.md)
