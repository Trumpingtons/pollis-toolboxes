# Linear Algebra — Overview

## Why Matrices

A matrix $A \in \mathbb{R}^{m \times n}$ is a linear map: it takes a vector $x \in \mathbb{R}^n$ to $Ax \in \mathbb{R}^m$. Almost every computation in applied mathematics, statistics and economics reduces to a few questions about such maps:

- **Which $x$ gives a chosen output?** Solve $Ax = b$ (a linear system), or, when no $x$ fits exactly, the closest one (least squares).
- **What does $A$ do to space?** Its eigenvalues and eigenvectors say which directions it only stretches; its singular values say how much it stretches in every direction.
- **How reliable is the answer?** The condition number says how much rounding and data errors can grow.

## Factorise, Then Solve

Numerical linear algebra never inverts a matrix to solve a system. It writes $A$ as a product of matrices that are easy to work with, triangular, orthogonal or diagonal, and solves with those ([Trefethen and Bau (1997)](#ref-trefethen1997); [Golub and Van Loan (2013)](#ref-golub2013)):

| Factorisation | Form | Used for |
|---|---|---|
| LU | $PA = LU$ | General square systems, determinants |
| Cholesky | $A = R^\top R$ | Symmetric positive definite systems: covariance matrices, normal equations |
| QR | $A = QR$ | Least squares, orthonormal bases |
| Eigendecomposition | $A = V \Lambda V^{-1}$ | Dynamics, stability, quadratic forms |
| SVD | $A = U \Sigma V^\top$ | Rank, conditioning, low-rank approximation, pseudo-inverse |

A factorisation costs about $n^3$ operations for an $n \times n$ matrix; each solve with it afterwards costs only about $n^2$. Factorise once, solve many times.

## Floating Point

Computers hold about 16 significant decimal digits. Stable algorithms, such as LU with partial pivoting, Householder QR ([Householder (1958)](#ref-householder1958)) and the QR algorithm for eigenvalues ([Francis (1961)](#ref-francis1961)), give the exact answer to a problem within rounding of the one posed ([Higham (2002)](#ref-higham2002)). Whether that answer is close to the true one then depends on the problem alone, through its condition number.

## In Julia

Julia's `LinearAlgebra` makes the structure of a matrix part of its type. `Symmetric(A)`, `Diagonal(d)` or `UpperTriangular(A)` send each operation to the method for that structure, and `A \ b` inspects a plain matrix to choose one ([Bezanson, Edelman, Karpinski and Shah (2017)](#ref-bezanson2017)).

## References

<a id="ref-bezanson2017"></a>Bezanson, J., Edelman, A., Karpinski, S. and Shah, V. B. (2017). Julia: a fresh approach to numerical computing. *SIAM Review* 59(1), 65–98. [doi:10.1137/141000671](https://doi.org/10.1137/141000671)

<a id="ref-francis1961"></a>Francis, J. G. F. (1961). The QR transformation: a unitary analogue to the LR transformation, part 1. *The Computer Journal* 4(3), 265–271. [doi:10.1093/comjnl/4.3.265](https://doi.org/10.1093/comjnl/4.3.265)

<a id="ref-golub2013"></a>Golub, G. H. and Van Loan, C. F. (2013). *Matrix Computations*, 4th edition. Johns Hopkins University Press.

<a id="ref-higham2002"></a>Higham, N. J. (2002). *Accuracy and Stability of Numerical Algorithms*, 2nd edition. Society for Industrial and Applied Mathematics. [doi:10.1137/1.9780898718027](https://doi.org/10.1137/1.9780898718027)

<a id="ref-householder1958"></a>Householder, A. S. (1958). Unitary triangularization of a nonsymmetric matrix. *Journal of the ACM* 5(4), 339–342. [doi:10.1145/320941.320947](https://doi.org/10.1145/320941.320947)

<a id="ref-trefethen1997"></a>Trefethen, L. N. and Bau, D. (1997). *Numerical Linear Algebra*. Society for Industrial and Applied Mathematics. [doi:10.1137/1.9780898719574](https://doi.org/10.1137/1.9780898719574)

## See Also
- [Factsheet](factsheet.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
- [Linear Systems](linear-systems.md) · [Factorisations](factorisations.md) · [Eigenvalues](eigenvalues.md) · [Singular Value Decomposition](singular-values.md) · [Least Squares](least-squares.md)
