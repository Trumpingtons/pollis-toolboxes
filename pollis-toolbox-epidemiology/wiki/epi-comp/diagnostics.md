# Diagnostics

## Does the Solution Conserve the Population?

The compartments must add up to N at all times, since every flow out of one is a flow into another. A sum that drifts points to a typing error in the equations rather than to the solver, because `Tsit5()` keeps a linear invariant to well within its tolerance. In SEIRD, S + E + I + R + D is the conserved total.

## Checking the Curve Against Final Size Theory

For the SIR model, the final share infected z solves z = 1 - exp(-R0 z), the final size equation of [Kermack and McKendrick (1927)](#ref-KM1927a). The Final Epidemic Size action solves this equation and sets it beside the simulated value. A gap usually means that T is too short and the epidemic has not ended. The same formula holds for a much wider class of models, given only the mean infectious period and R0 ([Ma and Earn (2006)](#ref-ME2006a)), which is the reason SEIR with the same R0 ends at the same size.

## Checking the Peak Against Theory

The SIR number infected peaks when the susceptible share falls to 1 / R0. Starting from a small seed, the largest share infectious is 1 - (1 + ln(R0)) / R0. Agreement between this and the curve shows that the run is correct and that the seed is small enough not to matter. The phase portrait of S against I shows the same fact as the top of its arc.

## Has the Run Reached Its End State?

SIS and SIRS approach an endemic level, and the approach can be slow when R0 is just above 1. Compare the infected number over the last part of the run with the formula under Endemic Equilibrium. Near the threshold, in particular, the Transmission Sweep needs a long T, or a slowly growing epidemic will look smaller than it is.

## How Sensitive the Result Is to the Seed

Changing the number of first cases moves an SIR curve in time, and does not change its shape as long as the seed is small. If a scenario depends on the seed, the epidemic is short of susceptible people from the start, or the run has been cut before the end. Timing is therefore much less trustworthy than peak or final size, unless the model has been matched to data at some date.

## References

<a id="ref-KM1927a"></a>Kermack, W. O. and McKendrick, A. G. (1927). A Contribution to the Mathematical Theory of Epidemics. *Proceedings of the Royal Society A* 115(772), 700–721. [doi:10.1098/rspa.1927.0118](https://doi.org/10.1098/rspa.1927.0118)

<a id="ref-ME2006a"></a>Ma, J. and Earn, D. J. D. (2006). Generality of the Final Size Formula for an Epidemic of a Newly Invading Infectious Disease. *Bulletin of Mathematical Biology* 68, 679–702. [doi:10.1007/s11538-005-9047-7](https://doi.org/10.1007/s11538-005-9047-7)

## See Also
- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Overview](overview.md)
