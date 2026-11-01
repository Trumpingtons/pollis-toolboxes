# Game Theory — Diagnostics

Diagnostics confirm that a claimed equilibrium is one, and show how much of the game can be discarded before solving it.

## Reading the Pure Nash Equilibria Check

**Pure Nash Equilibria** finds all pure-strategy equilibria by exhaustive search, with their payoffs and a flag for whether each one is strict, meaning that every deviation strictly loses. A strict equilibrium is more robust to small payoff errors and is a candidate for evolutionary stability. A weak equilibrium is vulnerable to any small perturbation, since some player has an alternative that earns the same. No pure equilibrium at all means that the solutions are mixed, as in games of pure conflict, and the **Mixed Nash Equilibria** action is then needed.

## Reading Nash Verification

**Nash Verification** reports for each equilibrium found the largest gain either player could obtain by deviating, along with the `is_nash` check from GameTheory.jl. The gain should be zero up to rounding error. A clearly positive gain means that a strategy is not a best response, usually because of an input mistake or a degenerate game. The check is also a good way to test a candidate found by hand or taken from a publication: enter the payoffs, and compare the deviation gain at the stated strategies.

## Reading the Dominance Check

**Dominance Check** carries out iterated elimination of actions strictly dominated by a pure or mixed action. No equilibrium ever uses an eliminated action, so a removal reduces the game without loss, and some games solve entirely by this procedure. Domination by a mixture can remove an action that no single pure action beats. Weak dominance is not used, because eliminating weakly dominated actions can remove equilibria and can depend on the order of removal. A game with nothing to remove is common and is no sign of an error.

## Comparing Algorithms and Counts

**Support vs Vertex Enumeration** compares the equilibria from support enumeration, vertex enumeration and the Lemke-Howson path, with run times. The path of [Lemke and Howson (1964)](#ref-LH1964a) finds one equilibrium, so it is fast and useful for larger matrices but does not list all of them. **Random Game Baseline** compares the number of equilibria with that of 500 random games of the same size, which generically have an odd number. An even count in the game at hand is a warning sign of degeneracy, and an unusually large count signals a coordination structure.

## References

<a id="ref-LH1964a"></a>Lemke, C. E. and Howson, J. T. (1964). Equilibrium Points of Bimatrix Games. *Journal of the Society for Industrial and Applied Mathematics* 12(2), 413–423. [doi:10.1137/0112033](https://doi.org/10.1137/0112033)

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
