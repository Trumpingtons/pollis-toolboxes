# Numerical Differentiation — Factsheet

The Numerical Differentiation panel estimates derivatives from values of the function alone, with difference quotients, stencils of several points, the complex step and Richardson extrapolation ([Nocedal and Wright (2006)](#ref-NW2006a)). Each tab sets its estimate beside the exact derivative, computed by Symbolics.jl from the formula, to show how many digits the estimate gets right.

| | |
|---|---|
| **Purpose** | Derivatives of a function known through its values, and the error of each estimate |
| **Package** | `FiniteDifferences.jl`: `central_fdm`, `forward_fdm`, `estimate_step`, `extrapolate_fdm`, `grad`, `jacobian` |
| **Exact reference** | `Symbolics.jl`, and `DifferentiationInterface.jl` with `AutoSymbolics()` for gradients, Hessians and Jacobians |
| **Tabs** | Finite Differences, Higher Derivatives, Jacobians, Hessians, Complex Step, Step Size and Error |
| **Output** | Each estimate, its error against the exact derivative and, for stencils, the step chosen and its error estimate |

## The Five Tabs of the Numerical Differentiation Panel

| Tab | What the tab estimates | How |
|---|---|---|
| Finite Differences | f'(x0) | Forward, backward and central differences at **Step h**, and a central stencil of **Stencil Points** |
| Higher Derivatives | The derivative of order 2, 3 or 4 | A central stencil, its weights and its step |
| Jacobians, Hessians | A gradient, a Hessian and a Jacobian | Difference quotients in each variable, counting the evaluations |
| Complex Step | f'(x0) | Im f(x0 + i h) / h, with a step as small as 1e-20 |
| Step Size and Error | f'(x0) | Errors over steps from 0.1 down to 1e-14, and Richardson extrapolation |

## A Minimal Example with FiniteDifferences

```julia
using FiniteDifferences

f(x) = x^2 * exp(-x)
m = central_fdm(5, 1)
m(f, 1.0)
estimate_step(m, f, 1.0)
extrapolate_fdm(central_fdm(2, 1), f, 1.0)
```

`central_fdm(5, 1)` is a central stencil of 5 points for the first derivative; calling it on f and a point gives the estimate, `estimate_step` gives the step it uses and an estimate of its error, and `extrapolate_fdm` returns a Richardson extrapolation and its error estimate.

## References

<a id="ref-NW2006a"></a>Nocedal, J. and Wright, S. J. (2006). *Numerical Optimization*, 2nd edition. Springer. [doi:10.1007/978-0-387-40065-5](https://doi.org/10.1007/978-0-387-40065-5)

## See Also

- [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
