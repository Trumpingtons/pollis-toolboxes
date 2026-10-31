# Decision Guide

| Situation | Model |
|---|---|
| One wave; those who recover stay immune | **SIR** |
| Reinfection right after recovery, as in many bacterial infections | **SIS** |
| A latent period long enough to change timing | **SEIR** |
| Immunity lost over months or years; recurrent waves | **SIRS** |
| Deaths are a result to be reported | **SEIRD** |

## Choosing the Simplest Model That Answers the Question

Each added compartment adds a rate to be known. SIR is the natural start, with a state added only when the question needs it: latency for timing, waning for long-run behaviour, deaths for burden. [Bjørnstad (2018)](#ref-Bjo2018a) takes this approach with data, and a model with more states that cannot be fitted says less than it seems to. When two models give the same answer to the question at hand, the simpler one is the better report.

## When a Compartmental Model Is the Wrong Tool

Move to the Branching Processes panel for the first few cases, where chance decides whether an outbreak takes off. Move to the Epidemics on Networks panel when the structure of contacts or targeted measures are the point. Move to the Contagion Models panel when rates must be estimated from data, and to the Coinfection panel when strains interact.

## Rules of Thumb for Compartmental Scenarios

- **T**: long enough for the curve to end, and much longer near the threshold.
- **Exponential periods**: split into stages if timing is the result of interest.
- **Comparisons**: more reliable than single forecasts.
- **Peak timing**: treat as the least reliable result.
- **Near R0 = 1**: expect large effects from small changes, and doubt a deterministic curve.

## References

<a id="ref-Bjo2018a"></a>Bjørnstad, O. N. (2018). *Epidemics: Models and Data Using R*. Springer. [doi:10.1007/978-3-319-97487-3](https://doi.org/10.1007/978-3-319-97487-3)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md)
