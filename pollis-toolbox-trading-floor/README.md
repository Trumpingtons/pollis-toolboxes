# Trading Floor

A case for Pollis's Simulation Games. Each team is a trading desk on the market for one share: Corvane Robotics, a listed maker of warehouse robots. Desks buy and sell on a live order book while each period trades by the clock; at its close Corvane announces results that move the share's value. Before each period some desks receive a hint of the results. The best return when Corvane is taken over at the end wins.

Installing it adds the case to **Compose > Collaboration > Simulation Games > Host a Game...**. The facilitator hosts the game, chooses four or six periods, and the players join it with its invitation. The facilitator's copy of Pollis keeps the order book; at the close of each period it runs the case's Julia model.

## The Case

| | |
|---|---|
| Rounds | 4 or 6 periods, as the facilitator chooses, each trading for 4 minutes by the clock |
| Teams | 3 to 8 trading desks, each starting with £5,000 and 100 shares |
| Trading | limit orders on a continuous order book, best price first and then oldest first, at the price of the order on the book; no borrowing, no short selling, no trading with one's own desk |
| Private information | before each period, every other desk receives its analysts' hint of the results |
| News | a rival's recall and a strike at Corvane's customers, released by the facilitator during a period |
| Negotiations | desks can write to each other; the facilitator reads what they write |
| Debrief | each desk's return, each period's results, every trade (trades.csv), the news and the negotiations, and questions for the class |

The name of Corvane Robotics is made up.

## Files

- `games/trading-floor/case.toml`: the market, the rounds, the results, the briefings, the news and the model's parameters.
- `games/trading-floor/model.jl`: the model: Corvane's results, its value and the hints, run at the close of each period.
- `games/trading-floor/briefing.md` and `briefings/`: what the players read.
- `games/trading-floor/debrief-questions.md`: questions for the debrief.

## Requirements

Pollis, and Julia on the facilitator's computer. The players need only Pollis.

## License

AGPL-3.0; model.jl is MIT.
