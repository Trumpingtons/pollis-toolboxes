# Automatic Differentiation — Diagnostics

The derivatives of automatic differentiation are exact up to floating-point rounding ([Griewank and Walther (2008)](#ref-GW2008a)), so a check against an exact formula shows whether a backend has differentiated the function as intended.

## Checking a Backend Against the Exact Derivative

The **Check Against Exact** action computes the derivative of the current tab three times: with the chosen backend, with Symbolics, which differentiates the formula, and with FiniteDiff, which takes difference quotients. The output gives the largest absolute error of the chosen backend and of FiniteDiff against Symbolics. An automatic differentiation backend agrees with Symbolics up to rounding, with relative differences of about 1e-15. FiniteDiff agrees to about half of the 16 digits of double precision, or somewhat more, depending on its step ([Nocedal and Wright (2006)](#ref-NW2006a)). For the Derivatives and the Gradients and Hessians tabs, the action also sets the second derivative or the Hessian beside the exact one.

## Comparing Every Backend on the Same Function

The **Compare Backends** action runs the derivative of the current tab on ForwardDiff, Enzyme, Mooncake, FiniteDiff and Symbolics, one row each. A row gives the result, the largest error against Symbolics and the time of a second call, after compilation. A backend that is not installed, or that cannot differentiate the function, shows its error message in place of a result, so the action also shows which backends accept the function's code.

## Warning Signs of a Wrong Derivative

| Sign in the output | Likely cause |
|---|---|
| `NaN` or `Inf` in a gradient | Point x0 on the boundary of the domain, such as `x^0.3` at 0 |
| The chosen backend and Symbolics disagree beyond rounding | A kink or a branch at or near x0 |
| A `MethodError` that names `Dual` | ForwardDiff met code that requires `Float64` |
| An error from Enzyme or Mooncake on the first call | Code the backend does not support: **Compare Backends** shows which backends accept it |
| A `DimensionMismatch` in the Pushforward/Pullback tab | **Direction dx** needs one value per variable and **Weights dy** one value per output |

## References

<a id="ref-GW2008a"></a>Griewank, A. and Walther, A. (2008). *Evaluating Derivatives: Principles and Techniques of Algorithmic Differentiation*, 2nd edition. SIAM. [doi:10.1137/1.9780898717761](https://doi.org/10.1137/1.9780898717761)

<a id="ref-NW2006a"></a>Nocedal, J. and Wright, S. J. (2006). *Numerical Optimization*, 2nd edition. Springer. [doi:10.1007/978-0-387-40065-5](https://doi.org/10.1007/978-0-387-40065-5)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
