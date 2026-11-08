# Numerical Differentiation — Assumptions

A difference quotient approaches the derivative only when the function is smooth near Point x0 and its values are computed accurately ([Nocedal and Wright (2006)](#ref-NW2006a)).

## Smoothness Near the Point

The truncation errors of difference quotients come from Taylor expansions of f around x0, so they hold when f has enough continuous derivatives on the interval the stencil spans: two for the forward difference, three for the central difference, and more for stencils of more points and for higher derivatives ([Nocedal and Wright (2006)](#ref-NW2006a)). At a kink, such as `abs(x)` at 0, a central difference returns the average of the two one-sided slopes. Every point of the stencil must lie inside the domain of f: near the edge of the domain, as for `log(x)` close to 0, the `max_range` keyword of `central_fdm` limits how far from x0 FiniteDifferences.jl evaluates f.

## Values Computed to Full Precision

The best step and the accuracy it gives assume that f is computed to about machine precision. A difference quotient divides the error in the values of f by the step ([Higham (2002)](#ref-Hig2002b)), so a function whose values carry a larger error, such as the result of a simulation or of a solver with a loose tolerance, needs a larger step and gives fewer correct digits. FiniteDifferences.jl takes the size of that error into account through the `factor` keyword of `central_fdm`, the level of noise in the values relative to machine precision.

## What the Complex Step Needs

The complex step evaluates f at x0 + i h, so the function must be analytic near x0 and real for real arguments, and its code must accept complex numbers ([Squire and Trapp (1998)](#ref-ST1998a)). Operations that are defined for real numbers in a way that does not extend analytically, such as `abs`, comparisons, `max` and `min`, need definitions that act on the real part for the complex step to give the derivative ([Martins, Sturdza and Alonso (2003)](#ref-MSA2003a)). The **Complex Step** tab, and the complex-step lines of **Step-Size Error** and **Compare Methods**, report the error, or `NaN`, when f does not accept a complex argument.

## What the Exact Reference Needs

Each tab computes the exact derivative with Symbolics.jl, which traces f with a symbolic variable and differentiates the resulting formula. The function must therefore be built from operations Symbolics.jl knows, without a loop or an `if` statement whose course depends on the value of x. For the Jacobians, Hessians tab the same holds for **Function f(x)** and **Functions F(x)**, which DifferentiationInterface.jl differentiates with `AutoSymbolics()`.

## References

<a id="ref-Hig2002b"></a>Higham, N. J. (2002). *Accuracy and Stability of Numerical Algorithms*, 2nd edition. SIAM. [doi:10.1137/1.9780898718027](https://doi.org/10.1137/1.9780898718027)

<a id="ref-MSA2003a"></a>Martins, J. R. R. A., Sturdza, P. and Alonso, J. J. (2003). The complex-step derivative approximation. *ACM Transactions on Mathematical Software* 29(3), 245–262. [doi:10.1145/838250.838251](https://doi.org/10.1145/838250.838251)

<a id="ref-NW2006a"></a>Nocedal, J. and Wright, S. J. (2006). *Numerical Optimization*, 2nd edition. Springer. [doi:10.1007/978-0-387-40065-5](https://doi.org/10.1007/978-0-387-40065-5)

<a id="ref-ST1998a"></a>Squire, W. and Trapp, G. (1998). Using complex variables to estimate derivatives of real functions. *SIAM Review* 40(1), 110–112. [doi:10.1137/S003614459631241X](https://doi.org/10.1137/S003614459631241X)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
