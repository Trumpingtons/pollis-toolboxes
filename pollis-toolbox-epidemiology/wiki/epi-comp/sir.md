# SIR

## The SIR Equations

The SIR model of [Kermack and McKendrick (1927)](#ref-KM1927a) follows susceptible, infectious and recovered people:

- dS/dt = -beta S I / N
- dI/dt = beta S I / N - gamma I
- dR/dt = gamma I

Here, beta is the transmission rate and gamma the recovery rate, so that the mean infectious period is 1 / gamma and R0 = beta / gamma. The original paper in fact gave a more general model with infectivity depending on the time since infection, of which this is the simplest case.

## How an SIR Epidemic Unfolds

Early on, S is close to N, and infections grow exponentially at rate beta - gamma. Growth slows as susceptible people run out, and the curve peaks when S / N = 1 / R0. An epidemic ends because infectious people are too few to sustain it, and not because everybody has been infected: some people always escape. The number who do depends only on R0, through the final size equation z = 1 - exp(-R0 z).

## What Vaccination Does to an SIR Epidemic

Vaccinating a share v before the wave moves v of the population directly from S to R, so that the effective reproduction number starts at R0 (1 - v). Below 1, the wave does not take off at all. Above 1 the wave is smaller by more than the number vaccinated, since the protected people also fail to pass on infection. The Vaccination Impact action computes this indirect effect.

## How to Read the Phase Portrait

The phase portrait plots I against S. Time moves from right to left, since S can only fall. The arc rises while S is above N / R0 and falls afterwards, and its end point on the S axis is the number who escape infection. All SIR runs with the same R0 lie on arcs of the same family, so that the portrait shows what R0 alone decides and what depends on the seed.

## References

<a id="ref-KM1927a"></a>Kermack, W. O. and McKendrick, A. G. (1927). A Contribution to the Mathematical Theory of Epidemics. *Proceedings of the Royal Society A* 115(772), 700–721. [doi:10.1098/rspa.1927.0118](https://doi.org/10.1098/rspa.1927.0118)

## See Also
- [SEIR](seir.md) · [SIRS](sirs.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
