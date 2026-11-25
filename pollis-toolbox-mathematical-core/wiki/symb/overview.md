# Symbolic Math — Overview

Five tabs share **Variables**, **Expression** and **Main Variable**, and each applies one operation. **From** and **To** set the plotting interval, and the limits of the definite integral in the **Integration** tab.

## The Algebra Tab

The **Algebra** tab rewrites an expression and evaluates it exactly. `simplify` applies rewrite rules toward a canonical form, `expand` multiplies out products and powers, and `substitute` plugs in **Point** while keeping integers and rationals exact. A shorter form is not always the most useful, since an expanded polynomial is easy to integrate while a factored one shows its roots. Use exact rationals such as `1//3`, since a decimal such as `0.333` enters the expression as a floating-point number and can no longer be simplified exactly.

## The Differentiation Tab

The **Differentiation** tab applies the chain, product and quotient rules through `Differential` and `expand_derivatives`, returning first and second derivatives with respect to **Main Variable**. `Symbolics.gradient` and `Symbolics.hessian` give the first-order and second-order information over every variable in the expression, which supplies conditions for optimisation in several variables. **Point** chooses where **Tangent Line** is drawn. Unlike finite differences, these formulas have no truncation error. Results of this kind are also what automatic differentiation computes, except that a formula remains available for reading.

## The Integration Tab

The **Integration** tab integrates with Giac, a computer algebra system, through Giac.jl. The call `Giac.Commands.integrate(f, v)` returns the antiderivative, and `Giac.Commands.integrate(f, v, a, b)` the definite integral between **From** and **To**, both exact and simplified. The answer may contain special functions, such as `erf(x)` for the antiderivative of `exp(-x^2)`. An integral with no closed form that Giac can find comes back unevaluated, as `integrate(...)`: the tab then reports `closed_form = false`, and the value of the definite integral is computed numerically. Giac is imported rather than used, because Giac and Symbolics both export `build_function` and `substitute`.

## The Limits and Series Tab

The **Limits and Series** tab computes the limit at **Point** and a Taylor polynomial of **Taylor Order** around that point. `limit` uses the algorithm of [Gruntz (1996)](#ref-Gru1996a), which handles indeterminate forms by comparing rates of growth in exp, log and rational operations, and it is two-sided at a finite point. `taylor` gives the local polynomial approximation, whose quality falls with distance from the point. Series are a tool for approximation, and a limit is a statement about behaviour at a single point: the two need not tell the same story.

## The Equation Solving Tab

The **Equation Solving** tab solves **Expression** equal to **Right-Hand Side** for **Main Variable**. `symbolic_solve` factors polynomials exactly through Nemo.jl, and it reduces other equations by isolating the variable and applying inverse functions. Roots are returned as exact expressions along with their numerical values from `symbolic_to_float`. Complex values appear when a polynomial has complex roots, and they are part of the answer. Roots that have no closed form are out of reach, so the Nonlinear Systems panel is the next step for such equations.

## Common Workflow for a Symbolic Calculation

1. Declare **Variables**, then enter **Expression** and **Main Variable**.
2. See the expression with **Function Plot**.
3. Choose the tab for the operation you need, and read the result.
4. Confirm it with **Symbolic Check** and **Numeric Check**.
5. Reuse the result through **Value Table**, **Compiled Function** or **LaTeX Output**.
6. For an optimisation question, read **Critical Points**, which classifies stationary points.

## References

<a id="ref-Gru1996a"></a>Gruntz, D. (1996). On Computing Limits in a Symbolic Manipulation System. *PhD thesis, ETH Zurich*. [doi:10.3929/ethz-a-001631582](https://doi.org/10.3929/ethz-a-001631582)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
