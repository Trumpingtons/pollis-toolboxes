# Linear Algebra — Assumptions

Each method asks something of the matrix. When the requirement fails, the method either stops with an error or, worse, returns an inaccurate answer without complaint.

| Method | Requires | If it fails |
|---|---|---|
| `A \ b`, square $A$ | $A$ nonsingular ($\det A \neq 0$, full rank) | `SingularException`, or a huge, meaningless $x$ when $A$ is nearly singular |
| `lu(A)` | Square $A$ for solving; any $A$ to factorise | A zero pivot: `SingularException` (use `lu(A; check=false)` to inspect) |
| `cholesky(A)` | $A$ symmetric positive definite: $x^\top A x > 0$ for every $x \neq 0$ | `PosDefException`. Test first with `isposdef(A)` |
| `qr(A)` | Nothing: any shape, any rank | For rank-deficient $A$, use the pivoted form `qr(A, ColumnNorm())` |
| `eigen(A)` | Square $A$ | A non-symmetric $A$ may have complex eigenvalues, and may be defective (too few independent eigenvectors) |
| `svd(A)` | Nothing | Always exists; only its cost (about $mn^2$) can be a limit |
| Least squares `A \ b` | $A$ tall with independent columns for a unique solution | Rank-deficient $A$: infinitely many minimisers; QR with pivoting or `pinv` returns one of them |

## Floating-Point Numbers

A matrix written with integers only, such as `[4 1; 1 5]`, holds integers. Most functions convert it, but `A \ b` with integer data still returns floats, and some routines need a floating-point type. Write one entry as a decimal (`4.0`) to be sure.

## Symmetry Is Exact

`issymmetric(A)` tests exact equality of $A$ and $A^\top$. A covariance matrix computed in floating point may differ from its transpose in the last digit. Wrap it as `Symmetric(A)` to tell Julia it is symmetric: Cholesky and the symmetric eigenvalue routine then apply.

## Well-Posed Problems

The answer is only as good as the data. When $\kappa(A)$ is near $10^{k}$, about $k$ of the 16 digits can be lost, whatever the algorithm ([Higham (2002)](#ref-higham2002)). A matrix with $\kappa(A)$ near $10^{16}$ is singular for practical purposes.

## References

<a id="ref-higham2002"></a>Higham, N. J. (2002). *Accuracy and Stability of Numerical Algorithms*, 2nd edition. Society for Industrial and Applied Mathematics. [doi:10.1137/1.9780898718027](https://doi.org/10.1137/1.9780898718027)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
- [Linear Systems](linear-systems.md) · [Factorisations](factorisations.md) · [Eigenvalues](eigenvalues.md) · [Singular Value Decomposition](singular-values.md) · [Least Squares](least-squares.md)
