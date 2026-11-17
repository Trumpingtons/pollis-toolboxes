# Advanced Time-Series Forecasting — Factsheet

Advanced Time-Series Forecasting covers three kinds of series that the ordinary seasonal models handle badly: complex seasonality, a trend that a short benchmark should capture cheaply, and demand that is mostly zero.

## What the Advanced Time-Series Forecasting Panel Does

| Item | Description |
|---|---|
| **Purpose** | Forecast one univariate series with a method suited to its shape |
| **Julia stack** | Durbyn.jl for the models; Plots.jl, HypothesisTests.jl and StatsBase.jl for the Next Steps |
| **Models** | BATS and TBATS, the four Theta variants, and the Croston family for intermittent demand |
| **Output** | Point forecasts for the chosen **Horizon**; 80% and 95% prediction intervals except for the Croston family |
| **Key choice** | The shape of the series: seasonal patterns, a trend with little structure, or many zeros |

## Which Function Does Each Tab of Advanced Time-Series Forecasting Call

| Tab | Input that selects the model | Durbyn.jl call |
|---|---|---|
| **BATS / TBATS** | **Model**: `tbats` or `bats`; **Seasonal Periods** | `tbats(y, periods)`, `bats(y, Int.(periods))` |
| **Theta Method** | **Variant**: STM, OTM, DSTM or DOTM; **Period** | `theta(y, period; model_type=OTM)` |
| **Intermittent Demand** | **Method**: classic, sba or sbj | `croston_classic(y)`, `croston_sba(y)`, `croston_sbj(y)` |

Every tab then calls `forecast(model; h=h)` with the **Horizon** input, and reads the point forecasts from `fc.mean`.

## How the Advanced Forecasting Methods Differ in One Line Each

BATS and TBATS combine a Box-Cox transformation, ARMA errors, a damped trend and several seasonal cycles in one state space model ([De Livera, Hyndman and Snyder (2011)](#ref-LHS2011a)). The Theta method splits a series into a long-run line and a short-run line, which behaves like simple exponential smoothing with drift ([Fiorucci, Pellegrini, Louzada, Petropoulos and Koehler (2016)](#ref-FPLPK2016a)). Croston's method smooths the size of each demand and the gap between demands separately ([Croston (1972)](#ref-Cro1972a)).

## References

<a id="ref-Cro1972a"></a>Croston, J. D. (1972). Forecasting and stock control for intermittent demands. *Operational Research Quarterly* 23(3), 289–303. [doi:10.1057/jors.1972.50](https://doi.org/10.1057/jors.1972.50)

<a id="ref-LHS2011a"></a>De Livera, A. M., Hyndman, R. J. and Snyder, R. D. (2011). Forecasting time series with complex seasonal patterns using exponential smoothing. *Journal of the American Statistical Association* 106(496), 1513–1527. [doi:10.1198/jasa.2011.tm09771](https://doi.org/10.1198/jasa.2011.tm09771)

<a id="ref-FPLPK2016a"></a>Fiorucci, J. A., Pellegrini, T. R., Louzada, F., Petropoulos, F. and Koehler, A. B. (2016). Models for optimising the theta method and their relationship to state space models. *International Journal of Forecasting* 32(4), 1151–1161. [doi:10.1016/j.ijforecast.2016.02.005](https://doi.org/10.1016/j.ijforecast.2016.02.005)

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
