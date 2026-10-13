# Linear Algebra — Decision Guide

## Which Task?

| You have | You want | Task |
|---|---|---|
| $n$ equations, $n$ unknowns | The unknowns | Linear Systems |
| One matrix, many right-hand sides | Fast repeated solves, a determinant | Factorisations |
| A square matrix describing dynamics or a quadratic form | Stability, long-run behaviour, curvature | Eigenvalues |
| Any matrix | Its rank, conditioning, a compressed version | Singular Values |
| More equations than unknowns | The best fit | Least Squares |

## Which Method for $Ax = b$?

| Structure of $A$ | Use | Cost, $n \times n$ |
|---|---|---|
| General square | `A \ b` (LU with partial pivoting) | $\tfrac{2}{3} n^3$ |
| Symmetric positive definite | `cholesky(A) \ b` | $\tfrac{1}{3} n^3$ |
| Symmetric, indefinite | `Symmetric(A) \ b` (Bunch-Kaufman) | $\tfrac{1}{3} n^3$ |
| Triangular, diagonal, tridiagonal | Wrap it (`UpperTriangular`, `Diagonal`, `Tridiagonal`) | $n^2$ or $n$ |
| Large and sparse | `SparseArrays`, or an iterative method (Krylov.jl) | Depends on the sparsity |
| Tall (least squares) | `A \ b` (QR) | $2mn^2$ |
| Rank-deficient or nearly so | `pinv(A) * b` or `qr(A, ColumnNorm()) \ b` | SVD: about $4mn^2$ |

`A \ b` on a plain matrix checks for triangular and symmetric structure and picks the method; `factorize(A)` returns that factorisation for reuse.

## Never `inv(A) * b`

Forming the inverse costs about three times as much as one LU solve and is less accurate ([Higham (2002)](#ref-higham2002)). Use `A \ b`, or keep a factorisation. You rarely need the inverse itself; even its diagonal (for standard errors) comes more cheaply from a factorisation.

## Least Squares: QR, Normal Equations or SVD?

| Method | Faces | When |
|---|---|---|
| QR (`A \ b`) | $\kappa(A)$ | The default |
| Normal equations, $(A^\top A)\,x = A^\top b$ | $\kappa(A)^2$ | Only when $A$ is very well conditioned and $m \gg n$ |
| SVD (`pinv`) | $\kappa(A)$ | Rank-deficient $A$; the minimum-norm solution ([Golub and Kahan (1965)](#ref-golub1965)) |

## Related Panels

- **Symbolic Math**: exact solutions of small linear systems.
- **Nonlinear Systems**: Newton's method solves a linear system with the Jacobian at every step.
- **Partial Differential Equations**: discretised equations are large sparse linear systems.

## References

<a id="ref-golub1965"></a>Golub, G. H. and Kahan, W. (1965). Calculating the singular values and pseudo-inverse of a matrix. *Journal of the Society for Industrial and Applied Mathematics, Series B: Numerical Analysis* 2(2), 205–224. [doi:10.1137/0702016](https://doi.org/10.1137/0702016)

<a id="ref-higham2002"></a>Higham, N. J. (2002). *Accuracy and Stability of Numerical Algorithms*, 2nd edition. Society for Industrial and Applied Mathematics. [doi:10.1137/1.9780898718027](https://doi.org/10.1137/1.9780898718027)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md)
- [Linear Systems](linear-systems.md) · [Factorisations](factorisations.md) · [Eigenvalues](eigenvalues.md) · [Singular Value Decomposition](singular-values.md) · [Least Squares](least-squares.md)
