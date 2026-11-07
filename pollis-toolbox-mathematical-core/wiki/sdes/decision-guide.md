# Decision Guide

Four choices settle how a stochastic differential equation is solved in the Stochastic Differential Equations panel: the calculus, the solver for the noise, explicit or implicit steps, and a fixed or an adaptive step. The sections below take them in that order.

## When to Prefer Itô or Stratonovich

Choose Itô when each shock is unknown until it happens and the coefficients are set before it, as for prices, populations and most models of decisions: g is then read at the start of the step. Choose Stratonovich when the white noise of the equation stands for a fast signal that is smooth on a short time scale, as is common in physics and engineering, since smooth approximations of Brownian motion lead to the Stratonovich equation ([Wong and Zakai (1965)](#ref-WZ1965a)). Stratonovich is also the reading in which changes of variable follow the ordinary chain rule, which keeps equations on curved spaces, such as rotations, in their natural form. A model stated in one reading can be run in the other by moving g g' / 2 into the drift, as the **Stratonovich** tab shows. When g does not depend on X, no choice is needed.

## Which Solver to Choose for the Noise

| Noise | Nonstiff, accuracy first | Nonstiff, simple and robust | Stiff drift |
|---|---|---|---|
| Additive | SOSRA, or SRIW1 if diagonal | EM, which has strong order 1 here | SKenCarp |
| Diagonal, depending on the state | SOSRI or SRIW1 | RKMil, or EM | ImplicitEM |
| General (non-diagonal) | LambaEM | EM | ImplicitEM |
| Stratonovich, any structure | RKMil (Stratonovich) if diagonal | EulerHeun, LambaEulerHeun | ImplicitEulerHeun |

SRIW1 is the strong order 3/2 method of [Rößler (2010)](#ref-Ros2010a), and SOSRI and SOSRA are versions of it whose coefficients were chosen for a larger stability region ([Rackauckas and Nie (2020)](#ref-RN2020a)). RKMil is the Milstein scheme of [Mil’shtejn (1975)](#ref-Mil1975a) written without derivatives of g. For general noise, the solvers above strong order 1/2 need the iterated integrals of pairs of Brownian motions, which none of the solvers of the panel computes.

## When an Implicit Solver Is Worth Its Cost

An implicit step solves a nonlinear equation at every step, with a Jacobian of the drift, so it costs more than an explicit step of the same order. The cost pays off when the drift has a time scale much faster than the scale of interest: strong mean reversion, fast chemical reactions, the fast variables of a fast-slow system. A sign of stiffness is an explicit solver that needs far smaller steps than the paths seem to call for, or whose adaptive step count rises sharply with the rate of the fast part, as **Step-Size Stability** and **Compare Solvers** in the **Stiff SDEs** tab show. SOSRA and SOSRI are a middle ground: explicit, but stable over longer steps than EM. Drift-implicit schemes treat only the drift implicitly, and for a diffusion term that is stiff as well, StochasticDiffEq.jl ([Rackauckas and Nie (2017)](#ref-RN2017a)) offers split-step methods such as `ISSEM`.

## When to Use a Fixed or an Adaptive Step

A fixed step is the choice when the results are compared across steps, as in **Strong and Weak Convergence Orders** and **Work-Precision Diagram**, which set `adaptive=false`, or when the paths must sit on one time grid. An adaptive step is the choice for a single accurate solve whose difficulty changes along the path, as in a burst of large noise. The adaptive solvers of the panel reject a step that is too large without discarding the Brownian increment already drawn, and split it with a Brownian bridge, so the path stays a sample of the same Brownian motion ([Rackauckas and Nie (2017)](#ref-RN2017b)). With an adaptive solver, **Step dt** is only the first step, and the accuracy is set by the tolerances `abstol` and `reltol`, which can be passed to `solve_with`.

## How to Choose the Step Before Trusting a Result

A step is small enough when halving it no longer changes the quantity of interest by more than the accuracy needed: the value along a path for a strong question, a mean or a probability for a weak one. For a weak question, the change must also be compared with the sampling error, which falls with the square root of the number of paths, not with the step. The **Exact Solutions** tab is the place to calibrate: on an equation close to the one of interest, find the step at which the error falls below the accuracy needed, and start from that step. For an equation whose coefficients grow faster than linearly, EM can fail however small the step ([Hutzenthaler, Jentzen and Kloeden (2011)](#ref-HJK2011a)), and an implicit solver is the safer start.

## Where to Go After the Stochastic Differential Equations Panel

The panel treats the mathematics of the equations: the calculus, the solvers and their errors. Simulation of diffusion models, with additive and multiplicative noise, ensembles and stationary distributions, is in the Diffusion Processes panel, under Simulate. Models with jumps as well as diffusion are in the Jump-Diffusion Processes panel, and the statistics of large ensembles in SDE Ensemble Analysis. For the methods of the panel at greater length, [Kloeden and Platen (1992)](#ref-KP1992a) treat the schemes and their orders, [Higham (2001)](#ref-Hig2001a) gives a short introduction with code, and [Särkkä and Solin (2019)](#ref-SS2019a) cover linear systems, filtering and the links with statistics.

## References

<a id="ref-Hig2001a"></a>Higham, D. J. (2001). An algorithmic introduction to numerical simulation of stochastic differential equations. *SIAM Review* 43(3), 525–546. [doi:10.1137/S0036144500378302](https://doi.org/10.1137/S0036144500378302)

<a id="ref-HJK2011a"></a>Hutzenthaler, M., Jentzen, A. and Kloeden, P. E. (2011). Strong and weak divergence in finite time of Euler's method for stochastic differential equations with non-globally Lipschitz continuous coefficients. *Proceedings of the Royal Society A: Mathematical, Physical and Engineering Sciences* 467(2130), 1563–1576. [doi:10.1098/rspa.2010.0348](https://doi.org/10.1098/rspa.2010.0348)

<a id="ref-KP1992a"></a>Kloeden, P. E. and Platen, E. (1992). *Numerical Solution of Stochastic Differential Equations*. Springer. [doi:10.1007/978-3-662-12616-5](https://doi.org/10.1007/978-3-662-12616-5)

<a id="ref-Mil1975a"></a>Mil’shtejn, G. N. (1975). Approximate integration of stochastic differential equations. *Theory of Probability and Its Applications* 19(3), 557–562. [doi:10.1137/1119062](https://doi.org/10.1137/1119062)

<a id="ref-RN2017a"></a>Rackauckas, C. and Nie, Q. (2017). DifferentialEquations.jl: a performant and feature-rich ecosystem for solving differential equations in Julia. *Journal of Open Research Software* 5(1), 15. [doi:10.5334/jors.151](https://doi.org/10.5334/jors.151)

<a id="ref-RN2017b"></a>Rackauckas, C. and Nie, Q. (2017). Adaptive methods for stochastic differential equations via natural embeddings and rejection sampling with memory. *Discrete and Continuous Dynamical Systems - B* 22(7), 2731–2761. [doi:10.3934/dcdsb.2017133](https://doi.org/10.3934/dcdsb.2017133)

<a id="ref-RN2020a"></a>Rackauckas, C. and Nie, Q. (2020). Stability-optimized high order methods and stiffness detection for pathwise stiff stochastic differential equations. *2020 IEEE High Performance Extreme Computing Conference (HPEC)*, 1–8. [doi:10.1109/hpec43674.2020.9286178](https://doi.org/10.1109/hpec43674.2020.9286178)

<a id="ref-Ros2010a"></a>Rößler, A. (2010). Runge–Kutta methods for the strong approximation of solutions of stochastic differential equations. *SIAM Journal on Numerical Analysis* 48(3), 922–952. [doi:10.1137/09076636X](https://doi.org/10.1137/09076636X)

<a id="ref-SS2019a"></a>Särkkä, S. and Solin, A. (2019). *Applied Stochastic Differential Equations*. Cambridge University Press. [doi:10.1017/9781108186735](https://doi.org/10.1017/9781108186735)

<a id="ref-WZ1965a"></a>Wong, E. and Zakai, M. (1965). On the convergence of ordinary integrals to stochastic integrals. *The Annals of Mathematical Statistics* 36(5), 1560–1564. [doi:10.1214/aoms/1177699916](https://doi.org/10.1214/aoms/1177699916)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md)
