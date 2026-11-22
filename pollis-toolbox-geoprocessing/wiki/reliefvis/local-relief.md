# Local Relief Model

## What the Local Relief Model Measures

The local relief model separates the small forms of the ground from the broad shape of the land. The broad shape, the trend, is estimated by smoothing the terrain model; the local relief is the terrain model less the trend ([Hesse (2010)](#ref-Hes2010a)). The result is in metres: a cell on a bank or a mound lies above the trend and is positive, a cell in a ditch or a pit lies below it and is negative, and level ground is near zero whatever its height above the sea. Because the values keep their unit, the local relief model is the visualisation from which the height of a bank or the depth of a ditch can be read, and it shows features on a hillside as clearly as on a plain.

## The Simple Local Relief Model and Hesse's Procedure

Hesse (2010) built the trend in several steps: the terrain model smoothed by a low-pass filter, the difference between the two, the lines where that difference is zero, and a new trend surface interpolated from the heights of the terrain model along those lines, which is less disturbed by the features themselves ([Hesse (2010)](#ref-Hes2010a)). The simple local relief model of RVT keeps only the first step: the trend is the mean height in a square window around each cell, and the result is the terrain model less that mean ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a); [Kokalj and Hesse (2017)](#ref-KH2017a)). The Local Relief Model tab of the Relief Visualisation panel computes the simple local relief model, which is what RVT and the ADAF tool use.

## How the Trend Radius Shapes the Local Relief Model

The Trend Radius input gives the radius of the window, in metres; the window is a square of twice the radius plus one cell on each side. A feature narrower than the window keeps its form in the local relief model, while a feature as wide as the window or wider is partly absorbed into the trend and loses height. Close to a large feature, the trend is pulled up or down by it, and a faint halo of the opposite sign surrounds the feature: a mound sits in a shallow negative ring, a ditch in a positive one. RVT's default radius is 20 cells and its function `slrm` accepts radii from 10 to 50 cells ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)).

## Reading the Values of the Local Relief Model

Most of a landscape lies within a few centimetres of its trend, so the values of a local relief model gather tightly around zero, with long tails where the earthworks, buildings and gullies are. Show the Image stretches the image from the 2% to the 98% quantile, so that the contrast is spent on the common values rather than on a few extreme cells. A fixed stretch is better for comparing areas: the ADAF tool stretches the simple local relief model from −0.5 to 0.5 m before its models see it ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)). Summary of the Result prints the quantiles, and Profile Through a Place the values along a line, where a bank rises above zero and a ditch sinks below it.

## How the Local Relief Model Is Computed

The mean of a square window around every cell is computed from summed-area tables: the cumulative sums of the heights along both axes, from which the sum over any rectangle is four lookups, whatever the size of the window. RVT computes its mean filter in the same way, counting only the cells with a height, so that a gap in the terrain model does not pull the mean down ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)). The Relief Visualisation panel subtracts the overall mean height before summing, which keeps the sums small and exact. RVT pads the edge of the grid with the edge values; the panel leaves out the cells within one radius of the edge instead.

## References

<a id="ref-CCCKK2026a"></a>Čož, N., Corns, A., Curran, S., Kocev, D. and Kokalj, Ž. (2026). Automatic detection of archaeological features from airborne laser scanning data using deep learning: development and evaluation of the ADAF tool. *Journal of Archaeological Science: Reports* 71, 105733. [doi:10.1016/j.jasrep.2026.105733](https://doi.org/10.1016/j.jasrep.2026.105733)

<a id="ref-Hes2010a"></a>Hesse, R. (2010). LiDAR-derived local relief models – a new tool for archaeological prospection. *Archaeological Prospection* 17(2), 67–72. [doi:10.1002/arp.374](https://doi.org/10.1002/arp.374)

<a id="ref-KH2017a"></a>Kokalj, Ž. and Hesse, R. (2017). *Airborne laser scanning raster data visualization: a guide to good practice*. Prostor, kraj, čas. Založba ZRC, Ljubljana. [doi:10.3986/9789612549848](https://doi.org/10.3986/9789612549848)

<a id="ref-ZRCUL2025a"></a>ZRC SAZU and University of Ljubljana (UL FGG) (2025). RVT: Relief Visualization Toolbox in Python (rvt-py), version 2.2.3. [github.com/EarthObservation/RVT_py](https://github.com/EarthObservation/RVT_py)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Sky-View Factor and Openness](sky-view-openness.md) · [Layered Image](layered-image.md)
