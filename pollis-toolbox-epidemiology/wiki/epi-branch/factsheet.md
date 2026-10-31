# Branching Processes — Factsheet

A branching process follows an outbreak case by case: each case produces a random number of secondary cases, drawn independently from an offspring distribution. Chance is the whole point, which makes these models the natural tool for the first cases of an outbreak, when it may die out by itself or take off.

| | |
|---|---|
| **Purpose** | The chance that an outbreak ends, what measures add to that chance, and R and dispersion k from counts or clusters |
| **Input** | R and k, delay distributions, measures in force; or offspring counts or final cluster sizes |
| **Core packages** | EpiBranch.jl, Distributions.jl, Turing.jl |
| **Models** | Containment, Superspreading, Estimating R and k, Line Lists |
| **Output** | Containment and extinction probabilities, chain sizes, share of transmission from the top cases, estimates of R and k, simulated line lists |
| **Key choice** | Whether to simulate with measures in force, compute exactly with no measures, or estimate from data |

## When to Use a Branching Process

A branching process suits outbreaks that are small compared with the population: a new introduction, a cluster, a pathogen near elimination, or an emerging infection with R below 1 that causes short chains. Questions it answers well are how likely an introduction is to fade out, how much isolation and tracing raise that chance, and how much of the transmission comes from a few cases.

## What a Branching Process Is Not

No susceptible people are used up in this panel's models, so that a growing branching process grows without limit. Peak and final size of a large epidemic are therefore out of reach, and belong to the Compartmental Models and Epidemics on Networks panels. Cases also act independently: households and clusters of contacts that overlap are not represented.

## See Also
- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
