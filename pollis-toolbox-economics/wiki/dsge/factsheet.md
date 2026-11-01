# Dynamic Stochastic General Equilibrium (DSGE) — Factsheet

The Dynamic Stochastic General Equilibrium (DSGE) panel writes a macroeconomic model as equations for forward-looking households and firms, solves the model by perturbation around a steady state, and uses the solution to compute moments, estimate parameters and trace the effects of shocks. All of the panel's code runs on MacroModelling.jl, and Turing.jl draws from the posterior. Dynare.jl, DSGE.jl, SolveDSGE.jl and StateSpaceEcon.jl are other Julia routes to similar models.

| | |
|---|---|
| **Purpose** | Solve, simulate and estimate rational-expectations models of the macroeconomy |
| **Julia stack** | MacroModelling.jl, Turing.jl, StatsPlots.jl |
| **Models** | A small custom business-cycle model, or a model from the package's library, through **Moments**, **Estimation** and **Impulse Responses** |
| **Output** | Steady states, model-implied moments, posterior draws, impulse responses, shock decompositions |
| **Key choice** | The model equations, the order of the perturbation, and the observables used for estimation |

## When to Use a DSGE Model

A DSGE model suits questions about mechanisms and policy changes, because its parameters describe preferences, technology and policy rules rather than reduced-form correlations. A change in a policy rule can be studied with the rest of the structure held fixed. Medium-scale models such as [Smets and Wouters (2007)](#ref-SW2007a) fit several aggregate series at once, and central banks keep models of that kind, including [Dorich, Johnston, Mendes, Murchison and Zhang (2013)](#ref-DJMMZ2013a), for projections and policy analysis. A structural model is less useful when the question is purely about forecasting a series and the mechanism is of no interest.

## What the DSGE Panel Does Not Cover

Regime changes are not part of the panel, though methods exist for them, as in [Foerster, Rubio-Ramírez, Waggoner and Zha (2016)](#ref-FRWZ2016a). The solution is local to a steady state, so large shocks, occasionally binding constraints and a lower bound on interest rates are outside what a plain perturbation captures. **Estimation** uses the Kalman filter at first order. The inversion filter that MacroModelling.jl offers for higher-order solutions is reachable by editing the code of the likelihood, but no panel input sets it. Heterogeneous households belong to the Heterogeneous-Agent Models panel, and the estimation of unrestricted systems to the VAR Models panel.

## References

<a id="ref-DJMMZ2013a"></a>Dorich, J., Johnston, M. K., Mendes, R. R., Murchison, S. and Zhang, Y. (2013). ToTEM II: An Updated Version of the Bank of Canada's Quarterly Projection Model. [Link](https://www.bankofcanada.ca/2013/10/technical-report-100/)

<a id="ref-FRWZ2016a"></a>Foerster, A., Rubio-Ramírez, J. F., Waggoner, D. F. and Zha, T. (2016). Perturbation methods for Markov-switching DSGE models. *Quantitative Economics* 7(2), 637–669. [doi:10.3982/QE596](https://doi.org/10.3982/QE596)

<a id="ref-SW2007a"></a>Smets, F. and Wouters, R. (2007). Shocks and frictions in US business cycles: A Bayesian DSGE approach. *American Economic Review* 97(3), 586–606. [doi:10.1257/aer.97.3.586](https://doi.org/10.1257/aer.97.3.586)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
