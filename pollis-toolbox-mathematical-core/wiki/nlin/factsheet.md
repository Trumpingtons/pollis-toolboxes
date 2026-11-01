# Nonlinear Systems — Factsheet

The Nonlinear Systems panel finds values that make one equation, or several equations at once, equal to zero. Root finding underlies market equilibria, first-order conditions, implied volatilities and steady states, as [Judd (1998)](#ref-Jud1998a) shows for economic models. NonlinearSolve.jl, described in [Pal, Holtorf, Larsson, Loman, Utkarsh, Schaefer, Qu, Edelman and Rackauckas (2024)](#ref-PHLLUSQER2024a), supplies the algorithms, with one interface for all of them.

| | |
|---|---|
| **Purpose** | Solve f(x) = 0 for one equation or for a system of n equations in n unknowns |
| **Julia stack** | NonlinearSolve.jl, with ForwardDiff.jl, Symbolics.jl and Plots.jl |
| **Models** | Scalar Equation, Bracketing, System of Equations |
| **Output** | The solution, the residual, a return code, evaluation counts, sensitivities |
| **Key choice** | A starting point or a bracket, and the algorithm |

## When to Use a Root Finder

A root finder fits any problem where the answer is defined by an equation that cannot be rearranged by hand: break-even points, internal rates of return, or a system of equilibrium conditions. A closed-form formula, if one exists, is more accurate and faster. The Symbolic Math panel can look for one first. When the equations come from maximising a function, an optimisation solver is often more stable, because it uses the objective to judge progress and can tell maxima from minima.

## What the Nonlinear Systems Panel Does Not Cover

The panel finds one solution per run, and repeated solves from different starts are the only way of looking for others. No method here guarantees finding all solutions of a system. Inequality constraints, complementarity conditions and bounds on unknowns are not supported, and problems with more equations than unknowns belong to a least-squares solver. Equations must be written as Julia expressions in the inputs, so functions that need a simulation or a data file require editing the code. Differential equations are also outside the panel's scope.

## References

<a id="ref-Jud1998a"></a>Judd, K. L. (1998). Numerical Methods in Economics. *MIT Press*.

<a id="ref-PHLLUSQER2024a"></a>Pal, A., Holtorf, F., Larsson, A., Loman, T., Utkarsh, Schaefer, F., Qu, Q., Edelman, A. and Rackauckas, C. (2024). NonlinearSolve.jl: High-Performance and Robust Solvers for Systems of Nonlinear Equations in Julia. *arXiv*. [Link](https://arxiv.org/abs/2403.16341)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
