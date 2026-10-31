# Compartmental Models — Factsheet

Compartmental models divide a population into health states and describe the flows between them with ordinary differential equations. Given rates of transmission, progression and recovery, they give the whole course of an epidemic in a large, well-mixed population.

| | |
|---|---|
| **Purpose** | The course of an epidemic from assumed rates: curves, peak, final size, thresholds and endemic levels |
| **Input** | Population size, simulated days, transmission rate beta and recovery rate gamma |
| **Core packages** | DifferentialEquations.jl |
| **Models** | SIR, SIS, SEIR, SIRS, SEIRD |
| **Output** | Numbers in each compartment over time, the basic reproduction number R0, the herd immunity threshold and the final or endemic size |
| **Key choice** | Which states the disease really passes through: is there a latent period, does immunity last, does the disease kill |

## When to Use Compartmental Models

Compartmental models suit questions about averages in large populations: how high a wave would peak, what share of people would ever be infected, how much vaccination stops spread, or how much delay in a measure costs. They run in a fraction of a second, so that many scenarios can be tried. Textbook treatments are in [Keeling and Rohani (2008)](#ref-KR2008a) and [Martcheva (2015)](#ref-Mar2015a).

## What Compartmental Models Are Not

Compartmental models are deterministic: the same rates always give the same curve, so that chance fade-out in a small outbreak cannot occur. They do not estimate rates from data, which is the task of the Contagion Models panel. Person-to-person variation and contact structure are also absent, and are treated in the Branching Processes and Epidemics on Networks panels.

## References

<a id="ref-KR2008a"></a>Keeling, M. J. and Rohani, P. (2008). *Modeling Infectious Diseases in Humans and Animals*. Princeton University Press. [doi:10.1515/9781400841035](https://doi.org/10.1515/9781400841035)

<a id="ref-Mar2015a"></a>Martcheva, M. (2015). *An Introduction to Mathematical Epidemiology*. Springer. [doi:10.1007/978-1-4899-7612-3](https://doi.org/10.1007/978-1-4899-7612-3)

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
