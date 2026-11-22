# Candidate Features — Diagnostics

## Too Many Candidates

A long list of candidates usually means that the rules let the ground itself through. In the depression tabs and Threshold and Shape, small regions near the Minimum Area that lie scattered over the whole terrain model are mostly noise, ploughed furrows or tree throws. Raising the Minimum Height or the Threshold by 0.05 to 0.1 m, or the Minimum Area, removes most of them. In Template Matching, many candidates with high scores and a `height` near zero are places of nearly level ground whose small undulations happen to match the shape. A higher Minimum Score, or keeping only the candidates whose `height` exceeds a few centimetres, removes them. Highest Candidates lists the strongest candidates first, which are usually the clearest features.

## Too Few Candidates

A short list, or known features missing from it, means that the rules are stricter than the features. A mound or a pit lower than the Minimum Height or the Threshold is not marked at all. A feature wider than the Trend Radius loses height in the local relief model and can fall below the limit. A damaged or oval feature can fall below the Minimum Roundness or the Minimum Score. In the depression tabs with Surface set to Terrain Model, a mound on a slope or a hill spills at a low level and keeps little height. Profile Through a Place, through a feature that should have been found, shows its height and local relief, and which of the limits it misses.

## Features Merged Into One Candidate

Two features become one candidate when the cells between them pass the rule too. In the depression tabs, two mounds joined by ground higher than their surroundings fill as one, and in Threshold and Shape, two banks that meet, or a mound beside a bank, form one region through their eight neighbours. A merged candidate is larger and less round than either feature, and can be dropped by the Maximum Area or the roundness rules. A higher Minimum Height or Threshold, or a smaller Trend Radius that removes the ground joining them, separates them. In Template Matching, two features closer than the radius of the better one are always given as one candidate, the better one.

## One Feature Split Into Several Candidates

A feature becomes several candidates when part of it fails the rule. A ditch crossed by a gap, a bank cut by a track, or a ring ditch filled in places breaks into short regions, each with its own `id`. A mound with two summits fills as one region in the Mounds tab, but can form two regions in Threshold and Shape when the Threshold is above the ground between the summits. A lower Threshold or Minimum Height joins the pieces, at the cost of more noise. Candidates on the Image and Zoom on a Place show the outlines of the regions over the local relief model, where a row of small regions along a line shows a feature that was split.

## Candidates That Are Not Archaeological

The rules describe shapes, and many forms that are not earthworks share them. Natural ones include hummocks, sinkholes, tree throws and the hollows of springs. Modern ones include field drains, quarries, ponds, spoil heaps, the banks of roads and the remains of buildings that the lidar processing removed. Errors of the terrain model, where the ground was misclassified or sparsely measured, can pass too ([Kokalj and Hesse (2017)](#ref-KH2017a)). Candidates and Scheduled Monuments shows which candidates lie inside known monuments of England ([Historic England (2026)](#ref-HE2026a)). For the others, older maps, aerial photographs and a visit to the ground decide. Trier and Pilø (2012) combined automatic detection with inspection of the lidar data and a field survey for that reason ([Trier and Pilø (2012)](#ref-TP2012a)).

## Candidates Near the Edge or a Gap of the Terrain Model

Cells within the Trend Radius of the edge of the terrain model, or of a gap in it, have no local relief value. The depression tabs treat them as drains, and depressions that reach them do not fill. A mound or pit cut by the edge or a gap is therefore missing or found only in part. Template Matching keeps no candidate within 1.5 times the largest radius of the edge or of a gap. To search an area fully, the terrain model should extend beyond it by the Trend Radius plus the largest feature, and the candidates outside the area of interest should then be dropped.

## References

<a id="ref-HE2026a"></a>Historic England (2026). National Heritage List for England (NHLE). Dataset, updated continuously. [historicengland.org.uk/listing/the-list](https://historicengland.org.uk/listing/the-list/)

<a id="ref-KH2017a"></a>Kokalj, Ž. and Hesse, R. (2017). *Airborne laser scanning raster data visualization: a guide to good practice*. Prostor, kraj, čas. Založba ZRC, Ljubljana. [doi:10.3986/9789612549848](https://doi.org/10.3986/9789612549848)

<a id="ref-TP2012a"></a>Trier, Ø. D. and Pilø, L. H. (2012). Automatic detection of pit structures in airborne laser scanning data. *Archaeological Prospection* 19(2), 103–121. [doi:10.1002/arp.1421](https://doi.org/10.1002/arp.1421)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Depressions: Mounds and Pits](depressions.md) · [Template Matching](template-matching.md) · [Threshold and Shape](threshold-shape.md)
