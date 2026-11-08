# Automatic Differentiation — Overview

The Automatic Differentiation panel computes exact derivatives of Julia functions by applying the chain rule to each operation they perform, in forward or reverse mode ([Griewank and Walther (2008)](#ref-GW2008a)). All four tabs run the same functions of DifferentiationInterface.jl on the backend chosen in the **Backend** menu ([Dalle and Hill (2026)](#ref-DH2026a)).

## What a Derivative, a Gradient and a Jacobian Are

The derivative f'(x0) of a function of one variable is the slope of its tangent at x0, and f''(x0) the rate at which that slope changes. For a function f of n variables with one value, the gradient is the vector of its n partial derivatives and points in the direction of steepest ascent; the Hessian is the n × n matrix of its second partial derivatives. For a function F of n variables with m values, the Jacobian J is the m × n matrix whose entry J[i, j] is the partial derivative of output i with respect to variable j, so row i is the gradient of output i ([Nocedal and Wright (2006)](#ref-NW2006a)).

## Forward Mode and Reverse Mode

Forward mode carries a derivative alongside each value through the program: one pass gives the derivative of every output along one direction of the inputs, so a gradient of n inputs takes n passes, or fewer passes carrying several directions at once. Reverse mode runs the program forward, keeps what the backward pass needs, then propagates the derivative of one output back to every input: one backward pass gives the whole gradient of a function with one value, whatever n is. A full m × n Jacobian therefore takes about n forward passes or m reverse passes, and the cheaper mode depends on which of n and m is smaller ([Griewank and Walther (2008)](#ref-GW2008a)).

## Pushforwards and Pullbacks: What One Pass Computes

One pass of forward mode computes a pushforward, the Jacobian-vector product J dx: the change of every output along the direction dx of the inputs. One pass of reverse mode computes a pullback, the vector-Jacobian product transpose(J) dy: the gradient of the weighted sum of the outputs, with weights dy. Neither forms the Jacobian. A gradient is the pullback of a function with one value and dy = 1, and backpropagation in a neural network is the pullback of its loss ([Baydin, Pearlmutter, Radul and Siskind (2018)](#ref-BPRS2018a)). DifferentiationInterface.jl calls the two products `pushforward` and `pullback`, and builds `gradient`, `jacobian` and the other operators from them ([Dalle and Hill (2026)](#ref-DH2026a)).

## How the Derivatives Tab Works

The **Derivatives** tab takes **Function f(x)**, a Julia expression in x, and **Point x0**, and computes f'(x0) with `derivative` and f''(x0) with `second_derivative`. With ForwardDiff, FiniteDiff or Symbolics the same backend computes both. With Enzyme or Mooncake the second derivative uses `SecondOrder`, which applies forward mode over reverse mode. The tab also defines `dcalc(b)`, the first derivative with any backend `b`, which **Check Against Exact** and **Compare Backends** call with other backends.

## How the Gradients and Hessians Tab Works

The **Gradients and Hessians** tab takes **Function f(x)**, an expression in x[1], x[2] and so on with one value, and **Point x0**, a vector, and computes the gradient with `gradient` and the Hessian with `hessian`. As in the Derivatives tab, Enzyme and Mooncake compute the Hessian forward over reverse with `SecondOrder`, the usual combination for Hessians ([Griewank and Walther (2008)](#ref-GW2008a)). The default function is a Cobb-Douglas production function, whose gradient holds the marginal products of its two inputs.

## How the Jacobians Tab Works

The **Jacobians** tab takes **Functions F(x)**, a vector with one Julia expression per output, and **Point x0**, and computes the Jacobian with `jacobian`. The number of outputs need not equal the number of variables. Row i of the result is output i and column j is variable j. ForwardDiff fills the Jacobian by forward passes along each variable; Enzyme and Mooncake fill it by reverse passes from each output.

## How the Pushforward/Pullback Tab Works

The **Pushforward/Pullback** tab takes **Functions F(x)**, **Point x0**, **Direction dx**, one value per variable, and **Weights dy**, one value per output. It computes the pushforward J dx with `pushforward` and the pullback transpose(J) dy with `pullback`, each in one pass, then computes the whole Jacobian J to check both: the output reports whether the pushforward equals J dx and the pullback equals transpose(J) dy. With dy putting weight 1 on a single output, the pullback is that output's gradient.

## Next Steps of the Automatic Differentiation Panel

| Group | Action | What the action shows |
|---|---|---|
| Visualise | **Function and Tangent**, **Derivative Plot** | f with its tangent, level curves with the gradient, or a heat map of the Jacobian; f, f' and f'' over a window, or the gradient field |
| Diagnose | **Check Against Exact** | The chosen backend beside Symbolics and FiniteDiff |
| Predict | **Linear Approximation** | f predicted from its derivatives at x0, beside its exact value |
| Compare | **Compare Backends**, **Forward vs Reverse Mode** | Every backend on the same function; the cost of a gradient as the number of inputs grows |
| Interpret | **Derivative Summary**, **Taylor Polynomial** | What the derivatives say about f at x0; the Taylor expansion up to **Taylor Order** |

## References

<a id="ref-BPRS2018a"></a>Baydin, A. G., Pearlmutter, B. A., Radul, A. A. and Siskind, J. M. (2018). Automatic differentiation in machine learning: a survey. *Journal of Machine Learning Research* 18(153), 1–43. [jmlr.org](https://jmlr.org/papers/v18/17-468.html)

<a id="ref-DH2026a"></a>Dalle, G. and Hill, A. (2026). A common interface for automatic differentiation. *Journal of Machine Learning Research* 27(25), 1–13. [jmlr.org](https://www.jmlr.org/papers/v27/25-1024.html)

<a id="ref-GW2008a"></a>Griewank, A. and Walther, A. (2008). *Evaluating Derivatives: Principles and Techniques of Algorithmic Differentiation*, 2nd edition. SIAM. [doi:10.1137/1.9780898717761](https://doi.org/10.1137/1.9780898717761)

<a id="ref-NW2006a"></a>Nocedal, J. and Wright, S. J. (2006). *Numerical Optimization*, 2nd edition. Springer. [doi:10.1007/978-0-387-40065-5](https://doi.org/10.1007/978-0-387-40065-5)

## See Also

- [Factsheet](factsheet.md) · [Automatic Differentiation](automatic-differentiation.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
