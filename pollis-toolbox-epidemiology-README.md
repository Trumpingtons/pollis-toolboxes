# Epidemiology Toolbox

Version 0.1.0

Pollis Epidemiology Toolbox: inference of epidemiological parameters, compartmental models (SIR, SIS, SEIR, SIRS, SEIRD) and universal differential equations for epidemics.

Installing it adds the **Epidemiology Toolbox** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code, Next Steps, wikis and notebook tutorials.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Epidemiological Inference | Bayesian inference of the reproduction number Rt and of SIR and SEIR parameters from case counts | [Turing.jl](https://github.com/TuringLang/Turing.jl), [Pathogen.jl](https://github.com/jangevaare/Pathogen.jl), [MCMCChains.jl](https://github.com/TuringLang/MCMCChains.jl), [Plots.jl](https://github.com/JuliaPlots/Plots.jl) |
| Compartmental Models | SIR, SIS, SEIR, SIRS and SEIRD models: epidemic curves, peaks, final sizes and herd-immunity thresholds | [DifferentialEquations.jl](https://docs.sciml.ai/DiffEqDocs/stable/) |
| Universal Differential Equations for Epidemiology | Neural ODEs, universal differential equations, Bayesian neural ODEs, symbolic recovery of the learned terms and the QSIR model | [Lux.jl](https://lux.csail.mit.edu/), [SciMLSensitivity.jl](https://docs.sciml.ai/SciMLSensitivity/stable/), [AdvancedHMC.jl](https://github.com/TuringLang/AdvancedHMC.jl), [DataDrivenDiffEq.jl](https://docs.sciml.ai/DataDrivenDiffEq/stable/) |

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones.

## License

AGPL-3.0
