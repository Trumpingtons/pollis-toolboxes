# Containment

## How a Containment Simulation Works

Each simulated case draws its offspring from the negative binomial, with infection dates from the generation time and symptom onset from the incubation period. Measures then remove some of those infections, depending on the dates. The structure follows [Hellewell, Abbott, Gimma, Bosse, Jarvis, Russell, Munday, Kucharski, Edmunds, Sun, Flasche, Quilty, Davies, Liu, Clifford, Klepac, Jit, Diamond, Gibbs, van Zandvoort, Funk and Eggo (2020)](#ref-HAGBJ...2020a), who simulated isolation and contact tracing in the same way. An outbreak counts as contained if it ends before the Case Cap.

## What Isolation Does in a Branching Process

Isolation begins after symptom onset, by a delay drawn from an exponential distribution, and stops further transmission from that case until it is released. Infections before that date are unaffected. A case released while still infectious can transmit again. [Fraser, Riley, Anderson and Ferguson (2004)](#ref-FRAF2004a) show that the share of transmission before symptoms, taken with R, decides whether isolation alone can stop an outbreak.

## What Contact Tracing Adds to Isolation

Contact tracing reaches each contact of an isolated case with a set probability, after a further delay. A traced contact is quarantined before its own symptoms, if the trace arrives in time, which removes the transmission that isolation would have missed. Tracing has little to work on when the delay from onset to isolation plus that of tracing is longer than the time to the next generation. Next Steps > Compare Tracing Levels shows how its benefit grows with the probability.

## What Post-Exposure Vaccination Adds

A dose given to a traced contact before symptom onset stops the infection with the probability set under Post-Exposure Efficacy. The measure relies on tracing to find those people, so that it adds nothing when tracing is absent, and little when incubation is short compared with the delays. It suits infections with long incubation periods, in which a dose can still act after exposure.

## How Dispersion Changes Control

For the same R, a smaller k makes outbreaks easier to contain under control, and many end with no measures at all. Measures that reach most contacts of a case are also more effective against the rare large events, since those events account for much of transmission. [Lloyd-Smith, Schreiber, Kopp and Getz (2005)](#ref-LSKG2005a) compare control aimed at everyone with control aimed at the most infectious cases, which is more effective when k is small.

## References

<a id="ref-FRAF2004a"></a>Fraser, C., Riley, S., Anderson, R. M. and Ferguson, N. M. (2004). Factors that make an infectious disease outbreak controllable. *Proceedings of the National Academy of Sciences* 101(16), 6146–6151. [doi:10.1073/pnas.0307506101](https://doi.org/10.1073/pnas.0307506101)

<a id="ref-HAGBJ...2020a"></a>Hellewell, J., Abbott, S., Gimma, A., Bosse, N. I., Jarvis, C. I., Russell, T. W., Munday, J. D., Kucharski, A. J., Edmunds, W. J., Sun, F., Flasche, S., Quilty, B. J., Davies, N., Liu, Y., Clifford, S., Klepac, P., Jit, M., Diamond, C., Gibbs, H., van Zandvoort, K., Funk, S. and Eggo, R. M. (2020). Feasibility of controlling COVID-19 outbreaks by isolation of cases and contacts. *The Lancet Global Health* 8(4), e488–e496. [doi:10.1016/S2214-109X(20)30074-7](https://doi.org/10.1016/S2214-109X(20)30074-7)

<a id="ref-LSKG2005a"></a>Lloyd-Smith, J. O., Schreiber, S. J., Kopp, P. E. and Getz, W. M. (2005). Superspreading and the effect of individual variation on disease emergence. *Nature* 438(7066), 355–359. [doi:10.1038/nature04153](https://doi.org/10.1038/nature04153)

## See Also
- [Superspreading](exact.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md)
