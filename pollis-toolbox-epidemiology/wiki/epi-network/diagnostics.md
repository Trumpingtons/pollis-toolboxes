# Diagnostics

## Does the Network Have the Intended Shape

Next Steps > Contacts per Person shows the distribution of the number of edges. A scale-free network should have a long right tail, and a regular one a single value. For a small network or few contacts, check that it is in one connected piece, or the epidemic cannot reach everybody. A random graph with very few mean contacts in particular falls apart into small pieces.

## Is the Basic R Really What the Network Gives

The infection rate is set from Basic R and the mean contacts, which ignores the variance of contacts. Next Steps > Reproduction Number of the Network computes what this network really gives. Random graphs come out close; scale-free networks can come out far higher. The two numbers should be reported separately, and the second is the one that governs the epidemic. Comparing networks at equal Basic R therefore does not compare them at equal reproduction number.

## Testing the Simulation Against Network Theory

Next Steps > Against Theory compares final size in repeated simulations with the size from the network's contact counts, as computed by the theory of [Newman (2002)](#ref-New2002a). Agreement shows the simulation is working as intended. The theory assumes a locally tree-like network, so that a gap is expected on the Small-World type, where clustered contacts make many routes redundant.

## How Much of the Result Is Chance

A single run can end soon by chance or go on to infect many. Next Steps > Many Epidemics reports the chance of a large outbreak, and the size and peak of those that take off. Results should use the runs that take off when reporting size, and report separately how many die out. Mixing the two gives a mean that describes neither.

## Has the Infection Settled

Next Steps > Has It Settled? compares the means over the second and last thirds of the run in the SIS and SIRS tab. If they differ, a longer run is needed. A low level may also end at any time by chance, in which case the level is that of the runs that survive. Next Steps > Chance of Dying Out counts how many of the runs lost the infection.

## References

<a id="ref-New2002a"></a>Newman, M. E. J. (2002). Spread of epidemic disease on networks. *Physical Review E* 66(1), 016128. [doi:10.1103/PhysRevE.66.016128](https://doi.org/10.1103/PhysRevE.66.016128)

## See Also
- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Overview](overview.md)
