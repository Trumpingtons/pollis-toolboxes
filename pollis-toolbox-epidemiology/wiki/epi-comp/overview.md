# Overview

Each tab of the Compartmental Models panel is one system of ordinary differential equations, solved with `Tsit5()` from DifferentialEquations.jl ([Rackauckas and Nie (2017)](#ref-RN2017a)). The inputs are the same across tabs.

## The Five Models and Their Flows

| Model | Flow | Immunity | Typical question |
|---|---|---|---|
| SIR | S → I → R | Lasting | How large will a single wave be? |
| SIS | S → I → S | None | At what level will an infection settle? |
| SEIR | S → E → I → R | Lasting | How does a latent period change the timing? |
| SIRS | S → I → R → S | Waning | Will waves recur as immunity is lost? |
| SEIRD | S → E → I → R or D | Lasting | How many deaths come with the wave? |

## What the Inputs of a Compartmental Model Mean

**N (population)** is the total size of the population; with one initial case, it also sets how small that seed is. **T (days)** is how long the solution runs. **beta (transmission)** is the rate of contacts that would infect, per infectious person per day. **gamma (recovery)** is the inverse of the mean infectious period in days. The rates that have no input, such as the latent rate of SEIR or the waning rate of SIRS, are constants at the top of the code and are meant to be edited.

## Common Workflow for a Compartmental Model

1. **Run the Example Code** with beta, gamma and N for the disease in question.
2. **Visualise**: Epidemic Curve and Phase Portrait show the course and its path.
3. **Diagnose**: Basic R0 and Final Epidemic Size check the curve against theory.
4. **Predict**: Transmission Sweep and Vaccination Impact explore what changes it.
5. **Compare**: Model Comparison and Intervention Timing set scenarios side by side.
6. **Interpret**: R0 Interpretation and Endemic Equilibrium put the result in words.

## References

<a id="ref-RN2017a"></a>Rackauckas, C. and Nie, Q. (2017). DifferentialEquations.jl: A Performant and Feature-Rich Ecosystem for Solving Differential Equations in Julia. *Journal of Open Research Software* 5(1), 15. [doi:10.5334/jors.151](https://doi.org/10.5334/jors.151)

## See Also
- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [SIR](sir.md) · [SIS](sis.md) · [SEIR](seir.md) · [SIRS](sirs.md) · [SEIRD](seird.md)
