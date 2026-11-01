# Symbolic Math — Decision Guide

The panel suits small expressions where exactness is useful. The choice of tab is usually obvious, whereas the harder question is when to give up on an exact answer.

## Which Symbolic Operation to Use

| Goal | Tab | Method |
|---|---|---|
| A cleaner form, or an exact value | **Algebra** | Rewrite rules, expansion and exact substitution |
| Slopes, gradients or second-order conditions | **Differentiation** | Chain, product and quotient rules |
| An antiderivative or an area | **Integration** | Candidate terms kept by sparse regression |
| Indeterminate forms or a local approximation | **Limits and Series** | Gruntz's algorithm and Taylor expansion |
| Exact roots of an equation | **Equation Solving** | Exact factoring, and inversion by isolation |

## Symbolic or Numerical Derivatives and Integrals

A symbolic derivative is valuable when the formula will be read or reused. Automatic differentiation gives the same accuracy for a number at a point, and it scales to long programs where a formula would swell. Finite differences are the simple fallback for a function available only as a black box. For integrals, a closed form reveals how a result depends on parameters, whereas numerical quadrature handles any integrand on a finite interval and is the only choice for functions with no elementary answer. When the same formula is evaluated many times, **Compiled Function** gives speed.

## When to Stop Looking for a Closed Form

Some problems have no closed-form solution, and failing to find one is often the right result. For polynomials of high degree or mixed equations, go to the Nonlinear Systems panel. For integrals with a non-empty unintegrated part, or those returning `nothing`, use a numerical method. Expressions that swell to pages are rarely useful as formulas, even when correct. A good compromise is to derive what is tractable, such as a gradient, and compute the rest numerically. Hybrid calculations of this kind are the reason Symbolics.jl works directly with Julia.

## How to Enter Expressions That Work

Use exact numbers where possible: `1//3` in place of `0.333`, since exact factoring, simplification and rational output depend on them. Declare every symbol in **Variables**, separated by spaces, including parameters. Choose **Main Variable** clearly in expressions with several symbols. Rewrite the input if a tool reports failure, because the form of an expression affects simplification and integration. Set **From** and **To** to avoid poles. In a multi-variable expression, plots and numeric checks need values for the other symbols, so substitute numbers first, or start with a single-variable version.

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
