# Contagion Models — Factsheet

Contagion models, listed in the menu as Epidemiological Inference, turn outbreak records into estimates of how fast an infection spreads and who infected whom, each with its uncertainty. Counts of daily cases give the reproduction number over time; individual records give the transmission, latency and removal parameters and the chain of infection.

| | |
|---|---|
| **Purpose** | Bayesian estimates of the time-varying reproduction number, and of the parameters of an outbreak recorded person by person |
| **Input** | Daily case counts and a serial interval, or dated individual events with the distances between people |
| **Core packages** | Turing.jl, Pathogen.jl, MCMCChains.jl |
| **Models** | Rt Estimation, SIR Inference, SEIR Inference |
| **Output** | Posterior distributions of Rt by day, of the parameters and of who infected whom; forecasts and counterfactuals |
| **Key choice** | Aggregate counts with the renewal equation, or individual records with an individual-level model |

## When to Use Contagion Models

Use these models when an outbreak has been observed and the question is what its data imply: whether transmission fell after a measure, how long the latent period is, how quickly infectivity decays with distance, or who probably infected whom. They give full posterior distributions, so that a decision can rest on a credible interval rather than one number.

## What Contagion Models Are Not

Contagion models are not a simulator of what a given set of rates would produce: that is the work of the Compartmental Models panel. They are not a nowcast either, since the Rt Estimation model here treats reported counts as complete and undelayed. A network of known contacts with test results belongs to the Inference on Contact Networks panel, where the data say who met whom rather than how far apart people live.

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
