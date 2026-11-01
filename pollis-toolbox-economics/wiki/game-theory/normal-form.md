# Game Theory — Normal-Form Games

A normal-form game lists players, their actions and a payoff for every combination of actions. With two players, this is a pair of matrices, one per player, indexed by the same row and column actions. Mixed strategies are probability distributions over actions.

## How a Nash Equilibrium Is Defined and Found

A pair of strategies is a Nash equilibrium when each is a best response to the other, so neither player gains by changing alone. [Nash (1951)](#ref-Nas1951a) proved that every finite game has at least one, once mixed strategies are allowed. Support enumeration searches pairs of action subsets of equal size. For each pair, it solves the linear equations that make the opponent indifferent among the supported actions, then checks that probabilities are non-negative and that no outside action does better. Vertex enumeration searches the corners of the best-response polytopes in place of supports.

## Why Generic Games Have an Odd Number of Equilibria

Almost every finite game, drawn at random, has a finite and odd number of Nash equilibria. Exceptions need exact ties in payoffs, and those ties can produce an even count or a continuum of equilibria. Because of this, a normal-form game with two strict pure equilibria usually has a third, mixed one between them. The path of [Lemke and Howson (1964)](#ref-LH1964a) proved constructively that a bimatrix game has an equilibrium: the algorithm follows edges of the polytopes from an artificial starting point until it reaches an equilibrium.

## References

<a id="ref-LH1964a"></a>Lemke, C. E. and Howson, J. T. (1964). Equilibrium Points of Bimatrix Games. *Journal of the Society for Industrial and Applied Mathematics* 12(2), 413–423. [doi:10.1137/0112033](https://doi.org/10.1137/0112033)

<a id="ref-Nas1951a"></a>Nash, J. (1951). Non-Cooperative Games. *Annals of Mathematics* 54(2), 286. [doi:10.2307/1969529](https://doi.org/10.2307/1969529)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Zero-Sum Games](zero-sum.md)
