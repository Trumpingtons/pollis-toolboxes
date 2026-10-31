# Interpretation

## What Dispersion k Measures

Dispersion k describes how unequal cases are. Variance of the offspring is R (1 + R / k), so that a small k means many cases infecting nobody and a few infecting many, and a very large k approaches a Poisson distribution with variance R. Values well below 1 are common among respiratory infections and were estimated for Ebola by [Althaus (2015)](#ref-Alt2015a) and for COVID-19 by [Endo, CMMID COVID-19 Working Group, Abbott, Kucharski and Funk (2020)](#ref-ECAKF2020a).

## Why the Same R Can Mean Very Different Risks

Two infections with equal R can differ greatly in how often an introduction takes off. With small k, most introductions fail, while those that succeed grow fast at first thanks to superspreading events. Outbreaks are therefore rarer and more explosive, as [Lloyd-Smith, Schreiber, Kopp and Getz (2005)](#ref-LSKG2005a) showed. This is why R alone cannot give the chance of an epidemic from one case, and it also explains why repeated introductions can fail for a long time before one succeeds.

## Reading Containment Probability

A containment probability is the share of simulated outbreaks ended under the assumed measures. Compare it with the chance of dying out with no control, since many outbreaks of an overdispersed infection die out by themselves: Next Steps > What the Measures Add gives the measure's own contribution. A high figure may owe most to low k. It is also a statement about one introduction, so that with n independent introductions the chance that all die out is the n-th power of that figure.

## How to Read the 80/20 Rule

The share of transmission from the top 20% of cases can be counted in two ways. Ranked by individual reproduction number, the figure describes an infectiousness that no one observes. Ranked by the secondary cases actually caused, chance adds to the spread, and the share is usually higher. Next Steps > Reading the 80/20 Rule prints both, and a stated figure should say which one it is.

## What an Estimate of R and k Applies To

Data from clusters or contact studies describe those settings and those measures. An R estimated during control is the R under that control, and not the basic reproduction number. Data from reported clusters usually miss small ones, which biases k low and R high when large clusters are over-represented. An upper limit that cannot be fixed for k also deserves saying plainly: data may rule out heavy superspreading, and not rule out its absence.

## References

<a id="ref-Alt2015a"></a>Althaus, C. L. (2015). Ebola superspreading. *The Lancet Infectious Diseases* 15(5), 507–508. [doi:10.1016/S1473-3099(15)70135-0](https://doi.org/10.1016/S1473-3099(15)70135-0)

<a id="ref-ECAKF2020a"></a>Endo, A., CMMID COVID-19 Working Group, Abbott, S., Kucharski, A. J. and Funk, S. (2020). Estimating the overdispersion in COVID-19 transmission using outbreak sizes outside China. *Wellcome Open Research* 5, 67. [doi:10.12688/wellcomeopenres.15842.3](https://doi.org/10.12688/wellcomeopenres.15842.3)

<a id="ref-LSKG2005a"></a>Lloyd-Smith, J. O., Schreiber, S. J., Kopp, P. E. and Getz, W. M. (2005). Superspreading and the effect of individual variation on disease emergence. *Nature* 438(7066), 355–359. [doi:10.1038/nature04153](https://doi.org/10.1038/nature04153)

## See Also
- [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
