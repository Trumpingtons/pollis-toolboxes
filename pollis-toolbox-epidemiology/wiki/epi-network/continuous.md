# Continuous Time

## The Continuous-Time SIR Model

In continuous time, each edge between an infectious and a susceptible person transmits at rate beta, and each infectious person recovers at rate gamma. There are no steps: every event occurs at its own time, and one person changes state at a time. The transmissibility is T = beta / (beta + gamma), and it does not depend on any choice of time unit.

## The Gillespie Algorithm

The Gillespie algorithm ([Gillespie (1977)](#ref-Gil1977a)) simulates events exactly. The total rate of all possible events is computed, the time to the next event is drawn from an exponential distribution with that rate, and then one event is chosen with probability proportional to its own rate. No approximation is made beyond the model itself. Its cost grows with the number of events, which is why such runs are slower than daily steps on a large network.

## What Daily Steps Change

Daily steps let an infection pass and a recovery occur on the same day in a set order, and update everybody at once. The effect on final size is usually small when daily probabilities are small. It grows when the rates are large compared with one day: a daily recovery chance of 1 gives everyone an infectious period of exactly one day, not an exponential one. Next Steps > Daily Steps Against Events shows the same rates run both ways.

## Rates and Probabilities Are Not the Same

A rate r per day corresponds to a daily probability of 1 - exp(-r), and not to r itself. The two are close for small values only. Reusing a rate as a probability in a daily model raises transmission and shortens the infectious period by a different amount, and changes the transmissibility. In GraphEpidemics.jl, `prob_from_rate` makes this conversion, which keeps the two kinds of model comparable.

## When Exact Timing Matters

Exact timing is worth its cost when the time order of events carries the question: the time between infections along a chain, a measure that begins at a given hour, or the very first steps of an outbreak. When only the size or shape of a large epidemic is wanted, daily steps with small probabilities give nearly the same result in far less time.

## References

<a id="ref-Gil1977a"></a>Gillespie, D. T. (1977). Exact stochastic simulation of coupled chemical reactions. *The Journal of Physical Chemistry* 81(25), 2340–2361. [doi:10.1021/j100540a008](https://doi.org/10.1021/j100540a008)

## See Also
- [SIR](sir.md) · [SIS and SIRS](recurring.md) · [Overview](overview.md) · [Assumptions](assumptions.md)
