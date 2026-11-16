# Save the Company

A case for Pollis's Simulation Games. Thistledown Home & Garden, a British chain of home-and-garden stores, cannot pay its debts. Its shareholders, its banks and its bondholders each play as one team, and have a few quarters to agree a plan before the cash runs out and the company goes into administration. Each team knows something the others do not.

Installing it adds the case to **Compose > Collaboration > Simulation Games > Host a Game...**. The facilitator hosts the game, chooses four or six quarters, and the players join it with its invitation; each round runs the case's Julia model on the facilitator's computer.

## The Case

| | |
|---|---|
| Rounds | 4 or 6 quarters, as the facilitator chooses; the cash lasts about 60% of them |
| Teams | 3: the shareholders, the bank syndicate (220 m £ of senior loans) and the bondholders (150 m £ of junior bonds) |
| The shareholders decide | whether to propose a plan, its new money, the cut to each debt and the bondholders' share of the company; and store closures |
| The banks decide | the largest cut they accept, or to call in the loan |
| The bondholders decide | the largest cut and the least share of the company they accept, or to sell their bonds to a fund |
| Private information | the true sales trend and the money the shareholders can put in; the banks' appraisal of the stores and stock; the fund's offer for the bonds |
| Teams organised as | One Voice (everyone in a team sets everything), or Officers: Chair and Chief Executive, Relationship Director and Credit Committee, Portfolio Manager and Trader |
| News | a wet spring, a rise in interest rates, falling property prices, and a rival chain's collapse, some read by some roles only |
| Negotiations | the teams can write to each other; the facilitator reads what they write |
| Debrief | each team's result against its market value at the start, each round's results, the news and the negotiations, five tables and questions for the class |

The name of Thistledown Home & Garden is made up.

## Files

- `games/save-the-company/case.toml`: the sides, rounds, decisions, results, briefings, news and the model's parameters.
- `games/save-the-company/model.jl`: the model: the plan, the vote, administration, the order in which the claims are paid, and each quarter's trading.
- `games/save-the-company/briefing.md` and `briefings/`: what the players read.
- `games/save-the-company/debrief-questions.md`: questions for the debrief.

## Requirements

Pollis, and Julia on the facilitator's computer. The players need only Pollis.

## License

AGPL-3.0; model.jl is MIT.
