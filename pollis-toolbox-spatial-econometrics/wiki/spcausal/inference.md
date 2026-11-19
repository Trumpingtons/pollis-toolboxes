# Inference Without Standard Errors

## Why a Synthetic Control Is Judged by a Permutation Test

A synthetic control reports a gap, not a coefficient with a standard error. Abadie, Diamond and Hainmueller (2010) propose inferential methods for it in the article that introduces its application to comparative case studies ([Abadie, Diamond and Hainmueller (2010)](#ref-ADH2010a)). `placebo_test` of SpatialEconometrics.jl gives the policy to sets of comparison areas that never had it, as many as the areas under the policy, fits their synthetic controls, and ranks the ratio of the RMSPE after the policy to that before of the real areas under the policy among theirs ([Randsley (2026)](#ref-Ran2026a)). The p-value is the share of ratios, counting the real one, at least as large as the real one.

## Why the Permutation Test Ranks a Ratio

The documentation of `placebo_test` explains that dividing the fit after the policy by the fit before makes the ratios of different sets comparable: a comparison area the synthetic control follows poorly before the policy would show a large gap after it for reasons unrelated to any policy ([Randsley (2026)](#ref-Ran2026a)). Its documentation adds that the ratio keeps the distortion from spatial correlation small, as scaling by the fit before the policy makes areas comparable even when their errors differ in size.

## Limits of the Permutation Test

The documentation of `placebo_test` names three limits ([Randsley (2026)](#ref-Ran2026a)).

| Limit | What it means |
|---|---|
| Smallest attainable p-value | One over one plus the number of sets; a single area under the policy with 18 comparison areas cannot reach a p-value below 0.053 |
| Exchangeable areas | Any area is taken as equally likely to have been under the policy; in its simulations the test over-rejects at strong spatial correlation |
| Sets drawn | Every set when there are few, otherwise a random draw; the result says which |

Areas left out for neighbouring an area under the policy are never in a set, as the spillover reaches them.

## The Effective Number of Shocks

In a shift-share design the observations that carry the inference are the shocks. Borusyak, Hull and Jaravel (2022) show that the regression coefficient can be obtained from an equivalent regression across shocks, which motivates conditions for consistency at the level of the shocks ([Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). `exposure_concentration` gives the Herfindahl index of the mean shares and its reciprocal, the effective number of shocks. Its documentation states that the asymptotics are in the number of shocks, so that an estimate resting on a few effective shocks is not supported by the theory however many areas there are ([Randsley (2026)](#ref-Ran2026a)).

## Balance at the Level of the Shocks

The documentation of `balance_test` states that the identifying assumption of Borusyak, Hull and Jaravel is the quasi-random assignment of the shocks, so the test belongs at the level of the shocks: each characteristic's exposure-weighted mean at each shock is regressed on the shock, weighted by the mean exposure ([Randsley (2026)](#ref-Ran2026a); [Borusyak, Hull and Jaravel (2022)](#ref-BHJ2022a)). Its simulations find the test correctly sized only with many effective shocks, and rejecting a true null far more often than its nominal level with few, the joint test more so. The documentation reads a passed test in a concentrated design as close to uninformative.

## References

<a id="ref-ADH2010a"></a>Abadie, A., Diamond, A. and Hainmueller, J. (2010). Synthetic control methods for comparative case studies: estimating the effect of California's tobacco control program. *Journal of the American Statistical Association*, 105(490), 493–505. [doi:10.1198/jasa.2009.ap08746](https://doi.org/10.1198/jasa.2009.ap08746)

<a id="ref-BHJ2022a"></a>Borusyak, K., Hull, P. and Jaravel, X. (2022). Quasi-experimental shift-share research designs. *Review of Economic Studies*, 89(1), 181–213. [doi:10.1093/restud/rdab030](https://doi.org/10.1093/restud/rdab030)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Synthetic Control](synth.md) · [Shift-Share](shiftshare.md) · [Decision Guide](decision-guide.md)
