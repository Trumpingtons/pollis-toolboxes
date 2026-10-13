# Factorisations

A factorisation writes $A$ as a product of matrices that are easy to solve with: triangular (solved by substitution), orthogonal ($Q^{-1} = Q^\top$) or diagonal. It is computed once, in about $n^3$ operations, and reused.

## LU

$$PA = LU$$

$L$ is unit lower triangular, $U$ upper triangular, $P$ a permutation (the row order). It exists for every square matrix with partial pivoting, and gives

- solutions: `lu(A) \ b`;
- the determinant: $\det A = \pm \prod_i u_{ii}$, the sign from the number of row swaps.

## Cholesky

$$A = R^\top R, \qquad R \text{ upper triangular with positive diagonal}$$

It exists exactly when $A$ is symmetric positive definite, so attempting it is also the cheapest test of positive definiteness. It needs half the work of LU and no pivoting. Covariance matrices, the normal equations $A^\top A$ and the Hessians of strictly convex functions are positive definite; Cholesky is how you simulate correlated normal draws ($x = R^\top z$) and evaluate a multivariate normal density.

## QR

$$A = QR, \qquad Q^\top Q = I, \quad R \text{ upper triangular}$$

It exists for any $m \times n$ matrix. Julia computes it with Householder reflections ([Householder (1958)](#ref-householder1958)), which are backward stable. Because $Q$ preserves lengths, $\lVert Ax - b \rVert = \lVert Rx - Q^\top b \rVert$, which turns least squares into a triangular solve. The columns of $Q$ are an orthonormal basis for the column space of $A$. With column pivoting, `qr(A, ColumnNorm())`, it also reveals the rank.

## Which One

| Matrix | Factorisation | Julia |
|---|---|---|
| Square, general | LU | `lu(A)` |
| Symmetric positive definite | Cholesky | `cholesky(A)` |
| Symmetric, indefinite | Bunch-Kaufman ($LDL^\top$) | `bunchkaufman(A)` |
| Any shape | QR | `qr(A)` |
| Unknown | Let Julia choose | `factorize(A)` |

## Reuse

```julia
F = factorize(A)            # about n^3 operations, once
x1 = F \ b1                 # about n^2 each
x2 = F \ b2
```

The factorisation object also gives `det(F)` and `logdet(F)`, the latter safe from overflow for large matrices.

## Further Reading

[Trefethen and Bau (1997)](#ref-trefethen1997) treat LU, QR and Cholesky in Lectures 7–11 and 20–23; [Strang (2023)](#ref-strang2023) is a gentler introduction.

## References

<a id="ref-householder1958"></a>Householder, A. S. (1958). Unitary triangularization of a nonsymmetric matrix. *Journal of the ACM* 5(4), 339–342. [doi:10.1145/320941.320947](https://doi.org/10.1145/320941.320947)

<a id="ref-strang2023"></a>Strang, G. (2023). *Introduction to Linear Algebra*, 6th edition. Wellesley-Cambridge Press.

<a id="ref-trefethen1997"></a>Trefethen, L. N. and Bau, D. (1997). *Numerical Linear Algebra*. Society for Industrial and Applied Mathematics. [doi:10.1137/1.9780898719574](https://doi.org/10.1137/1.9780898719574)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
- [Linear Systems](linear-systems.md) · [Eigenvalues](eigenvalues.md) · [Singular Value Decomposition](singular-values.md) · [Least Squares](least-squares.md)
