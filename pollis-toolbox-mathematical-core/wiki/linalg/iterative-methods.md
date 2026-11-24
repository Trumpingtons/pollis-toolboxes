# Iterative Methods

## When a Factorisation Is Too Much

A direct method factorises $A$ and solves with the factors. For a large sparse matrix, such as a discretised differential equation with millions of unknowns, the factors can hold far more nonzeros than $A$ itself, and the factorisation can exhaust memory and time. Sometimes $A$ is not even stored: it is known only through a routine that returns the product $Av$.

An iterative method improves an approximate solution step by step and touches $A$ only through such products. Each iteration costs about one product with $A$ (or with $A^\top$ too) and a few vector operations, so the cost depends on the number of nonzeros and on how many iterations are needed ([Saad (2003)](#ref-Saa2003a)).

## Krylov Subspaces

Starting from $x_0 = 0$, a Krylov method looks for the $k$-th approximation in the Krylov subspace

$$\mathcal{K}_k(A, b) = \operatorname{span}\{\, b,\ Ab,\ A^2 b,\ \dots,\ A^{k-1} b \,\},$$

and the methods differ in which element of that subspace they pick and in what they require of $A$ ([Saad (2003)](#ref-Saa2003a); [Trefethen and Bau (1997)](#ref-TB1997a)).

| Method | Matrix | What it does |
|---|---|---|
| CG | Symmetric positive definite | Conjugate gradients: in exact arithmetic, the solution in at most $n$ steps ([Hestenes and Stiefel (1952)](#ref-HS1952a)) |
| MINRES | Symmetric, possibly indefinite | Minimises the residual over the subspace, from the Lanczos process ([Paige and Saunders (1975)](#ref-PS1975a)) |
| GMRES | Any square nonsingular matrix | Minimises the residual over the subspace with the Arnoldi process; its storage grows with the iterations, so it is often restarted ([Saad and Schultz (1986)](#ref-SS1986a)) |
| BiCGSTAB | Any square nonsingular matrix | A variant of Bi-CG that avoids the irregular convergence of CG-S ([van der Vorst (1992)](#ref-Vor1992a)) |
| LSQR | Any shape: least squares | Based on the Golub-Kahan bidiagonalisation; analytically equivalent to the standard method of conjugate gradients, with more favourable numerical properties ([Paige and Saunders (1982)](#ref-PS1982a)) |
| LSMR | Any shape: least squares | Analytically equivalent to MINRES on the normal equations, so that $\lVert A^\top r_k \rVert$ decreases monotonically ([Fong and Saunders (2011)](#ref-FS2011a)) |

## Convergence

How fast a Krylov method converges depends on the eigenvalues (or singular values) of $A$ rather than on its size. For CG on a symmetric positive definite $A$ with condition number $\kappa$, the error in the norm $\lVert e \rVert_A = \sqrt{e^\top A e}$ satisfies

$$\frac{\lVert x_k - x \rVert_A}{\lVert x_0 - x \rVert_A} \le 2 \left( \frac{\sqrt{\kappa} - 1}{\sqrt{\kappa} + 1} \right)^{k}$$

([Trefethen and Bau (1997)](#ref-TB1997a); [Saad (2003)](#ref-Saa2003a)). A matrix with a small condition number, or with eigenvalues in a few tight clusters, needs few iterations. The matrix of a discretised differential equation becomes more ill-conditioned as the grid is refined, so the iterations grow with the grid.

## Preconditioning

A preconditioner $M$ is a matrix close to $A$ that is cheap to solve with. The method is then applied to a system such as $M^{-1}Ax = M^{-1}b$, whose matrix is closer to the identity and needs fewer iterations ([Saad (2003)](#ref-Saa2003a)). Common choices:

- **Jacobi**: the diagonal of $A$. Free to build, and helpful when the diagonal entries differ widely.
- **Incomplete factorisations**: LU or Cholesky factors that keep only some of the nonzeros.
- **Algebraic multigrid**: a hierarchy of coarser problems built from the entries of $A$ alone, without a grid ([Ruge and Stüben (1987)](#ref-RS1987a)).

CG and MINRES need a symmetric positive definite preconditioner. GMRES and BiCGSTAB accept one on the left or on the right; on the right, the residual the method measures is the true residual ([Saad (2003)](#ref-Saa2003a)).

## Stopping

A Krylov method stops when the residual $r_k = b - A x_k$ is small, for example when $\lVert r_k \rVert \le \text{atol} + \text{rtol}\,\lVert r_0 \rVert$. A least-squares problem has a residual that does not vanish, so LSQR and LSMR also stop when the normal equations $A^\top r = 0$ hold to the tolerance ([Paige and Saunders (1982)](#ref-PS1982a); [Fong and Saunders (2011)](#ref-FS2011a)). The residual says how well the equations are satisfied; the error in $x$ can be larger by up to the condition number.

## Beyond a Single Square System

Krylov.jl also has methods for problems with more structure ([Montoison and Orban (2023)](#ref-MO2023a)):

- **Symmetric quasi-definite and saddle-point systems** $\begin{bmatrix} M & A \\ A^\top & -N \end{bmatrix}$: TriCG and TriMR work on the blocks, with the orthogonal tridiagonalisation process of [Saunders, Simon and Yip (1988)](#ref-SSY1988a) ([Montoison and Orban (2021)](#ref-MO2021a)).
- **Nonsymmetric partitioned systems** $\begin{bmatrix} \lambda I & A \\ B & \mu I \end{bmatrix}$: GPMR, with storage and work per iteration similar to those of GMRES ([Montoison and Orban (2023b)](#ref-MO2023b)).
- **Adjoint systems** $Ax = b$ and $A^\top y = c$ together: BiLQR for a square $A$ and TriLQR for a rectangular one, which may be used to estimate functionals that involve the solutions of both ([Montoison and Orban (2020)](#ref-MO2020a)).
- **Several right-hand sides**: block methods such as block-GMRES multiply $A$ by several vectors at once.

## In Julia

Each method of Krylov.jl takes the operator and the right-hand side and returns the solution and the statistics of the run:

```julia
using Krylov

x, stats = cg(A, b)        # symmetric positive definite A
x, stats = gmres(A, b)     # any square A
x, stats = lsqr(A, b)      # least squares
stats.niter, stats.solved
```

The operator can be a sparse matrix, a dense one, or any object that defines `size`, `eltype` and `mul!`, so a product computed by a function serves as well as a stored matrix. The vectors can be of any array type, including GPU arrays. A preconditioner is passed as `M` (and `N` for a right one), with `ldiv = true` when it is applied by solving rather than by multiplying.

## References

<a id="ref-FS2011a"></a>Fong, D. C.-L. and Saunders, M. (2011). LSMR: an iterative algorithm for sparse least-squares problems. *SIAM Journal on Scientific Computing* 33(5), 2950–2971. [doi:10.1137/10079687X](https://doi.org/10.1137/10079687X)

<a id="ref-HS1952a"></a>Hestenes, M. R. and Stiefel, E. (1952). Methods of conjugate gradients for solving linear systems. *Journal of Research of the National Bureau of Standards* 49(6), 409. [doi:10.6028/jres.049.044](https://doi.org/10.6028/jres.049.044)

<a id="ref-MO2020a"></a>Montoison, A. and Orban, D. (2020). BiLQ: an iterative method for nonsymmetric linear systems with a quasi-minimum error property. *SIAM Journal on Matrix Analysis and Applications* 41(3), 1145–1166. [doi:10.1137/19M1290991](https://doi.org/10.1137/19M1290991)

<a id="ref-MO2021a"></a>Montoison, A. and Orban, D. (2021). TriCG and TriMR: two iterative methods for symmetric quasi-definite systems. *SIAM Journal on Scientific Computing* 43(4), A2502–A2525. [doi:10.1137/20M1363030](https://doi.org/10.1137/20M1363030)

<a id="ref-MO2023a"></a>Montoison, A. and Orban, D. (2023). Krylov.jl: a Julia basket of hand-picked Krylov methods. *Journal of Open Source Software* 8(89), 5187. [doi:10.21105/joss.05187](https://doi.org/10.21105/joss.05187)

<a id="ref-MO2023b"></a>Montoison, A. and Orban, D. (2023b). GPMR: an iterative method for unsymmetric partitioned linear systems. *SIAM Journal on Matrix Analysis and Applications* 44(1), 293–311. [doi:10.1137/21M1459265](https://doi.org/10.1137/21M1459265)

<a id="ref-PS1975a"></a>Paige, C. C. and Saunders, M. A. (1975). Solution of sparse indefinite systems of linear equations. *SIAM Journal on Numerical Analysis* 12(4), 617–629. [doi:10.1137/0712047](https://doi.org/10.1137/0712047)

<a id="ref-PS1982a"></a>Paige, C. C. and Saunders, M. A. (1982). LSQR: an algorithm for sparse linear equations and sparse least squares. *ACM Transactions on Mathematical Software* 8(1), 43–71. [doi:10.1145/355984.355989](https://doi.org/10.1145/355984.355989)

<a id="ref-RS1987a"></a>Ruge, J. W. and Stüben, K. (1987). Algebraic multigrid. In *Multigrid Methods*, 73–130. Society for Industrial and Applied Mathematics. [doi:10.1137/1.9781611971057.ch4](https://doi.org/10.1137/1.9781611971057.ch4)

<a id="ref-Saa2003a"></a>Saad, Y. (2003). *Iterative Methods for Sparse Linear Systems*. Society for Industrial and Applied Mathematics. [doi:10.1137/1.9780898718003](https://doi.org/10.1137/1.9780898718003)

<a id="ref-SS1986a"></a>Saad, Y. and Schultz, M. H. (1986). GMRES: a generalized minimal residual algorithm for solving nonsymmetric linear systems. *SIAM Journal on Scientific and Statistical Computing* 7(3), 856–869. [doi:10.1137/0907058](https://doi.org/10.1137/0907058)

<a id="ref-SSY1988a"></a>Saunders, M. A., Simon, H. D. and Yip, E. L. (1988). Two conjugate-gradient-type methods for unsymmetric linear equations. *SIAM Journal on Numerical Analysis* 25(4), 927–940. [doi:10.1137/0725052](https://doi.org/10.1137/0725052)

<a id="ref-TB1997a"></a>Trefethen, L. N. and Bau, D. (1997). *Numerical Linear Algebra*. Society for Industrial and Applied Mathematics. [doi:10.1137/1.9780898719574](https://doi.org/10.1137/1.9780898719574)

<a id="ref-Vor1992a"></a>van der Vorst, H. A. (1992). Bi-CGSTAB: a fast and smoothly converging variant of Bi-CG for the solution of nonsymmetric linear systems. *SIAM Journal on Scientific and Statistical Computing* 13(2), 631–644. [doi:10.1137/0913035](https://doi.org/10.1137/0913035)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
- [Linear Systems](linear-systems.md) · [Factorisations](factorisations.md) · [Eigenvalues](eigenvalues.md) · [Singular Value Decomposition](singular-values.md) · [Least Squares](least-squares.md)
