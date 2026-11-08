# Automatic Differentiation

Automatic differentiation computes the derivatives of a program by applying the chain rule to each elementary operation the program performs, as it runs. The method, its two modes and its cost are set out by [Griewank and Walther (2008)](#ref-GW2008a), and its place in machine learning by [Baydin, Pearlmutter, Radul and Siskind (2018)](#ref-BPRS2018a).

## How Automatic Differentiation Differs from Symbolic and Numerical Differentiation

Automatic differentiation, symbolic differentiation and numerical differentiation all compute derivatives, by different means. Symbolic differentiation applies the rules of calculus to a formula and returns a new formula. Numerical differentiation evaluates the function at nearby points and takes difference quotients, which approximate the derivative with an error that depends on the step. Automatic differentiation follows the program as it computes a value, and for each elementary operation (an addition, a product, a sine, an exponential) it also computes that operation's derivative and combines it with the chain rule. The result is a number, not a formula, and it is exact up to the rounding of floating-point arithmetic, since no step and no truncated series is involved ([Griewank and Walther (2008)](#ref-GW2008a)).

## The Origins of Forward Mode: Wengert Lists

[Wengert (1964)](#ref-Wen1964a) described a program that evaluates a function together with its derivatives by breaking the formula into a sequence of elementary steps and carrying, at each step, the derivative of the intermediate value along with the value itself. The sequence of intermediate variables is still called a Wengert list. Carrying derivatives forward through the steps is forward mode. Forward mode can be written with dual numbers, pairs a + b ε with ε^2 = 0, whose arithmetic carries a value and a derivative at once; ForwardDiff.jl implements forward mode with dual numbers that pass through generic Julia code ([Revels, Lubin and Papamarkou (2016)](#ref-RLP2016a)).

## The Origins of Reverse Mode and Backpropagation

[Linnainmaa (1976)](#ref-Lin1976a) expressed the accumulated rounding error of an algorithm as a Taylor expansion in the local rounding errors, computing its coefficients by propagating sensitivities backwards through the computation. Propagating sensitivities from the output back to the inputs is reverse mode, which gives the whole gradient of a scalar function at a cost that does not grow with the number of inputs ([Griewank and Walther (2008)](#ref-GW2008a)). [Rumelhart, Hinton and Williams (1986)](#ref-RHW1986a) trained layered neural networks by propagating errors backwards through the layers, the procedure known as backpropagation. Backpropagation is reverse-mode automatic differentiation applied to a network's loss, and deep learning frameworks are built around it ([Baydin, Pearlmutter, Radul and Siskind (2018)](#ref-BPRS2018a)).

## Automatic Differentiation Packages in Julia

| Package | Mode | How it differentiates |
|---|---|---|
| ForwardDiff.jl | Forward | Dual numbers that flow through generic Julia code ([Revels, Lubin and Papamarkou (2016)](#ref-RLP2016a)) |
| Enzyme.jl | Forward and reverse | Differentiates the LLVM compiler's intermediate representation after optimisation ([Moses and Churavy (2020)](#ref-MC2020a)) |
| Mooncake.jl | Forward and reverse | Differentiates Julia's own intermediate representation |
| DifferentiationInterface.jl | Any | One set of functions over all the backends above, and over FiniteDiff.jl and Symbolics.jl ([Dalle and Hill (2026)](#ref-DH2026a)) |

The **Backend** menu of the Automatic Differentiation panel chooses among these packages, and every tab runs the same DifferentiationInterface code on the one chosen.

## Forward Mode Worked by Hand

Take f(x1, x2) = x1 x2 + sin(x1) at (x1, x2) = (2, 3), written as a Wengert list. Forward mode carries, beside each value v, its derivative v' along one input direction, here x1.

| Step | Value | Derivative along x1 |
|---|---|---|
| v1 = x1 | 2 | v1' = 1 |
| v2 = x2 | 3 | v2' = 0 |
| v3 = v1 v2 | 6 | v3' = v1' v2 + v1 v2' = 3 |
| v4 = sin(v1) | sin 2 | v4' = cos(v1) v1' = cos 2 |
| v5 = v3 + v4 | 6 + sin 2 | v5' = 3 + cos 2 |

The last row gives the partial derivative of f with respect to x1. The partial derivative with respect to x2 needs a second pass, starting from v1' = 0 and v2' = 1: forward mode makes one pass per input direction.

## Reverse Mode Worked by Hand

Reverse mode evaluates the same Wengert list forward once, keeping the values, then goes backwards with adjoints, the derivatives of the output with respect to each intermediate value, written v̄. The backward pass starts from v̄5 = 1.

| Step, taken backwards | Adjoints |
|---|---|
| v5 = v3 + v4 | v̄3 = 1, v̄4 = 1 |
| v4 = sin(v1) | v̄1 = v̄4 cos(v1) = cos 2 |
| v3 = v1 v2 | v̄1 = cos 2 + v̄3 v2 = 3 + cos 2, v̄2 = v̄3 v1 = 2 |

One backward pass gives the whole gradient, (3 + cos 2, 2), whatever the number of inputs. The price is memory: the values of the forward pass must be kept, or recomputed, for the backward pass ([Griewank and Walther (2008)](#ref-GW2008a)).

## How Automatic Differentiation Treats Branches, Kinks and Loops

Automatic differentiation differentiates the program as written. At an `if` statement it differentiates the branch the program takes at that point, so at a kink, such as `abs(x)` at 0 or `max(x, 0)` at 0, it returns the derivative of one side. A loop is differentiated iteration by iteration, so the derivative of an iterative solver is the derivative of the iterations it ran. The result is always numbers at a point, never a formula; Symbolics.jl, the reference backend of the panel, works with formulas ([Griewank and Walther (2008)](#ref-GW2008a)).

## References

<a id="ref-BPRS2018a"></a>Baydin, A. G., Pearlmutter, B. A., Radul, A. A. and Siskind, J. M. (2018). Automatic differentiation in machine learning: a survey. *Journal of Machine Learning Research* 18(153), 1–43. [jmlr.org](https://jmlr.org/papers/v18/17-468.html)

<a id="ref-DH2026a"></a>Dalle, G. and Hill, A. (2026). A common interface for automatic differentiation. *Journal of Machine Learning Research* 27(25), 1–13. [jmlr.org](https://www.jmlr.org/papers/v27/25-1024.html)

<a id="ref-GW2008a"></a>Griewank, A. and Walther, A. (2008). *Evaluating Derivatives: Principles and Techniques of Algorithmic Differentiation*, 2nd edition. SIAM. [doi:10.1137/1.9780898717761](https://doi.org/10.1137/1.9780898717761)

<a id="ref-Lin1976a"></a>Linnainmaa, S. (1976). Taylor expansion of the accumulated rounding error. *BIT* 16(2), 146–160. [doi:10.1007/BF01931367](https://doi.org/10.1007/BF01931367)

<a id="ref-MC2020a"></a>Moses, W. S. and Churavy, V. (2020). Instead of rewriting foreign code for machine learning, automatically synthesize fast gradients. *Advances in Neural Information Processing Systems* 33. [arXiv:2010.01709](https://arxiv.org/abs/2010.01709)

<a id="ref-RLP2016a"></a>Revels, J., Lubin, M. and Papamarkou, T. (2016). Forward-mode automatic differentiation in Julia. arXiv:1607.07892. [arxiv.org](https://arxiv.org/abs/1607.07892)

<a id="ref-RHW1986a"></a>Rumelhart, D. E., Hinton, G. E. and Williams, R. J. (1986). Learning representations by back-propagating errors. *Nature* 323(6088), 533–536. [doi:10.1038/323533a0](https://doi.org/10.1038/323533a0)

<a id="ref-Wen1964a"></a>Wengert, R. E. (1964). A simple automatic derivative evaluation program. *Communications of the ACM* 7(8), 463–464. [doi:10.1145/355586.364791](https://doi.org/10.1145/355586.364791)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
