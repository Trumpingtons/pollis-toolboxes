# Diagnostics

The Next Steps of the Stochastic Differential Equations panel check a solver in four ways: against an exact solution, against itself as the step grows, against the other solvers on one Brownian path, and, for a linear system, against the moment equations. Each check answers a different question, and each has its own way of misleading.

## How to Read the Strong and Weak Convergence Orders

**Strong and Weak Convergence Orders**, in the **Exact Solutions** tab, solves the equation over one unit of time at five fixed steps, from 1/512 to 1/32, with `test_convergence` of DiffEqDevTools.jl. The strong error is the mean, over 1000 paths, of the distance between the numerical and the exact value at the end. The weak error is the distance between the two means, over 10000 paths. Each order is the slope of log error against log step, fitted by least squares over the five steps. A solver of strong order 1/2 should show a slope near 0.5, one of strong order 3/2 a slope near 1.5. The `expected_strong_and_weak` entry of the result gives the orders of the solver chosen, for comparison. Only the end values are kept (`save_everystep=false`), so 10000 paths at the smallest step take little memory.

## Why a Measured Order Differs from the Expected One

A measured slope can differ from the order of the solver for reasons that have nothing to do with a fault in the solver:

- Pre-asymptotic steps: the order describes the error as the step goes to zero, and at 1/32 the higher-order terms can still count.
- Monte Carlo error: the weak error at small steps can fall below the sampling error of a mean over 10000 paths, which flattens the slope at its lower end.
- Additive noise: Euler-Maruyama reaches strong order 1, not 1/2, when g does not depend on X, as with the Additive Noise equation.
- Coefficients that are not smooth, as in the Cubic equation near zero, where the derivatives that the error expansions of [Kloeden and Platen (1992)](#ref-KP1992a) need do not exist.

## How to Read Step-Size Stability

**Step-Size Stability** solves the equation on one Brownian path with an explicit solver and its drift-implicit counterpart, EM and ImplicitEM, or EulerHeun and ImplicitEulerHeun in the **Stratonovich** tab. The step starts at **Step dt** and doubles five times, and each row gives the largest state each solver reaches along the path. An explicit run whose largest state jumps by orders of magnitude, or whose `explicit_retcode` is not `Success`, has crossed its stability limit, while an implicit run that stays bounded shows that the jump comes from the step and not from the equation. When both stay bounded at every step, the equation is not stiff at those steps. When both grow, the equation itself may be unstable, or its coefficients may grow too fast for any fixed-step scheme.

## How Compare Solvers Puts Every Solver on One Brownian Path

**Compare Solvers** first runs a reference solution at a step 1000 times smaller than **Step dt**, with EM, or EulerHeun in the **Stratonovich** tab, and `save_noise=true`, which records its Brownian path. Every solver of the tab then replays that path through `NoiseWrapper`, so the differences in `error_at_end` come from the schemes, not from different draws of the noise. The reference has an error of its own, of the order of its small step, so an error at the end near that size says only that the solver is at least as good as the reference. The time in `seconds` is from a second run, after compilation. An adaptive solver chooses its own steps on the recorded path, so `steps` differs from one solver to the next. A solver that does not accept the noise of the tab reports the error in its `retcode`, with missing values in the other columns.

## How to Read the Work-Precision Diagram

**Work-Precision Diagram**, in the **Exact Solutions** tab, plots the mean error at the end, over 100 paths, against the mean number of evaluations of the drift and the diffusion, for EM, RKMil, SRIW1 and SOSRI at seven fixed steps, from 1/8 to 1/512. Both axes are logarithmic. A curve further down at the same position on the horizontal axis gives a smaller error for the same work, and a steeper curve gains more accuracy for each doubling of the work. Evaluations measure work independently of the computer, but leave out the cost of drawing the noise and of the iterated integrals that higher-order schemes approximate. As every run uses a fixed step, the diagram says nothing about the error control of the adaptive versions of these solvers ([Rackauckas and Nie (2017)](#ref-RN2017b)).

## What the Itô vs Stratonovich Chart Shows

**Itô vs Stratonovich** solves f and g of the tab three times on one Brownian path: with EM, which reads them as an Itô equation, with EulerHeun, which reads them as a Stratonovich equation, and with EM again after adding g g' / 2 to the drift, with g' computed by a central difference. The first solve keeps its Brownian path with `save_noise=true`, and the other two replay it through `NoiseWrapper`. The dashed curve should follow the Stratonovich curve, apart from the discretisation error of the two schemes; `corrected_minus_stratonovich` measures the remaining gap at the end. In the **Stiff SDEs** tab, and for the Additive Noise equation of **Exact Solutions**, g does not depend on X, so the three curves coincide up to that error.

## How to Check the Moment Equations Against the Paths

**Moment Equations**, in the **Systems of SDEs** tab, solves the mean and covariance equations with Tsit5 at tight tolerances, so their own error is negligible, and compares them with the mean and variance of u[1] over 2000 paths. The paths carry two errors: the discretisation error of the solver, which shrinks with **Step dt**, and a sampling error, which shrinks with the square root of the number of paths. Close agreement of the curves therefore confirms the equations only to the size of the sampling error, which for the mean is the standard deviation divided by the square root of 2000, about 45. A gap that stays when **Step dt** is halved points to the noise: a Q that does not describe the noise of the paths, or a drift that is not the A u of the equations.

## References

<a id="ref-KP1992a"></a>Kloeden, P. E. and Platen, E. (1992). *Numerical Solution of Stochastic Differential Equations*. Springer. [doi:10.1007/978-3-662-12616-5](https://doi.org/10.1007/978-3-662-12616-5)

<a id="ref-RN2017b"></a>Rackauckas, C. and Nie, Q. (2017). Adaptive methods for stochastic differential equations via natural embeddings and rejection sampling with memory. *Discrete and Continuous Dynamical Systems - B* 22(7), 2731–2761. [doi:10.3934/dcdsb.2017133](https://doi.org/10.3934/dcdsb.2017133)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
