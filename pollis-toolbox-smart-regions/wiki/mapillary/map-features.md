# Map Features

## Map Features and Detections in Mapillary

A map feature of Mapillary is an object with a location, derived from several detections of it in several images; a detection is an object found in a single image, with its outline in the image ([Mapillary (2026)](#ref-Map2026a)). Each map feature has a value naming its kind, such as `object--support--utility-pole`, a type, either `traffic_sign` or `point`, the dates of the first and last images in which it was detected, the compass direction it faces, and the images it was derived from. The Map Features tab reads the map features; it does not read the detections.

## Traffic Signs and Points

The map features of type `traffic_sign` are traffic signs, with values such as `regulatory--stop`, `warning--curve-left` or `information--general-directions`; those of type `point` are other objects, such as utility poles (`object--support--utility-pole`), advertisements (`object--sign--advertisement`) and road markings (`marking--discrete--other-marking`) ([Mapillary (2026)](#ref-Map2026a)). Mapillary images annotated by hand have been published as benchmarks for methods that recognise such objects: the Mapillary Vistas Dataset of 25,000 images annotated into 66 object categories ([Neuhold, Ollmann, Rota Bulò and Kontschieder (2017)](#ref-NORK2017a)), and the Mapillary Traffic Sign Dataset of 100,000 images covering more than 300 classes of traffic sign ([Ertler, Mislej, Ollmann, Porzi, Neuhold and Kuang (2020)](#ref-EMOPN...2020a)).

## How the Map Features Tab Searches

The endpoint `/map_features` returns the map features in a bounding box smaller than 0.01 square degrees, at most 2,000 a request, filtered by their values, with `*` as a wildcard, and by the dates they were first and last seen ([Mapillary (2026)](#ref-Map2026a)). The Map Features tab splits the Area as the Images tab does, into boxes under that size, divided into four again when one returns 2,000 features. Values passes the kinds wanted, separated by commas, such as `regulatory--*, warning--*`; Kind keeps the traffic signs, the points or both.

## The Columns of the Features Table

| Column | What it holds |
|---|---|
| `id`, `value` | The map feature and the kind of object it is |
| `kind` | `traffic_sign` or `point` |
| `family` | The first part of the value, such as `regulatory` or `object` |
| `first_seen`, `last_seen` | The capture times of the first and last images in which it was detected |
| `aligned_direction` | The compass angle the object faces |
| `geom` | Its location |

Kinds of Map Features counts the commonest values over the Area, and Traffic Signs and Points sets the two types side by side.

## References

<a id="ref-EMOPN...2020a"></a>Ertler, C., Mislej, J., Ollmann, T., Porzi, L., Neuhold, G. and Kuang, Y. (2020). The Mapillary Traffic Sign Dataset for Detection and Classification on a Global Scale. *Computer Vision – ECCV 2020*, 12368, 68–84. [doi:10.1007/978-3-030-58592-1_5](https://doi.org/10.1007/978-3-030-58592-1_5)

<a id="ref-Map2026a"></a>Mapillary (2026). Mapillary API Documentation. [www.mapillary.com/developer/api-documentation](https://www.mapillary.com/developer/api-documentation)

<a id="ref-NORK2017a"></a>Neuhold, G., Ollmann, T., Rota Bulò, S. and Kontschieder, P. (2017). The Mapillary Vistas Dataset for Semantic Understanding of Street Scenes. *Proceedings of the IEEE International Conference on Computer Vision (ICCV)*, 5000–5009. [doi:10.1109/ICCV.2017.534](https://doi.org/10.1109/ICCV.2017.534)

## See Also
- [Image Search](image-search.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md) · [Factsheet](factsheet.md)
