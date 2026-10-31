# Interpretation

## What the Time-Varying Reproduction Number Says

The instantaneous reproduction number Rt is the mean number of people that a case would infect if conditions stayed as they are on day t ([Fraser (2007)](#ref-Fra2007a)). It is the natural estimate in real time, since it uses only past cases. The case reproduction number of [Wallinga and Teunis (2004)](#ref-WT2004a) instead asks how many people the cases of day t went on to infect, so that it is known only later and reacts earlier to a change, by about a generation.

## Why Rt Above 1 Should Be Read with Its Probability

Rt above 1 means growth, and below 1 decline, whatever the shape of the serial interval. The useful statement is the probability, for example the share of posterior draws with Rt above 1 on a given day. The Parameter Posteriors action reports the first day on which that share falls below 5%, which is a far safer claim of control than a median crossing 1.

## Converting Rt into a Growth Rate and a Doubling Time

Growth rate r and Rt are linked through the serial interval by R = 1 / M(-r), with M the moment generating function of the interval ([Wallinga and Lipsitch (2007)](#ref-WL2007a)). For a Gamma interval of mean m and standard deviation s, R = (1 + r s^2 / m)^(m^2 / s^2). The doubling time is ln(2) / r, or the halving time when r is negative. Next Steps > Growth and Transmission does this for each draw.

## Reading the Distance Kernel, Sparks and Removal Rate

The kernel power says how quickly infectivity falls with distance: under the power law, doubling a distance divides the rate by 2 to that power. Sparks measure infection from outside the population, so that a large value means cases not explained by spread within it. The mean infectious period is 1 / removal rate, and the mean latent period is 1 / latency rate.

## Reading the Transmission Network Posterior

The transmission network is a distribution over who infected whom. Each person has a posterior probability for each candidate source, and a single most likely tree can hide near ties. A person's expected number of secondary cases, summed over draws, gives an individual reproduction number. Links are well informed only when events are dated closely, and when candidates are few.

## What a Counterfactual Can and Cannot Claim

A counterfactual applies a change to the fitted model: Rt held at its value before a change, or faster removal of cases. The answer is conditional on the model holding under that change, including behaviour staying as it was, and should be reported as a model result rather than as lives or cases proven to have been saved.

## References

<a id="ref-Fra2007a"></a>Fraser, C. (2007). Estimating Individual and Household Reproduction Numbers in an Emerging Epidemic. *PLoS ONE* 2(8), e758. [doi:10.1371/journal.pone.0000758](https://doi.org/10.1371/journal.pone.0000758)

<a id="ref-WT2004a"></a>Wallinga, J. and Teunis, P. (2004). Different Epidemic Curves for Severe Acute Respiratory Syndrome Reveal Similar Impacts of Control Measures. *American Journal of Epidemiology* 160(6), 509–516. [doi:10.1093/aje/kwh255](https://doi.org/10.1093/aje/kwh255)

<a id="ref-WL2007a"></a>Wallinga, J. and Lipsitch, M. (2007). How Generation Intervals Shape the Relationship between Growth Rates and Reproductive Numbers. *Proceedings of the Royal Society B* 274(1609), 599–604. [doi:10.1098/rspb.2006.3754](https://doi.org/10.1098/rspb.2006.3754)

## See Also
- [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
