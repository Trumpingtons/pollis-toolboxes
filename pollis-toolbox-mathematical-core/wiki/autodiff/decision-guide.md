# Automatic Differentiation — Decision Guide

The choice in the Automatic Differentiation panel is the tab, set by the shape of the function, and the backend, set mostly by the number of inputs and outputs ([Griewank and Walther (2008)](#ref-GW2008a)).

## Which Tab for Which Function

| The function | What is wanted | Tab |
|---|---|---|
| f(x), one variable | Slope, curvature, a marginal value | Derivatives |
| f(x[1], ..., x[n]), one value | Marginal effects, conditions for an optimum, concavity | Gradients and Hessians |
| F(x[1], ..., x[n]), several values | The effect of every input on every output | Jacobians |
| F with many inputs or many outputs | The change along one direction, or the gradient of a weighted sum, without the whole Jacobian | Pushforward/Pullback |

## Which Backend for Which Problem

| Situation | Backend | Reason |
|---|---|---|
| Few inputs, ordinary Julia code | ForwardDiff | Forward mode, no setup ([Revels, Lubin and Papamarkou (2016)](#ref-RLP2016a)) |
| Many inputs and one value: a likelihood, a loss | Enzyme or Mooncake | Reverse mode: one backward pass gives the gradient |
| Code that mutates arrays | Enzyme or Mooncake | Both support mutation ([Moses and Churavy (2020)](#ref-MC2020a)) |
| An exact reference to check against | Symbolics | Differentiates the formula |
| A difference-quotient reference | FiniteDiff | Needs only values of the function; see the Numerical Differentiation panel |
| A Hessian with Enzyme or Mooncake | `SecondOrder`, forward over reverse | The usual combination for Hessians |

When the best backend is unclear, the **Compare Backends** action runs all of them on the function and reports which work, how accurate each is and how long each takes.

## Forward or Reverse Mode for a Jacobian

A full Jacobian of a function with n inputs and m outputs costs about n forward passes or m reverse passes, so forward mode suits functions with fewer inputs than outputs and reverse mode suits functions with fewer outputs than inputs ([Griewank and Walther (2008)](#ref-GW2008a)). A gradient, with m = 1, is the case for which reverse mode is made, and the reason it trains neural networks with millions of parameters ([Baydin, Pearlmutter, Radul and Siskind (2018)](#ref-BPRS2018a)). The **Forward vs Reverse Mode** action shows the two costs on one test function as n grows.

## Related Panels of the Core Mathematics Toolbox

- **Numerical Differentiation**: difference quotients, stencils, the complex step and the choice of step, for functions known only through their values.
- **Symbolic Math**: derivatives as formulas.
- **Nonlinear Systems**: Jacobians inside Newton's method.

## References

<a id="ref-BPRS2018a"></a>Baydin, A. G., Pearlmutter, B. A., Radul, A. A. and Siskind, J. M. (2018). Automatic differentiation in machine learning: a survey. *Journal of Machine Learning Research* 18(153), 1–43. [jmlr.org](https://jmlr.org/papers/v18/17-468.html)

<a id="ref-GW2008a"></a>Griewank, A. and Walther, A. (2008). *Evaluating Derivatives: Principles and Techniques of Algorithmic Differentiation*, 2nd edition. SIAM. [doi:10.1137/1.9780898717761](https://doi.org/10.1137/1.9780898717761)

<a id="ref-MC2020a"></a>Moses, W. S. and Churavy, V. (2020). Instead of rewriting foreign code for machine learning, automatically synthesize fast gradients. *Advances in Neural Information Processing Systems* 33. [arXiv:2010.01709](https://arxiv.org/abs/2010.01709)

<a id="ref-RLP2016a"></a>Revels, J., Lubin, M. and Papamarkou, T. (2016). Forward-mode automatic differentiation in Julia. arXiv:1607.07892. [arxiv.org](https://arxiv.org/abs/1607.07892)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Automatic Differentiation](automatic-differentiation.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md)
