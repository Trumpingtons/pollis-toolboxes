# Assumptions

## Why a Branching Process Needs Plenty of Susceptible People

Every case in a branching process is assumed to meet people who are all susceptible. The assumption holds while the outbreak is small compared with the population and its reach. It fails sooner in a closed setting such as a ward or a school, and sooner still on a network with clustered contacts, where the people a case meets may already have been infected.

## What Independence Between Cases Assumes

Offspring numbers of different cases are independent draws from one distribution. In reality superspreading events bring together cases that are linked by time and place, and later generations can differ from earlier ones as behaviour changes. A single pair of R and k is therefore a summary across settings and time, and not a fixed property of each case.

## What the Negative Binomial Assumes About Superspreading

The negative binomial arises when each case has its own Gamma-distributed individual reproduction number, with Poisson offspring around that number ([Lloyd-Smith, Schreiber, Kopp and Getz (2005)](#ref-LSKG2005a)). It fits many outbreaks, while the true shape of the tail is hard to test with the data usually available. A few extreme events carry much of the information about k, so that estimates depend strongly on whether those events were seen.

## Why Delay Distributions Decide What Measures Can Do

Generation time and incubation period together fix how much transmission happens before symptoms. When the generation time is short compared with the incubation period, much transmission comes before any case can be isolated, and isolating at onset has little effect ([Fraser, Riley, Anderson and Ferguson (2004)](#ref-FRAF2004a)). Results for containment therefore depend at least as much on these distributions as on R, and they should be varied rather than assumed.

## What the Measures Assume About Tracing

Tracing is modelled as an independent chance for each contact, and with a delay that is the same for everyone. Real tracing saturates when cases are many and misses particular groups of contacts, and people do not always comply with isolation. Results under this panel's settings should be read as an upper bound on what the same stated probabilities would achieve in the field.

## References

<a id="ref-FRAF2004a"></a>Fraser, C., Riley, S., Anderson, R. M. and Ferguson, N. M. (2004). Factors that make an infectious disease outbreak controllable. *Proceedings of the National Academy of Sciences* 101(16), 6146–6151. [doi:10.1073/pnas.0307506101](https://doi.org/10.1073/pnas.0307506101)

<a id="ref-LSKG2005a"></a>Lloyd-Smith, J. O., Schreiber, S. J., Kopp, P. E. and Getz, W. M. (2005). Superspreading and the effect of individual variation on disease emergence. *Nature* 438(7066), 355–359. [doi:10.1038/nature04153](https://doi.org/10.1038/nature04153)

## See Also
- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
