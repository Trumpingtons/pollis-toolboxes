# Nonlinear Systems — Diagnostics

Diagnostics answer three questions: did the solver stop for the right reason, is the solution well determined, and is it the only one.

## Reading the Solution Check

**Solution Check** reports whether the solver converged, the size of the residual and how well determined the solution is. A slope or Jacobian near singular means a small change in the equations moves the solution a lot. A converged result with a tiny residual and a badly conditioned Jacobian is therefore still an unreliable answer. A residual that is not small means the result is not a solution at all, whatever the return code implies. Check for a pole, too: the residual is large on either side of one.

## Reading the Convergence Plot

**Convergence Plot** shows the residual at each iteration on a log scale. A straight line means linear convergence, and a curve that bends ever more steeply downward means quadratic convergence. A residual that first wanders and later drops is typical of a poor start, with the method finding the region of fast convergence only at the end. A plateau above the tolerance suggests rounding limits, or a singular Jacobian. Sharp oscillation calls for a globalised method such as **Trust Region** in place of **Newton-Raphson**.

## Reading Starting-Point Sensitivity

**Starting-Point Sensitivity** solves again from many starting points, or from many sub-brackets in the **Bracketing** tab, and lists the distinct solutions found and how often each was reached. More than one means that the answer depends on where you start. The method is a scan rather than a proof, so a single answer does not guarantee uniqueness. Make the window of **Plot From** and **Plot To** large enough to cover plausible solutions. Which solution makes sense depends on the application, for instance a positive price or a stable steady state.

## Reading the Convergence Order

**Convergence Order** estimates the order from successive residuals: about 1 is linear, as for bisection, about 1.6 is superlinear, as for secant and [Broyden (1965)](#ref-Bro1965a), and about 2 is quadratic, as for Newton near a simple root. An order near 1 under **Newton-Raphson** suggests a repeated root or an inaccurate Jacobian. Only the last few iterations reflect the local rate, so short runs give rough numbers. For bracketing methods, only the improving evaluations are used, so the estimate is rough as well. Treat the result as an indication rather than a precise measurement.

## References

<a id="ref-Bro1965a"></a>Broyden, C. G. (1965). A Class of Methods for Solving Nonlinear Simultaneous Equations. *Mathematics of Computation* 19(92), 577–593. [doi:10.1090/S0025-5718-1965-0198670-6](https://doi.org/10.1090/S0025-5718-1965-0198670-6)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
