# Symbolic Math — Assumptions

A symbolic result looks like a proof, but it is the output of a program operating under rules and limits of its own.

## Variables Without Assumptions

**Variables** declares symbols with no information about their range. A rule that holds only for some values, such as sqrt(x^2) = x for non-negative x, is then correct only under a condition, and the software may either refuse to apply it or apply it without a warning. Check domain conditions by hand, especially for logs, roots and fractions. A cancellation such as x / x = 1 drops the point x = 0, which matters in limits and in equation solving. Treat a simplified form as valid where the original expression is defined.

## Elementary Antiderivatives Are Not Guaranteed

Many simple functions have no elementary antiderivative, the classic case being exp(-x^2). [Risch (1969)](#ref-Ris1969a) gave a decision procedure for elementary integration. The regression approach here is a different method: it searches a space of candidate terms, so a failure does not prove that no antiderivative exists. A success is checkable, though, since differentiating the result should return the integrand, which is what **Symbolic Check** does. Coefficients found by a regression can be rounded to rationals, so a small error is possible in principle, and a verification step is worthwhile.

## Closed-Form Roots May Not Exist

A polynomial of degree five or more has no general formula in radicals, and a real-world equation mixing polynomial and transcendental terms rarely has a closed-form solution. `symbolic_solve` covers polynomials, with factorisation over exact numbers, and equations reducible by isolation. If the method fails, the equation may still have roots. A floating-point coefficient also weakens the exact approach, since factorisation relies on exact numbers, so enter fractions. An isolating step can introduce or lose solutions, which **Symbolic Check** tests by substituting each root back in.

## Taylor Polynomials Are Local

A Taylor polynomial matches the function's derivatives at one point, up to **Taylor Order**. Good behaviour nearby says nothing about distant values, and for functions like log(1 + x), the series converges only inside a limited radius, so raising the order away from the point can make matters worse. Functions with a singularity or a kink at the point have no such expansion. A limit computed by the algorithm of [Gruntz (1996)](#ref-Gru1996a) is restricted to exp, log and rational operations, so expressions with trigonometric functions may need rewriting or a numerical check.

## References

<a id="ref-Gru1996a"></a>Gruntz, D. (1996). On Computing Limits in a Symbolic Manipulation System. *PhD thesis, ETH Zurich*. [doi:10.3929/ethz-a-001631582](https://doi.org/10.3929/ethz-a-001631582)

<a id="ref-Ris1969a"></a>Risch, R. H. (1969). The Problem of Integration in Finite Terms. *Transactions of the American Mathematical Society* 139(0), 167–189. [doi:10.1090/S0002-9947-1969-0237477-8](https://doi.org/10.1090/S0002-9947-1969-0237477-8)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
