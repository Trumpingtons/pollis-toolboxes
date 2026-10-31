# Decision Guide

| Question | Tab |
|---|---|
| How often would a set of measures stop an outbreak? | **Containment** |
| What is the chance one introduction takes off, with no control? | **Superspreading** |
| What share of transmission comes from the top cases? | **Superspreading** |
| What are R and k, given counts or clusters? | **Estimating R and k** |
| Does an analysis work on data with a known answer? | **Line Lists** |

## Choosing Between Offspring Counts and Chain Sizes

Offspring counts need to know who infected whom, from contact tracing or genomic data, and they say the most about both R and k. Chain sizes need only the final number of cases per cluster, which are easier to collect, and identify both parameters for R below 1 ([Blumberg and Lloyd-Smith (2013)](#ref-BL2013a)). For R above 1, only the small outbreaks are finished chains, and an analysis conditioned on extinction is needed ([Nishiura, Yan, Sleeman and Mode (2012)](#ref-NYSM2012a)). A cluster still growing must be left out or dealt with explicitly.

## When a Branching Process Is the Wrong Tool

Move to the Compartmental Models panel for the course of a large epidemic. Move to the Epidemics on Networks panel when a known contact structure limits transmission, and to the Contagion Models panel to estimate a time-varying R from a case series. Move to the Inference on Contact Networks panel when individual contacts and test results are known.

## Rules of Thumb for Branching Scenarios

- **Outbreaks**: enough for a small standard error of the comparison, not of the single figure.
- **Case Cap**: raise it until the answer stops changing.
- **Measures**: add one at a time, so as to see what each adds.
- **Generation time and incubation**: vary them together, since their overlap decides what isolation can do.
- **Few observations**: expect no upper limit for k.

## References

<a id="ref-BL2013a"></a>Blumberg, S. and Lloyd-Smith, J. O. (2013). Inference of R0 and Transmission Heterogeneity from the Size Distribution of Stuttering Chains. *PLoS Computational Biology* 9(5), e1002993. [doi:10.1371/journal.pcbi.1002993](https://doi.org/10.1371/journal.pcbi.1002993)

<a id="ref-NYSM2012a"></a>Nishiura, H., Yan, P., Sleeman, C. K. and Mode, C. J. (2012). Estimating the transmission potential of supercritical processes based on the final size distribution of minor outbreaks. *Journal of Theoretical Biology* 294, 48–55. [doi:10.1016/j.jtbi.2011.10.039](https://doi.org/10.1016/j.jtbi.2011.10.039)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md)
