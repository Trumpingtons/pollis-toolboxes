# Nonlinear Systems — Interpretation

Reading the results means asking what was solved, how much it cost, and how the answer depends on the problem's parameters.

## Reading the Solution Summary

**Solution Summary** reports whether the solver converged, the solution, how close the equations are to zero there, and what it cost. Function evaluations are the fairest measure of cost, because a method with fewer iterations may evaluate more per step, particularly with a Jacobian. The final residual should be read in the units of the equation: an error of a small amount in a price is negligible, while the same number in a small rate may not be. Report the residual alongside the solution so that readers can judge precision.

## Reading Comparative Statics

**Comparative Statics** shows how the solution moves when the right-hand side of each equation rises from 0, using the inverse Jacobian at the solution. The result comes from the implicit function theorem, which is familiar from the analysis of equilibrium models. An entry of the inverse Jacobian says how much unknown j changes per unit of change in equation i. Large entries reflect a poorly determined solution. The calculation requires a nonsingular Jacobian, and it is a local answer, valid for small changes in the equations.

## Reading the Right-Hand-Side Shift

**Right-Hand-Side Shift** solves the equation again with its right-hand side raised or lowered, for the first equation in a system, and compares the exact new solution with the linear prediction. Close agreement means the linear answer from **Comparative Statics** is safe for changes of that size. A wide gap shows important curvature, and an exact re-solve is then needed for any policy-sized change. Very different answers for the upward and downward changes signal asymmetry. If a solve fails at a shifted value, the solution may have ceased to exist there.

## Reading Algorithm and Tolerance Comparisons

**Compare Algorithms** runs each method on the same problem from the same start, reporting the return code, solution, function evaluations and time from a second run after compilation. **Tolerance Sweep** tightens the tolerance from 1e-4 to 1e-14 and reports the evaluations needed and the residual reached. Fast methods pay little for extra digits, which is the practical meaning of quadratic convergence. A residual that stops improving at some tolerance marks the limit of accuracy given rounding error. Comparisons from one start can mislead, so vary the start for a fair picture.

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
