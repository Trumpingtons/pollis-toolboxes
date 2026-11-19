# Inference Across the Shocks

## Why the Usual Standard Errors of a Shift-Share Regression Are Too Small

Adão, Kolesár and Morales (2019) show with a stylised economic model that regression residuals are correlated across areas with similar shares, independent of their location ([Adão, Kolesár and Morales (2019)](#ref-AKM2019a)). They find that tests built on commonly used standard errors reject a true null in up to 55% of their placebo samples at a nominal 5%, and derive inference methods valid under arbitrary correlation of the residuals across areas. Standard errors clustered by area, or by region, treat areas in different clusters as independent, while areas with similar shares are hit by the same shocks wherever they are. The Against the Regional Standard Error step sets such a standard error beside the one of the panel.

## The Standard Error of the Regression Across the Shocks

Borusyak, Hull and Jaravel (2022) show that the shift-share coefficient equals that of a regression across the shocks, and that standard errors from that regression are valid when the shocks are as good as randomly assigned ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). The documentation of `fit_shock_level` describes the computation: the standard error is the cluster-robust one of the weighted regression across the shocks, without a small-sample correction, as Stata's `ivreg2` computes it ([Randsley (2026)](#ref-Ran2026a)). The observations of the inference are the shocks, so the correlation of the areas' residuals through their shares needs no model of its own.

## Clustering the Shocks

Shocks may be correlated with each other: industries of the same broader sector, or the same industry in two periods of a stacked design. The documentation of `fit_shock_level` states that with `shock_clusters`, one label per shock, the standard error is clustered by label, so the shocks may be correlated within a cluster, as Borusyak, Hull and Jaravel cluster industries by their 3-digit SIC code ([Randsley (2026)](#ref-Ran2026a); [Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). The Shock Clusters input names the column of the shocks file that gives the labels; empty, each shock is its own cluster and the standard error is robust.

## The Confidence Interval With the Null Imposed

Beside the standard error, Borusyak, Hull and Jaravel (2022) report a confidence interval with the null imposed, built from the test of Adão, Kolesár and Morales (2019) that imposes the null value of the coefficient on the residuals ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a); [Adão, Kolesár and Morales (2019)](#ref-AKM2019a)). The documentation of `fit_shock_level` describes it: the interval collects the values for which Hansen's J statistic of the moment that the shocks are uncorrelated with the residual, after the controls of the shocks, stays below the chi-squared critical value with one degree of freedom ([Randsley (2026)](#ref-Ran2026a)). It need not be symmetric around the estimate; an end is infinite when the test rejects no value on that side.

## The Effective Number of Shocks

In a shift-share design the observations that carry the inference are the shocks. Borusyak, Hull and Jaravel (2022) require many shocks, none with a large share of the exposure, and measure the concentration by the inverse of the Herfindahl index of the shocks' mean shares ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). `exposure_concentration` gives that Herfindahl index and its reciprocal, the effective number of shocks. Its documentation states that the asymptotics are in the number of shocks, so that an estimate resting on a few effective shocks is not supported by the theory however many areas there are ([Randsley (2026)](#ref-Ran2026a)).

## Balance at the Level of the Shocks

The documentation of `balance_test` states that the identifying assumption of Borusyak, Hull and Jaravel is the quasi-random assignment of the shocks, so the test belongs at the level of the shocks: each characteristic's exposure-weighted mean at each shock is regressed on the shock, weighted by the mean exposure ([Randsley (2026)](#ref-Ran2026a); [Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). Its simulations find the test correctly sized only with many effective shocks, and rejecting a true null far more often than its nominal level with few, the joint test more so. The documentation reads a passed test in a concentrated design as close to uninformative.

## The First-Stage F Across the Shocks

The strength of a shift-share instrument is judged at the level of the shocks: Borusyak, Hull and Jaravel (2022) report the first-stage F statistic of the regression across the shocks ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). The documentation of `ShockLevelFit` defines `first_stage_F` as the squared t-statistic of that first stage, with the same clusters as the standard error ([Randsley (2026)](#ref-Ran2026a)). A weak first stage makes the interval with the null imposed wide, and it can then be unbounded on one side or both.

## References

<a id="ref-AKM2019a"></a>Adão, R., Kolesár, M. and Morales, E. (2019). Shift-share designs: theory and inference. *Quarterly Journal of Economics*, 134(4), 1949–2010. [doi:10.1093/qje/qjz025](https://doi.org/10.1093/qje/qjz025)

<a id="ref-BHJ2022a"></a>Borusyak, K., Hull, P. and Jaravel, X. (2022). Quasi-experimental shift-share research designs. *Review of Economic Studies*, 89(1), 181–213. [doi:10.1093/restud/rdab030](https://doi.org/10.1093/restud/rdab030)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Shares, Shocks and Identification](identification.md) · [Replications](replications.md) · [Overview](overview.md)
