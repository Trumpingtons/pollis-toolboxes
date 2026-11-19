# Spatial DiD

## What the Spatial DiD Tab Fits

The Spatial DiD tab fits the difference-in-differences regression of Delgado and Florax (2015) for data with local spatial interaction, in which an area's outcome depends on its own policy status and on that of its neighbours ([Delgado and Florax (2015)](#ref-DF2015a)). It calls `fit_spatial_did(y, treat, W; X, vcov, coords, dist_cutoff, order)` of SpatialEconometrics.jl, with the outcome as an areas by periods matrix. Beside the 0 and 1 column of the policy, the regression has the share of each area's neighbours under the policy, WD, and with Exposure Order 2 the share of the neighbours of its neighbours, W2D, each with a coefficient of its own. The documentation states that this is equation 6 of Delgado and Florax, without the restriction their derivation carries between the two coefficients, so that their restricted case is nested rather than assumed ([Randsley (2026)](#ref-Ran2026a)).

## Every Period or Mean Before and After

The Periods input sets how the periods enter the Spatial DiD tab. With Mean Before and After, each area's mean before the policy starts and its mean after are first-differenced, which removes the area's own level and leaves a regression with an intercept, the policy column, the shares of neighbours under the policy and the changes of the explanatory variables. With Every Period, fixed effects of the areas and of the periods are removed by the two-way within transformation, and the policy column may switch on in different periods in different areas ([Randsley (2026)](#ref-Ran2026a)). Goodman-Bacon (2021) shows that with timing that varies, the two-way fixed effects estimate is a weighted mean of all the two-group comparisons in the data, some with negative weights when the effect changes over time ([Goodman-Bacon (2021)](#ref-Goo2021a)). The tab prints a warning when the policy starts in different periods.

## The Four Effects of the Spatial DiD Tab

| Effect | What it is |
|---|---|
| Direct effect | The effect on an area under the policy of its own policy status, the coefficient of the policy column |
| Spillover onto the areas under the policy | The exposure coefficients times the mean share of neighbours under the policy among the areas under it |
| Spillover onto the comparison areas | The same coefficients times the mean share among the comparison areas |
| Total onto the areas under the policy | The direct effect plus the spillover onto them |

The documentation of `SpatialDiDResult` notes that the two spillovers come from the same coefficients evaluated at different mean shares, and that each effect is a fixed linear combination of the coefficients, so its standard error is exact ([Randsley (2026)](#ref-Ran2026a)).

## Standard Errors of the Spatial DiD Tab

The Standard Errors input offers clustering by area, Conley standard errors and those of least squares. Clustering by area allows any correlation over the periods within an area; Conley standard errors also allow correlation between areas closer than the Conley Cutoff, in metres of the Distance Coordinate System, with weights falling linearly to zero at it. With Mean Before and After there is one row per area, so clustering by area is robust to heteroskedasticity only. The documentation of `fit_spatial_did` reports, from its simulations, Conley intervals covering less as the cutoff widens and advises reporting more than one cutoff ([Randsley (2026)](#ref-Ran2026a)).

## When the Spillover Is Not Identified

The spillover coefficient is identified by comparison areas that differ in their share of neighbours under the policy. The documentation of `InterferenceReport` explains that when every comparison area has a neighbour under the policy, there is no unexposed baseline and the coefficient measures more against less exposure; when no comparison area has one, the spillover rests on the areas under the policy alone and cannot be told apart from the direct effect ([Randsley (2026)](#ref-Ran2026a)). The tab prints the counts and the message of `check_interference`, and the Interference Check step repeats them for each definition of the neighbours.

## References

<a id="ref-DF2015a"></a>Delgado, M. S. and Florax, R. J. G. M. (2015). Difference-in-differences techniques for spatial data: local autocorrelation and spatial interaction. *Economics Letters*, 137, 123–126. [doi:10.1016/j.econlet.2015.10.035](https://doi.org/10.1016/j.econlet.2015.10.035)

<a id="ref-Goo2021a"></a>Goodman-Bacon, A. (2021). Difference-in-differences with variation in treatment timing. *Journal of Econometrics*, 225(2), 254–277. [doi:10.1016/j.jeconom.2021.03.014](https://doi.org/10.1016/j.jeconom.2021.03.014)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Spillovers and Exposure](spillovers.md) · [Synthetic Control](synth.md) · [Decision Guide](decision-guide.md)
