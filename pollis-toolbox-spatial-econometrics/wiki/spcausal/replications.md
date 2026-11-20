# Replications

## Proposition 99 and the Synthetic California

Abadie, Diamond and Hainmueller (2010) estimate the effect of Proposition 99, the tobacco control programme California passed in 1988, on cigarette sales per head in California from 1989 to 2000 ([Abadie, Diamond and Hainmueller (2010)](#ref-ADH2010a)). Its counterfactual is a synthetic California: a weighted mean of other US states that reproduces California's cigarette sales and their predictors before 1989. The comparison states leave out those that adopted another large tobacco control programme or raised their cigarette taxes sharply in the years studied, which leaves 38 states. PollisDatasets.jl holds their panel, from 1970 to 2000, as `prop99`, from the R package tidysynth.

## Tables 1 and 2 of Abadie, Diamond and Hainmueller

| Table | What it gives | What the replication step prints |
|---|---|---|
| Table 1 | The predictors of California, of the synthetic California and of the mean of the 38 states | California and the synthetic California, each beside the article |
| Table 2 | The weight of each state in the synthetic California | Every state with a weight, beside the article |

The predictors are the log of income per head, the percent of the population aged 15 to 24 and the retail price of cigarettes, as means of 1980 to 1988, beer consumption per head, as the mean of 1984 to 1988, and cigarette sales per head in 1975, 1980 and 1988 ([Abadie, Diamond and Hainmueller (2010)](#ref-ADH2010a)). The step also prints the gap in cigarette sales in 2000, which the article's text gives.

## The Predictor Weights of the Replication

Abadie, Diamond and Hainmueller (2010) weigh the seven predictors with the weights that make the synthetic California follow California's cigarette sales most closely before Proposition 99 ([Abadie, Diamond and Hainmueller (2010)](#ref-ADH2010a)). The replication step finds them with `fit_synthetic_control(Y, ca, 19; predictors, donor_pool = :all, predictor_weights = :nested)` of SpatialEconometrics.jl, over the 19 years from 1970 to 1988, with every one of the 38 states as a comparison state ([Randsley (2026)](#ref-Ran2026a)). The documentation states that the nested search is not unique, so the weights of the states can differ from the article's in the last digit printed. With Predictor Weights set to Equal, the default of the tab, the same predictors give another synthetic California.

## The Permutation Test of Abadie, Diamond and Hainmueller

Abadie, Diamond and Hainmueller (2010) apply the synthetic control method to every comparison state in turn, as if Proposition 99 had passed there, and compare the gaps of these placebo runs with California's ([Abadie, Diamond and Hainmueller (2010)](#ref-ADH2010a)). They rank the ratio of the mean squared gap after 1988 to that before, which a state with a poor fit before 1989 cannot make large by that poor fit alone, and report the probability that a state drawn at random has a ratio as large as California's. The replication step computes it with `placebo_test`, each placebo state with its synthetic control from the other 37 and the same nested search ([Randsley (2026)](#ref-Ran2026a)).

## References

<a id="ref-ADH2010a"></a>Abadie, A., Diamond, A. and Hainmueller, J. (2010). Synthetic control methods for comparative case studies: estimating the effect of California's tobacco control program. *Journal of the American Statistical Association*, 105(490), 493–505. [doi:10.1198/jasa.2009.ap08746](https://doi.org/10.1198/jasa.2009.ap08746)

<a id="ref-Ran2026a"></a>Randsley, N. (2026). SpatialEconometrics.jl: spatial econometrics in Julia. [github.com/randsley/SpatialEconometrics.jl](https://github.com/randsley/SpatialEconometrics.jl)

## See Also
- [Synthetic Control](synth.md) · [Inference Without Standard Errors](inference.md) · [Factsheet](factsheet.md)
