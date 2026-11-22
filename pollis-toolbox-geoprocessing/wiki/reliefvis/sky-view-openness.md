# Sky-View Factor and Openness

## The Horizon of a Cell in Each Direction

The sky-view factor and openness both start from the horizon of each cell. In each of several directions, spread evenly around the compass, the cells along a line out to the search radius are examined, and the horizon angle is the steepest elevation angle from the cell to any of them: positive when the ground rises in that direction, negative when it falls away ([Zakšek, Oštir and Kokalj (2011)](#ref-ZOK2011a); [Yokoyama, Shirasawa and Pike (2002)](#ref-YSP2002a)). A cell in a ditch has high horizons on both sides; a cell on a bank has low or negative horizons. Neither measure needs a light, so a feature looks the same whatever its direction. The Search Radius and Directions inputs of the Sky-View and Openness tab set how far and in how many directions the horizon is sought.

## What the Sky-View Factor Measures

The sky-view factor is the share of the sky seen from a cell, from 0 to 1. Zakšek, Oštir and Kokalj (2011) compute it as one less the mean, over the directions, of the sine of the horizon angle, with a horizon below the level of the cell counted as level ([Zakšek, Oštir and Kokalj (2011)](#ref-ZOK2011a)). On a plain or a crest the whole sky is seen and the factor is 1; in a ditch, a hollow way or a narrow valley it drops. The sky-view factor therefore marks concave forms strongly and leaves convex forms, banks and mounds, almost as bright as flat ground. Shown in grey, with dark for a low factor, it resembles the ground lit by a diffuse, overcast sky.

## What Positive Openness Measures

Positive openness is the mean, over the directions, of the angle between the zenith and the horizon, in degrees ([Yokoyama, Shirasawa and Pike (2002)](#ref-YSP2002a)). On level ground the horizon lies at the level of the cell and the angle is 90 degrees. On a bank, a mound or a ridge the ground falls away, the horizon drops below the level of the cell and positive openness rises above 90; in a ditch or a pit the horizon rises and it falls below 90. Unlike the sky-view factor, positive openness responds to convex forms as much as to concave ones, which is why the layered image uses it to bring out banks and mounds.

## What Negative Openness Measures

Negative openness looks at the surface from below: it is the mean angle between the nadir and the horizon seen from beneath the ground ([Yokoyama, Shirasawa and Pike (2002)](#ref-YSP2002a)). It equals the positive openness of the terrain model turned upside down, which is how the Relief Visualisation panel computes it, with the heights negated. Negative openness is high in ditches, pits and hollow ways and low on banks and crests, the mirror of positive openness, so that the two together tell raised from sunken features. Measures Compared prints the correlations of the sky-view factor, both openness measures and the local relief model.

## The Search Radius and the Number of Directions

The search radius limits how far the horizon is sought: a hill beyond it casts no influence, so a short radius isolates small features and a long one brings in the surrounding landform. RVT's defaults are a radius of 10 cells and 16 directions ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)). Yokoyama, Shirasawa and Pike (2002) used eight directions, the eight neighbours of a cell. More directions sample the horizon more finely and remove the angular pattern that few directions give to round features. The time of the computation grows with the radius times the number of directions, so a radius of 20 m on a grid of 0.5 m costs four times as much as one of 10 m on a grid of 1 m.

## How the Panel Follows RVT's Sampling of the Horizon

RVT samples each direction at distances from one cell to the search radius in steps of a third of a cell, rounds each point to the nearest whole cell and keeps each cell once ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)). The Sky-View and Openness tab uses the same points, which is why Replicate with RVT agrees with RVT's values to many digits. `sky_view_factor` of Geomorphometry.jl computes a different quantity, the mean of the squared cosine of the horizon angle with no search radius, which is a measure of the sky seen over the whole grid rather than within a radius ([Pronk and Schouten (2026)](#ref-PS2026a)); the panel therefore computes the horizon itself.

## References

<a id="ref-PS2026a"></a>Pronk, M. and Schouten, R. (2026). Geomorphometry.jl: analyzing and visualizing the shape of the Earth in Julia. *Journal of Open Source Software* 11(122), 10395. [doi:10.21105/joss.10395](https://doi.org/10.21105/joss.10395)

<a id="ref-YSP2002a"></a>Yokoyama, R., Shirasawa, M. and Pike, R. J. (2002). Visualizing topography by openness: a new application of image processing to digital elevation models. *Photogrammetric Engineering and Remote Sensing* 68(3), 257–265.

<a id="ref-ZOK2011a"></a>Zakšek, K., Oštir, K. and Kokalj, Ž. (2011). Sky-view factor as a relief visualization technique. *Remote Sensing* 3(2), 398–415. [doi:10.3390/rs3020398](https://doi.org/10.3390/rs3020398)

<a id="ref-ZRCUL2025a"></a>ZRC SAZU and University of Ljubljana (UL FGG) (2025). RVT: Relief Visualization Toolbox in Python (rvt-py), version 2.2.3. [github.com/EarthObservation/RVT_py](https://github.com/EarthObservation/RVT_py)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Local Relief Model](local-relief.md) · [Layered Image](layered-image.md)
