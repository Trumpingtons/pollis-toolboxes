# Merge or Be Bought

A case for Pollis's Simulation Games. Three listed bicycle makers, each run by a team as its board. Each quarter a board can bid for the shares of its rivals and sets the lowest bid it would accept for its own. The best return for the original shareholders after six quarters wins, whether the company is still independent or was bought.

Installing it adds the case to **Compose > Collaboration > Simulation Games > Host a Game...**. The facilitator hosts the game and the players join it with its invitation; each round runs the case's Julia model on the facilitator's computer.

## The Case

| | |
|---|---|
| Rounds | 6 quarters |
| Teams | 3: Larkspur Cycles, Tamberlin Bikes and Orvane Wheelworks |
| Decisions | a bid per share for each rival still listed, and a walk-away price for the company's own shares |
| Private information | each board's estimate of the yearly savings of buying each rival, and its own accounts |
| Teams organised as | Board Members (everyone sets everything), or Officers: Chief Executive, Strategy and Finance, each with its own briefing and decisions |
| News | rising interest rates, a cycling boom, and investors paying less for earnings, each read by some roles only |
| Negotiations | boards can write to each other; the facilitator reads what they write |
| Debrief | the standings, each round's results, the bids, the news and the negotiations, five tables and questions for the class |

A company that is bought leaves the game, and its shareholders keep the price they were paid.

## Files

- `games/merge-or-be-bought/case.toml`: the rounds, teams, decisions, results, briefings, news and the model's parameters.
- `games/merge-or-be-bought/model.jl`: the model: earnings, the market's value of each company, bids and deals, and the savings of a merger.
- `games/merge-or-be-bought/briefing.md` and `briefings/`: what the players read.
- `games/merge-or-be-bought/debrief-questions.md`: questions for the debrief.

## Requirements

Pollis, and Julia on the facilitator's computer. The players need only Pollis.

## License

AGPL-3.0; model.jl is MIT.
