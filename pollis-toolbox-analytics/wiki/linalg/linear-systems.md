# Linear Systems

## The Problem

Given a square matrix $A \in \mathbb{R}^{n \times n}$ and a vector $b$, find $x$ with

$$Ax = b.$$

A unique solution exists exactly when $A$ is nonsingular: $\det A \neq 0$, equivalently $\operatorname{rank} A = n$, equivalently no eigenvalue or singular value is zero. Otherwise there are no solutions or infinitely many.

## Gaussian Elimination

Elimination subtracts multiples of each row from the rows below until $A$ is upper triangular, then solves from the bottom up. Recorded as a factorisation, it is $PA = LU$: $L$ lower triangular with the multipliers, $U$ upper triangular, $P$ the row swaps. *Partial pivoting* swaps in the largest available entry at each step so the multipliers stay at most 1 in size, which keeps rounding errors small in practice ([Golub and Van Loan (2013)](#ref-golub2013)).

Solving then takes two triangular solves:

$$Ly = Pb, \qquad Ux = y.$$

## The Backslash Operator

In Julia, `A \ b` solves the system. For a plain dense matrix it checks the structure first: triangular matrices are solved directly, symmetric ones go to a symmetric factorisation (Cholesky when positive definite, Bunch-Kaufman otherwise), and anything else to LU. The same operator on a tall matrix solves a least-squares problem.

## Cost

| Step | Operations |
|---|---|
| LU factorisation | $\tfrac{2}{3}n^3$ |
| Each solve with the factors | $2n^2$ |
| Explicit inverse | $2n^3$ |

For $n = 1000$, a factorisation takes well under a second; each further right-hand side costs about a thousandth of that.

## Accuracy

LU with partial pivoting is backward stable in practice: the computed $\hat x$ solves $(A + \Delta A)\hat x = b$ with $\lVert \Delta A \rVert / \lVert A \rVert$ near machine precision ([Higham (2002)](#ref-higham2002)). The forward error is then bounded by the condition number:

$$\frac{\lVert \hat x - x \rVert}{\lVert x \rVert} \lesssim \kappa(A) \, \varepsilon_{\text{machine}}.$$

## Example Uses

- **Input-output models**: gross output $x$ that meets final demand $d$ given the technical coefficients $C$: $(I - C)x = d$.
- **Market equilibrium** with linear supply and demand in several goods.
- **Inside other methods**: each Newton step for a nonlinear system and each implicit step of a stiff ODE solver is a linear solve.

## References

<a id="ref-golub2013"></a>Golub, G. H. and Van Loan, C. F. (2013). *Matrix Computations*, 4th edition. Johns Hopkins University Press.

<a id="ref-higham2002"></a>Higham, N. J. (2002). *Accuracy and Stability of Numerical Algorithms*, 2nd edition. Society for Industrial and Applied Mathematics. [doi:10.1137/1.9780898718027](https://doi.org/10.1137/1.9780898718027)

## See Also
- [Factsheet](factsheet.md) · [Overview](overview.md) · [Assumptions](assumptions.md) · [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
- [Factorisations](factorisations.md) · [Eigenvalues](eigenvalues.md) · [Singular Value Decomposition](singular-values.md) · [Least Squares](least-squares.md)
