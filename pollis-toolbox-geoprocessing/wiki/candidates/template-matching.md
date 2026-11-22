# Template Matching

## What Template Matching Does

Template matching looks for places where the ground has a given shape. A template is a small grid of heights describing that shape, a dome or a hollow of a given radius. The template is set over each cell of the local relief model in turn, and the ground under it is compared with the template. The comparison gives a score at every cell, high where the ground has the template's shape, and the places that score highest are the candidates. Trier and Pilø (2012) matched a template of a pit to the terrain model to find the charcoal-burning pits and pitfall traps of Oppland, Norway, before a field survey ([Trier and Pilø (2012)](#ref-TP2012a)). Davis, Sanger and Lipo (2019) combined template matching with rules on shape to find earthen mounds, shell heaps and shell rings in South Carolina ([Davis, Sanger and Lipo (2019)](#ref-DSL2019a)).

## The Mound, Pit and Ring Ditch Templates

The Template input of the Template Matching tab chooses among three templates. `feature_template` of SmartRegions.jl draws each one on a square of cells, for a radius given in cells.

| Template | Shape within the radius | Around it |
|---|---|---|
| Mound | A half-dome, the height at distance d from the centre being the square root of the radius squared less d squared | Level ground out to 1.5 times the radius |
| Pit | The same half-dome, sunken | Level ground out to 1.5 times the radius |
| Ring Ditch | Level ground inside a ditch whose centre line lies at the radius, a quarter of the radius wide and at least one cell | Level ground out to 1.5 times the radius |

The ring of level ground matters as much as the shape itself. A form scores high only where the ground falls back to level around it, as it does around a free-standing mound or pit.

## Normalised Cross-Correlation

The score of the Template Matching tab is the normalised cross-correlation. It is computed from the template and the window of the local relief model of the same size centred on a cell. Each is taken less its mean, the two are multiplied cell by cell and summed, and the sum is divided by the square root of the product of their sums of squares. The score runs from −1 to 1. It is 1 where the window is the template raised or lowered and stretched by any factor, 0 where the two are unrelated, and −1 where the window is the template upside down. The score does not depend on the height of the feature, only on its shape, so a mound 20 cm high and one 2 m high of the same form score alike. `template_scores` of SmartRegions.jl counts cells beyond the edge, and cells with no height, as 0.

## Several Radii and the Best Score

Features of one kind come in many sizes, and a template matches best when its radius is close to that of the feature. The Radii input lists the radii to try, in metres. For each radius, `find_templates` of SmartRegions.jl turns the radius into cells, draws the template and scores every cell. Each cell keeps its best score over all radii, and the radius that gave it. A candidate thus records the radius that fits it best, a rough measure of its size. More radii, closer together, find more sizes, while each radius adds a full pass over the grid. The largest radius sets how far from the edge of the terrain model, or from a gap in it, a candidate may lie: 1.5 times that radius, so that every template it was matched with lies on measured ground.

## From Scores to Candidates in Template Matching

A feature scores high not only at its centre but also at cells near it, and a list of all cells above the Minimum Score would name every feature many times. `find_templates` therefore takes the cells scoring at least the Minimum Score from best to worst. It keeps a cell as a candidate unless it lies within the radius of a better candidate already kept, and marks the disc of its radius as taken. Each candidate records its `score`, its `radius` and its `height`, the local relief at its centre, which tells a raised form from a sunken one. Ring ditches score lower than mounds and pits, as the template is narrow and real ditches are rarely complete circles. Their Minimum Score is set lower, near 0.5, than for domes and hollows.

## Limits of Template Matching

A template describes one idealised shape. Features that are oval, ploughed down, cut by later ditches or joined to other earthworks match it less well, and their scores fall below the Minimum Score. Because the score ignores height, very low forms such as hummocks of a few centimetres, or the noise of the terrain model, can match the shape as well as an earthwork does. The `height` of each candidate, read beside its score, shows how much it actually rises or sinks. Long features, such as banks, ditches and hollow ways, have no centre and no radius, so templates of a dome or a ring do not find them. The Threshold and Shape tab does.

## References

<a id="ref-DSL2019a"></a>Davis, D. S., Sanger, M. C. and Lipo, C. P. (2019). Automated mound detection using lidar and object-based image analysis in Beaufort County, South Carolina. *Southeastern Archaeology* 38(1), 23–37. [doi:10.1080/0734578X.2018.1482186](https://doi.org/10.1080/0734578X.2018.1482186)

<a id="ref-TP2012a"></a>Trier, Ø. D. and Pilø, L. H. (2012). Automatic detection of pit structures in airborne laser scanning data. *Archaeological Prospection* 19(2), 103–121. [doi:10.1002/arp.1421](https://doi.org/10.1002/arp.1421)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Depressions: Mounds and Pits](depressions.md) · [Threshold and Shape](threshold-shape.md)
