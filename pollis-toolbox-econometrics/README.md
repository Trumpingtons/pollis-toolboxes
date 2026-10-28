# Financial Econometrics Toolbox

The Pollis Financial Econometrics Toolbox covers time-series econometrics and empirical asset pricing: volatility measurement, ARIMAX models, VAR/VECM systems, GARCH-type and regime switching models, time-series forecasting, and Bayesian asset-pricing factor models.

Installing it adds the **Financial Econometrics** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code you can send to the Julia REPL or a notebook, reference wikis and notebook tutorials.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Measuring Volatility | Range-based volatility estimators: close-to-close, Parkinson, Garman-Klass, Rogers-Satchell, Garman-Klass-Yang-Zhang, Yang-Zhang and Alizadeh-Brandt-Diebold | [RangeVol.jl](https://github.com/Trumpingtons/RangeVol.jl) |
| ARIMAX Models | ARIMA and seasonal ARIMA models with exogenous regressors | [StateSpaceModels.jl](https://github.com/LAMPSPUC/StateSpaceModels.jl) |
| VAR/VECM Systems | VAR, structural VAR, factor-augmented VAR and VECM, with transmission channel analysis | [MacroEconometricModels.jl](https://github.com/FriedmanJP/MacroEconometricModels.jl), [TransmissionChannelAnalysis.jl](https://github.com/enweg/TransmissionChannelAnalysis.jl) |
| GARCH-Type Models | GARCH, EGARCH, GJR-GARCH and DCC volatility models | [ARCHModels.jl](https://github.com/s-broda/ARCHModels.jl) |
| Regime Switching Models | Markov-switching regression, autoregression and ARCH, with time-varying transitions | [MarSwitching.jl](https://github.com/m-dadej/MarSwitching.jl) |
| Advanced Time-Series Forecasting | BATS/TBATS, the Theta method and intermittent demand | [Durbyn.jl](https://github.com/taf-society/Durbyn.jl) |
| Neural Network Time-Series Forecasting | LSTnet, DA-RNN, TPA-LSTM and DSANet | [FluxArchitectures.jl](https://github.com/sdobber/FluxArchitectures.jl), [Flux.jl](https://github.com/FluxML/Flux.jl) |
| Automatic Time-Series Forecasting | Auto ARIMA, auto ETS, auto ARARMA and a race between models | [Durbyn.jl](https://github.com/taf-society/Durbyn.jl) |
| Bayesian Linear Stochastic Discount Factor | Bayesian SDF estimation with spike-and-slab factor selection | [BayesianFactorZoo.jl](https://github.com/eohne/BayesianFactorZoo.jl) |
| Fama-MacBeth Regression | Bayesian and classical Fama-MacBeth regressions of returns on factors | [BayesianFactorZoo.jl](https://github.com/eohne/BayesianFactorZoo.jl), [FamaFrenchData.jl](https://github.com/tbeason/FamaFrenchData.jl) |

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones.

## License

AGPL-3.0
