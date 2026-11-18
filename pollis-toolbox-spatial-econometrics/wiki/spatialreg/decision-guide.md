# Decision Guide

## Choosing a Spatial Model from the LM Tests

The specific-to-general route starts from least squares on the OLS and LM Tests tab of the Spatial Lag and Error Models panel ([Anselin (1988)](#ref-Ans1988a); [Anselin, Bera, Florax and Yoon (1996)](#ref-ABFY1996a)):

| LM lag | LM error | Robust tests | Model the tests point to |
|---|---|---|---|
| Not significant | Not significant | Not needed | Least squares |
| Significant | Not significant | Not needed | Spatial lag (SAR) |
| Not significant | Significant | Not needed | Spatial error (SEM) |
| Significant | Significant | Robust LM lag larger and significant | Spatial lag (SAR) |
| Significant | Significant | Robust LM error larger and significant | Spatial error (SEM) |

When both robust tests stay significant, a model with both terms, or the spatial Durbin model, may be needed ([Elhorst (2014)](#ref-Elh2014a)).

## Testing Down from the Spatial Durbin Model

The general-to-specific route fits the spatial Durbin model first, because it nests the spatial lag, SLX and spatial error models, and tests the restrictions that lead to each. LeSage and Pace (2009) argue for it on the ground that leaving out a spatial lag of the outcome or of the explanatory variables biases the estimates, while including one that is not needed costs only efficiency ([LeSage and Pace (2009)](#ref-LP2009a)). The Likelihood Ratio Tests of the SDM step of the Spatial Lag and Error Models panel tests the spatial Durbin model against the spatial lag model (`theta = 0`), the SLX model (`rho = 0`) and the spatial error model (the common factor restriction `theta = -rho beta`).

## Spillovers or Shared Unobservables

The choice between a spatial lag and a spatial error model is also a question about the process. A spatial lag says that outcomes spill over between areas: one area's crime, prices or pollution affects its neighbours', and a change in one area travels over the map. A spatial error says that neighbouring areas share influences the model leaves out, with no spillover of the explanatory variables ([Anselin (1988)](#ref-Ans1988a)). Halleck Vega and Elhorst (2015) propose the SLX model as a starting point when the spillovers are local, from the neighbours' explanatory variables, since it needs no multiplier and is estimated by least squares ([Halleck Vega and Elhorst (2015)](#ref-HE2015a)).

## Choosing the Neighbours for a Spatial Model

Every estimate of a spatial model depends on the spatial weights, and the same data can favour different models under different weights. Contiguity suits polygons that tile a region; k nearest neighbours suits areas of very different sizes and leaves no islands, areas without a neighbour. The Weights: Contiguity and k Nearest step of the Spatial Lag and Error Models panel fits the tab's model with each, and the log-likelihoods can be compared, since the models have as many parameters ([LeSage and Pace (2009)](#ref-LP2009a)).

## References

<a id="ref-ABFY1996a"></a>Anselin, L., Bera, A. K., Florax, R. and Yoon, M. J. (1996). Simple diagnostic tests for spatial dependence. *Regional Science and Urban Economics*, 26(1), 77–104. [doi:10.1016/0166-0462(95)02111-6](https://doi.org/10.1016/0166-0462(95)02111-6)

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-HE2015a"></a>Halleck Vega, S. and Elhorst, J. P. (2015). The SLX model. *Journal of Regional Science*, 55(3), 339–363. [doi:10.1111/jors.12188](https://doi.org/10.1111/jors.12188)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

## See Also
- [Lagrange Multiplier Tests](lm-tests.md) · [Maximum Likelihood Estimation](maximum-likelihood.md) · [Spatial Durbin (SDM)](sdm.md) · [Overview](overview.md)
