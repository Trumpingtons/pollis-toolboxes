# Shift-Share

## What the Shift-Share Tab Fits

The Shift-Share tab fits a regression whose regressor, or instrument, is each area's exposure to common shocks: its shares in the shocks times the shocks, such as its shares of jobs in each industry times the national growth of each industry. Borusyak, Hull and Jaravel (2022) describe these shift-share, or Bartik, instruments as averaging a set of shocks with exposure shares as weights ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). The tab builds the design with `shift_share_design(S, g; controls, shock_names)` and fits it with `fit_shift_share(dy, d; treatment, vcov)` of SpatialEconometrics.jl ([Randsley (2026)](#ref-Ran2026a)). The outcome is a long difference: the mean of the last periods averaged minus the mean of the first, the number set by Periods Averaged.

## Reduced Form or Shift-Share IV

With an Endogenous Variable, the Shift-Share tab fits the shift-share instrumental variables regression: the long difference of the outcome on the long difference of the endogenous variable, instrumented by the shift-share regressor, and it prints the first stage. With Endogenous Variable empty, it fits the reduced form, the outcome on the shift-share regressor itself. Goldsmith-Pinkham, Sorkin and Swift (2020) describe the instrument as formed by interacting local industry shares and national industry growth rates ([Goldsmith-Pinkham, Sorkin and Swift (2020)](#ref-GSS2020a)). The Explanatory Variables enter as controls at their means over the first periods averaged, and an intercept is always added ([Randsley (2026)](#ref-Ran2026a)).

## Shares That Do Not Sum to the Same Total

The documentation of `shift_share_design` explains that the framework of Borusyak, Hull and Jaravel assumes each area's shares sum to the same total; when they do not, as with shares of manufacturing jobs only, the sum of the shares is an area characteristic correlated with the regressor and must be among the controls ([Randsley (2026)](#ref-Ran2026a)). The function warns and leaves the choice to the user. The Shift-Share tab adds the total as a control whenever the shares do not sum to the same total in every area, and says so in its first lines.

## Two Views of What Identifies a Shift-Share Design

Goldsmith-Pinkham, Sorkin and Swift (2020) show that the typical use of a Bartik instrument rests on the exogeneity of the shares, with the shares measuring differential exposure to common shocks ([Goldsmith-Pinkham, Sorkin and Swift (2020)](#ref-GSS2020a)). Borusyak, Hull and Jaravel (2022) give a framework in which identification follows from the quasi-random assignment of the shocks, while the shares are allowed to be endogenous ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). The Balance Test and The Estimate Shock by Shock steps follow the second view; Which Shocks Drive the Estimate follows the first, naming the shocks whose shares carry the estimate.

## The Standard Error of Adão, Kolesár and Morales

Adão, Kolesár and Morales (2019) show with a stylised economic model that regression residuals are correlated across areas with similar shares, independent of their location, and derive inference methods valid under arbitrary correlation of the residuals across areas ([Adão, Kolesár and Morales (2019)](#ref-AKM2019a)). `fit_shift_share` computes their standard error by default, from their equations 29 and 39, and offers HC1 for comparison only. Its documentation reports that in its simulations the interval of Adão, Kolesár and Morales covers less as the effective number of shocks falls, and that the null-imposed interval of the article is not implemented ([Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-AKM2019a"></a>Adão, R., Kolesár, M. and Morales, E. (2019). Shift-share designs: theory and inference. *Quarterly Journal of Economics*, 134(4), 1949–2010. [doi:10.1093/qje/qjz025](https://doi.org/10.1093/qje/qjz025)

<a id="ref-BHJ2022a"></a>Borusyak, K., Hull, P. and Jaravel, X. (2022). Quasi-experimental shift-share research designs. *Review of Economic Studies*, 89(1), 181–213. [doi:10.1093/restud/rdab030](https://doi.org/10.1093/restud/rdab030)

<a id="ref-GSS2020a"></a>Goldsmith-Pinkham, P., Sorkin, I. and Swift, H. (2020). Bartik instruments: what, when, why, and how. *American Economic Review*, 110(8), 2586–2624. [doi:10.1257/aer.20181047](https://doi.org/10.1257/aer.20181047)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Inference Without Standard Errors](inference.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
