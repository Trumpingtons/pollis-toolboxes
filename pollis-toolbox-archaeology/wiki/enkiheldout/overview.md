# Enki on Held-Out Ground — Overview

## What Enki on Held-Out Ground Tests

Enki on Held-Out Ground takes Enki, a classifier of RGB images trained by [Rosati (2025b)](#ref-Ros2025b) on tells and mound-like features of the Ancient Near East, to a region it was not trained on, and asks whether it finds the region's known sites, and whether training on those sites helps. The question for each image of 350 by 350 m stays Enki's own: does it hold a site or not. The ground, the kind of site and the imagery change. Each of its three tabs uses Enki's network in a different way, and each is scored on known sites it has not seen.

## What Transfer from a Trained Network Means for Enki

[Yosinski, Clune, Bengio and Lipson (2014)](#ref-YCBL2014a) found that the first layers of networks trained on natural images learn general features, applicable to many datasets and tasks, while the features of the last layers become specific to the original task. Enki's network is EfficientNet-B0 of [Tan and Le (2019)](#ref-TL2019a), started from weights trained on ImageNet and trained further on Enki's images of tells ([Rosati (2025a)](#ref-Ros2025a)), with a head of two dense layers on top. Enki on Held-Out Ground keeps the network beneath the head as it is in every tab and changes only what sits on top of its 1,280 channels, so that the few known sites of a region train few weights.

## What the Three Tabs of Enki on Held-Out Ground Train

| Tab | Network beneath the head | Head | Trained on the known sites |
|---|---|---|---|
| **As Published** | Enki's, frozen | Enki's | Nothing |
| **Frozen Features** | Enki's, frozen | Replaced by a random forest | The forest |
| **Fine-Tuned Head** | Enki's, frozen | Enki's, trained again | The two dense layers |

**Frozen Features** feeds the 1,280 channels Enki's network gives each image to a random forest, after [Breiman (2001)](#ref-Bre2001a), from DecisionTree.jl ([JuliaAI Contributors (2026)](#ref-JAIC2026a)). **Fine-Tuned Head** starts the two dense layers from Enki's weights and trains them on the known sites with `enki_finetune` of ArchaeologicalDetection.jl, which runs Enki's network with NNlib.jl ([FluxML Contributors (2026)](#ref-FMLC2026a)).

## How the Tabs of Enki on Held-Out Ground Are Scored

The area is split in two at the column of cells of 350 m that halves the known sites. Every tab trains on the sites of one side and is scored on the other, the **Held-Out Side**, whose sites none of the tabs has seen. Two scores are printed for the held-out side: the area under the ROC curve (AUC), the probability that a cell holding a site ranks above a cell holding none, and the share of the held-out sites that lie in the top **Share of Cells** of highest share.

## What the Next Steps of Enki on Held-Out Ground Do

| Group | Action | What it does |
|---|---|---|
| Visualise | **Probability Map** | The share for a site of every cell, with the known sites and the split |
| Visualise | **Training Curves** | The loss of the head after each epoch (Fine-Tuned Head) |
| Interpret | **Sites Missed** | The held-out sites outside the top Share of Cells, with their share and rank |
| Interpret | **Three Models on Held-Out Ground** | The three tabs scored on the same held-out side |
| Interpret | **What Was Retrained** | The weights frozen against those each tab trains |
| Export | **Features Found** | The top Share of Cells joined into features, written to a GeoPackage |
| Export | **Save the Tuned Model** | The trained head written with `enki_save` (Fine-Tuned Head) |

## References

<a id="ref-Bre2001a"></a>Breiman, L. (2001). Random forests. *Machine Learning* 45(1), 5–32. [doi:10.1023/A:1010933404324](https://doi.org/10.1023/A:1010933404324)

<a id="ref-FMLC2026a"></a>FluxML Contributors (2026). NNlib.jl: neural network primitives with multiple backends. [github.com/FluxML/NNlib.jl](https://github.com/FluxML/NNlib.jl)

<a id="ref-JAIC2026a"></a>JuliaAI Contributors (2026). DecisionTree.jl: Julia implementation of decision tree (CART) and random forest algorithms. [github.com/JuliaAI/DecisionTree.jl](https://github.com/JuliaAI/DecisionTree.jl)

<a id="ref-Ros2025a"></a>Rosati, P. (2025a). Enki: AI for Archaeology – Datasets for Automatic Site Recognition. Dataset, Zenodo. [doi:10.5281/zenodo.14950564](https://doi.org/10.5281/zenodo.14950564)

<a id="ref-Ros2025b"></a>Rosati, P. (2025b). Enki: AI-Assistant for Archaeological Discoveries. Software and trained model. [github.com/archeorosati/enki](https://github.com/archeorosati/enki)

<a id="ref-TL2019a"></a>Tan, M. and Le, Q. V. (2019). EfficientNet: Rethinking Model Scaling for Convolutional Neural Networks. *Proceedings of the 36th International Conference on Machine Learning*, Proceedings of Machine Learning Research 97, 6105–6114. [proceedings.mlr.press/v97/tan19a.html](https://proceedings.mlr.press/v97/tan19a.html)

<a id="ref-YCBL2014a"></a>Yosinski, J., Clune, J., Bengio, Y. and Lipson, H. (2014). How Transferable Are Features in Deep Neural Networks? *Advances in Neural Information Processing Systems 27*, 3320–3328. [doi:10.48550/arXiv.1411.1792](https://doi.org/10.48550/arXiv.1411.1792)

## See Also
- [Factsheet](factsheet.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Enki on Imagery of 1 m](../learnedsatellite/enki.md)
