# Nonlinear Systems — Decision Guide

The first decision is what is known in advance, and the second is how well behaved the equation is.

## Which Nonlinear Solver Tab to Use

| What you have | Tab | What you get |
|---|---|---|
| One smooth equation and a reasonable first guess | **Scalar Equation** | Fast convergence near a simple root, with safer variants far from it |
| One continuous equation and an interval with a sign change | **Bracketing** | A root inside the interval, with guaranteed convergence |
| Several equations that must hold together | **System of Equations** | A joint solution, using the Jacobian at each step |

## Which Algorithm to Choose for Equations With a Guess

**Newton-Raphson** is the first choice with a good start and an affordable Jacobian. **Trust Region** limits each step to where the local model can be trusted, so it is more robust far from the root, as described in [Nocedal and Wright (2006)](#ref-NW2006a). **Levenberg-Marquardt**, implemented carefully by [Moré (1978)](#ref-Mor1978a), adds damping and tolerates a nearly singular Jacobian, which helps with almost redundant equations. **Broyden** updates an approximate Jacobian, needing fewer derivative evaluations, and it suits problems where derivatives are costly, as shown in [Broyden (1965)](#ref-Bro1965a).

## Which Bracketing Method to Choose

**ITP** is the default and a good general choice. **Brent** uses inverse quadratic interpolation with a bisection fallback, following [Brent (1973)](#ref-Bre1973a), and it has been the reliable standard for decades. **Ridder** fits an exponential and often behaves well on functions that change quickly. **False Position** interpolates linearly and can stall when one end of the bracket stays fixed. **Bisection** halves the bracket at each step, so its cost is predictable, and it is a simple baseline. All these methods keep the root inside the interval, and they differ mainly in the evaluations needed.

## Choosing the Jacobian and Handling Failure

**Automatic** is the right default for a system, since it is exact to machine precision and requires no extra code. **Symbolic** costs more once, for derivation and compilation, and then each step is fast, which pays off when the same small system is solved repeatedly. When a solve fails, plot the problem, improve the start, try **Trust Region** or **Levenberg-Marquardt**, and rescale the equations. A homotopy, moving gradually from an easy problem to the hard one and restarting from each solution, is a further option, as [Judd (1998)](#ref-Jud1998a) describes.

## References

<a id="ref-Bre1973a"></a>Brent, R. P. (1973). Algorithms for Minimization Without Derivatives. *Prentice-Hall*.

<a id="ref-Bro1965a"></a>Broyden, C. G. (1965). A Class of Methods for Solving Nonlinear Simultaneous Equations. *Mathematics of Computation* 19(92), 577–593. [doi:10.1090/S0025-5718-1965-0198670-6](https://doi.org/10.1090/S0025-5718-1965-0198670-6)

<a id="ref-Jud1998a"></a>Judd, K. L. (1998). Numerical Methods in Economics. *MIT Press*.

<a id="ref-Mor1978a"></a>Moré, J. J. (1978). The Levenberg-Marquardt Algorithm: Implementation and Theory. *Numerical Analysis, Lecture Notes in Mathematics 630*, 105–116. [doi:10.1007/BFb0067700](https://doi.org/10.1007/BFb0067700)

<a id="ref-NW2006a"></a>Nocedal, J. and Wright, S. J. (2006). Numerical Optimization. *Springer*. [doi:10.1007/978-0-387-40065-5](https://doi.org/10.1007/978-0-387-40065-5)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
