# Game Theory — Evolutionary Games

Evolutionary game theory replaces reasoning players with a population of individuals carrying fixed strategies. A strategy's share grows when it earns more than the population average. No foresight is required, which makes the framework relevant to biology, cultural imitation and learning.

## How Replicator Dynamics Move a Population

Replicator dynamics, formulated by [Taylor and Jonker (1978)](#ref-TJ1978a), state that dx_i / dt = x_i (f_i(x) - x' f(x)), where f(x) = A x is the payoff vector of the symmetric game. Each share grows at a rate equal to its advantage over the average. The simplex of shares is invariant, so shares stay non-negative and sum to one. A strategy absent at the start stays absent. Rest points include every pure state, even unstable ones, and each symmetric Nash equilibrium. Stable rest points are always Nash equilibria, whereas an unstable equilibrium is not reached from nearby states.

## What Makes a Strategy Evolutionarily Stable

A strategy is evolutionarily stable when, in a population that plays it, a small group of mutants earns less than the incumbents. The definition comes from [Maynard Smith and Price (1973)](#ref-SP1973a) and was developed at length in [Maynard Smith (1982)](#ref-Smi1982a). Formally, x is stable if each mutant y earns less against x, or earns the same against x but less against itself. Stability is stronger than being a Nash equilibrium, and every evolutionarily stable strategy is an asymptotically stable rest point of the replicator dynamics, though the converse can fail. Cyclic games such as rock-paper-scissors illustrate how an interior equilibrium may be stable, neutrally stable or unstable, depending on the size of the win and loss payoffs.

## References

<a id="ref-SP1973a"></a>Maynard Smith, J. and Price, G. R. (1973). The Logic of Animal Conflict. *Nature* 246(5427), 15–18. [doi:10.1038/246015a0](https://doi.org/10.1038/246015a0)

<a id="ref-Smi1982a"></a>Maynard Smith, J. (1982). Evolution and the Theory of Games. *Cambridge University Press*. [doi:10.1017/CBO9780511806292](https://doi.org/10.1017/CBO9780511806292)

<a id="ref-TJ1978a"></a>Taylor, P. D. and Jonker, L. B. (1978). Evolutionary stable strategies and game dynamics. *Mathematical Biosciences* 40(1-2), 145–156. [doi:10.1016/0025-5564(78)90077-9](https://doi.org/10.1016/0025-5564(78)90077-9)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Normal-Form Games](normal-form.md)
