# Eigenvalues

## Definition

A nonzero vector $v$ is an eigenvector of the square matrix $A$, with eigenvalue $\lambda$, when

$$Av = \lambda v.$$

$A$ only stretches $v$, by the factor $\lambda$. The eigenvalues are the roots of the characteristic polynomial $\det(A - \lambda I) = 0$, so an $n \times n$ matrix has $n$ of them, counted with multiplicity, possibly complex. When there are $n$ independent eigenvectors, $A = V \Lambda V^{-1}$.

## Symmetric Matrices

If $A = A^\top$, every eigenvalue is real and the eigenvectors can be chosen orthonormal: $A = Q \Lambda Q^\top$ (the spectral theorem). The signs of the eigenvalues decide the shape of the quadratic form $x^\top A x$:

| Eigenvalues | Matrix | Quadratic form |
|---|---|---|
| All $> 0$ | Positive definite | A bowl: unique minimum |
| All $\ge 0$ | Positive semidefinite | A bowl or a trough |
| Mixed signs | Indefinite | A saddle |
| All $< 0$ | Negative definite | An upturned bowl: unique maximum |

This is the second-order condition of optimisation, applied to the Hessian.

## Computing Them

Eigenvalues are never found from the characteristic polynomial: its roots are extremely sensitive to rounding in its coefficients. LAPACK reduces $A$ to Hessenberg (or, if symmetric, tridiagonal) form and runs the shifted QR algorithm ([Francis (1961)](#ref-francis1961)), which converges to a triangular matrix with the eigenvalues on its diagonal. In Julia: `eigen(A)`, `eigvals(A)`, and `eigen(Symmetric(A))` for the faster symmetric routine.

## The Power Method

Repeatedly multiplying a vector by $A$ and normalising,

$$x_{k+1} = \frac{A x_k}{\lVert A x_k \rVert},$$

converges to the eigenvector of the eigenvalue largest in modulus, at a rate set by $\lvert \lambda_2 / \lambda_1 \rvert$. It is the simplest eigenvalue method and the idea behind PageRank and the long-run distribution of a Markov chain.

## Bounds Without Computing: Gershgorin

Every eigenvalue lies in at least one disc centred at a diagonal entry $a_{ii}$ with radius $\sum_{j \ne i} \lvert a_{ij} \rvert$. A strictly diagonally dominant matrix, whose discs exclude zero, is therefore nonsingular.

## Example Uses

- **Linear dynamics** $x_{t+1} = Ax_t$: stable when every $\lvert\lambda\rvert < 1$; the VAR companion matrix and Markov transition matrices are of this kind.
- **Principal components**: the eigenvectors of a covariance matrix.
- **Second-order conditions**: the eigenvalues of a Hessian.

## References

<a id="ref-francis1961"></a>Francis, J. G. F. (1961). The QR transformation: a unitary analogue to the LR transformation, part 1. *The Computer Journal* 4(3), 265–271. [doi:10.1093/comjnl/4.3.265](https://doi.org/10.1093/comjnl/4.3.265)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
- [Linear Systems](linear-systems.md) · [Factorisations](factorisations.md) · [Singular Value Decomposition](singular-values.md) · [Least Squares](least-squares.md)
