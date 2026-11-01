# Regime Switching Models — Factsheet

The Regime Switching Models panel fits regressions whose parameters depend on an unobserved state that follows a Markov chain, in the tradition of [Hamilton (1989)](#ref-Ham1989a). Each observation is assigned a probability of belonging to each regime, and the transition matrix says how long regimes last. MarSwitching.jl, described by [Dadej (2024)](#ref-Dad2024a), provides the estimation.

| | |
|---|---|
| **Purpose** | Identify unobserved regimes and estimate how a relationship, its persistence or its volatility differs between them |
| **Julia stack** | MarSwitching.jl, with Plots.jl, HypothesisTests.jl and StatsBase.jl for the actions |
| **Models** | Markov-Switching Regression, Markov-Switching Autoregression, Markov-Switching ARCH, Time-Varying Transitions |
| **Output** | Coefficients by regime, regime probabilities over time, a transition matrix, expected durations |
| **Key choice** | The number of regimes, which parameters switch, and whether transitions depend on other variables |

## When to Use a Regime Switching Model

A switching model suits data that appear to alternate between distinct behaviours at unknown dates: expansions and recessions, calm and crisis periods, low and high inflation. Unlike a break test, it allows a state to recur, and unlike a threshold model, the switch does not depend on an observed variable crossing a level. Each regime needs enough observations for its own parameters, so a regime visited only a few times will be poorly estimated. Quarterly macroeconomic series with several recessions and long daily return series are the usual applications.

## What Regime Labels Do Not Prove

Finding two regimes does not prove that two real states exist. A model with extra states can also absorb outliers, fat tails or one structural break, and the likelihood will reward it for doing so. Regime labels carry no meaning beyond the estimates: the statement that regime 1 is a recession is an interpretation that should be checked against an outside source. The usual tests of one regime against two do not have a standard distribution, because the extra parameters are unidentified under the null hypothesis, so information criteria give only a heuristic answer.

## References

<a id="ref-Dad2024a"></a>Dadej, M. (2024). MarSwitching.jl: A Julia package for Markov switching dynamic models. *Journal of Open Source Software* 9(98), 6441. [doi:10.21105/joss.06441](https://doi.org/10.21105/joss.06441)

<a id="ref-Ham1989a"></a>Hamilton, J. D. (1989). A New Approach to the Economic Analysis of Nonstationary Time Series and the Business Cycle. *Econometrica* 57(2), 357. [doi:10.2307/1912559](https://doi.org/10.2307/1912559)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
