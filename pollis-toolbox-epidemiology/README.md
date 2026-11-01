# Epidemiology Toolbox

Pollis Epidemiology Toolbox: inference of epidemiological parameters, inference on contact networks, compartmental models (SIR, SIS, SEIR, SIRS, SEIRD), branching processes, epidemics on networks and coinfection.

Installing it adds the **Epidemiology** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code, Next Steps and wikis.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Epidemiological Inference | Bayesian inference of the reproduction number Rt and of SIR and SEIR parameters from case counts | [Turing.jl](https://github.com/TuringLang/Turing.jl), [Pathogen.jl](https://github.com/Trumpingtons/Pathogen.jl), [MCMCChains.jl](https://github.com/TuringLang/MCMCChains.jl), [Plots.jl](https://github.com/JuliaPlots/Plots.jl) |
| Inference on Contact Networks | Who is likely infected and who the first cases were, from a known contact network and test results, by small-coupling dynamic cavity | [SmallCouplingDynamicCavity.jl](https://github.com/Mattiatarabolo/SmallCouplingDynamicCavity.jl), [Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl), [Plots.jl](https://github.com/JuliaPlots/Plots.jl) |
| Compartmental Models | SIR, SIS, SEIR, SIRS and SEIRD models: epidemic curves, peaks, final sizes and herd-immunity thresholds | [DifferentialEquations.jl](https://docs.sciml.ai/DiffEqDocs/stable/) |
| Branching Processes | Containment by isolation, contact tracing and post-exposure vaccination; exact results on superspreading and chain sizes; R and dispersion k estimated from counts or clusters; simulated line lists | [EpiBranch.jl](https://github.com/epiforecasts/EpiBranch.jl), [Distributions.jl](https://github.com/JuliaStats/Distributions.jl), [Turing.jl](https://github.com/TuringLang/Turing.jl), [Tables.jl](https://github.com/JuliaData/Tables.jl), [Plots.jl](https://github.com/JuliaPlots/Plots.jl) |
| Epidemics on Networks | SIR, SEIR, SIS and SIRS on contact networks, person by person, in daily steps or event by event | [GraphEpidemics.jl](https://github.com/fabmazz/GraphEpidemics.jl), [Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl), [Distributions.jl](https://github.com/JuliaStats/Distributions.jl), [Plots.jl](https://github.com/JuliaPlots/Plots.jl) |
| Coinfection | Strains that help or hinder each other in one host population: two strains, whole communities, and surveys with imperfect tests | [CoinfectionSimulator.jl](https://github.com/Trumpingtons/CoinfectionSimulator.jl), [Plots.jl](https://github.com/JuliaPlots/Plots.jl) |

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones.

## License

AGPL-3.0
