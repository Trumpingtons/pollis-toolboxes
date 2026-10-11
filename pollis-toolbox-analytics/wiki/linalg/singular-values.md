# Singular Value Decomposition

## Definition

Every $m \times n$ matrix, of any shape and rank, can be written

$$A = U \Sigma V^\top,$$

with $U$ ($m \times m$) and $V$ ($n \times n$) orthogonal and $\Sigma$ diagonal with the singular values $\sigma_1 \ge \sigma_2 \ge \dots \ge \sigma_{\min(m,n)} \ge 0$. Geometrically, $A$ rotates ($V^\top$), stretches each axis by $\sigma_i$ ($\Sigma$) and rotates again ($U$). The unit sphere becomes an ellipsoid with semi-axes $\sigma_i$.

The singular values are the square roots of the eigenvalues of $A^\top A$; for a symmetric matrix they are the absolute values of its eigenvalues.

## What It Gives

| Quantity | From the SVD |
|---|---|
| 2-norm | $\lVert A \rVert_2 = \sigma_1$ |
| Condition number | $\kappa(A) = \sigma_1 / \sigma_n$ |
| Numerical rank | Number of $\sigma_i$ above a tolerance, by default about $\max(m,n)\,\sigma_1\,\varepsilon$ |
| Pseudo-inverse | $A^+ = V \Sigma^+ U^\top$, inverting only the nonzero $\sigma_i$ |
| Orthonormal bases | Columns of $U$ and $V$ for the four fundamental subspaces |

## Best Low-Rank Approximation

Keeping the first $k$ terms,

$$A_k = \sum_{i=1}^{k} \sigma_i u_i v_i^\top,$$

gives the closest matrix of rank $k$ to $A$, in both the 2-norm and the Frobenius norm ([Eckart and Young (1936)](#ref-eckart1936)):

$$\lVert A - A_k \rVert_2 = \sigma_{k+1}, \qquad \lVert A - A_k \rVert_F = \sqrt{\sigma_{k+1}^2 + \dots + \sigma_{\min(m,n)}^2}.$$

This is the basis of principal components, of image and signal compression, of latent semantic analysis in text and of low-rank models in recommendation.

## Computing It

[Golub and Kahan (1965)](#ref-golub1965) reduce $A$ to bidiagonal form with orthogonal transformations, then find the singular values of the bidiagonal matrix; LAPACK uses refinements of this. The cost is about $4mn^2$ for $m \ge n$, several times a QR. In Julia: `svd(A)` for the factors, `svdvals(A)` for the values only.

## References

<a id="ref-eckart1936"></a>Eckart, C. and Young, G. (1936). The approximation of one matrix by another of lower rank. *Psychometrika* 1(3), 211–218. [doi:10.1007/BF02288367](https://doi.org/10.1007/BF02288367)

<a id="ref-golub1965"></a>Golub, G. H. and Kahan, W. (1965). Calculating the singular values and pseudo-inverse of a matrix. *Journal of the Society for Industrial and Applied Mathematics, Series B: Numerical Analysis* 2(2), 205–224. [doi:10.1137/0702016](https://doi.org/10.1137/0702016)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
- [Linear Systems](linear-systems.md) · [Factorisations](factorisations.md) · [Eigenvalues](eigenvalues.md) · [Least Squares](least-squares.md)
