# Linear Algebra — Interpretation

## Solutions

The solution $x$ of $Ax = b$ expresses $b$ as a combination of the columns of $A$: $b = x_1 a_1 + \dots + x_n a_n$. In an input-output model, $x$ is the output each sector must produce to meet final demand $b$; in a market model, the prices that clear every market at once.

## Determinant and Trace

- $\det A$ is the factor by which $A$ scales volume. Zero means $A$ flattens space onto a lower dimension: no unique solution. Its sign says whether $A$ reverses orientation.
- $\operatorname{tr} A = \sum_i \lambda_i$ and $\det A = \prod_i \lambda_i$: two quick checks on computed eigenvalues.

## Eigenvalues

For the recursion $x_{t+1} = A x_t$, write the start as a combination of eigenvectors; then $x_t = \sum_i c_i \lambda_i^{\,t} v_i$:

| Eigenvalue | Along its eigenvector, each step |
|---|---|
| $\lvert\lambda\rvert > 1$ | Grows |
| $\lvert\lambda\rvert < 1$ | Decays; half-life $\log 2 / \lvert \log \lvert\lambda\rvert \rvert$ steps |
| $\lambda < 0$ | Changes sign: oscillation with period 2 |
| Complex $\lambda = r e^{i\theta}$ | Rotates by $\theta$ and scales by $r$ |

The eigenvalue largest in modulus dominates in the long run, and $x_t$ turns towards its eigenvector. For a symmetric matrix, the eigenvalues give the curvature of the quadratic form $x^\top A x$: all positive means a minimum (positive definite), mixed signs a saddle.

## Singular Values

The singular values are the lengths of the semi-axes of the ellipse (ellipsoid) into which $A$ maps the unit sphere.

- **Rank**: the number of singular values above a tolerance.
- **Condition number**: $\sigma_1 / \sigma_n$.
- **Energy**: $\sigma_i^2 / \sum_j \sigma_j^2$ is the share of $\lVert A \rVert_F^2$ carried by component $i$. For a centred data matrix, this is the share of variance explained by the $i$-th principal component.
- **Low rank**: the error of the best rank-$k$ approximation is $\sigma_{k+1}$ ([Eckart and Young (1936)](#ref-eckart1936)).

## Least-Squares Coefficients

Each coefficient is the change in the fitted value per unit change in its column, the others held fixed. The fitted values $A\hat x$ are the orthogonal projection of $b$ onto the column space of $A$; the residual is what lies outside it. $R^2 = 1 - \lVert r \rVert^2 / \lVert b - \bar b \rVert^2$ is the share of the variation the columns explain.

## References

<a id="ref-eckart1936"></a>Eckart, C. and Young, G. (1936). The approximation of one matrix by another of lower rank. *Psychometrika* 1(3), 211–218. [doi:10.1007/BF02288367](https://doi.org/10.1007/BF02288367)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md)
- [Linear Systems](linear-systems.md) · [Factorisations](factorisations.md) · [Eigenvalues](eigenvalues.md) · [Singular Value Decomposition](singular-values.md) · [Least Squares](least-squares.md)
