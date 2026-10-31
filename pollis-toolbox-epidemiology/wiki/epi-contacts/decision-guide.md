# Decision Guide

| Question | Tab |
|---|---|
| Who is likely infected now, including people never tested? | **Individual Risk** |
| Who started the outbreak? | **First Cases** |
| How do results change when contacts differ from day to day? | **Changing Contacts** |

## Choosing a Disease Model for Inference

| Disease | Course | Use it when |
|---|---|---|
| SI | Infected for good | The time span is short compared with recovery |
| SIR | Lasting immunity | Recovered people test negative and stay immune |
| SIS | Immediate reinfection | No protection after recovery |
| SIRS | Immunity that wanes | Reinfection after a time, within the run |

## Message Passing, Sampling and Neural Alternatives

Other methods address the same question. Belief propagation on the dynamics ([Altarelli, Braunstein, Dall'Asta, Lage-Castellanos and Zecchina (2014)](#ref-ABDLZ2014a)) is more exact but costlier, and dynamic message passing has been used for the origin of an epidemic ([Lokhov, Mézard, Ohta and Zdeborová (2014)](#ref-LMOZ2014a), built on [Karrer and Newman (2010)](#ref-KN2010a)). Sampling with a generative neural network gives samples of whole histories, and not just marginals ([Biazzo, Braunstein, Dall'Asta and Mazza (2022)](#ref-BBDM2022a)). The small-coupling method is a mean-field trade of accuracy for speed. Compare methods on simulations close to the real setting, when more than one is available.

## When a Contact-Network Method Is the Wrong Tool

Move to the Contagion Models panel when only case counts exist. Move to the Epidemics on Networks panel for forward simulation with no observations. Move to the Branching Processes panel for the chance that an outbreak takes off. If contacts are poorly recorded, a population-level estimate may be more honest than an individual-level one built on a network that is mostly missing.

## Rules of Thumb for Inference on Contacts

- **Convergence**: check it first, and raise Damping when it fails.
- **Infection**: expect the approximation to weaken as infection along a contact grows.
- **Ranking**: compare with a simple rule.
- **Waiting time**: test as early as possible when the origin is the question.
- **People and Days**: memory limits how far the method scales.

## References

<a id="ref-ABDLZ2014a"></a>Altarelli, F., Braunstein, A., Dall'Asta, L., Lage-Castellanos, A. and Zecchina, R. (2014). Bayesian Inference of Epidemics on Networks via Belief Propagation. *Physical Review Letters* 112(11), 118701. [doi:10.1103/PhysRevLett.112.118701](https://doi.org/10.1103/PhysRevLett.112.118701)

<a id="ref-BBDM2022a"></a>Biazzo, I., Braunstein, A., Dall'Asta, L. and Mazza, F. (2022). A Bayesian generative neural network framework for epidemic inference problems. *Scientific Reports* 12. [doi:10.1038/s41598-022-20898-x](https://doi.org/10.1038/s41598-022-20898-x)

<a id="ref-KN2010a"></a>Karrer, B. and Newman, M. E. J. (2010). Message passing approach for general epidemic models. *Physical Review E* 82(1), 016101. [doi:10.1103/PhysRevE.82.016101](https://doi.org/10.1103/PhysRevE.82.016101)

<a id="ref-LMOZ2014a"></a>Lokhov, A. Y., Mézard, M., Ohta, H. and Zdeborová, L. (2014). Inferring the origin of an epidemic with a dynamic message-passing algorithm. *Physical Review E* 90(1), 012801. [doi:10.1103/PhysRevE.90.012801](https://doi.org/10.1103/PhysRevE.90.012801)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md)
