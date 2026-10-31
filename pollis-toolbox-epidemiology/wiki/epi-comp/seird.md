# SEIRD

## The SEIRD Equations

SEIRD adds a compartment for those who die of the disease:

- dS/dt = -beta S I / N
- dE/dt = beta S I / N - sigma E
- dI/dt = sigma E - gamma I - mu I
- dR/dt = gamma I
- dD/dt = mu I

The mean infectious period is now 1 / (gamma + mu), which makes R0 = beta / (gamma + mu), since a person who dies stops transmitting. Models of this family, with vaccination added, have been used in forecasting ([Ghostine, Gharamti, Hassrouny and Hoteit (2021)](#ref-GGHH2021a)).

## How Deaths Relate to Infections in SEIRD

A person leaving I dies with probability mu / (gamma + mu), which is the infection fatality ratio of the model. Total deaths are that ratio times everyone ever infected. Deaths therefore lag infections by about the latent and infectious periods combined. In the model, the competition between recovery and death is simple, so that mu and gamma cannot be read directly as the clinical durations of those who die and of those who recover.

## Why N Stays Fixed in the Force of Infection

The panel's equations divide by the initial N rather than by the living population. For small death shares, the difference is negligible, while with high fatality the two differ. Dividing by N - D, with deaths removed from the mixing population, is frequency dependence applied strictly, and is a small edit of the code for a disease with high fatality.

## What SEIRD Leaves Out About Mortality

All infected people here are at the same risk, while real mortality differs strongly by age and by health care. Overloaded hospitals raise fatality during a peak, an effect this model cannot show since mu is fixed. Burial or body contact can also transmit some diseases. A stated fatality ratio for one population should not be assumed to hold in another with a different age structure.

## References

<a id="ref-GGHH2021a"></a>Ghostine, R., Gharamti, M., Hassrouny, S. and Hoteit, I. (2021). An Extended SEIR Model with Vaccination for Forecasting the COVID-19 Pandemic in Saudi Arabia Using an Ensemble Kalman Filter. *Mathematics* 9(6), 636. [doi:10.3390/math9060636](https://doi.org/10.3390/math9060636)

## See Also
- [SEIR](seir.md) · [SIR](sir.md) · [Assumptions](assumptions.md) · [Interpretation](interpretation.md)
