# Relief Visualisation — Decision Guide

## Which Visualisation for Which Feature

| Feature or task | Visualisation | Why |
|---|---|---|
| Height of a bank, depth of a ditch | Local Relief Model | Its values are metres above or below the trend |
| Ditches, hollow ways, pits | Sky-view factor, negative openness | Both are low or high exactly where the ground is enclosed |
| Banks, mounds, ridges | Positive openness | It rises above 90 degrees on convex forms |
| Features of every direction, without a light | Sky-View and Openness | No direction is favoured |
| A familiar view of the landscape | Hillshade | It reads as a relief map |
| Linear features at many angles | Several Directions | Lights from four directions leave fewer features unlit |
| Mapping on screen or in the field, one image | Layered Image | It combines the strengths of four visualisations |

The guide to good practice of Kokalj and Hesse (2017) compares the visualisations for features of many kinds and recommends looking at more than one ([Kokalj and Hesse (2017)](#ref-KH2017a)).

## Flat Ground and Steep Ground

On flat ground the slope is small everywhere, and a visualisation needs strong contrast to show features a few centimetres high: the local relief model and the sky-view factor stretched to a narrow range do this. On steep ground, a hillshade turns whole slopes dark or bright and features on them disappear; the sky-view factor and openness depend on the horizon, not on the direction of the slope, and keep features visible on both sides of a hill. The layered image was designed to work on both kinds of terrain at once, with settings that suit the mixed landscapes interpreters usually face ([Kokalj and Somrak (2019)](#ref-KS2019a)).

## Choosing the Trend Radius of the Local Relief Model

The trend radius sets which forms count as trend and which as local relief. A form much wider than the window becomes part of the trend and disappears; a form much narrower stays whole. A radius should therefore be larger than half the width of the widest feature sought. RVT allows radii from 10 to 50 cells ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)). A radius of 10 m keeps barrows and narrow ditches and removes almost everything else, as in the training of the ADAF tool ([Čož, Corns, Curran, Kocev and Kokalj (2026)](#ref-CCCKK2026a)); 20 m suits most earthworks; 40 m keeps large enclosures and hillforts but lets more of the landform through.

## Choosing the Search Radius and the Number of Directions

The search radius of the sky-view factor and openness sets how far each cell looks for its horizon. A short radius makes the measures sensitive to small, sharp features and blind to broad ones; a long radius lets hills and valleys darken the image and costs more time, since the time grows with the radius. RVT's default is 10 cells in 16 directions ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)). Eight directions are faster but give a blocky look to round features; 32 smooth them at twice the time.

## Choosing the Light of a Hillshade

A hillshade shows best the features that run across the light and hides those that run along it ([Devereux, Amable and Crow (2008)](#ref-DAC2008a)). The north-west light of 315 degrees is the convention of relief maps, because a light from the top of the map lets the eye read ridges as ridges. A low sun, 15 to 35 degrees above the horizon, lengthens the shadows of small features; a high sun flattens them. Several Directions combines four lights so that fewer features are lost ([Mark (1992)](#ref-Mar1992a)).

## References

<a id="ref-CCCKK2026a"></a>Čož, N., Corns, A., Curran, S., Kocev, D. and Kokalj, Ž. (2026). Automatic detection of archaeological features from airborne laser scanning data using deep learning: development and evaluation of the ADAF tool. *Journal of Archaeological Science: Reports* 71, 105733. [doi:10.1016/j.jasrep.2026.105733](https://doi.org/10.1016/j.jasrep.2026.105733)

<a id="ref-DAC2008a"></a>Devereux, B. J., Amable, G. S. and Crow, P. (2008). Visualisation of LiDAR terrain models for archaeological feature detection. *Antiquity* 82(316), 470–479. [doi:10.1017/S0003598X00096952](https://doi.org/10.1017/S0003598X00096952)

<a id="ref-KH2017a"></a>Kokalj, Ž. and Hesse, R. (2017). *Airborne laser scanning raster data visualization: a guide to good practice*. Prostor, kraj, čas. Založba ZRC, Ljubljana. [doi:10.3986/9789612549848](https://doi.org/10.3986/9789612549848)

<a id="ref-KS2019a"></a>Kokalj, Ž. and Somrak, M. (2019). Why not a single image? Combining visualizations to facilitate fieldwork and on-screen mapping. *Remote Sensing* 11(7), 747. [doi:10.3390/rs11070747](https://doi.org/10.3390/rs11070747)

<a id="ref-Mar1992a"></a>Mark, R. K. (1992). Multidirectional, oblique-weighted, shaded-relief image of the Island of Hawaii. U.S. Geological Survey Open-File Report 92-422. [doi:10.3133/ofr92422](https://doi.org/10.3133/ofr92422)

<a id="ref-ZRCUL2025a"></a>ZRC SAZU and University of Ljubljana (UL FGG) (2025). RVT: Relief Visualization Toolbox in Python (rvt-py), version 2.2.3. [github.com/EarthObservation/RVT_py](https://github.com/EarthObservation/RVT_py)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [Diagnostics](diagnostics.md) · [Local Relief Model](local-relief.md) · [Sky-View Factor and Openness](sky-view-openness.md) · [Shaded Relief](shaded-relief.md) · [Layered Image](layered-image.md)
