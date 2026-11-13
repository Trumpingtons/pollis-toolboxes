# Finance Toolbox

The Pollis Finance Toolbox covers time-series econometrics and empirical asset pricing: volatility measurement from daily and intraday prices, high-frequency covariance, ARIMAX models, GARCH-type, stochastic volatility and regime switching models, point processes, time-series forecasting, Bayesian asset-pricing factor models, portfolio optimisation, loss risk measures, extreme value analysis, and simulated limit order book markets.

Installing it adds the **Finance** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code you can send to the Julia REPL or a notebook, reference wikis and notebook tutorials.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Measuring Volatility | Range-based volatility estimators: close-to-close, Parkinson, Garman-Klass, Rogers-Satchell, Garman-Klass-Yang-Zhang, Yang-Zhang and Alizadeh-Brandt-Diebold | [RangeVol.jl](https://github.com/Trumpingtons/RangeVol.jl) |
| High-Frequency Volatility | The volatility of one asset over a day of ticks: realized volatility, two-scales volatility and bipower variation, with the volatility signature plot and the Barndorff-Nielsen and Shephard jump test | [HighFrequencyCovariance.jl](https://github.com/s-baumann/HighFrequencyCovariance.jl), [TwoScalesVolatility.jl](https://github.com/Trumpingtons/TwoScalesVolatility.jl) |
| High-Frequency Covariance Matrix Estimation | The covariance of assets that trade at different times: realized covariance, pre-averaging, two scales and the realized kernel, with regularisation to a valid matrix | [HighFrequencyCovariance.jl](https://github.com/s-baumann/HighFrequencyCovariance.jl) |
| ARIMAX and SARIMA Models | ARIMA and seasonal ARIMA models with exogenous regressors | [StateSpaceModels.jl](https://github.com/LAMPSPUC/StateSpaceModels.jl), [Durbyn.jl](https://github.com/taf-society/Durbyn.jl) |
| GARCH-Type Models | GARCH, EGARCH, GJR-GARCH and DCC volatility models | [ARCHModels.jl](https://github.com/s-broda/ARCHModels.jl) |
| Continuous-Time Stochastic Volatility Models | Simulated paths and European option prices, in closed form and by Monte Carlo, under the Heston, Bates and SABR models | [StochasticVolatility.jl](https://github.com/Trumpingtons/StochasticVolatility.jl), [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) |
| Regime Switching Models | Markov-switching regression, autoregression and ARCH, with time-varying transitions | [MarSwitching.jl](https://github.com/m-dadej/MarSwitching.jl) |
| Point Processes: Model | Poisson, inhomogeneous Poisson, Cox, Hawkes and network Hawkes processes fitted to event times, with the time-rescaling test, the branching ratio and the next event predicted | [PointProcesses.jl](https://github.com/JoseKling/PointProcesses.jl), [HawkesProcesses.jl](https://github.com/dm13450/HawkesProcesses.jl), [NetworkHawkesProcesses.jl](https://github.com/cswaney/NetworkHawkesProcesses.jl), [KernelDensity.jl](https://github.com/JuliaStats/KernelDensity.jl) |
| Point Processes: Simulate | The same five processes simulated from given parameters, with counts against theory, the branching ratio and superposition | [PointProcesses.jl](https://github.com/JoseKling/PointProcesses.jl), [HawkesProcesses.jl](https://github.com/dm13450/HawkesProcesses.jl), [NetworkHawkesProcesses.jl](https://github.com/cswaney/NetworkHawkesProcesses.jl) |
| Advanced Time-Series Forecasting | BATS/TBATS, the Theta method and intermittent demand | [Durbyn.jl](https://github.com/taf-society/Durbyn.jl) |
| Neural Network Time-Series Forecasting | LSTnet, DA-RNN, TPA-LSTM and DSANet | [FluxArchitectures.jl](https://github.com/sdobber/FluxArchitectures.jl), [Flux.jl](https://github.com/FluxML/Flux.jl) |
| Automatic Time-Series Forecasting | Auto ARIMA, auto ETS, auto ARARMA and a race between models | [Durbyn.jl](https://github.com/taf-society/Durbyn.jl) |
| Bayesian Linear Stochastic Discount Factor | Bayesian SDF estimation with spike-and-slab factor selection | [BayesianFactorZoo.jl](https://github.com/eohne/BayesianFactorZoo.jl) |
| Fama-MacBeth Regression | Bayesian and classical Fama-MacBeth regressions of returns on factors | [BayesianFactorZoo.jl](https://github.com/eohne/BayesianFactorZoo.jl), [FamaFrenchData.jl](https://github.com/tbeason/FamaFrenchData.jl) |
| Portfolio Optimisation | Mean-variance, mean-Expected Shortfall, Hierarchical Risk Parity and Hierarchical Equal Risk Contribution weights from daily returns, judged on held-out returns against 1/N | [PortfolioOptimisers.jl](https://github.com/dcelisgarza/PortfolioOptimisers.jl), [Clarabel.jl](https://github.com/oxfordcontrol/Clarabel.jl) |
| Loss Risk Measures | Drawdown, downside risk, Value at Risk and Expected Shortfall of a return series, with a VaR backtest and the contributions of assets to a portfolio Expected Shortfall | [Distributions.jl](https://github.com/JuliaStats/Distributions.jl), [StatsBase.jl](https://github.com/JuliaStats/StatsBase.jl), [HypothesisTests.jl](https://github.com/JuliaStats/HypothesisTests.jl) |
| Generalized Extreme Value Distribution | Block maxima: GEV fits by maximum likelihood, probability-weighted moments and Bayesian estimation, with return levels | [Extremes.jl](https://github.com/jojal5/Extremes.jl) |
| Generalized Pareto Distribution | Peaks over threshold: threshold selection and GP fits to exceedances | [Extremes.jl](https://github.com/jojal5/Extremes.jl) |
| EVT Risk Measures | Return levels, peaks-over-threshold analysis, and extreme value VaR and expected shortfall | [Extremes.jl](https://github.com/jojal5/Extremes.jl) |
| EVT Diagnostics | Threshold selection and tail index estimation for extreme value models | [Extremes.jl](https://github.com/jojal5/Extremes.jl) |
| Trading Agents | Simulated limit order book markets: fundamentalist, chartist and noise traders after Chiarella and Iori, zero-intelligence order flow, and a live exchange with trading agents, with the spread, depth, fat tails and price impact they produce | [LimitOrderBook.jl](https://github.com/p-casgrain/LimitOrderBook.jl), [Brokerage.jl](https://github.com/aaron-wheeler/Brokerage.jl), [TradingAgents.jl](https://github.com/aaron-wheeler/TradingAgents.jl) |

## Texts for the Knowledge Base

The toolbox adds to the Knowledge Base (**Compose > Knowledge for AI Models > Knowledge Base**), with Finance Toolbox as its source, a text that Ask Pollis can answer from once it is switched on and in the index:

| Text | Authors | Licence | As kept |
|---|---|---|---|
| Lecture Notes in Empirical Asset Pricing (PhD), 25 August 2023, University of St. Gallen | Söderlind | MIT | The PDF of its author, unchanged, downloaded from [PaulSoderlind/EmpiricalFinancePhD](https://github.com/PaulSoderlind/EmpiricalFinancePhD) |

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones.

## License

AGPL-3.0
