# Automatic Differentiation — Interpretation

The derivatives the Automatic Differentiation panel computes describe the function near Point x0: its slope, its curvature, the direction it rises fastest and how its outputs respond to its inputs ([Nocedal and Wright (2006)](#ref-NW2006a)).

## Reading Slope and Curvature

| Sign at x0 | Meaning |
|---|---|
| f'(x0) > 0 | f is increasing: a small rise dx in x raises f by about f'(x0) dx |
| f'(x0) < 0 | f is decreasing |
| f'(x0) = 0 | x0 is a stationary point: a candidate maximum, minimum or inflection point |
| f''(x0) > 0 | f is convex at x0, bending up, as with increasing marginal cost |
| f''(x0) < 0 | f is concave at x0, bending down, as with diminishing marginal returns |

The **Derivative Summary** action states these readings for the Derivatives tab.

## Reading a Gradient and a Hessian

Each entry of the gradient is the effect of one variable on f with the others held fixed; for a production function the entries are the marginal products. The gradient points in the direction in which f rises fastest, perpendicular to the level curve through x0, as the **Function and Tangent** action draws for two variables. Where the gradient is zero, the eigenvalues of the Hessian classify the stationary point: all positive, a local minimum; all negative, a local maximum; of both signs, a saddle point; a zero eigenvalue leaves the second-order test inconclusive ([Nocedal and Wright (2006)](#ref-NW2006a)). The **Derivative Summary** action reports the norm of the gradient, the eigenvalues of the Hessian and the shape they imply.

## Reading a Jacobian

Entry J[i, j] of the Jacobian is the effect of variable j on output i; in a system of demand equations the entries off the diagonal are the effects of the price of one good on the demand for another. A square Jacobian with a nonzero determinant means that F is locally invertible near x0, by the inverse function theorem, the condition under which Newton's method for F(x) = 0 is well defined ([Nocedal and Wright (2006)](#ref-NW2006a)). The rank of the Jacobian is the number of independent directions in which the outputs can move. The **Derivative Summary** action reports the rank, the determinant of a square Jacobian and its singular values.

## Reading a Pushforward and a Pullback

The pushforward J dx is the first-order change of every output when the inputs move along the direction dx: the **Linear Approximation** action of the Pushforward/Pullback tab compares F(x0) + t J dx with F(x0 + t dx) for several values of t. The pullback transpose(J) dy is the gradient of the weighted sum dy[1] F[1] + dy[2] F[2] + ..., so entry j says how much that sum changes per unit change in variable j. With weight 1 on output i and 0 elsewhere, the pullback is the gradient of output i, which is row i of the Jacobian ([Griewank and Walther (2008)](#ref-GW2008a)).

## Reading the Cost of Forward and Reverse Mode

The **Forward vs Reverse Mode** action times a gradient of a test function as its number of inputs n grows, on ForwardDiff, Enzyme and Mooncake, and plots the times on log scales. Forward mode needs a number of passes that grows with n, so its time rises with n. Reverse mode gives the gradient in one backward pass, at a cost bounded by a small multiple of the cost of evaluating the function, so its time grows only as the function itself grows with n ([Griewank and Walther (2008)](#ref-GW2008a)).

## Reading a Taylor Polynomial

The **Taylor Polynomial** action expands f around x0 up to the power set by **Taylor Order**, with TaylorSeries.jl, which propagates truncated Taylor series through the function as automatic differentiation propagates derivatives ([Griewank and Walther (2008)](#ref-GW2008a)). The coefficient of dx^k is f^(k)(x0) / k!, so the action also lists the derivatives at x0. The polynomial approximates f near x0, and the action compares the polynomial with f at x0 plus **Plot Half-Width**, which shows how far the approximation holds.

## References

<a id="ref-GW2008a"></a>Griewank, A. and Walther, A. (2008). *Evaluating Derivatives: Principles and Techniques of Algorithmic Differentiation*, 2nd edition. SIAM. [doi:10.1137/1.9780898717761](https://doi.org/10.1137/1.9780898717761)

<a id="ref-NW2006a"></a>Nocedal, J. and Wright, S. J. (2006). *Numerical Optimization*, 2nd edition. Springer. [doi:10.1007/978-0-387-40065-5](https://doi.org/10.1007/978-0-387-40065-5)

## See Also

- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
