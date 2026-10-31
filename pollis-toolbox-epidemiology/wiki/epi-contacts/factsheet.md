# Inference on Contact Networks — Factsheet

Inference on a contact network works out, for each person and each day, the probability of each health state, given who met whom and the results of some tests. The method is the small-coupling dynamic cavity of [Braunstein, Catania, Dall'Asta, Mariani, Mazza and Tarabolo (2025)](#ref-BCDMM...2025a), in SmallCouplingDynamicCavity.jl. It sends messages along contacts rather than sampling.

| | |
|---|---|
| **Purpose** | Who is likely infected now, and who the first cases were, from known contacts and test results |
| **Input** | A contact network for each day, disease rates, and tests with their error rates |
| **Core packages** | SmallCouplingDynamicCavity.jl, Graphs.jl |
| **Models** | Individual Risk, First Cases, Changing Contacts |
| **Output** | Each person's probability of being infected on each day, a ranking of people by risk, and candidates for the first case |
| **Key choice** | Which disease model applies, and whether the rates and test errors are known well enough to be given to the inference |

## When to Use Inference on a Contact Network

Inference on a contact network suits settings with contact records and some tests: a ward, a school, a farm network, or digital contact tracing data. The result is a risk for each person, including people never tested. [Baker, Biazzo, Braunstein, Catania, Dall'Asta, Ingrosso, Krzakala, Mazza, Mézard, Muntoni, Refinetti, Sarao Mannelli and Zdeborová (2021)](#ref-BBBCD...2021a) propose risks of this kind for choosing whom to test and quarantine, and conclude that they can improve digital contact tracing.

## What Inference on a Contact Network Is Not

Inference on a contact network requires the contacts to be known, and it treats them as complete: an unrecorded contact cannot explain an infection. The rates and error rates are also given to the inference rather than estimated. When only case counts exist, a method for population averages is needed, as in the Contagion Models panel.

## References

<a id="ref-BBBCD...2021a"></a>Baker, A., Biazzo, I., Braunstein, A., Catania, G., Dall'Asta, L., Ingrosso, A., Krzakala, F., Mazza, F., Mézard, M., Muntoni, A. P., Refinetti, M., Sarao Mannelli, S. and Zdeborová, L. (2021). Epidemic mitigation by statistical inference from contact tracing data. *Proceedings of the National Academy of Sciences* 118(32), e2106548118. [doi:10.1073/pnas.2106548118](https://doi.org/10.1073/pnas.2106548118)

<a id="ref-BCDMM...2025a"></a>Braunstein, A., Catania, G., Dall'Asta, L., Mariani, M., Mazza, F. and Tarabolo, M. (2025). Small-coupling dynamic cavity: A Bayesian mean-field framework for epidemic inference. *Physical Review Research* 7(2), 023089. [doi:10.1103/physrevresearch.7.023089](https://doi.org/10.1103/physrevresearch.7.023089)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
