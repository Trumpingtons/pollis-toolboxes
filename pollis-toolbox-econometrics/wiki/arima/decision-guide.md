# ARIMA Models — Decision Guide

Choosing an ARIMA specification means settling the tab first, then the differencing, then the orders, using criteria that compare models on the same differenced data.

## Which ARIMA Tab Fits the Data

| Situation | Tab | Reason |
|---|---|---|
| One series with no repeating pattern | **ARIMA** | Differencing and short lags capture the dynamics |
| A pattern repeating at a fixed period | **Seasonal ARIMA** | Seasonal terms act at lag s and its multiples |
| Other variables move the series, and their future is known | **ARIMAX** | The regression carries their effect and ARIMA errors carry the rest |
| Regressors whose future must also be forecast | **ARIMAX** with care, or a VAR | Conditional forecasts understate the uncertainty |

## How to Choose the Differencing Order

Settle d and D before p and q, because information criteria cannot compare models fitted to differently differenced data. Start with the plot and with **ADF Unit Root Test**, then take the smallest d that yields a stable mean. One difference is the common answer; a second is rare and often a sign of over-differencing. Use D = 1 when the seasonal pattern is stable and strong. The sum d + D should rarely exceed 2. A series that has been differenced more than the data require gains variance and loses nothing else, so the plot and the test deserve a look together before moving on.

## How to Choose the AR and MA Orders

Three routes are available in the panel. The classical route reads the autocorrelations: a PACF that cuts off at lag p points to an AR(p), and an ACF that cuts off at lag q points to an MA(q). **Automatic Order Selection** runs a stepwise search over orders and reports what it picks beside the current model, following [Hyndman and Khandakar (2008)](#ref-HK2008a). **Order Grid (AICc)** fits every p and q from 0 to 3 at the current differencing and shows how much the choice matters. The small-sample correction of [Hurvich and Tsai (1989)](#ref-HT1989a) matters most with short series and many parameters. A flat grid means several orders are equivalent, and the simplest is the better choice.

## How to Choose Between ARIMA and Other Forecasters

For a broad treatment of the alternatives, [Hyndman and Athanasopoulos (2021)](#ref-HA2021a) is the standard text. ARIMA handles short-run correlation well, but a benchmark should always sit next to it: **Rolling Backtest** should beat a naive or seasonal naive forecast at the horizons that matter. Exponential smoothing tends to do as well on series with clear trend and seasonality, and is available in the Automatic Time-Series Forecasting panel. Conditional variance models take over when the question is about risk rather than level. A vector autoregression takes over when several series move together, and neural networks need far more data before they repay their complexity.

## References

<a id="ref-HT1989a"></a>Hurvich, C. M. and Tsai, C. (1989). Regression and time series model selection in small samples. *Biometrika* 76(2), 297–307. [doi:10.1093/biomet/76.2.297](https://doi.org/10.1093/biomet/76.2.297)

<a id="ref-HK2008a"></a>Hyndman, R. J. and Khandakar, Y. (2008). Automatic Time Series Forecasting: The forecast Package for R. *Journal of Statistical Software* 27(3). [doi:10.18637/jss.v027.i03](https://doi.org/10.18637/jss.v027.i03)

<a id="ref-HA2021a"></a>Hyndman, R. J. and Athanasopoulos, G. (2021). Forecasting: Principles and Practice. *OTexts*. [Link](https://otexts.com/fpp3/)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
