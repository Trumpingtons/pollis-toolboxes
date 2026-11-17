# Grow a Chocolate Chain

A case for Pollis's Simulation Games. Rival teams each run a chocolate brand in one country, and make every tablet they sell in their own shops. Each year they set their price, beans, shops, staff and marketing. The highest cumulative profit after five years wins.

Installing it adds the case to **Compose > Simulation Games > Host a Game...**. The facilitator hosts the game and the players join it with its invitation; each round runs the case's Julia model on the facilitator's computer.

## The Case

| | |
|---|---|
| Rounds | 5 years |
| Teams | 2 to 6 |
| Decisions | price, beans, shops, staff per shop, marketing |
| Each game draws | the market's size and the buyers' sensitivity to price, within the ranges the briefings give |
| Teams organised as | Board Members (everyone sets everything), or Departments: Chief Executive, Marketing, Sourcing and Finance, each with its own briefing and decisions |
| News | rising cacao prices, rising rents, and a television series on craft chocolate, each read by some roles only; each game draws whether each comes, when and how large |
| Negotiations | teams can write to each other; the facilitator reads what they write |
| Debrief | the standings, each round's results, the news and the negotiations, five tables and questions for the class; the market and buyers the game drew |

## Files

- `games/chocolate-chain/case.toml`: the rounds, teams, decisions, results, briefings, news and the model's parameters.
- `games/chocolate-chain/model.jl`: the model, a multinomial logit of the buyers' choices among the brands, and each team's accounts.
- `games/chocolate-chain/briefing.md` and `briefings/`: what the players read.
- `games/chocolate-chain/debrief-questions.md`: questions for the debrief.

## Requirements

Pollis, and Julia on the facilitator's computer. The players need only Pollis.

## Icon

The icon's photo, cacao beans on a table, from [rawpixel](https://www.rawpixel.com/image/5914848/image-public-domain-plant-free), is in the public domain (CC0 1.0), with the Pollis logo added in its upper left corner.

## License

AGPL-3.0; model.jl is MIT.
