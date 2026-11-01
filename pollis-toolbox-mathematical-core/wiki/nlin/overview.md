# Nonlinear Systems — Overview

Three tabs share one question and differ in what must be known beforehand: a guess, an interval, or a guess for several unknowns.

## The Scalar Equation Tab

The **Scalar Equation** tab solves **Equation f(x)** from **Starting Point**. The expression goes on the left-hand side, with everything moved across, so that an equation written with two sides becomes a difference equal to zero. **Algorithm** offers **Newton-Raphson**, **Trust Region**, **Levenberg-Marquardt** and **Broyden**, and derivatives come from automatic differentiation. **Tolerance** sets the absolute stopping level, and **Max Iterations** sets the step limit. **Plot From** and **Plot To** set the window for plots and for the search over starting points.

## The Bracketing Tab

The **Bracketing** tab takes **Equation f(x)**, a **Lower Bound** and an **Upper Bound**, between which f must change sign. For a continuous function, a sign change guarantees a root in the interval. **Method** offers **ITP**, **Brent**, **Ridder**, **False Position** and **Bisection**. ITP, the method of [Oliveira and Takahashi (2020)](#ref-OT2020a), is the default since it has the worst-case guarantee of bisection and typically converges much faster. No derivative is needed. The panel warns when the two ends have the same sign, since the interval may then contain no root at all.

## The System of Equations Tab

The **System of Equations** tab takes **Equations f(u) = 0**, a vector with one Julia expression per equation in `u[1]`, `u[2]` and so on, along with a **Starting Point** holding one value per unknown. **Jacobian** chooses **Automatic**, which uses automatic differentiation at each step, or **Symbolic**, which derives formulas once with Symbolics.jl and compiles them. Each Newton step solves a linear system with the Jacobian. Two unknowns can be drawn as zero curves, whose crossings are the solutions.

## What the Solver Returns

Each solve returns the solution `sol.u`, the residual `sol.resid`, the return code `sol.retcode`, and evaluation counts in `sol.stats`. A return code of `Success` means that the stopping rule was met at the tolerance, while `MaxIters` means the limit was reached first. The residual is what the equation evaluates to at the solution, which is the direct measure of quality. Bracketing methods also return the final interval as `sol.left` and `sol.right`, whose width is a direct bound on how far the root can be from the answer.

## Common Workflow for Finding a Root

1. Choose the tab, then enter the equation and a starting point or bracket.
2. Look at the function with **Solution Plot**.
3. Confirm the solution with **Solution Check** and **Solution Summary**.
4. Run **Starting-Point Sensitivity** to look for other solutions.
5. Compare methods with **Compare Algorithms**, if speed or reliability matters.
6. Use **Comparative Statics** to see how the answer responds to changes.

## References

<a id="ref-OT2020a"></a>Oliveira, I. F. D. and Takahashi, R. H. C. (2020). An Enhancement of the Bisection Method Average Performance Preserving Minmax Optimality. *ACM Transactions on Mathematical Software* 47(1), 1–24. [doi:10.1145/3423597](https://doi.org/10.1145/3423597)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
