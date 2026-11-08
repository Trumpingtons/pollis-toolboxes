# Numerical Differentiation — Interpretation

An estimate of a derivative is read with its error: how many of its digits are right, at what step, and at what cost in evaluations of the function ([Nocedal and Wright (2006)](#ref-NW2006a)).

## Reading Correct Digits

The **Accuracy Summary** action turns the error of each estimate into the number of significant digits that agree with the exact derivative, minus the base-10 logarithm of the relative error, capped at about 16, the precision of double-precision numbers. Seven correct digits means the relative error is about 1e-7. For the Finite Differences and Complex Step tabs the action also names the most accurate estimate of the tab, and for every tab it gives the step used. For the Jacobians, Hessians tab it counts the digits of the worst entry of the gradient, the Hessian and the Jacobian.

## Reading the Step Beside the Usual Rules

The **Accuracy Summary** action gives, beside the step used, the usual best steps sqrt(eps) max(1, |x0|) for the forward difference and eps^(1/3) max(1, |x0|) for the central difference, where eps is machine precision. The factor max(1, |x0|) keeps the step in proportion to x0 when x0 is large ([Nocedal and Wright (2006)](#ref-NW2006a)). A step well below its rule loses digits to rounding; a step well above it loses digits to truncation. The Step Size and Error tab reports the steps that were actually best for the function, which may differ from the rules when the derivatives of f are very large or very small.

## Reading the Weights of a Stencil

The **Stencil Weights** action draws the weight of each point of the stencil at its position, in steps from x0. The estimate is the sum of the weights times the values of f at those points, divided by the step raised to the order of the derivative ([Fornberg (1988)](#ref-For1988a)). For a first derivative the weights of a central stencil are antisymmetric around x0, and the weight at x0 is zero; for a second derivative they are symmetric, with a large negative weight at x0. The weights of every derivative sum to zero, since the derivative of a constant is zero. Large weights of alternating sign, as in stencils of many points, amplify the rounding errors in the values of f.

## Reading the Cost in Evaluations

A derivative by differences costs evaluations of f, and the cost grows with the number of variables: a gradient of n variables needs evaluations in each of the n directions, and a Hessian needs them for each pair of variables ([Nocedal and Wright (2006)](#ref-NW2006a)). The Jacobians, Hessians tab reports the evaluations each one took, and the **Compare Methods** action reports them for each method of the first derivative, including the evaluations FiniteDifferences.jl spends choosing a step. The complex step takes a single evaluation, in complex arithmetic.

## Reading a Linear Approximation

The **Linear Approximation** action predicts f after a change dx in x as f(x0) + f'(x0) dx, with the estimated derivative, and sets the prediction beside the exact value. For the Jacobians, Hessians tab it adds the second-order term with the estimated Hessian, and predicts F with the estimated Jacobian. The prediction is close for small changes and drifts as the change grows; an estimate of the derivative with few correct digits shows its error already for small changes.

## References

<a id="ref-For1988a"></a>Fornberg, B. (1988). Generation of finite difference formulas on arbitrarily spaced grids. *Mathematics of Computation* 51(184), 699–706. [doi:10.1090/S0025-5718-1988-0935077-0](https://doi.org/10.1090/S0025-5718-1988-0935077-0)

<a id="ref-NW2006a"></a>Nocedal, J. and Wright, S. J. (2006). *Numerical Optimization*, 2nd edition. Springer. [doi:10.1007/978-0-387-40065-5](https://doi.org/10.1007/978-0-387-40065-5)

## See Also

- [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
