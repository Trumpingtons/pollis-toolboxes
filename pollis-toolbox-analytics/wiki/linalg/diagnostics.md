# Linear Algebra — Diagnostics

Every result in linear algebra can be checked by multiplying back. Two numbers tell you whether to trust it: the **residual** and the **condition number**.

## Residuals

| Result | Check | Expect |
|---|---|---|
| Solution of $Ax = b$ | $\dfrac{\lVert Ax - b \rVert}{\lVert A \rVert \, \lVert x \rVert}$ | About $10^{-16}$ (machine precision) |
| $PA = LU$ | $\lVert LU - PA \rVert / \lVert A \rVert$ | About $10^{-16}$ |
| $A = QR$ | $\lVert QR - A \rVert / \lVert A \rVert$ and $\lVert Q^\top Q - I \rVert$ | About $10^{-16}$ |
| $AV = V\Lambda$ | $\lVert AV - V\Lambda \rVert / \lVert A \rVert$ | About $10^{-16}$ |
| $A = U\Sigma V^\top$ | $\lVert U\Sigma V^\top - A \rVert / \lVert A \rVert$ | About $10^{-16}$ |
| Least squares | $\lVert A^\top r \rVert / (\lVert A \rVert \lVert r \rVert)$, $r = b - Ax$ | About $10^{-16}$: the residual is orthogonal to the columns of $A$ |

A small *relative* residual says the algorithm did its job: $x$ is the exact solution of a nearby problem (backward stability). It does not say $x$ is close to the true solution.

## Condition Number

$$\kappa(A) = \lVert A \rVert \, \lVert A^{-1} \rVert = \frac{\sigma_{\max}}{\sigma_{\min}}$$

If $b$ changes by a relative amount $\varepsilon$, the solution can change by up to $\kappa(A)\,\varepsilon$:

$$\frac{\lVert \Delta x \rVert}{\lVert x \rVert} \le \kappa(A) \, \frac{\lVert \Delta b \rVert}{\lVert b \rVert}.$$

| $\kappa(A)$ | Reading |
|---|---|
| Below $10^{3}$ | Well conditioned |
| $10^{3}$ to $10^{10}$ | Some digits lost: about $\log_{10}\kappa$ |
| Above $10^{12}$ | Few digits left; look for a better formulation |
| Near $10^{16}$ | Numerically singular |

A small determinant does **not** mean ill-conditioning: $10^{-3} I$ has determinant $10^{-3n}$ and condition number 1.

## Eigenvalue Sensitivity

For a symmetric matrix, eigenvalues move no more than the perturbation of $A$. For a non-symmetric one, they can move by $\kappa(V)$ times as much, where $V$ holds the eigenvectors ([Golub and Van Loan (2013)](#ref-golub2013)). `cond(V)` near 1 is safe; a large value means the eigenvalues are fragile.

## Common Failures

- **`SingularException`**: $A$ has an exact zero pivot. Check `rank(A)`: a column may be a copy or a sum of others.
- **`PosDefException`**: Cholesky on a matrix that is not positive definite, often a covariance matrix with too few observations, or one that is symmetric only up to rounding (wrap it in `Symmetric`).
- **Huge entries in $x$**: $A$ is nearly singular; look at its smallest singular values.

## References

<a id="ref-golub2013"></a>Golub, G. H. and Van Loan, C. F. (2013). *Matrix Computations*, 4th edition. Johns Hopkins University Press.

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
- [Linear Systems](linear-systems.md) · [Factorisations](factorisations.md) · [Eigenvalues](eigenvalues.md) · [Singular Value Decomposition](singular-values.md) · [Least Squares](least-squares.md)
