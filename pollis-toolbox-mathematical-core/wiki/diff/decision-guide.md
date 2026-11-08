# Numerical Differentiation — Decision Guide

The choice in the Numerical Differentiation panel is the formula, the number of points and the step, set by how smooth the function is, how accurately its values are computed and whether its code accepts complex numbers ([Nocedal and Wright (2006)](#ref-NW2006a)).

## Which Tab for Which Question

| The question | Tab |
|---|---|
| The first derivative of a function given by its values | Finite Differences |
| A second, third or fourth derivative | Higher Derivatives |
| A gradient, a Hessian or a Jacobian, and their cost | Jacobians, Hessians |
| The first derivative to machine precision, from code that accepts complex numbers | Complex Step |
| The best step for a function, and the gain from Richardson extrapolation | Step Size and Error |

## Which Formula for Which Function

| Situation | Formula | Reason |
|---|---|---|
| f smooth, evaluations cheap | A central stencil of 5 or more points | A higher order of accuracy for the same rounding ([Fornberg (1988)](#ref-For1988a)) |
| f defined only on one side of x0 | `forward_fdm` or `backward_fdm` | Every point stays inside the domain |
| f computed with noise | A central difference with a larger step, or `factor` in `central_fdm` | The step must exceed the scale of the noise |
| f analytic, code accepts complex numbers | The complex step | No cancellation, so a tiny step ([Squire and Trapp (1998)](#ref-ST1998a)) |
| A few more digits from the same differences | Richardson extrapolation, `extrapolate_fdm` | Cancels the leading truncation error ([Richardson (1911)](#ref-Ric1911a)) |

The **Compare Methods** action runs all of these on the function at x0 and reports the error and the evaluations of each.

## When Automatic Differentiation Is the Better Choice

Numerical differentiation needs only values of the function, which is why it works with simulations, external programs and code in other languages. When the function is Julia code that an automatic differentiation backend can follow, automatic differentiation gives derivatives exact up to rounding, with no step to choose, and a gradient by reverse mode costs a small multiple of one evaluation whatever the number of variables ([Nocedal and Wright (2006)](#ref-NW2006a)). The Automatic Differentiation panel of the Core Mathematics Toolbox computes them with DifferentiationInterface.jl.

## Related Panels of the Core Mathematics Toolbox

- **Automatic Differentiation**: exact derivatives, gradients, Hessians and Jacobians of Julia code, in forward or reverse mode.
- **Symbolic Math**: derivatives as formulas.
- **Numerical Integration**: the companion problem of estimating an integral from values of the function.

## References

<a id="ref-For1988a"></a>Fornberg, B. (1988). Generation of finite difference formulas on arbitrarily spaced grids. *Mathematics of Computation* 51(184), 699–706. [doi:10.1090/S0025-5718-1988-0935077-0](https://doi.org/10.1090/S0025-5718-1988-0935077-0)

<a id="ref-NW2006a"></a>Nocedal, J. and Wright, S. J. (2006). *Numerical Optimization*, 2nd edition. Springer. [doi:10.1007/978-0-387-40065-5](https://doi.org/10.1007/978-0-387-40065-5)

<a id="ref-Ric1911a"></a>Richardson, L. F. (1911). The approximate arithmetical solution by finite differences of physical problems involving differential equations, with an application to the stresses in a masonry dam. *Philosophical Transactions of the Royal Society of London, Series A* 210, 307–357. [doi:10.1098/rsta.1911.0009](https://doi.org/10.1098/rsta.1911.0009)

<a id="ref-ST1998a"></a>Squire, W. and Trapp, G. (1998). Using complex variables to estimate derivatives of real functions. *SIAM Review* 40(1), 110–112. [doi:10.1137/S003614459631241X](https://doi.org/10.1137/S003614459631241X)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md)
