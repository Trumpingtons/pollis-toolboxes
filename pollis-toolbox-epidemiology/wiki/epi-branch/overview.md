# Overview

The four tabs of the Branching Processes panel share one offspring distribution, the negative binomial with mean R and dispersion k of [Lloyd-Smith, Schreiber, Kopp and Getz (2005)](#ref-LSKG2005a). They differ in what they do with it, and all rest on EpiBranch.jl.

## Simulating Control in the Containment Tab

**Inputs:** R, Dispersion k, Generation Time, Incubation Period, Measures, Onset to Isolation, Isolation Length, Tracing Probability, Isolation to Trace, Post-Exposure Efficacy, Outbreaks, Case Cap. Many outbreaks are simulated from one introduced case, and `containment_probability` gives the share that end. The measures are built up from `Isolation`, `ContactTracing` and `RingVaccination`.

## Exact Results in the Superspreading Tab

**Inputs:** R, Dispersion k, R for Chain Sizes, Top Share of Cases. No simulation takes place: `extinction_probability`, `chain_size_distribution` and `proportion_transmission` compute results from the offspring distribution alone, with no control in force.

## Fitting in the Estimating R and k Tab

**Inputs:** Data, True R, True k, Observations, NUTS Samples, Chains. Simulated offspring counts or chain sizes are fitted twice, by `maximum_likelihood` and with the Turing.jl NUTS sampler, on the same exact likelihood. To use real data, replace the simulated vector in the code.

## Simulated Data in the Line Lists Tab

**Inputs:** R, Dispersion k, Generation Time, Incubation Period, Smallest Outbreak, Largest Outbreak, Onset to Report, Admission Probability, Death Probability. `linelist` turns one outbreak into the rows surveillance would hold, one per case, and `contacts` gives one per contact.

## Common Workflow for a Branching Process

1. **Start with Superspreading**, which shows the exact behaviour for assumed R and k.
2. **Estimate R and k** from real counts or clusters, if there are any.
3. **Move to Containment** with those values, and add measures one at a time.
4. **Read the result** with Next Steps > Interpret.
5. **Use Line Lists** to test an analysis on data of known truth.

## References

<a id="ref-LSKG2005a"></a>Lloyd-Smith, J. O., Schreiber, S. J., Kopp, P. E. and Getz, W. M. (2005). Superspreading and the effect of individual variation on disease emergence. *Nature* 438(7066), 355–359. [doi:10.1038/nature04153](https://doi.org/10.1038/nature04153)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Containment](contain.md) · [Superspreading](exact.md) · [Estimating R and k](fit.md) · [Line Lists](cases.md)
