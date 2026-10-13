# Least Squares

## The Problem

With more equations than unknowns, $A \in \mathbb{R}^{m \times n}$, $m > n$, there is usually no exact solution. Least squares takes the $x$ that makes the residual $r = b - Ax$ as short as possible:

$$\hat x = \arg\min_x \lVert b - Ax \rVert_2^2.$$

At the minimum, the residual is orthogonal to every column of $A$:

$$A^\top (b - A\hat x) = 0 \quad\Longleftrightarrow\quad A^\top A \, \hat x = A^\top b \quad \text{(the normal equations)}.$$

$A\hat x$ is the orthogonal projection of $b$ onto the column space of $A$. The solution is unique when the columns of $A$ are linearly independent.

## Three Ways to Compute It

| Method | Steps | Accuracy |
|---|---|---|
| **QR** | $A = QR$, then solve $R\hat x = Q^\top b$ | Depends on $\kappa(A)$ |
| **Normal equations** | Form $A^\top A$, then Cholesky | Depends on $\kappa(A)^2$ |
| **SVD** | $\hat x = V \Sigma^+ U^\top b$ | Depends on $\kappa(A)$; handles rank deficiency |

Forming $A^\top A$ squares the condition number: with $\kappa(A) = 10^{6}$, the normal equations face $10^{12}$ and can lose twelve of sixteen digits where QR loses six ([Trefethen and Bau (1997)](#ref-trefethen1997), Lecture 19). Julia's `A \ b` on a tall matrix uses QR with column pivoting.

## Polynomial Fitting

Fitting $y \approx c_0 + c_1 t + \dots + c_d t^d$ to points $(t_i, y_i)$ is least squares with the *Vandermonde* design matrix $A_{ij} = t_i^{\,j}$. Its columns become nearly parallel as the degree grows, so its condition number climbs quickly: high-degree fits in the monomial basis are ill-conditioned. Centring and scaling $t$, or orthogonal polynomials, help.

More terms always lower the residual on the data, but past the true degree they fit the noise: the error against the underlying curve, and above all outside the range of the data, grows.

## Connection to Regression

Ordinary least squares regression is this problem with $A$ the design matrix and $b$ the response. Statistical packages add standard errors, which come from $\hat\sigma^2 (A^\top A)^{-1}$, computed from the QR factor as $\hat\sigma^2 (R^\top R)^{-1}$ without forming $A^\top A$.

## References

<a id="ref-trefethen1997"></a>Trefethen, L. N. and Bau, D. (1997). *Numerical Linear Algebra*. Society for Industrial and Applied Mathematics. [doi:10.1137/1.9780898719574](https://doi.org/10.1137/1.9780898719574)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
- [Linear Systems](linear-systems.md) · [Factorisations](factorisations.md) · [Eigenvalues](eigenvalues.md) · [Singular Value Decomposition](singular-values.md)
