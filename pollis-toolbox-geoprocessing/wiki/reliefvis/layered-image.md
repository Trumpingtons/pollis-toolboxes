# Layered Image

## What the Layered Image Combines

The layered image is the Visualization for Archaeological Topography (VAT) of Kokalj and Somrak (2019): a hillshade, with slope, positive openness and the sky-view factor blended over it, so that one grey image carries what each of them shows best ([Kokalj and Somrak (2019)](#ref-KS2019a)). The hillshade gives the familiar look of a relief map, slope darkens steep edges, positive openness brightens banks and darkens ditches, and the sky-view factor deepens hollows. The combination was designed so that small features remain visible on level and on sloping ground alike, and so that one image serves for mapping on screen and as a map in the field. RVT names the combination with these settings VAT – Archaeological ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)).

## The Four Layers of the Layered Image

| Layer, from the bottom | Stretched from, to | Blend mode | Opacity |
|---|---|---|---|
| Hillshade, sun at 315 and 35 degrees | 0 to 1 | Normal | 100% |
| Slope, in degrees, reversed so that steep is dark | 0 to 50 | Luminosity | 50% |
| Positive openness, in degrees | 68 to 93 | Overlay | Openness Overlay input |
| Sky-view factor | 0.7 to 1 | Multiply | 25% |

Each visualisation is first stretched linearly onto 0 to 1 between the two values given, with values outside clipped to the ends. The sky-view factor and positive openness use the Search Radius and Directions inputs of the Layered Image tab ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a); [Kokalj and Somrak (2019)](#ref-KS2019a)).

## How the Blend Modes of the Layered Image Work

A layer is blended with the image built from the layers below it, and the opacity then mixes the blended image with the image below: at 50%, each contributes half. In a normal blend the layer replaces the image below. Luminosity takes the brightness of the layer and the colour of the image below; for grey images that is the brightness of the layer, the same as a normal blend. Multiply multiplies the two, so the layer can only darken: where the sky-view factor is low, the image grows darker. Overlay multiplies where the image below is dark and screens where it is light, pushing dark tones darker and light tones lighter by the amount the layer departs from mid-grey: it adds contrast where positive openness is far from its middle ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)).

## The Openness Overlay Input and RVT 2.2.3

Kokalj and Somrak (2019) blend positive openness by overlay at an opacity of 50% ([Kokalj and Somrak (2019)](#ref-KS2019a)). In RVT 2.2.3, the overlay function writes its result into the image below before the opacity is applied, so mixing the two at 50% mixes the overlay result with itself, and the openness reaches the image at full strength ([ZRC SAZU and University of Ljubljana (UL FGG) (2025)](#ref-ZRCUL2025a)). The Openness Overlay input of the Layered Image tab sets the opacity: 50 follows the published combination, and 100 gives the image RVT 2.2.3 renders. Replicate with RVT prints the layered image at the chosen opacity and at 100% beside RVT's values, where the second agrees with RVT.

## When the Layered Image Helps

The layered image suits a first look at an area and the mapping of features of many kinds at once: banks and ditches, mounds and pits, on plains and on hillsides, in one image that reads like a relief map. It is less suited to measuring, since its grey tones mix four quantities and have no unit; the local relief model gives heights in metres. Because the ranges of the stretches are fixed, layered images of different areas made with the same settings can be compared directly, and a layer whose values fall mostly outside its range, such as the sky-view factor in a deep valley, saturates. Kokalj and Somrak (2019) also describe settings for particular kinds of terrain ([Kokalj and Somrak (2019)](#ref-KS2019a)).

## References

<a id="ref-KS2019a"></a>Kokalj, Ž. and Somrak, M. (2019). Why not a single image? Combining visualizations to facilitate fieldwork and on-screen mapping. *Remote Sensing* 11(7), 747. [doi:10.3390/rs11070747](https://doi.org/10.3390/rs11070747)

<a id="ref-ZRCUL2025a"></a>ZRC SAZU and University of Ljubljana (UL FGG) (2025). RVT: Relief Visualization Toolbox in Python (rvt-py), version 2.2.3. [github.com/EarthObservation/RVT_py](https://github.com/EarthObservation/RVT_py)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Local Relief Model](local-relief.md) · [Sky-View Factor and Openness](sky-view-openness.md) · [Shaded Relief](shaded-relief.md)
