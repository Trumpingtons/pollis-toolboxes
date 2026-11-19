# Replications

## The China Shock of Autor, Dorn and Hanson

Autor, Dorn and Hanson (2013) relate the rise of imports from China between 1990 and 2007 to changes in manufacturing employment across US local labour markets, the commuting zones ([Autor, Dorn and Hanson (2013)](#ref-ADH2013a)). The exposure of each zone is its shares of employment in each manufacturing industry, at the start of each period, times the growth of US imports from China in that industry per worker. The growth of imports from China in other high-income countries instruments it, as a shift-share instrument whose shocks are those industries' growth rates. The changes are stacked over two periods, 1990 to 2000 and 2000 to 2007, and weighted by each zone's share of the national working-age population.

## Table 4 of Borusyak, Hull and Jaravel

Borusyak, Hull and Jaravel (2022) estimate the design of Autor, Dorn and Hanson across the industries, in Table 4, and report for each column the coefficient, its standard error clustered by 3-digit SIC code, the confidence interval with the null imposed and the first-stage F across the industries ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). Their replication files give the data of the zones, the shares and the shocks, which PollisDatasets.jl holds as `adh_czones`, `adh_shocks` and the file `adh_shares.parquet`, with the zones' polygons in `us_czones.gpkg`. The Borusyak, Hull and Jaravel's Table 4 step of the Shift-Share Designs panel computes the seven columns with `fit_shock_level` and prints each value beside the article's ([Randsley (2026)](#ref-Ran2026a)).

## The Controls of the Seven Columns of Table 4

| Column | Controls of the zones | Controls of the industries |
|---|---|---|
| 1 | Period, the manufacturing share of the zone, the controls of Autor, Dorn and Hanson | None; the shares completed by a shock of 0 |
| 2 | Period, the sum of the shares, the controls of Autor, Dorn and Hanson | None |
| 3 | Column 2 with the sum of the shares by period | Period |
| 4 | Period and the sum of the shares by period | Period |
| 5 | Column 3 with the shares of ten groups of industries | Period and the group |
| 6 | Column 3 with five characteristics of the zones' industries | Period and the five characteristics |
| 7 | Column 3 with the share of every industry | Period and the industry |

The controls of Autor, Dorn and Hanson are the census divisions and five characteristics of the zones' populations and jobs ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)).

## Column 1 of Table 4 and the Completed Shares

The shares of manufacturing employment do not sum to the same total in every zone. Column 1 of Table 4 of Borusyak, Hull and Jaravel (2022) completes them instead of controlling for their sum: it adds, in each period, an industry with a shock of 0 whose share is the rest of each zone's employment ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). The documentation of `fit_shock_level` names this remedy ([Randsley (2026)](#ref-Ran2026a)). The replication step builds those shares and shocks in Julia for column 1 only; the other columns control for the sum of the shares, as the tabs of the panel do.

## Column 7 of Table 4 and the Small-Sample Correction

Column 7 of Table 4 of Borusyak, Hull and Jaravel (2022) adds an indicator of every industry to the regression across the industries ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). Their replication files absorb those indicators with Stata's `ivreghdfe`, which multiplies the variance by a small-sample correction for the number of clusters and of observations, while the other columns use `ivreg2` without one. `fit_shock_level` computes the standard error without a correction, as `ivreg2` does ([Randsley (2026)](#ref-Ran2026a)). The replication step prints column 7 also with the correction, the number of clusters over that number less one, times the number of shocks less one over that number less three.

## References

<a id="ref-ADH2013a"></a>Autor, D. H., Dorn, D. and Hanson, G. H. (2013). The China syndrome: local labor market effects of import competition in the United States. *American Economic Review*, 103(6), 2121–2168. [doi:10.1257/aer.103.6.2121](https://doi.org/10.1257/aer.103.6.2121)

<a id="ref-BHJ2022a"></a>Borusyak, K., Hull, P. and Jaravel, X. (2022). Quasi-experimental shift-share research designs. *Review of Economic Studies*, 89(1), 181–213. [doi:10.1093/restud/rdab030](https://doi.org/10.1093/restud/rdab030)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Inference Across the Shocks](inference.md) · [Shift-Share IV](ssiv.md) · [Factsheet](factsheet.md)
