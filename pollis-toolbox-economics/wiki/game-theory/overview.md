# Game Theory — Overview

Four tabs cover four families of two-player games with finitely many actions. All of them build the same `NormalFormGame` object, so most actions work across tabs, and each tab differs in what it asks you to enter.

## The Normal Form Tab

The **Normal Form** tab takes **Row Payoffs A** and **Column Payoffs B**, two matrices of the same shape, where entry (i, j) gives each player's payoff when row plays i and column plays j. Payoffs can be arbitrary, covering coordination, entry, pricing and conflict games. `support_enumeration` returns all Nash equilibria of a nondegenerate game, pure and mixed, in the sense of [Nash (1950)](#ref-Nas1950a). A separate page, Normal-Form Games, describes the method.

## The Zero Sum Tab

The **Zero Sum** tab takes one **Payoff Matrix A**, and the column player receives minus that payoff, so each player's gain is the other's loss. The minimax theorem of [von Neumann (1928)](#ref-Neu1928a) gives such a game a single value, which every equilibrium shares. The **Minimax Solution** action computes security strategies by linear programming. A separate page, Zero-Sum Games, covers the mathematics. Equilibria are also computed by support enumeration in this tab, so the two routes can be compared.

## The Evolutionary Tab

The **Evolutionary** tab reads a **Payoff Matrix A** as a symmetric game: entry (i, j) is the payoff to strategy i when it meets strategy j. **Initial State x0** gives population shares that are non-negative and sum to 1. Replicator dynamics, from [Taylor and Jonker (1978)](#ref-TJ1978a), make a strategy grow when it earns more than the population average. The panel integrates that equation numerically and draws the path with BaryPlots.jl for three strategies. A separate page, Evolutionary Games, explains the stability concept.

## The Potential Tab

The **Potential** tab takes one matrix, **Potential P**, and gives both players the same payoff from it. An exact potential game, as defined by [Monderer and Shapley (1996)](#ref-MS1996a), is one where any player's change in payoff from a unilateral deviation equals the change in a single function. Identical interests form the simplest example, so the tab analyses that case directly. Pure equilibria always exist in such a game, because the action pair that maximises the potential cannot be improved on by either player.

## Common Workflow for Solving a Game

1. Choose the tab that matches the structure of the payoffs, then enter them.
2. Look at the game through **Payoff Heatmap**, **Best Response Plot** and **Strategy Dynamics**.
3. Run **Dominance Check** and **Pure Nash Equilibria**.
4. List all solutions with **Mixed Nash Equilibria** or **Minimax Solution**.
5. Confirm results with **Nash Verification**.
6. Read **Support Analysis**, **Equilibrium Welfare** and, for populations, **ESS Check** and **Long-Run Outcomes**.

## References

<a id="ref-MS1996a"></a>Monderer, D. and Shapley, L. S. (1996). Potential Games. *Games and Economic Behavior* 14(1), 124–143. [doi:10.1006/game.1996.0044](https://doi.org/10.1006/game.1996.0044)

<a id="ref-Nas1950a"></a>Nash, J. F. (1950). Equilibrium Points in N-Person Games. *Proceedings of the National Academy of Sciences* 36(1), 48–49. [doi:10.1073/pnas.36.1.48](https://doi.org/10.1073/pnas.36.1.48)

<a id="ref-TJ1978a"></a>Taylor, P. D. and Jonker, L. B. (1978). Evolutionary stable strategies and game dynamics. *Mathematical Biosciences* 40(1-2), 145–156. [doi:10.1016/0025-5564(78)90077-9](https://doi.org/10.1016/0025-5564(78)90077-9)

<a id="ref-Neu1928a"></a>von Neumann, J. (1928). Zur Theorie der Gesellschaftsspiele. *Mathematische Annalen* 100(1), 295–320. [doi:10.1007/BF01448847](https://doi.org/10.1007/BF01448847)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
