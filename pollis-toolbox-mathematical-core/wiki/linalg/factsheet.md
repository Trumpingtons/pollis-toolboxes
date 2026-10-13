# Linear Algebra — Factsheet

Linear algebra is the arithmetic of many quantities at once. Systems of equations, regressions, input-output tables, Markov chains and the curvature of a function of several variables are all matrix problems. This panel uses Julia's standard library **LinearAlgebra**, which calls the LAPACK and BLAS routines of [Anderson, Bai, Bischof, Blackford, Demmel, Dongarra, Du Croz, Greenbaum, Hammarling, McKenney and Sorensen (1999)](#ref-anderson1999) and needs no installation.

| | |
|---|---|
| **Purpose** | Solve linear systems, factorise matrices, find eigenvalues and singular values, fit by least squares |
| **Julia stack** | `LinearAlgebra` (standard library), backed by LAPACK and BLAS |
| **Key operator** | `A \ b`: solves square systems and least-squares problems, choosing the method from the structure of `A` |
| **Factorisations** | `lu`, `qr`, `cholesky`, `eigen`, `svd`, and `factorize`, which picks one |
| **Accuracy measure** | The condition number `cond(A)`: about $\log_{10}\kappa(A)$ decimal digits may be lost |
| **Matrix types** | `Symmetric`, `Diagonal`, `Tridiagonal`, `UpperTriangular`, ...: tell Julia the structure and it uses a faster method |

## The Five Tasks

| Task | Problem | Julia | Result |
|---|---|---|---|
| Linear Systems | $Ax = b$, $A$ square | `A \ b` | $x$ |
| Factorisations | $A = LU$, $A = QR$, $A = R^\top R$ | `lu(A)`, `qr(A)`, `cholesky(A)` | Triangular and orthogonal factors |
| Eigenvalues | $Av = \lambda v$ | `eigen(A)` | Eigenvalues $\lambda_i$ and eigenvectors $v_i$ |
| Singular Values | $A = U \Sigma V^\top$ | `svd(A)` | Singular values $\sigma_1 \ge \sigma_2 \ge \dots \ge 0$ |
| Least Squares | $\min_x \lVert Ax - b \rVert_2$, $A$ tall | `A \ b` | Coefficients $x$ |

## Minimal Example

```julia
using LinearAlgebra

A = [2.0 1; 1 3]
b = [3.0, 5]
x = A \ b              # solve A x = b
norm(A * x - b)        # residual: zero up to rounding
eigvals(A), svdvals(A), cond(A)
```

## References

<a id="ref-anderson1999"></a>Anderson, E., Bai, Z., Bischof, C., Blackford, S., Demmel, J., Dongarra, J., Du Croz, J., Greenbaum, A., Hammarling, S., McKenney, A. and Sorensen, D. (1999). *LAPACK Users' Guide*, 3rd edition. Society for Industrial and Applied Mathematics. [doi:10.1137/1.9780898719604](https://doi.org/10.1137/1.9780898719604)

## See Also
- [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
- [Linear Systems](linear-systems.md) · [Factorisations](factorisations.md) · [Eigenvalues](eigenvalues.md) · [Singular Value Decomposition](singular-values.md) · [Least Squares](least-squares.md)
