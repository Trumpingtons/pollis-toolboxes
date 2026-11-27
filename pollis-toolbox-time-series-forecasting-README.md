# Time-Series Forecasting Toolbox

Version 0.1.0

The Pollis Time-Series Forecasting Toolbox forecasts time series with three families of methods: BATS and TBATS, the Theta method and intermittent demand; neural networks, LSTnet, DA-RNN, TPA-LSTM and DSANet; and automatic forecasting, which chooses the model for you with auto ARIMA, auto ETS, auto ARARMA and a race between models.

Installing it adds the **Time-Series Forecasting** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code you can send to the Julia REPL or a notebook, reference wikis and notebook tutorials.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Advanced Time-Series Forecasting | BATS/TBATS, the Theta method and intermittent demand | [Durbyn.jl](https://github.com/taf-society/Durbyn.jl) |
| Neural Network Time-Series Forecasting | LSTnet, DA-RNN, TPA-LSTM and DSANet | [FluxArchitectures.jl](https://github.com/sdobber/FluxArchitectures.jl), [Flux.jl](https://github.com/FluxML/Flux.jl) |
| Automatic Time-Series Forecasting | Auto ARIMA, auto ETS, auto ARARMA and a race between models | [Durbyn.jl](https://github.com/taf-society/Durbyn.jl) |

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones.

## License

AGPL-3.0
