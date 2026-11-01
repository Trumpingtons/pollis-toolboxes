# Game Theory — Interpretation

Interpretation asks what an equilibrium means for the players and whether that outcome is good for them.

## Reading Mixed Equilibria and Supports

**Mixed Nash Equilibria** lists every equilibrium with each player's strategy and expected payoff, and **Support Analysis** shows why mixing is optimal: every action in a player's support earns the same expected payoff against the opponent's mix. Mixing probabilities are determined by the other player's payoffs and not the player's own. Raising a player's payoff from one action thus changes the opponent's mixture rather than that player's. A mixed equilibrium may also be read as population shares, or as a belief about the opponent, and it need not mean actual randomisation.

## Reading the Best Response Plot

**Best Response Plot** draws both best-response correspondences in the (q, p) square for a 2 by 2 game, and their crossings are the equilibria. Three crossings often mean two pure equilibria and one mixed equilibrium between them, which is the classic pattern of a coordination game. A single interior crossing implies pure conflict. Larger games show the row player's expected payoff from each action as the column player's strategy varies. The upper envelope of those lines marks the best response, and the kinks mark the mixtures at which the row player is indifferent.

## Reading Equilibrium Welfare

**Equilibrium Welfare** compares the payoffs and total welfare at each equilibrium with the best total payoff of any action pair, and it flags whether an equilibrium is Pareto-dominated by another. A gap between equilibrium welfare and the best cell is the cost of decentralised decisions, as seen in the prisoner's dilemma. Selecting among equilibria is a separate question: a Pareto-dominant equilibrium may seem natural, but a safer one may attract players who doubt each other. In the **Potential** tab, the action also reports the potential's maximiser.

## Reading Long-Run Outcomes and Evolutionary Stability

**Long-Run Outcomes** runs replicator dynamics from 200 random starting states and reports where play ends up and how often, an estimate of the basins of attraction. In a zero-sum game the dynamics cycle, so the action reports the time average, which approaches the equilibrium. **ESS Check** tests the concept of [Maynard Smith and Price (1973)](#ref-SP1973a): a symmetric equilibrium x resists every mutant that would earn less against x, or equally against x but less against itself. In an asymmetric game, only strict equilibria are evolutionarily stable, so mixed equilibria of those games fail the check.

## References

<a id="ref-SP1973a"></a>Maynard Smith, J. and Price, G. R. (1973). The Logic of Animal Conflict. *Nature* 246(5427), 15–18. [doi:10.1038/246015a0](https://doi.org/10.1038/246015a0)

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
