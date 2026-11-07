# Assumptions

Each tab of the Stochastic Differential Equations panel rests on conditions that the code does not check: that the equation has one solution, that the calculus fits how the noise arises, that the solver accepts the noise structure, and that the step is small enough for an explicit scheme to stay stable.

## When a Stochastic Differential Equation Has a Unique Solution

The standard theorem asks two things of the drift f and the diffusion g ([Øksendal (2003)](#ref-Oks2003a)). First, a Lipschitz condition: |f(x) - f(y)| + |g(x) - g(y)| stays below a constant times |x - y|. Second, linear growth: |f(x)| + |g(x)| stays below a constant times 1 + |x|. Under both, and an initial value with a finite second moment, the equation has a unique solution that does not explode in finite time. The conditions are sufficient, not necessary. The Cubic equation of the **Exact Solutions** tab has coefficients X^(1/3) / 3 and X^(2/3), which are not Lipschitz at zero, and still has the solution (X0^(1/3) + W(t) / 3)^3. In the **Itô Calculus** and **Stratonovich** tabs, any expression can be typed for f and g, and nothing in the panel tests these conditions on them.

## What Euler-Maruyama Assumes About the Growth of the Coefficients

The convergence of Euler-Maruyama is proved under the Lipschitz and linear growth conditions. [Hutzenthaler, Jentzen and Kloeden (2011)](#ref-HJK2011a) showed that the condition is more than a technicality: with a drift that grows faster than linearly, such as -X^3, the moments of the Euler-Maruyama approximation diverge as the step goes to zero, although the moments of the exact solution stay finite. The divergence comes from rare paths that a large Brownian increment throws far out, where the explicit step overshoots more at each step. A run of a few paths can look fine, so strong and weak errors measured on such an equation need many paths or a drift-implicit solver.

## What the Choice of Itô or Stratonovich Assumes

When g depends on X, the Itô and the Stratonovich readings of dX = f dt + g dW are two different models, and the mathematics alone cannot say which one describes a system ([van Kampen (1981)](#ref-Kam1981a)). The choice is part of the model and rests on how the noise arises: as a sequence of shocks that each act before the next is known, or as the idealisation of a fast but smooth signal. A model taken in the wrong reading has its drift shifted by g g' / 2, where g' is the derivative of g in X. No check in the **Stratonovich** tab can reveal that shift, since each solution is a correct solution of its own equation.

## Which Noise Structures the Solvers of the Panel Accept

| Noise structure | What it means | Solvers of the panel that accept it |
|---|---|---|
| Scalar or diagonal | Each state has its own Brownian motion, with a diffusion that may depend on the state | All of them |
| Additive | The diffusion does not depend on the state | All of them while the noise is also diagonal; SKenCarp and SOSRA, written for additive noise, also with a noise matrix |
| General (non-diagonal) | A noise matrix mixes several Brownian motions in each state | EM, LambaEM, ImplicitEM, EulerHeun, LambaEulerHeun |
| Correlated | Diagonal noise whose Brownian motions are correlated | The diagonal solvers, through `CorrelatedWienerProcess` |

The **Itô Calculus** tab has general noise, a noise matrix of 3 rows and 1 column, so its **Solver** menu holds EM and LambaEM only. In the **Systems of SDEs** tab, SRIW1 leaves the menu when **Noise Structure** is General (Non-Diagonal). The strong order 1 of RKMil assumes diagonal noise; with general noise, a Milstein scheme needs the iterated integrals of pairs of Brownian motions ([Kloeden and Platen (1992)](#ref-KP1992a)).

## What an Explicit Step Assumes About Stability

An explicit scheme is stable only below a step size that the equation sets. For the linear test equation dX = lambda X dt + mu X dW, [Higham (2001)](#ref-Hig2001a) gives the condition under which Euler-Maruyama keeps the mean square of X going to zero: |1 + h lambda|^2 + h |mu|^2 < 1, for a step h. With a large negative lambda, the condition holds only for a small h, even when the solution itself settles at once. [Higham (2000)](#ref-Hig2000a) shows that the stochastic theta method, which treats the drift implicitly with weight theta, keeps the stability of the test equation for every step once theta is large enough. ImplicitEM uses theta = 1 by default. The **Stiff SDEs** tab and **Step-Size Stability** rely on this difference.

## What the Moment Equations Assume

**Moment Equations** solves m' = A m for the mean and P' = A P + P A^T + Q for the covariance, as ordinary differential equations. These closed equations hold because the drift A u is linear and the noise does not depend on u ([Särkkä and Solin (2019)](#ref-SS2019a)). With a nonlinear drift, the equation for the mean involves the mean of f(u), which is not f of the mean, and the moments no longer close. With a noise that depends on u, Q itself becomes a moment of the solution. The comparison with 2000 paths in the **Systems of SDEs** tab also assumes that the paths come from the same noise, so that Q = B Gam B^T describes them: B is the noise matrix and Gam the correlation of the Brownian motions.

## References

<a id="ref-Hig2000a"></a>Higham, D. J. (2000). Mean-square and asymptotic stability of the stochastic theta method. *SIAM Journal on Numerical Analysis* 38(3), 753–769. [doi:10.1137/S003614299834736X](https://doi.org/10.1137/S003614299834736X)

<a id="ref-Hig2001a"></a>Higham, D. J. (2001). An algorithmic introduction to numerical simulation of stochastic differential equations. *SIAM Review* 43(3), 525–546. [doi:10.1137/S0036144500378302](https://doi.org/10.1137/S0036144500378302)

<a id="ref-HJK2011a"></a>Hutzenthaler, M., Jentzen, A. and Kloeden, P. E. (2011). Strong and weak divergence in finite time of Euler's method for stochastic differential equations with non-globally Lipschitz continuous coefficients. *Proceedings of the Royal Society A: Mathematical, Physical and Engineering Sciences* 467(2130), 1563–1576. [doi:10.1098/rspa.2010.0348](https://doi.org/10.1098/rspa.2010.0348)

<a id="ref-KP1992a"></a>Kloeden, P. E. and Platen, E. (1992). *Numerical Solution of Stochastic Differential Equations*. Springer. [doi:10.1007/978-3-662-12616-5](https://doi.org/10.1007/978-3-662-12616-5)

<a id="ref-Oks2003a"></a>Øksendal, B. (2003). *Stochastic Differential Equations: An Introduction with Applications*, 6th edition. Springer. [doi:10.1007/978-3-642-14394-6](https://doi.org/10.1007/978-3-642-14394-6)

<a id="ref-SS2019a"></a>Särkkä, S. and Solin, A. (2019). *Applied Stochastic Differential Equations*. Cambridge University Press. [doi:10.1017/9781108186735](https://doi.org/10.1017/9781108186735)

<a id="ref-Kam1981a"></a>van Kampen, N. G. (1981). Itô versus Stratonovich. *Journal of Statistical Physics* 24(1), 175–187. [doi:10.1007/BF01007642](https://doi.org/10.1007/BF01007642)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
