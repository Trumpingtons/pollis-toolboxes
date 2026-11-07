# Factsheet

A stochastic differential equation, dX = f(X,t) dt + g(X,t) dW, adds the increments of a Brownian motion W to an ordinary differential equation. The Stochastic Differential Equations panel treats such equations as mathematics: which calculus gives them a meaning, how a function of the solution moves, how accurate a scheme is, and which schemes suit which noise.

## What the Stochastic Differential Equations Panel Does

| Item | Description |
|---|---|
| **Purpose** | Calculus and numerical solution of stochastic differential equations |
| **Julia stack** | StochasticDiffEq.jl for `SDEProblem` and `solve`, DiffEqNoiseProcess.jl for Brownian paths, Symbolics.jl for derivatives, DiffEqDevTools.jl for convergence tests, OrdinaryDiffEq.jl for moment equations |
| **Tabs** | **Itô Calculus**, **Stratonovich**, **Exact Solutions**, **Systems of SDEs**, **Stiff SDEs** |
| **Shared inputs** | **Time Span**, **Step dt** and **Seed** |
| **Output** | A path `sol`, with `sol.t` and `sol.u`, and a named tuple of results for each tab |
| **Key choice** | The calculus, the noise structure, and an explicit or an implicit solver |

## What the Five Tabs of the Panel Compute

| Tab | Equation | What the main code returns |
|---|---|---|
| **Itô Calculus** | dX = f(X) dt + g(X) dW and a function F(X) | The SDE of F(X) by Itô's lemma, and F(X) on one path against two integrated versions |
| **Stratonovich** | dX = f(X) dt + g(X) ∘ dW | The drift of the equivalent Itô equation, and both solutions on one path |
| **Exact Solutions** | One of four equations with a closed-form solution | The numerical and the exact value at the end, and the error |
| **Systems of SDEs** | du = A u dt + noise | The state at the end and the covariance rate Q of the noise |
| **Stiff SDEs** | dX = -lambda (X - sin(t)) dt + sigma dW | The value at the end and the explicit step limit 2 / lambda |

## Which Solvers the Stochastic Differential Equations Panel Offers

| Solver | Step | Strong order | Weak order | Noise it accepts |
|---|---|---|---|---|
| EM | Fixed | 1/2, or 1 with additive noise | 1 | Any |
| LambaEM | Adaptive | 1/2 | 1 | Any |
| RKMil | Adaptive | 1 | 1 | Diagonal |
| SRIW1, SOSRI | Adaptive | 3/2 | 2 | Diagonal |
| EulerHeun, LambaEulerHeun | Fixed, adaptive | 1 with commutative noise, 1/2 otherwise | 1 | Any, read as Stratonovich |
| SKenCarp, SOSRA | Adaptive | 3/2 | 2 | Additive: scalar, diagonal or non-diagonal |
| ImplicitEM | Adaptive | 1/2 | 1 | Any |

The orders of EM and RKMil are those of [Kloeden and Platen (1992)](#ref-KP1992a), SRIW1 is the method of [Rößler (2010)](#ref-Ros2010a), and SOSRI and SOSRA are the stability-optimised methods of [Rackauckas and Nie (2020)](#ref-RN2020a). With `adaptive=false`, as in the convergence and stability checks, every solver takes the fixed step it is given.

## References

<a id="ref-KP1992a"></a>Kloeden, P. E. and Platen, E. (1992). *Numerical Solution of Stochastic Differential Equations*. Springer. [doi:10.1007/978-3-662-12616-5](https://doi.org/10.1007/978-3-662-12616-5)

<a id="ref-RN2020a"></a>Rackauckas, C. and Nie, Q. (2020). Stability-optimized high order methods and stiffness detection for pathwise stiff stochastic differential equations. *2020 IEEE High Performance Extreme Computing Conference (HPEC)*, 1–8. [doi:10.1109/hpec43674.2020.9286178](https://doi.org/10.1109/hpec43674.2020.9286178)

<a id="ref-Ros2010a"></a>Rößler, A. (2010). Runge–Kutta methods for the strong approximation of solutions of stochastic differential equations. *SIAM Journal on Numerical Analysis* 48(3), 922–952. [doi:10.1137/09076636X](https://doi.org/10.1137/09076636X)

## See Also

- [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
