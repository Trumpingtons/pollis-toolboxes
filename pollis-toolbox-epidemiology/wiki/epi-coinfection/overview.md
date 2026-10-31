# Overview

The three tabs of the Coinfection panel share a population, a disease model and an individual-based simulation in discrete time steps.

## What the Shared Coinfection Inputs Mean

**Disease Model** applies to every strain: SI, SIR, SEIR or SEIRS. **Hosts** and **Time Steps** set the scale. **Transmission** chooses between Frequency-Dependent and Density-Dependent. **Disease Mortality**, **Recovery**, **Latent Period** and **Loss of Immunity** are per time step, as they apply to the model chosen. **Background Mortality**, **Births per Mature Host** and **Age of Maturity** keep the host population going through a long run.

## The Three Tabs of the Coinfection Panel

| Tab | Added inputs | Purpose |
|---|---|---|
| Two Strains | Transmission of each strain, Effect of Strain 2 on Strain 1, Effect of Strain 1 on Strain 2, First Cases per Strain | One known interaction in each direction |
| Strain Community | Strains, Interaction Strength, Share Facilitative, Priority Effects, Arrival of Strains | Many strains with a random matrix |
| Detection | The same, with Share Sampled, False Positive Rate, False Negative Rate | A survey of the simulated hosts |

## Common Workflow for a Coinfection Simulation

1. **Start with Two Strains** and no interaction, to see what the disease model gives alone.
2. **Add interactions**, and look at Infected and Coinfected.
3. **Diagnose**: Run-to-Run Variation and Coinfection Against Chance.
4. **Compare**: interactions, order of arrival and the two forms of transmission.
5. **Scale up** to Strain Community, if many strains are at stake.
6. **Survey** the simulation with Detection, before planning or reading a real one.

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Two Strains](two.md) · [Strain Community](community.md) · [Detection](detection.md)
