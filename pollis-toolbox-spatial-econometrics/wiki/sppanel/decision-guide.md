# Decision Guide

## Choosing a Tab of the Spatial Panel Data Panel

| Situation | Tab | Reason |
|---|---|---|
| An area's outcome responds to its neighbours' outcomes in the same period | SAR, Fixed Effects | Estimates that spillover, rho, with direct, indirect and total effects |
| Unobserved shocks spread between neighbouring areas, the coefficients being what matters | SEM, Fixed Effects | Its coefficients are the effects of the explanatory variables as they stand |
| The neighbours' explanatory variables may matter as well as their outcomes | SDM, Fixed Effects | Nests both SAR and SEM, so the data can choose between them |
| The outcome persists from one period to the next | Dynamic Panel | Separates persistence over time from spillover in space, with short-run and long-run effects |

## Choosing the Fixed Effects of a Spatial Panel

Fixed effects of the areas remove what is constant in each area over the periods; fixed effects of the periods remove what is common to all areas in each period, such as a business cycle; Areas and Periods removes both. The choice limits the explanatory variables: with fixed effects of the areas a variable that does not change over time cannot be estimated, and with fixed effects of the periods one that is the same in every area cannot, and `fit_spatial_panel` stops with an error naming the column. `fit_dynamic_spatial_panel` treats only fixed effects of the areas, alone or with those of the periods, as meaningful choices ([Randsley (2026)](#ref-Ran2026a)). Lee and Yu (2010) treat both the model with fixed effects of the areas only and the model with both kinds ([Lee and Yu (2010)](#ref-LY2010a)). The Fixed-Effect Specifications step fits the tab's model under each choice.

## Lee and Yu's Transformation or Direct QML

On the SAR and SDM tabs the Estimation input chooses how the fixed effects are removed. Lee and Yu (2010) show that estimating the fixed effects along with the other parameters leaves some estimators inconsistent or their distributions not properly centred, and propose a transformation that gives consistent estimators with properly centred distributions ([Lee and Yu (2010)](#ref-LY2010a)). SpatialEconometrics.jl uses that transformation by default and describes it as the right choice for short panels; its direct quasi-maximum likelihood demeans the data and corrects afterwards the bias, of order one over the number of periods, that demeaning leaves in the error variance and the spatial parameter; the documentation prefers the transformation, which avoids the bias by construction, unless the direct estimator is wanted specifically ([Randsley (2026)](#ref-Ran2026a)). The Lee and Yu Against Direct QML step sets the two side by side.

## A Spatial Lag, Spatial Error or Spatial Durbin Panel

Baltagi, Song and Koh (2003) derive Lagrange multiplier tests for a panel regression with spatial error correlation and random effects of the regions, jointly and one at a time ([Baltagi, Song and Koh (2003)](#ref-BSK2003a)). The Panel LM Tests step computes, from pooled least squares, tests for a spatial lag, a spatial error and random effects of the areas, and a joint test; the documentation of `panel_lm_tests` advises reading the joint test first ([Randsley (2026)](#ref-Ran2026a)). The spatial Durbin model nests the other two: it reduces to the spatial lag model when the coefficients of the spatially lagged explanatory variables are zero, and to the spatial error model under the common factor restriction, in which each of them equals minus rho times the coefficient of its variable ([Randsley (2026)](#ref-Ran2026a)). The SAR, SEM and SDM step tests both restrictions.

## A Static or a Dynamic Spatial Panel

A static spatial panel leaves out the persistence of the outcome from one period to the next. A dynamic spatial panel includes it through the area's own outcome and its neighbours' outcomes in the previous period; with fixed effects, its quasi-maximum likelihood estimator needs the bias correction of Yu, de Jong and Lee (2008), which they derive when both the number of areas and the number of periods are large ([Yu, de Jong and Lee (2008)](#ref-YJL2008a)). The documentation of `fit_dynamic_spatial_panel` notes that the correction assumes few periods relative to the number of areas, and that the long-run effects exist only when the spectral radius of the implied system is below one ([Randsley (2026)](#ref-Ran2026a)). The Static Against Dynamic step fits both on the same periods.

## Quasi-Likelihood or Driscoll–Kraay Standard Errors

Driscoll and Kraay (1998) give conditions under which an extension of the usual nonparametric covariance estimators yields standard errors robust to very general forms of spatial and temporal dependence, as the number of periods becomes large ([Driscoll and Kraay (1998)](#ref-DK1998a)). Their estimator needs no distances between the areas; the documentation of `DriscollKraayVCOV` notes that it leans on a reasonable number of periods, the correction over time being poorly estimated in very short panels ([Randsley (2026)](#ref-Ran2026a)). The Driscoll–Kraay Standard Errors step sets them beside the quasi-likelihood standard errors on the SAR, SDM and Dynamic Panel tabs; SpatialEconometrics.jl does not compute them for the spatial error panel.

## References

<a id="ref-BSK2003a"></a>Baltagi, B. H., Song, S. H. and Koh, W. (2003). Testing panel data regression models with spatial error correlation. *Journal of Econometrics*, 117(1), 123–150. [doi:10.1016/S0304-4076(03)00120-9](https://doi.org/10.1016/S0304-4076(03)00120-9)

<a id="ref-DK1998a"></a>Driscoll, J. C. and Kraay, A. C. (1998). Consistent covariance matrix estimation with spatially dependent panel data. *Review of Economics and Statistics*, 80(4), 549–560. [doi:10.1162/003465398557825](https://doi.org/10.1162/003465398557825)

<a id="ref-LY2010a"></a>Lee, L.-f. and Yu, J. (2010). Estimation of spatial autoregressive panel data models with fixed effects. *Journal of Econometrics*, 154(2), 165–185. [doi:10.1016/j.jeconom.2009.08.001](https://doi.org/10.1016/j.jeconom.2009.08.001)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

<a id="ref-YJL2008a"></a>Yu, J., de Jong, R. and Lee, L.-f. (2008). Quasi-maximum likelihood estimators for spatial dynamic panel data with fixed effects when both n and T are large. *Journal of Econometrics*, 146(1), 118–134. [doi:10.1016/j.jeconom.2008.08.002](https://doi.org/10.1016/j.jeconom.2008.08.002)

## See Also
- [Overview](overview.md) · [Factsheet](factsheet.md) · [Replications](replications.md)
