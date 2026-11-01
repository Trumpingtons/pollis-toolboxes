# Neural Network Time-Series Forecasting — Factsheet

The Neural Network Time-Series Forecasting panel trains four deep architectures for multivariate series, each built to find patterns that a linear model cannot express. FluxArchitectures.jl provides the models and Flux.jl, described by [Innes (2018)](#ref-Inn2018a), provides the training.

| | |
|---|---|
| **Purpose** | Forecast one target series from a window of its own past and the past of related series |
| **Julia stack** | FluxArchitectures.jl and Flux.jl, with BSON.jl to save models and Plots.jl for figures |
| **Models** | LSTnet, DA-RNN, TPA-LSTM, DSANet |
| **Output** | A trained network, test mean squared error, forecasts, loss curves, input importance |
| **Key choice** | The architecture, the length of the input window, and how much capacity to train |

## When to Use a Neural Forecasting Model

Neural forecasters earn their cost with long samples, several related series, and nonlinear or multi-scale structure, such as electricity load, traffic or sensor data. Thousands of windows are a reasonable starting point. Macroeconomic series with a few hundred observations rarely justify a network, and the approaches in [Hyndman and Athanasopoulos (2021)](#ref-HA2021a) usually forecast them better. A network should always be judged against a simple benchmark on data it has not seen, because training error alone says little about real forecasting skill.

## What Neural Forecasters Do Not Provide

The four architectures produce point forecasts, with no likelihood, standard errors or forecast intervals. Their parameters have no direct economic meaning, so coefficients cannot be read as in a regression. Results depend on the random seed, the initial weights and the training length, so two runs of one specification may differ. A saved network also encodes the scale of its training data, and it will extrapolate poorly when a series moves outside the range seen in training, a known weakness of models fitted purely to patterns in past data.

## References

<a id="ref-HA2021a"></a>Hyndman, R. J. and Athanasopoulos, G. (2021). Forecasting: Principles and Practice. *OTexts*. [Link](https://otexts.com/fpp3/)

<a id="ref-Inn2018a"></a>Innes, M. (2018). Flux: Elegant Machine Learning with Julia. *Journal of Open Source Software* 3(25), 602. [doi:10.21105/joss.00602](https://doi.org/10.21105/joss.00602)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
