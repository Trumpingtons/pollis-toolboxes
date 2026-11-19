# Decision Guide

## Which Tab of the Regionalisation and Spatial Regimes Panel to Use

| Question | Tab | What it gives |
|---|---|---|
| Which contiguous regions are alike inside? | SKATER Regions | The regions and their means |
| Do the coefficients differ between known regions? | Regimes, OLS, Regimes From Column | One set of coefficients per regime, and the Chow test |
| Do they differ, while outcomes spill over between neighbours? | Regimes, Spatial Lag | The same, with a spatial lag shared by the regimes |
| Do they differ between regions found from the data? | Either regime tab, Regimes From SKATER | The regime model on SKATER's regions, and the Bootstrap Chow Test |

## Regimes From a Column or From SKATER

Regimes from a column, such as a city and its county or the regions of a country, are fixed before the outcome is seen, so the Chow test reads as stated ([Chow (1960)](#ref-Cho1960a)). Regimes from SKATER suit the case where no boundary is known, but SKATER places its boundaries where the SKATER Variables differ most, and the documentation of `regime_chow_test` warns that the p-value is then optimistic ([Randsley (2026)](#ref-Ran2026a)). Given Regimes Against SKATER shows how far a known boundary and SKATER's regions agree, and the Bootstrap Chow Test gives a p-value that allows for the search.

## Least Squares or a Spatial Lag Within the Regimes

Regimes, OLS fits each regime by least squares. When Moran's I of the Residuals finds spatial dependence left, the outcome of an area may depend on its neighbours' outcomes, which Regimes, Spatial Lag models with one rho for the whole map ([Anselin (1988)](#ref-Ans1988a)). OLS Against Spatial Lag Regimes fits the same regimes both ways and tests rho = 0 by likelihood ratio. Anselin (1990) shows that ignoring spatial error dependence invalidates the usual tests of equal coefficients across regimes ([Anselin (1990)](#ref-Ans1990a)).

## Regimes or Geographically Weighted Regression

Spatial regimes and geographically weighted regression both let coefficients change over the map. The documentation of `SpatialRegimeModel` calls regimes a discrete alternative to GWR: GWR lets coefficients vary smoothly with location, while regimes estimate one set per group, easier to interpret and to test when the groups are meaningful ([Randsley (2026)](#ref-Ran2026a); [Brunsdon, Fotheringham and Charlton (1996)](#ref-BFC1996a)). A change that is abrupt at a boundary suits regimes; a gradual one suits GWR. Regimes Against GWR compares the single model, the regimes and GWR by AICc, and sets GWR's mean local coefficients in each regime beside the regime's own.

## References

<a id="ref-Ans1988a"></a>Anselin, L. (1988). *Spatial econometrics: methods and models*. Springer Netherlands. [doi:10.1007/978-94-015-7799-1](https://doi.org/10.1007/978-94-015-7799-1)

<a id="ref-Ans1990a"></a>Anselin, L. (1990). Spatial dependence and spatial structural instability in applied regression analysis. *Journal of Regional Science*, 30(2), 185–207. [doi:10.1111/j.1467-9787.1990.tb00092.x](https://doi.org/10.1111/j.1467-9787.1990.tb00092.x)

<a id="ref-BFC1996a"></a>Brunsdon, C., Fotheringham, A. S. and Charlton, M. E. (1996). Geographically weighted regression: a method for exploring spatial nonstationarity. *Geographical Analysis*, 28(4), 281–298. [doi:10.1111/j.1538-4632.1996.tb00936.x](https://doi.org/10.1111/j.1538-4632.1996.tb00936.x)

<a id="ref-Cho1960a"></a>Chow, G. C. (1960). Tests of equality between sets of coefficients in two linear regressions. *Econometrica*, 28(3), 591–605. [doi:10.2307/1910133](https://doi.org/10.2307/1910133)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Overview](overview.md) · [Testing Regimes](testing-regimes.md) · [Factsheet](factsheet.md)
