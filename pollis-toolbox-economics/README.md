# Economics Toolbox

The Pollis Economics Toolbox covers quantitative macroeconomics and game theory: business cycle filters, stochastic volatility macroeconomic models, DSGE models, heterogeneous-agent models, continuous-time macro-finance, and normal-form, zero-sum, potential and evolutionary games.

Installing it adds the **Economic Models** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code you can send to the Julia REPL or a notebook, reference wikis and notebook tutorials.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Business Cycle Filters | Hodrick-Prescott, Hamilton, Beveridge-Nelson, Baxter-King and boosted HP filters | [MacroEconometricModels.jl](https://github.com/FriedmanJP/MacroEconometricModels.jl) |
| Stochastic Volatility Macroeconomic Models | Basic, leverage and Student-t stochastic volatility models | [MacroEconometricModels.jl](https://github.com/FriedmanJP/MacroEconometricModels.jl) |
| Dynamic Stochastic General Equilibrium (DSGE) | Model moments, estimation and impulse responses | [MacroModelling.jl](https://github.com/thorek1/MacroModelling.jl), [Dynare.jl](https://github.com/DynareJulia/Dynare.jl), [DSGE.jl](https://github.com/FRBNY-DSGE/DSGE.jl), [SolveDSGE.jl](https://github.com/RJDennis/SolveDSGE.jl), [StateSpaceEcon.jl](https://github.com/bankofcanada/StateSpaceEcon.jl) |
| Heterogeneous-Agent Models | Huggett and Aiyagari economies | [EconPDEs.jl](https://github.com/matthieugomez/EconPDEs.jl) |
| Continuous-Time Macro-Finance | Asset pricing through Hamilton-Jacobi-Bellman equations: habit formation, long-run risk, disaster risk and financial intermediaries | [EconPDEs.jl](https://github.com/matthieugomez/EconPDEs.jl) |
| Game Theory | Normal-form, zero-sum, potential and evolutionary games: Nash equilibria, minimax strategies and replicator dynamics | [GameTheory.jl](https://github.com/QuantEcon/GameTheory.jl), [JuMP.jl](https://github.com/jump-dev/JuMP.jl), [HiGHS.jl](https://github.com/jump-dev/HiGHS.jl), [BaryPlots.jl](https://github.com/datadreamscorp/BaryPlots.jl) |

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones.

## License

AGPL-3.0
