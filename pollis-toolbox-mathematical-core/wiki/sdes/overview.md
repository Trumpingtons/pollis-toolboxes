# Overview

A stochastic differential equation describes a path that moves by a drift and by random shocks whose size the equation also sets. The integral that gives the shocks a meaning was defined by [Itô (1944)](#ref-Ito1944a), a second one with the rules of ordinary calculus by [Stratonovich (1966)](#ref-Str1966a), and the numerical schemes that solve both are collected by [Kloeden and Platen (1992)](#ref-KP1992a).

## What a Stochastic Differential Equation Means

The equation dX = f(X,t) dt + g(X,t) dW is shorthand for X(t) = X(0) + the integral of f over time + the integral of g against the Brownian motion W. Over a step h, the increment of W is a Normal(0, h) draw, so the shock is of size sqrt(h) and outweighs the drift, of size h, on short steps. Brownian paths are too rough for the integral of g to be defined as an ordinary limit of sums: where g is read within each step changes the answer. The Itô integral reads g at the start of the step, so the integrand never looks ahead. The scheme that follows this rule step by step is Euler-Maruyama, from [Maruyama (1955)](#ref-Mar1955a).

## How Itô's Lemma Changes the Chain Rule

For a function F that is twice differentiable, the process F(X) is again an Itô equation, by Itô's lemma ([Øksendal (2003)](#ref-Oks2003a)):

- dF(X) = (F'(X) f + F''(X) g^2 / 2) dt + F'(X) g dW

The second-order term F'' g^2 / 2 has no counterpart in ordinary calculus. It arises because the square of a Brownian increment is of order dt, not of order dt^2, so a Taylor expansion to second order keeps it. For X a geometric Brownian motion, with f = a X and g = b X, and F = log, the term turns the drift a into a - b^2 / 2.

## How the Itô Calculus Tab Works

The **Itô Calculus** tab takes **Drift f(X)**, **Diffusion g(X)** and **Function F(X)** as expressions in X, and Symbolics.jl differentiates F twice to build the drift and the diffusion of F(X) by Itô's lemma. The main code then solves three equations driven by one Brownian motion: X itself, Y with the coefficients of Itô's lemma, and Z with the drift of the ordinary chain rule, F' f. The three share their noise through a noise matrix with one column, so the problem has non-diagonal noise and the **Solver** menu holds EM and LambaEM. Y should stay close to F(X(t)) along the whole path, and Z should drift away from it at the rate F'' g^2 / 2.

## How the Stratonovich Integral Differs from the Itô Integral

The Stratonovich integral reads g at the middle of each step, written g ∘ dW. Ordinary calculus rules then hold, at the price of an integrand that looks half a step ahead. Each Stratonovich equation has an Itô equation with the same solution, whose drift is f + g g' / 2, where g' is the derivative of g in X. [Wong and Zakai (1965)](#ref-WZ1965a) showed that ordinary differential equations driven by smooth approximations of Brownian motion converge to the Stratonovich equation and not to the Itô one, which is why the Stratonovich form is common in physics.

## How the Stratonovich Tab Works

The **Stratonovich** tab solves dX = f(X) dt + g(X) ∘ dW with a solver that reads the Stratonovich integral. `SDEProblem` has no setting for the calculus: the solver decides it. A step of EulerHeun is a predictor and a corrector, the improved Euler form of [Roberts (2012)](#ref-Rob2012a):

- Predictor: U = X + f(X) dt + g(X) dW
- Corrector: X(n+1) = X + (f(X) + f(U)) dt / 2 + (g(X) + g(U)) dW / 2

Symbolics.jl computes the Itô drift f + g g' / 2, and EM solves that Itô equation on the Brownian path recorded with `save_noise=true` and replayed with `NoiseWrapper`. The two solutions should agree up to the error of the two schemes.

## How the Exact Solutions Tab Works

The **Exact Solutions** tab offers four equations whose solution is a function of t and W(t) alone, from [Kloeden and Platen (1992)](#ref-KP1992a): geometric Brownian motion, an equation with additive noise, the Wave equation and the Cubic equation. Their solutions are passed to `SDEFunction` as `analytic`, so every solve also computes the exact solution on its own Brownian path, in `sol.u_analytic`, and its errors, in `sol.errors`. The tab is the place to measure what a solver delivers before trusting it on an equation that has no closed form.

## How the Systems of SDEs Tab Works

The **Systems of SDEs** tab solves du = A u dt + noise for a vector u, with three **Noise Structure** choices. Diagonal noise gives each state its own Brownian motion, of size S[i, i]. General noise lets the matrix S mix the Brownian motions, which needs `noise_rate_prototype`. Correlated noise gives each state its own Brownian motion, correlated with the others through `CorrelatedWienerProcess`. In each case the main code reports Q, the covariance rate of the noise, which the moment equations use.

## How the Stiff SDEs Tab Works

The **Stiff SDEs** tab pulls X towards sin(t) at **Rate lambda**, with constant noise **Noise sigma**. With a large lambda, the solution relaxes in a time of order 1 / lambda and then follows sin(t) slowly. Explicit Euler-Maruyama multiplies the distance to the target by 1 - lambda h at each step, so it is stable only for h below 2 / lambda. Drift-implicit schemes remove that limit for this linear drift ([Higham (2000)](#ref-Hig2000a)), and SOSRA stretches the stability region of an explicit method ([Rackauckas and Nie (2020)](#ref-RN2020a)).

## A Common Workflow in the Stochastic Differential Equations Panel

1. In **Itô Calculus**, derive the equation of the quantity of interest from the equation of the state.
2. Settle the calculus in **Stratonovich**, and use **Itô vs Stratonovich** to see what the choice changes.
3. In **Exact Solutions**, measure the solver with **Strong and Weak Convergence Orders** and **Work-Precision Diagram**.
4. For several states, set the noise in **Systems of SDEs** and check the paths against **Moment Equations**.
5. When steps must be small for no visible reason, try **Step-Size Stability** and the solvers of **Stiff SDEs**.

## References

<a id="ref-Hig2000a"></a>Higham, D. J. (2000). Mean-square and asymptotic stability of the stochastic theta method. *SIAM Journal on Numerical Analysis* 38(3), 753–769. [doi:10.1137/S003614299834736X](https://doi.org/10.1137/S003614299834736X)

<a id="ref-Ito1944a"></a>Itô, K. (1944). Stochastic integral. *Proceedings of the Japan Academy, Series A, Mathematical Sciences* 20(8), 519–524. [doi:10.3792/pia/1195572786](https://doi.org/10.3792/pia/1195572786)

<a id="ref-KP1992a"></a>Kloeden, P. E. and Platen, E. (1992). *Numerical Solution of Stochastic Differential Equations*. Springer. [doi:10.1007/978-3-662-12616-5](https://doi.org/10.1007/978-3-662-12616-5)

<a id="ref-Mar1955a"></a>Maruyama, G. (1955). Continuous Markov processes and stochastic equations. *Rendiconti del Circolo Matematico di Palermo* 4(1), 48–90. [doi:10.1007/BF02846028](https://doi.org/10.1007/BF02846028)

<a id="ref-Oks2003a"></a>Øksendal, B. (2003). *Stochastic Differential Equations: An Introduction with Applications*, 6th edition. Springer. [doi:10.1007/978-3-642-14394-6](https://doi.org/10.1007/978-3-642-14394-6)

<a id="ref-RN2020a"></a>Rackauckas, C. and Nie, Q. (2020). Stability-optimized high order methods and stiffness detection for pathwise stiff stochastic differential equations. *2020 IEEE High Performance Extreme Computing Conference (HPEC)*, 1–8. [doi:10.1109/hpec43674.2020.9286178](https://doi.org/10.1109/hpec43674.2020.9286178)

<a id="ref-Rob2012a"></a>Roberts, A. J. (2012). Modify the improved Euler scheme to integrate stochastic differential equations. arXiv:1210.0933. [doi:10.48550/arXiv.1210.0933](https://doi.org/10.48550/arXiv.1210.0933)

<a id="ref-Str1966a"></a>Stratonovich, R. L. (1966). A new representation for stochastic integrals and equations. *SIAM Journal on Control* 4(2), 362–371. [doi:10.1137/0304028](https://doi.org/10.1137/0304028)

<a id="ref-WZ1965a"></a>Wong, E. and Zakai, M. (1965). On the convergence of ordinary integrals to stochastic integrals. *The Annals of Mathematical Statistics* 36(5), 1560–1564. [doi:10.1214/aoms/1177699916](https://doi.org/10.1214/aoms/1177699916)

## See Also

- [Factsheet](factsheet.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
