# Numerical Differentiation — Diagnostics

The error of a difference quotient is the sum of a truncation error, which falls as the step shrinks, and a rounding error, which grows as it shrinks ([Nocedal and Wright (2006)](#ref-NW2006a)). The diagnostics of the Numerical Differentiation panel measure both against the exact derivative.

## Reading the Step-Size Error Plot

The **Step-Size Error** action plots, on log scales, the error against the exact derivative of the forward difference, the central difference and the complex step as the step h goes from 0.1 down to 1e-15. For the Higher Derivatives tab it plots the error of the tab's stencil. Read from the right, where h is large, the error of a difference quotient first falls along a line whose slope is the order of its truncation error, 1 for the forward difference and 2 for the central difference. It reaches a minimum, then rises as rounding error, of the order of eps / h, takes over ([Nocedal and Wright (2006)](#ref-NW2006a)). The dotted lines mark sqrt(eps) and eps^(1/3), the usual best steps of the two differences. The complex step has no subtraction and so no rising branch ([Martins, Sturdza and Alonso (2003)](#ref-MSA2003a)). For the Jacobians, Hessians tab the plot uses f along x[1].

## Checking an Estimate Against the Exact Derivative

Each tab computes the exact derivative with Symbolics.jl and reports the error of every estimate against it. The forward difference at its best step gets about half of the 16 significant digits of double precision right, and the central difference about two thirds ([Nocedal and Wright (2006)](#ref-NW2006a)). The complex step and a well-chosen stencil of several points get close to all of them. Richardson extrapolation improves on the differences it starts from when f is smooth ([Richardson (1911)](#ref-Ric1911a)). The **Accuracy Summary** action turns each error into a count of correct digits.

## Error Estimates of FiniteDifferences

`estimate_step` returns, with the step it chooses for a stencil, an estimate of the error of the result, and `extrapolate_fdm` returns one with the extrapolated estimate. The Finite Differences, Higher Derivatives and Step Size and Error tabs list these estimates beside the actual error against the exact derivative. An actual error close to the estimate, or below it, means the estimate can be relied on for a function with no exact derivative at hand.

## Warning Signs of a Poor Estimate

| Sign in the output | Likely cause |
|---|---|
| The error grows as **Step h** shrinks | Rounding error dominates: the step is below its best value |
| The error barely falls as **Step h** shrinks | f is not smooth near x0, or has a kink there |
| `NaN` or a `DomainError` | A point of the stencil lies outside the domain of f |
| `NaN` for the complex step | f does not accept complex numbers |
| An estimated Hessian that is not symmetric | Differences of differences: the Hessian is only an estimate ([Nocedal and Wright (2006)](#ref-NW2006a)) |
| An error from `central_fdm` in the Higher Derivatives tab | **Stencil Points** not larger than **Derivative Order** |

## References

<a id="ref-MSA2003a"></a>Martins, J. R. R. A., Sturdza, P. and Alonso, J. J. (2003). The complex-step derivative approximation. *ACM Transactions on Mathematical Software* 29(3), 245–262. [doi:10.1145/838250.838251](https://doi.org/10.1145/838250.838251)

<a id="ref-NW2006a"></a>Nocedal, J. and Wright, S. J. (2006). *Numerical Optimization*, 2nd edition. Springer. [doi:10.1007/978-0-387-40065-5](https://doi.org/10.1007/978-0-387-40065-5)

<a id="ref-Ric1911a"></a>Richardson, L. F. (1911). The approximate arithmetical solution by finite differences of physical problems involving differential equations, with an application to the stresses in a masonry dam. *Philosophical Transactions of the Royal Society of London, Series A* 210, 307–357. [doi:10.1098/rsta.1911.0009](https://doi.org/10.1098/rsta.1911.0009)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
