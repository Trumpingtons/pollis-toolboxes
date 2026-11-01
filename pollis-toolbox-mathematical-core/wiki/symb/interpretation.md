# Symbolic Math — Interpretation

Symbolic output serves understanding and reuse, so reading it often means choosing among forms and turning it into something else.

## Reading Forms of an Expression

**Compare Forms** shows the original, simplified and expanded forms side by side with their lengths. The shortest is often the easiest to read, and the expanded one the easiest to integrate. A factored form shows the roots, and a completed square shows the extremum. Equal expressions may look quite different, so a mismatch with a textbook answer is not necessarily an error. An antiderivative can differ from a printed one by a constant, or by an identity, and both are right if **Symbolic Check** confirms them.

## Reading Critical Points

**Critical Points** solves f' = 0 and classifies each real solution by the sign of f'': a local minimum when positive, a local maximum when negative, and an inflection candidate when zero. A zero second derivative only leaves the question open, since higher derivatives decide. Local results do not give a global maximum on their own: compare values at critical points and at the ends of the interval. For several variables, the Hessian from the **Differentiation** tab plays the part of f'', and its definiteness is the condition described in [Simon and Blume (1994)](#ref-SB1994a).

## Reading Taylor Approximations

**Taylor Approximations** reports Taylor polynomials of order 1 to 6 around **Point** and their largest error over the interval, which shows how quickly the approximation improves. First order is the tangent, and second order adds curvature, which is the basis of many economic approximations. An error that shrinks steadily means that the interval lies within the region where the series works well. An error that grows with the order signals a point outside the radius of convergence. Narrowing the interval is often more effective than raising the order.

## Reusing a Result

**LaTeX Output** gives the expression and the result as LaTeX, ready for a paper, slides or a notebook, through Latexify.jl. **Compiled Function** turns the expression into ordinary Julia code with `build_function`, which is fast and no longer needs Symbolics. A symbolic gradient compiled this way can be passed to an optimiser or a root finder. **Value Table** evaluates the expression and the result at evenly spaced points. These three actions form the bridge from an exact formula to numerical work, which is often the reason for deriving it.

## References

<a id="ref-SB1994a"></a>Simon, C. P. and Blume, L. (1994). Mathematics for Economists. *W. W. Norton*.

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
