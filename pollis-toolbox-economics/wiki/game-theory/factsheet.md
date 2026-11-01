# Game Theory — Factsheet

The Game Theory panel analyses strategic situations, in which each player's best choice depends on what the others do. A game is entered as payoff matrices, and the panel finds its equilibria, the value of a zero-sum game, or the long-run behaviour of a population. GameTheory.jl from QuantEcon, described in [QuantEcon (2020)](#ref-Qua2020a), supplies the solvers, and BaryPlots.jl draws population paths on the simplex.

| | |
|---|---|
| **Purpose** | Solve finite two-player games and study how strategies spread in a population |
| **Julia stack** | GameTheory.jl, BaryPlots.jl, JuMP.jl with HiGHS.jl for linear programmes, Plots.jl |
| **Models** | Normal Form, Zero Sum, Evolutionary, Potential |
| **Output** | Nash equilibria and payoffs, security strategies and game values, basins of attraction, evolutionary stability |
| **Key choice** | The kind of game, which decides what solution concept and which dynamics apply |

## When to Use a Game Model

A game model fits a situation with a few decision makers whose payoffs depend on one another's actions: firms choosing whether to enter a market, bidders, inspectors and inspected, or drivers choosing routes. It also fits a large population in which successful strategies spread. Explicit payoff matrices make incentives visible and comparable. Textbook treatments in [Osborne and Rubinstein (1994)](#ref-OR1994a) and [Fudenberg and Tirole (1991)](#ref-FT1991a) extend these ideas much further. When one agent decides without strategic rivals, an optimisation panel is the better tool, since no equilibrium needs finding.

## What the Game Theory Panel Does Not Cover

The panel is for finite games in which two players choose at the same time, once, with complete information about payoffs. Extensive-form games with sequential moves, incomplete information, repeated games and auctions are not available as tabs, though some can be rewritten as a larger normal form. A population game has one population with symmetric payoffs. Solvers enumerate candidate supports, so run time grows quickly with the number of actions, and the panel suits small and medium matrices. Continuous action spaces are outside its scope.

## References

<a id="ref-FT1991a"></a>Fudenberg, D. and Tirole, J. (1991). Game Theory. *MIT Press*. [Link](https://mitpress.mit.edu/9780262061414/game-theory/)

<a id="ref-OR1994a"></a>Osborne, M. J. and Rubinstein, A. (1994). A Course in Game Theory. *MIT Press (freely available online)*. [Link](https://arielrubinstein.org/gt/arielDocs/)

<a id="ref-Qua2020a"></a>QuantEcon (2020). GameTheory.jl: A Julia package for game theory. *GitHub*. [Link](https://github.com/QuantEcon/GameTheory.jl)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
