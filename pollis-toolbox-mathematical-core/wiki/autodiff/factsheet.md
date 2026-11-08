# Automatic Differentiation — Factsheet

The Automatic Differentiation panel computes derivatives, gradients, Hessians, Jacobians, pushforwards and pullbacks of Julia functions by automatic differentiation, through one interface, DifferentiationInterface.jl, over several backends ([Dalle and Hill (2026)](#ref-DH2026a)).

| | |
|---|---|
| **Purpose** | Exact derivatives of a Julia function at a point, by forward or reverse mode |
| **Interface** | `DifferentiationInterface.jl`: `derivative`, `second_derivative`, `gradient`, `hessian`, `jacobian`, `pushforward`, `pullback` |
| **Automatic backends** | ForwardDiff (forward mode), Enzyme and Mooncake (reverse mode, and forward mode for second derivatives) |
| **Reference backends** | FiniteDiff (difference quotients) and Symbolics (formulas, then evaluated) |
| **Higher orders** | `TaylorSeries.jl`, in the **Taylor Polynomial** action |
| **Tabs** | Derivatives, Gradients and Hessians, Jacobians, Pushforward/Pullback |

## The Four Tabs of the Automatic Differentiation Panel

| Tab | From and to | What the tab computes | Example |
|---|---|---|---|
| Derivatives | One variable to one value | f'(x0) and f''(x0) | Marginal cost and whether it is rising |
| Gradients and Hessians | Several variables to one value | The gradient and the Hessian at x0 | Marginal products, concavity of a production function |
| Jacobians | Several variables to several values | The m × n Jacobian at x0 | The effects of each price on each demand |
| Pushforward/Pullback | Several variables to several values | J dx and transpose(J) dy, without the whole Jacobian | The gradient of a loss, by backpropagation |

## A Minimal Example with DifferentiationInterface

```julia
using DifferentiationInterface
import ForwardDiff

f(x) = x[1]^0.3 * x[2]^0.7
x0 = [1.0, 2.0]
backend = AutoForwardDiff()
gradient(f, backend, x0)
hessian(f, backend, x0)
```

Replacing `AutoForwardDiff()` by `AutoEnzyme()` or `AutoMooncake(; config=nothing)` changes the backend and nothing else in the code, which is what the **Backend** menu of the panel does.

## References

<a id="ref-DH2026a"></a>Dalle, G. and Hill, A. (2026). A common interface for automatic differentiation. *Journal of Machine Learning Research* 27(25), 1–13. [jmlr.org](https://www.jmlr.org/papers/v27/25-1024.html)

## See Also

- [Overview](overview.md) · [Automatic Differentiation](automatic-differentiation.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
