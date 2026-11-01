# Nonlinear Systems — Assumptions

Convergence guarantees are conditional. Each family of methods relies on properties of the equation that are worth checking before relying on the answer.

## Smoothness and Simple Roots in Newton Methods

Quadratic convergence of Newton's method requires a differentiable function, a Lipschitz derivative near the root, a nonsingular Jacobian at the root, and a start close enough, as set out in [Dennis and Schnabel (1996)](#ref-DS1996a) and [Kelley (2003)](#ref-Kel2003a). A kink breaks the local model. A double root gives a singular Jacobian at the solution, and convergence then slows to linear. Far from the root, a full Newton step can overshoot or diverge. Global convergence strategies, which are line searches and trust regions, help, though they can still stop at a point that is not a root.

## Continuity in Bracketing Methods

The guarantee of a bracketing method relies on the intermediate value theorem, which requires continuity. A sign change across a pole, as in 1 / x, looks exactly like a root, and the method converges to the pole. A bracket with an even number of sign changes shows no change at the ends. When an interval contains several roots, the method returns one of them with no indication of the others. Bracketing also cannot find a double root, where the function touches zero without crossing.

## Square, Well-Conditioned Systems

A system needs as many equations as unknowns, or the Newton step is not defined. A well-posed system has an invertible Jacobian at the solution. When the Jacobian is nearly singular, a small residual does not imply a precise solution, because equations are almost redundant and a large move in the solution barely changes them. Scaling also matters: equations and unknowns with very different magnitudes make the residual, the tolerance and the conditioning hard to interpret, so rescaling to comparable magnitudes is the first remedy to try, as [Dennis and Schnabel (1996)](#ref-DS1996a) recommend.

## Tolerance and Machine Precision

**Tolerance** is absolute and applies to the residual or the bracket, so its meaning depends on the units of the equation. A function measured in large units may never reach a small tolerance because rounding error in evaluating it exceeds that value, and the solver then reaches **Max Iterations** even though it is at the best possible answer. A function that is very flat near the root reaches the tolerance with a solution that is still far off. The residual alone is never the whole picture, so examine conditioning as well.

## References

<a id="ref-DS1996a"></a>Dennis, J. E. and Schnabel, R. B. (1996). Numerical Methods for Unconstrained Optimization and Nonlinear Equations. *SIAM*. [doi:10.1137/1.9781611971200](https://doi.org/10.1137/1.9781611971200)

<a id="ref-Kel2003a"></a>Kelley, C. T. (2003). Solving Nonlinear Equations with Newton's Method. *SIAM*. [doi:10.1137/1.9780898718898](https://doi.org/10.1137/1.9780898718898)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
