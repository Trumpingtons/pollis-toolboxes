# Symbolic Math — Factsheet

The Symbolic Math panel works with expressions as formulas rather than numbers, in the way of a calculus or algebra textbook such as [Apostol (1967)](#ref-Apo1967a) or [Stewart, Clegg and Watson (2020)](#ref-SCW2020a). An answer stays exact, for example a fraction remains a fraction. Symbolics.jl, described in [Gowda, Ma, Cheli, Gwóźzdź, Shah, Edelman and Rackauckas (2022)](#ref-GMCGSER2022a), handles the algebra and derivatives, SymbolicNumericIntegration.jl finds antiderivatives, and Nemo.jl factors polynomials.

| | |
|---|---|
| **Purpose** | Simplify, differentiate, integrate, expand and solve expressions exactly |
| **Julia stack** | Symbolics.jl, SymbolicNumericIntegration.jl, Nemo.jl, Latexify.jl, Plots.jl |
| **Models** | Algebra, Differentiation, Integration, Limits and Series, Equation Solving |
| **Output** | Formulas with their numerical checks, LaTeX, and compiled Julia functions |
| **Key choice** | The operation, and whether the exact answer is worth having over a numerical one |

## When to Use Symbolic Computation

Symbolic computation fits a problem where a formula itself is the goal: deriving a first-order condition, showing that a derivative has a given sign, finding a closed-form integral, or generating code for a gradient. [Simon and Blume (1994)](#ref-SB1994a) show how much of economic analysis rests on such manipulations. An exact answer also has no rounding error and remains valid for all parameter values when the parameters are declared as symbols. A numerical method is the better path when only a number is needed at one point, or when the expression is large.

## What the Symbolic Math Panel Does Not Cover

Results are limited by the packages: some integrals have no elementary answer, some equations have no closed-form roots, and a limit is available only for expressions using exp, log and rational operations. Differential equations, matrix algebra beyond the gradient and Hessian, proofs and assumptions about variables, such as declaring one positive, are not available as inputs. Without those assumptions, a simplification that needs a sign may not happen. Simplification itself is heuristic, so a simple form may exist that the panel does not find.

## References

<a id="ref-Apo1967a"></a>Apostol, T. M. (1967). Calculus, Volume 1. *Wiley*.

<a id="ref-GMCGSER2022a"></a>Gowda, S., Ma, Y., Cheli, A., Gwóźzdź, M., Shah, V. B., Edelman, A. and Rackauckas, C. (2022). High-Performance Symbolic-Numerics via Multiple Dispatch. *ACM Communications in Computer Algebra* 55(3), 92–96. [doi:10.1145/3511528.3511535](https://doi.org/10.1145/3511528.3511535)

<a id="ref-SB1994a"></a>Simon, C. P. and Blume, L. (1994). Mathematics for Economists. *W. W. Norton*.

<a id="ref-SCW2020a"></a>Stewart, J., Clegg, D. and Watson, S. (2020). Calculus: Early Transcendentals. *Cengage Learning*.

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
