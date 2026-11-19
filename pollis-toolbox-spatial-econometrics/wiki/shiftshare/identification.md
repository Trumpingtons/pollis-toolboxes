# Shares, Shocks and Identification

## Two Views of What Identifies a Shift-Share Design

Goldsmith-Pinkham, Sorkin and Swift (2020) show that the typical use of a Bartik instrument rests on the exogeneity of the shares, with the shares measuring differential exposure to common shocks ([Goldsmith-Pinkham, Sorkin and Swift (2020)](#ref-GSS2020a)). Borusyak, Hull and Jaravel (2022) give a framework in which identification follows from the quasi-random assignment of the shocks, while the shares are allowed to be endogenous ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). The Shift-Share Designs panel estimates in the second framework, across the shocks. Its Balance Test and The Estimate Shock by Shock steps follow the second view; its Which Shocks Drive the Estimate step follows the first, naming the shocks whose shares carry the estimate.

## Shocks as Good as Randomly Assigned

In the framework of Borusyak, Hull and Jaravel (2022), the shift-share instrument is valid when the shocks are as good as randomly assigned relative to the areas' unobserved determinants of the outcome, averaged with the areas' shares as weights, and when the number of shocks is large with no shock carrying much of the exposure ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). The shares themselves may then be related to those determinants. The assumption can be weakened to random assignment conditional on controls at the level of the shocks, such as an indicator of each period in a stacked design. The panel adds those indicators to the regression across the shocks in every tab.

## Shares That Do Not Sum to the Same Total

The documentation of `shift_share_design` explains that the framework of Borusyak, Hull and Jaravel assumes each area's shares sum to the same total; when they do not, as with shares of manufacturing jobs only, the sum of the shares is an area characteristic correlated with the regressor and must be among the controls ([Randsley (2026)](#ref-Ran2026a)). The documentation of `fit_shock_level` adds the other remedy the authors use: a shock of value zero whose share is the rest of each area's total, so that the shares are complete. The Shift-Share Designs panel takes the first: it adds the total, and its product with each period indicator, whenever the shares do not sum to the same total in every row, and says so in its first lines.

## Stacked Periods in a Shift-Share Design

A stacked shift-share design has one row per area and period, with shares and shocks of each period's own: the changes of Autor, Dorn and Hanson (2013) are stacked over two periods, each with the shares of an earlier year ([Autor, Dorn and Hanson (2013)](#ref-ADH2013a)). In the Shift-Share Designs panel each shock is a value of the Shock Column in one period, so an industry is two shocks in a design of two periods, and an area's row has shares only in the shocks of its own period. An indicator of each period after the first is a control of the areas and of the shocks. Shock Clusters can group the same industry over the periods, as its shocks may be correlated.

## Exposure on the Map and Exposure Through Similar Shares

In a shift-share design, an area's exposure is its shares in the shocks. The documentation of `ShiftShareDesign` notes that two areas with similar shares have correlated values of the regressor, and so correlated residuals, whether or not they are near each other ([Randsley (2026)](#ref-Ran2026a)). Adão, Kolesár and Morales (2019) find this correlation independent of geographic location ([Adão, Kolesár and Morales (2019)](#ref-AKM2019a)). The neighbours on the map matter less here than the similarity of the shares: the Moran's I of the Residuals step measures the first, and the regression across the shocks allows for the second.

## References

<a id="ref-AKM2019a"></a>Adão, R., Kolesár, M. and Morales, E. (2019). Shift-share designs: theory and inference. *Quarterly Journal of Economics*, 134(4), 1949–2010. [doi:10.1093/qje/qjz025](https://doi.org/10.1093/qje/qjz025)

<a id="ref-ADH2013a"></a>Autor, D. H., Dorn, D. and Hanson, G. H. (2013). The China syndrome: local labor market effects of import competition in the United States. *American Economic Review*, 103(6), 2121–2168. [doi:10.1257/aer.103.6.2121](https://doi.org/10.1257/aer.103.6.2121)

<a id="ref-BHJ2022a"></a>Borusyak, K., Hull, P. and Jaravel, X. (2022). Quasi-experimental shift-share research designs. *Review of Economic Studies*, 89(1), 181–213. [doi:10.1093/restud/rdab030](https://doi.org/10.1093/restud/rdab030)

<a id="ref-GSS2020a"></a>Goldsmith-Pinkham, P., Sorkin, I. and Swift, H. (2020). Bartik instruments: what, when, why, and how. *American Economic Review*, 110(8), 2586–2624. [doi:10.1257/aer.20181047](https://doi.org/10.1257/aer.20181047)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Inference Across the Shocks](inference.md) · [Shift-Share IV](ssiv.md)
