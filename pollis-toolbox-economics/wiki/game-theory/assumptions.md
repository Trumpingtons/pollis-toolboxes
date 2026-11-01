# Game Theory — Assumptions

Equilibrium predictions depend on strong assumptions about what players know and how they reason, and these differ between the static and evolutionary tabs.

## Rationality and Common Knowledge

A Nash equilibrium assumes that each player maximises expected payoff given correct beliefs about the other's strategy. Payoffs and the structure of the game are taken as known to both. An equilibrium describes a stable agreement, but the theory says little about how players reach it, and experiments often find behaviour far from the prediction in one-shot play. With several equilibria, the model alone does not say which will occur, as [Osborne and Rubinstein (1994)](#ref-OR1994a) emphasise. Treat a computed equilibrium as a candidate outcome, since real players may not be fully rational.

## Payoffs Must Measure What Players Care About

Entries in a payoff matrix are utilities and not necessarily money. Mixed strategy calculations rely on expected utility, so scale matters in mixed equilibria: a transformation that preserves ranking but not ratios of differences can change them, whereas pure equilibria depend only on rankings. Social preferences and risk aversion should enter through the payoffs themselves. The players' payoffs at each cell are entered side by side in the **Normal Form** tab, so the row and column indices have to match in both matrices, a common source of input errors.

## Nondegeneracy in Support Enumeration

`support_enumeration` tests pairs of action supports of equal size, which finds all equilibria only in a nondegenerate game. Degenerate games have ties in payoffs that create a continuum of equilibria or unequal supports, and the routine can then miss solutions. Integer payoffs with many repeated values are a frequent cause. **Support vs Vertex Enumeration** gives a check on this: if routines disagree, degeneracy is a likely explanation. In that situation, small perturbations of payoffs can restore genericity, at the cost of changing the game slightly.

## Population Assumptions in Replicator Dynamics

Replicator dynamics assume a very large population, random matching and strategies that spread in proportion to their payoff advantage. No player reasons about the future, and nobody mutates during the dynamics, so an extinct strategy never returns: a pure starting state stays where it is. Players in the **Evolutionary** tab belong to one population with symmetric payoffs. The numerical integration uses small Euler steps with a fixed horizon, so paths that move slowly may not have reached a rest point when the run ends.

## References

<a id="ref-OR1994a"></a>Osborne, M. J. and Rubinstein, A. (1994). A Course in Game Theory. *MIT Press (freely available online)*. [Link](https://arielrubinstein.org/gt/arielDocs/)

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
