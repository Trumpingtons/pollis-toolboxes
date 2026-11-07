# Interpretation

The results of the Stochastic Differential Equations panel are named tuples and charts, and their entries mean different things in each tab: a symbolic drift, the gap between two paths, an error against an exact solution, a mean and a covariance. Each section below takes one of them.

## How to Read the Results of the Itô Calculus Tab

The **Itô Calculus** tab returns three expressions in X and six numbers. `ito_drift_of_F` and `ito_diffusion_of_F` are the coefficients of the equation that F(X) follows by Itô's lemma, and `chain_rule_drift` is the drift that the ordinary chain rule would give, F' f. Their difference is F'' g^2 / 2 ([Itô (1944)](#ref-Ito1944a), [Øksendal (2003)](#ref-Oks2003a)). `gap_Y` is the difference at the end between Y, integrated with the coefficients of Itô's lemma, and F(X) computed from X: a small number, which shrinks with **Step dt**, confirms the lemma for the f, g and F typed in. `gap_Z` is the same difference for Z, integrated with the chain rule. Its size is the integral of F'' g^2 / 2 along the path, and it does not shrink with the step. With F = log and X a geometric Brownian motion, Z drifts above log X at the constant rate b^2 / 2.

## How to Read the Difference Between Itô and Stratonovich

A Stratonovich equation with drift f has the same solution as the Itô equation with drift f + g g' / 2 and the same g. The **Stratonovich** tab returns that drift as `ito_drift_equivalent`, and `gap`, the difference at the end between the Itô form solved on the same Brownian path and the Stratonovich solution; `gap` should be of the size of the discretisation error. For g = b X the extra drift is b^2 X / 2, so the mean of the Stratonovich solution grows at the rate a + b^2 / 2 where the Itô mean grows at a. Neither result is the more accurate one: they solve two models. For a g that does not depend on X, the term vanishes and the two readings agree.

## What Strong and Weak Errors Measure

The strong error measures how far the numerical path is from the exact path driven by the same Brownian motion, on average over paths. The weak error measures how far the expectation of a quantity, here the value at the end, is from its exact expectation, and says nothing about single paths ([Kloeden and Platen (1992)](#ref-KP1992a)). A scheme can have a small weak error and a large strong error, because errors of opposite signs on different paths cancel in the mean. The strong error matters when single paths are used: a filter, a path-dependent quantity, or a comparison on one recorded Brownian path, as in **Compare Solvers**. The weak error matters when only expectations are used: moments, probabilities, prices computed as means. Weak order 1 for EM means that halving the step halves the bias of a mean, while the sampling error falls only with more paths.

## How to Read Moments over Time

**Moments over Time** draws the mean of the first state over 1000 paths, with a ribbon one standard deviation wide on each side. The ribbon shows the spread of the paths at each time, not the uncertainty of the mean, which is smaller by the square root of 1000. A ribbon that widens and then stops widening points to a stationary distribution; one that keeps widening points to a process that spreads without bound, as Brownian motion does. In the **Exact Solutions** tab, the dashed curve is the mean of the exact solutions on the same Brownian paths, so the gap between the two curves estimates the weak error of the solver at **Step dt**, with far less sampling error than a comparison with the exact mean of the distribution would have.

## How to Read the Moment Equations of a Linear System

For du = A u dt + noise, the mean m(t) solves m' = A m, and the covariance P(t) solves P' = A P + P A^T + Q ([Särkkä and Solin (2019)](#ref-SS2019a)). The mean therefore behaves as the deterministic system would, and the noise acts only on the covariance. When every eigenvalue of A has a negative real part, P(t) settles at the solution of A P + P A^T + Q = 0, the stationary covariance. Q, the covariance rate of the noise in the result of the **Systems of SDEs** tab, depends on the **Noise Structure**: with General (Non-Diagonal), off-diagonal entries of Q come from the noise matrix S sharing Brownian motions across states; with Correlated, from **Correlation rho**. Either way, the noise alone correlates states that the drift A would keep apart.

## How to Read the Results of the Stiff SDEs Tab

The **Stiff SDEs** tab returns the value at the end, the number of steps, the return code, and `explicit_step_limit`, 2 / lambda, beside `step`, the **Step dt** used. For a step below the limit, every solver of the menu follows sin(t), with fluctuations that grow with **Noise sigma** and shrink as **Rate lambda** grows. For a step above it, EM's `retcode` turns to a failure, or its values grow without bound, while SKenCarp and ImplicitEM stay close to sin(t). SOSRA is explicit, but its stability region is stretched along the negative real axis ([Rackauckas and Nie (2020)](#ref-RN2020a)), so it holds a longer step than EM before it fails. The adaptive solvers report the steps they chose, and a count far above the time span divided by **Step dt** is a sign of stiffness.

## References

<a id="ref-Ito1944a"></a>Itô, K. (1944). Stochastic integral. *Proceedings of the Japan Academy, Series A, Mathematical Sciences* 20(8), 519–524. [doi:10.3792/pia/1195572786](https://doi.org/10.3792/pia/1195572786)

<a id="ref-KP1992a"></a>Kloeden, P. E. and Platen, E. (1992). *Numerical Solution of Stochastic Differential Equations*. Springer. [doi:10.1007/978-3-662-12616-5](https://doi.org/10.1007/978-3-662-12616-5)

<a id="ref-Oks2003a"></a>Øksendal, B. (2003). *Stochastic Differential Equations: An Introduction with Applications*, 6th edition. Springer. [doi:10.1007/978-3-642-14394-6](https://doi.org/10.1007/978-3-642-14394-6)

<a id="ref-RN2020a"></a>Rackauckas, C. and Nie, Q. (2020). Stability-optimized high order methods and stiffness detection for pathwise stiff stochastic differential equations. *2020 IEEE High Performance Extreme Computing Conference (HPEC)*, 1–8. [doi:10.1109/hpec43674.2020.9286178](https://doi.org/10.1109/hpec43674.2020.9286178)

<a id="ref-SS2019a"></a>Särkkä, S. and Solin, A. (2019). *Applied Stochastic Differential Equations*. Cambridge University Press. [doi:10.1017/9781108186735](https://doi.org/10.1017/9781108186735)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
