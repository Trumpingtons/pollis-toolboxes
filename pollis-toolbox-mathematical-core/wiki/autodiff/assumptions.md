# Automatic Differentiation — Assumptions

Automatic differentiation needs a function that is differentiable at the point, and code that the chosen backend can follow ([Griewank and Walther (2008)](#ref-GW2008a)).

## Differentiability at the Point

A derivative exists at x0 only where the function is differentiable there. At a kink, such as `abs(x)` at 0 or `max(x, 0)` at 0, automatic differentiation returns the derivative of the branch the program takes, which is one of the two one-sided slopes. Second derivatives and Hessians need the function to be twice differentiable at x0; a function that is linear in pieces has a second derivative of zero wherever it is defined. Point x0, and the window of the plots set by **Plot Half-Width**, must lie inside the domain of the function: `log(x)` and `x^0.3` need x > 0, and the gradient of a Cobb-Douglas function is infinite where an input is 0.

## Code a Backend Can Differentiate

Automatic differentiation follows the program, so what each backend accepts depends on how it reads the code. ForwardDiff passes dual numbers through the function, so the function must accept any number type: an argument declared `Float64`, or an array of `Float64` allocated inside the function, stops the dual numbers ([Revels, Lubin and Papamarkou (2016)](#ref-RLP2016a)). Enzyme differentiates the compiled code and supports functions that mutate arrays ([Moses and Churavy (2020)](#ref-MC2020a)). Mooncake differentiates Julia's intermediate representation and also supports mutation; its first call compiles the rules it needs and takes longer than the calls after it.

## What the Reference Backends Need

The **Backend** menu also holds two backends that are not automatic differentiation, used as references. FiniteDiff takes difference quotients, so the function must be smooth on the scale of its step: a function computed with noise, such as a simulation or a solver with a loose tolerance, gives difference quotients that reflect the noise. Symbolics traces the function with symbolic variables, so a loop or an `if` statement whose course depends on the value of x cannot be traced. The **Taylor Polynomial** action evaluates the function on Taylor series of TaylorSeries.jl, so the function must accept them in place of numbers.

## References

<a id="ref-GW2008a"></a>Griewank, A. and Walther, A. (2008). *Evaluating Derivatives: Principles and Techniques of Algorithmic Differentiation*, 2nd edition. SIAM. [doi:10.1137/1.9780898717761](https://doi.org/10.1137/1.9780898717761)

<a id="ref-MC2020a"></a>Moses, W. S. and Churavy, V. (2020). Instead of rewriting foreign code for machine learning, automatically synthesize fast gradients. *Advances in Neural Information Processing Systems* 33. [arXiv:2010.01709](https://arxiv.org/abs/2010.01709)

<a id="ref-RLP2016a"></a>Revels, J., Lubin, M. and Papamarkou, T. (2016). Forward-mode automatic differentiation in Julia. arXiv:1607.07892. [arxiv.org](https://arxiv.org/abs/1607.07892)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
