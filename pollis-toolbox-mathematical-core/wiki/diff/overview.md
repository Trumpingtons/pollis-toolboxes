# Numerical Differentiation — Overview

Numerical differentiation estimates a derivative from values of the function at points near x0. Its accuracy is limited by two errors, truncation and rounding, whose balance sets the best step ([Nocedal and Wright (2006)](#ref-NW2006a)). The Numerical Differentiation panel computes the estimates with FiniteDifferences.jl and simple Julia formulas, and compares each with the exact derivative.

## Forward, Backward and Central Differences

The derivative is the limit of the difference quotient as the step h goes to zero, so a small h gives an estimate. The forward difference (f(x0 + h) - f(x0)) / h and the backward difference (f(x0) - f(x0 - h)) / h have a truncation error proportional to h. The central difference (f(x0 + h) - f(x0 - h)) / (2h) has a truncation error proportional to h^2, since the terms of order h of the two Taylor expansions cancel ([Nocedal and Wright (2006)](#ref-NW2006a)). For the same step, the central difference is therefore more accurate, at the price of one more evaluation when f(x0) is already known.

## Stencils of Several Points and Higher Derivatives

A stencil estimates a derivative as a weighted sum of values of f at x0 plus multiples of the step, divided by the step raised to the order of the derivative. The weights are chosen so that the Taylor expansions of those values cancel every term below the derivative wanted and as many terms above it as the points allow; [Fornberg (1988)](#ref-For1988a) gives an algorithm for the weights on any grid of points and for any order. More points give a higher order of accuracy, and a derivative of order q needs more than q points. FiniteDifferences.jl builds central stencils with `central_fdm(p, q)`, p points for the derivative of order q, and one-sided ones with `forward_fdm` and `backward_fdm`.

## Truncation Error, Rounding Error and the Best Step

A difference quotient subtracts two nearly equal values of f, and floating-point subtraction of nearly equal numbers loses relative accuracy: the rounding errors in the values, of the size of machine precision eps, about 2.2e-16, are divided by h ([Higham (2002)](#ref-Hig2002b)). The total error is about C1 h^p + C2 eps / h, truncation plus rounding, which is smallest at a step that balances the two. For the forward difference the best step is of the order of sqrt(eps), about 1e-8, and for the central difference of the order of eps^(1/3), about 6e-6, for a function and its derivatives of moderate size ([Nocedal and Wright (2006)](#ref-NW2006a)).

## The Complex Step

For a function that is analytic and real on the real line, derivatives can be estimated with complex arithmetic ([Lyness and Moler (1967)](#ref-LM1967a)). [Squire and Trapp (1998)](#ref-ST1998a) gave the first-derivative formula f'(x0) ≈ Im f(x0 + i h) / h. The formula subtracts nothing, so it has no cancellation, and its truncation error is of order h^2: the step can be made tiny, such as 1e-20, and the estimate is then accurate to machine precision ([Martins, Sturdza and Alonso (2003)](#ref-MSA2003a)). The function's code must accept complex numbers.

## Richardson Extrapolation

Richardson extrapolation combines estimates made with several steps to cancel the leading term of their truncation error ([Richardson (1911)](#ref-Ric1911a)). If an estimate D(h) has an error proportional to h^2, then (4 D(h/2) - D(h)) / 3 removes that term, and repeating the step removes further terms. FiniteDifferences.jl's `extrapolate_fdm` applies the idea as polynomial extrapolation of the estimate as the step shrinks, and returns the extrapolated estimate with an estimate of its error.

## How the Finite Differences Tab Works

The **Finite Differences** tab takes **Function f(x)**, **Point x0** and **Step h**, and computes the forward, backward and central differences at that step. It also builds a central stencil of **Stencil Points** for the first derivative, whose step FiniteDifferences.jl chooses with `estimate_step`, which also returns an estimate of the error. Symbolics.jl differentiates the formula of f to give the exact derivative, and the output lists each estimate with its error against it.

## How the Higher Derivatives Tab Works

The **Higher Derivatives** tab takes **Function f(x)**, **Point x0**, **Derivative Order** (2, 3 or 4) and **Stencil Points**, and estimates the derivative of that order with a central stencil, `central_fdm(p, q)`. The output gives the estimate, the exact derivative from Symbolics.jl, the error, the step chosen with its error estimate, and the grid and weights of the stencil, which the **Stencil Weights** action draws. A stencil needs more points than the order of the derivative.

## How the Jacobians, Hessians Tab Works

The **Jacobians, Hessians** tab takes **Function f(x)**, with one value, **Functions F(x)**, with one value per output, and **Point x0**. It estimates the gradient of f with `grad`, the Hessian of f as the Jacobian of that gradient, and the Jacobian of F with `jacobian`, all with a central stencil of 5 points. A counter records how many times f was evaluated for the gradient and for the Hessian. A gradient by differences needs evaluations in every variable, and a Hessian in every pair of variables ([Nocedal and Wright (2006)](#ref-NW2006a)). The output also gives the largest error of each against the exact derivatives and how far the estimated Hessian is from symmetric.

## How the Complex Step and Step Size and Error Tabs Work

The **Complex Step** tab evaluates f at x0 + i h, with **Step h** as small as 1e-20, takes the imaginary part divided by h, and sets the result beside a central difference with a usual step and the exact derivative. The **Step Size and Error** tab computes the forward and central differences at steps from 0.1 down to 1e-14, lists their errors against the exact derivative, reports the step at which each error is smallest, and gives the Richardson extrapolation of `extrapolate_fdm` with its error and its error estimate.

## References

<a id="ref-For1988a"></a>Fornberg, B. (1988). Generation of finite difference formulas on arbitrarily spaced grids. *Mathematics of Computation* 51(184), 699–706. [doi:10.1090/S0025-5718-1988-0935077-0](https://doi.org/10.1090/S0025-5718-1988-0935077-0)

<a id="ref-Hig2002b"></a>Higham, N. J. (2002). *Accuracy and Stability of Numerical Algorithms*, 2nd edition. SIAM. [doi:10.1137/1.9780898718027](https://doi.org/10.1137/1.9780898718027)

<a id="ref-LM1967a"></a>Lyness, J. N. and Moler, C. B. (1967). Numerical differentiation of analytic functions. *SIAM Journal on Numerical Analysis* 4(2), 202–210. [doi:10.1137/0704019](https://doi.org/10.1137/0704019)

<a id="ref-MSA2003a"></a>Martins, J. R. R. A., Sturdza, P. and Alonso, J. J. (2003). The complex-step derivative approximation. *ACM Transactions on Mathematical Software* 29(3), 245–262. [doi:10.1145/838250.838251](https://doi.org/10.1145/838250.838251)

<a id="ref-NW2006a"></a>Nocedal, J. and Wright, S. J. (2006). *Numerical Optimization*, 2nd edition. Springer. [doi:10.1007/978-0-387-40065-5](https://doi.org/10.1007/978-0-387-40065-5)

<a id="ref-Ric1911a"></a>Richardson, L. F. (1911). The approximate arithmetical solution by finite differences of physical problems involving differential equations, with an application to the stresses in a masonry dam. *Philosophical Transactions of the Royal Society of London, Series A* 210, 307–357. [doi:10.1098/rsta.1911.0009](https://doi.org/10.1098/rsta.1911.0009)

<a id="ref-ST1998a"></a>Squire, W. and Trapp, G. (1998). Using complex variables to estimate derivatives of real functions. *SIAM Review* 40(1), 110–112. [doi:10.1137/S003614459631241X](https://doi.org/10.1137/S003614459631241X)

## See Also

- [Factsheet](factsheet.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
