# Game Theory — Decision Guide

The right tab follows from how the payoffs are structured and from whether players reason or a population adapts.

## Which Game Model to Choose

| Situation | Tab | Solution you get |
|---|---|---|
| Two players, finitely many actions and arbitrary payoffs | **Normal Form** | All pure and mixed Nash equilibria |
| One player's gain is the other's loss | **Zero Sum** | The value of the game and optimal mixed strategies |
| A large population matched repeatedly in a symmetric game | **Evolutionary** | Replicator paths, rest points and evolutionarily stable states |
| Every unilateral change in payoff mirrored by one function | **Potential** | Pure equilibria at local maxima of the potential |

## Which Equilibrium Algorithm to Use

`support_enumeration` lists all equilibria of a nondegenerate game and is the panel's default. `vertex_enumeration` reaches the same list by a different route, through the corners of the best-response polytopes, at a run time that depends on their geometry. `lemke_howson` finds only one, quickly, which is enough when any equilibrium serves. [Govindan and Wilson (2004)](#ref-GW2004a) describe another approach based on polymatrix approximation, which targets larger games and is not among the panel's actions. Use **Support vs Vertex Enumeration** to see how these behave on the game at hand.

## How to Choose Among Several Equilibria

Multiplicity is the rule in coordination games, and the theory gives criteria without giving a unique answer. Payoff dominance favours the equilibrium best for both, seen in **Equilibrium Welfare**. Dynamic stability favours outcomes with a large basin, seen in **Long-Run Outcomes**, and an interior mixed equilibrium of a coordination game is usually unstable. Dominance arguments from **Dominance Check** remove some candidates before any comparison. Context matters too, for example convention, communication before play, or a focal point, which lie outside the matrices. [Fudenberg and Tirole (1991)](#ref-FT1991a) survey formal refinements.

## Static Equilibrium or Evolutionary Dynamics

A static analysis suits a one-time interaction among informed players. A population view suits repeated, anonymous interactions with imitation or selection, and it was developed for animal contests in [Maynard Smith (1982)](#ref-Smi1982a). The two views are linked: an evolutionarily stable state is a Nash equilibrium, and a stable rest point of the replicator dynamics is one as well. The reverse does not always hold, so an equilibrium may be unreachable under adaptation. Reporting both is often helpful when a game has several equilibria, because adaptation offers one way to select among them.

## References

<a id="ref-FT1991a"></a>Fudenberg, D. and Tirole, J. (1991). Game Theory. *MIT Press*. [Link](https://mitpress.mit.edu/9780262061414/game-theory/)

<a id="ref-GW2004a"></a>Govindan, S. and Wilson, R. (2004). Computing Nash Equilibria by Iterated Polymatrix Approximation. *Journal of Economic Dynamics and Control* 28(7), 1229–1241. [doi:10.1016/S0165-1889(03)00108-8](https://doi.org/10.1016/S0165-1889(03)00108-8)

<a id="ref-Smi1982a"></a>Maynard Smith, J. (1982). Evolution and the Theory of Games. *Cambridge University Press*. [doi:10.1017/CBO9780511806292](https://doi.org/10.1017/CBO9780511806292)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
