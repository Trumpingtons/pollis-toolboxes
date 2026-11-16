# A Vineyard for the Portfolio

A case for Pollis's Simulation Games. Harrowgate Drinks, a British drinks group, wants to buy one of three wineries, in Chile, Italy and Australia. One team is Harrowgate's board, three teams the wineries' owners, each knowing something about its winery that Harrowgate does not. After diligence and two rounds of offers, every winery is run for three years. The team that creates the most value wins.

Installing it adds the case to **Compose > Collaboration > Simulation Games > Host a Game...**. The facilitator hosts the game and the players join it with its invitation; each round runs the case's Julia model on the facilitator's computer.

## The Case

| | |
|---|---|
| Rounds | Due Diligence, First Offers, Last Offers, Years 1 to 3 |
| Teams | 4: Harrowgate Drinks (the buyer), and the owners of Viña Piedra Azul (Chile), Tenuta Ventaluce (Italy) and Kestrel Flats Estate (Australia) |
| Harrowgate decides | diligence on each winery; the winery it offers for, with cash and an earn-out; then its distribution and currency hedge |
| The owners decide | whether to disclose their winery's issue; the least cash, and cash and earn-out, they accept; then prices, marketing and investment |
| Private information | each winery's hidden issue, known to its owners; Harrowgate's estimate of the savings of owning each winery; offers and asks |
| Teams organised as | Boards (everyone in a team sets everything), or Officers: Chief Executive, Corporate Development, Treasury and Distribution for Harrowgate, Owner and Managing Director for each winery |
| News | frost in Tuscany, a jump in the Chilean peso, a tariff on Australian wine, and a fine year in Colchagua |
| Negotiations | the buyer and the owners can write to each other; the facilitator reads what they write |
| Debrief | the standings, each round's results, the news and the negotiations, five tables and questions for the class |

The names of Harrowgate Drinks and of the three wineries are made up.

## Files

- `games/a-vineyard-for-the-portfolio/case.toml`: the sides, rounds, decisions, results, briefings, news and the model's parameters.
- `games/a-vineyard-for-the-portfolio/model.jl`: the model: diligence, offers and the earn-out, and each winery's earnings, currency and value.
- `games/a-vineyard-for-the-portfolio/briefing.md` and `briefings/`: what the players read.
- `games/a-vineyard-for-the-portfolio/debrief-questions.md`: questions for the debrief.

## Requirements

Pollis, and Julia on the facilitator's computer. The players need only Pollis.

## License

AGPL-3.0; model.jl is MIT.
