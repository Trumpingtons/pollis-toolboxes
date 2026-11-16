# Grow a Chocolate Chain

A case for Pollis's Simulation Games. Rival teams each run a chocolate brand in one country, and make every tablet they sell in their own shops. Each year they set their price, beans, shops, staff and marketing. The highest cumulative profit after five years wins.

Installing it adds the case to **Compose > Collaboration > Simulation Games > Host a Game...**. The facilitator hosts the game and the players join it with its invitation; each round runs the case's Julia model on the facilitator's computer.

## The Case

| | |
|---|---|
| Rounds | 5 years |
| Teams | 2 to 6 |
| Decisions | price, beans, shops, staff per shop, marketing |
| Teams organised as | Board Members (everyone sets everything), or Departments: Chief Executive, Marketing, Sourcing and Finance, each with its own briefing and decisions |
| News | rising cacao prices, rising rents, and a television series on craft chocolate, each read by some roles only |
| Negotiations | teams can write to each other; the facilitator reads what they write |
| Debrief | the standings, each round's results, the news and the negotiations, five tables and questions for the class |

## Files

- `games/chocolate-chain/case.toml`: the rounds, teams, decisions, results, briefings, news and the model's parameters.
- `games/chocolate-chain/model.jl`: the model, a multinomial logit of the buyers' choices among the brands, and each team's accounts.
- `games/chocolate-chain/briefing.md` and `briefings/`: what the players read.
- `games/chocolate-chain/debrief-questions.md`: questions for the debrief.

## Requirements

Pollis, and Julia on the facilitator's computer. The players need only Pollis.

## License

AGPL-3.0; model.jl is MIT.
