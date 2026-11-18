# Overview

## What Spatial Regression Models Are For

Spatial regression models explain an outcome measured on areas (crime in neighbourhoods, house prices in census tracts, air pollution in grid cells) when the observations are not independent: neighbouring areas share influences, and the outcome of one area may affect its neighbours. Least squares assumes independent errors, so spatial dependence left in its residuals makes its standard errors wrong, and a spatial lag of the outcome left out of it biases its coefficients ([Anselin (1988)](#ref-Ans1988a)). Spatial regression models put the dependence into the model, through a spatial weights matrix `W` that says which areas are neighbours and how much each counts ([LeSage and Pace (2009)](#ref-LP2009a)).

## The Spatial Weights Matrix W in Spatial Regression

The spatial weights matrix `W` has one row and one column per area; its entry `w_ij` is positive when area `j` is a neighbour of area `i`, and zero otherwise, with zeros on the diagonal. With row-standardised weights each row sums to 1, so `Wy` is the average of the neighbours' outcomes, the spatial lag of `y`, and `WX` the average of the neighbours' explanatory variables ([Anselin (1988)](#ref-Ans1988a)). Every estimate of a spatial model is conditional on `W`: a different definition of neighbours gives a different model, which is why the Spatial Lag and Error Models panel compares contiguity with k nearest neighbours.

## The Family of Spatial Models: SAR, SEM, SLX and SDM

| Model | Equation | Spatial terms |
|---|---|---|
| Spatial lag (SAR) | `y = rho W y + X beta + e` | The neighbours' outcomes |
| Spatial error (SEM) | `y = X beta + u`, `u = lambda W u + e` | Dependence in the error term |
| Spatial lag of X (SLX) | `y = X beta + W X theta + e` | The neighbours' explanatory variables |
| Spatial Durbin (SDM) | `y = rho W y + X beta + W X theta + e` | The neighbours' outcomes and explanatory variables |

The spatial Durbin model nests the other three: `theta = 0` gives the spatial lag model, `rho = 0` the SLX model, and `theta = -rho beta` the spatial error model ([LeSage and Pace (2009)](#ref-LP2009a); [Elhorst (2014)](#ref-Elh2014a)).

## What rho and lambda Measure in Spatial Regression

In the spatial lag model and the spatial Durbin model, `rho` measures how strongly an area's outcome depends on the average outcome of its neighbours. In the spatial error model, `lambda` measures the spatial dependence of the error term, between the parts of the outcomes that the explanatory variables leave unexplained. With row-standardised weights both must lie below 1 for the model to be defined. A spatial lag means that a change in one area travels to its neighbours, their neighbours and back, so its effects spread over the map; spatial dependence in the errors changes the standard errors and the efficiency of the estimates but carries no effect of the explanatory variables from area to area ([Anselin (1988)](#ref-Ans1988a)).

## References

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-Elh2014a"></a>Elhorst, J. P. (2014). *Spatial econometrics: from cross-sectional data to spatial panels*. Springer Berlin Heidelberg. [doi:10.1007/978-3-642-40340-8](https://doi.org/10.1007/978-3-642-40340-8)

<a id="ref-LP2009a"></a>LeSage, J. and Pace, R. K. (2009). *Introduction to spatial econometrics*. Chapman and Hall/CRC. [doi:10.1201/9781420064254](https://doi.org/10.1201/9781420064254)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Direct and Indirect Effects](effects.md) · [Spatial Lag (SAR)](sar.md) · [Spatial Error (SEM)](sem.md) · [Lag of X (SLX)](slx.md) · [Spatial Durbin (SDM)](sdm.md)
