# Game Theory — Zero-Sum Games

A zero-sum game has payoffs that add to zero in every cell, so its analysis needs only one matrix, with the row player maximising and the column player minimising. Any constant-sum game can be treated in the same way after subtracting the constant.

## How the Minimax Theorem Gives a Game Value

A player's security level is the best payoff that can be guaranteed whatever the opponent does. [von Neumann (1928)](#ref-Neu1928a) proved that with mixed strategies, the row player's maximin level equals the column player's minimax level. The common number is the value of the game. Equilibrium strategies are precisely the security strategies, and any pairing of an optimal row strategy with an optimal column strategy is an equilibrium, so players need no coordination. Several equilibria may exist, and all of them have the same value.

## How Linear Programming Solves a Zero-Sum Game

Finding a security strategy is a linear programme. The row player chooses probabilities x and a level v, maximising v subject to the expected payoff against each column being at least v. The column player's problem is the dual, so strong duality of linear programmes delivers the minimax theorem. JuMP.jl and HiGHS.jl solve these in the **Minimax Solution** action, which scales well to larger matrices, unlike general equilibrium enumeration. Under replicator dynamics, zero-sum interior paths cycle around the equilibrium in place of converging, with the time average approaching equilibrium.

## References

<a id="ref-Neu1928a"></a>von Neumann, J. (1928). Zur Theorie der Gesellschaftsspiele. *Mathematische Annalen* 100(1), 295–320. [doi:10.1007/BF01448847](https://doi.org/10.1007/BF01448847)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Normal-Form Games](normal-form.md)
