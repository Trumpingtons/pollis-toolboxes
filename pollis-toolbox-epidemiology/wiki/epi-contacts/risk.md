# Individual Risk

## What Individual Risk Infers

Individual Risk gives, for each person and each day, the probability of being infected, given all the tests and contacts. Ideally this would come from the whole distribution over everyone's history, of which each person's probabilities are a marginal. That is too large to compute, so that the method approximates each marginal by messages passed between neighbours.

## How Messages Work on a Contact Network

Each person sends each neighbour a message that summarises what the rest of the network says about that person, leaving out the neighbour's own part. Messages are updated in rounds until they stop changing. Cavity methods of this kind are exact on trees, and work well on networks with few short cycles. Message passing for general epidemic models goes back to [Karrer and Newman (2010)](#ref-KN2010a), and its inference form to [Altarelli, Braunstein, Dall'Asta, Lage-Castellanos and Zecchina (2014)](#ref-ABDLZ2014a).

## What the Small-Coupling Expansion Does

Belief propagation on full histories is costly because a message depends on a person's whole infection time. The small-coupling dynamic cavity expands the messages for weak contacts ([Braunstein, Catania, Dall'Asta, Mariani, Mazza and Tarabolo (2025)](#ref-BCDMM...2025a)), keeping only low-order terms, so that the update can be carried out on the individual marginals at far lower cost. The method therefore belongs to the family of mean-field approximations. Its cost in memory grows with the square of People times the number of days in the current implementation.

## How Tests Enter the Inference

Each test multiplies a person's possible histories by the likelihood of the result given the state on that day, with the stated False Positive and False Negative rates. A positive test raises the risk for that person, and also the risk of neighbours on earlier and later days. A negative test lowers them, with the effect fading with the distance in the network. Next Steps > Compare Testing Effort shows how estimates improve as more tests are made.

## How Far Ahead a Risk Can Look

Next Steps > Risk Ahead carries the model forward beyond the last test with no new data. Its projection is a mean over futures, widening with time. Early days ahead are driven by the current infected people, and later days more by assumed rates, and so the projection is not a substitute for repeated tests. Next Steps > Course of the Highest Risks shows how the top risks develop over the run.

## References

<a id="ref-ABDLZ2014a"></a>Altarelli, F., Braunstein, A., Dall'Asta, L., Lage-Castellanos, A. and Zecchina, R. (2014). Bayesian Inference of Epidemics on Networks via Belief Propagation. *Physical Review Letters* 112(11), 118701. [doi:10.1103/PhysRevLett.112.118701](https://doi.org/10.1103/PhysRevLett.112.118701)

<a id="ref-BCDMM...2025a"></a>Braunstein, A., Catania, G., Dall'Asta, L., Mariani, M., Mazza, F. and Tarabolo, M. (2025). Small-coupling dynamic cavity: A Bayesian mean-field framework for epidemic inference. *Physical Review Research* 7(2), 023089. [doi:10.1103/physrevresearch.7.023089](https://doi.org/10.1103/physrevresearch.7.023089)

<a id="ref-KN2010a"></a>Karrer, B. and Newman, M. E. J. (2010). Message passing approach for general epidemic models. *Physical Review E* 82(1), 016101. [doi:10.1103/PhysRevE.82.016101](https://doi.org/10.1103/PhysRevE.82.016101)

## See Also
- [First Cases](source.md) · [Changing Contacts](changing.md) · [Interpretation](interpretation.md) · [Diagnostics](diagnostics.md)
