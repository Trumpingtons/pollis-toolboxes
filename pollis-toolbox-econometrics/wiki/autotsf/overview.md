# Automatic Time-Series Forecasting — Overview

Each tab of the panel runs one automatic procedure on the **Data variable**, with **Horizon** and **Seasonal Period** shared. A broad account of these methods is in [Hyndman and Athanasopoulos (2021)](#ref-HA2021a), and the classical theory behind them is in [Brockwell and Davis (2016)](#ref-BD2016a).

## The Auto ARIMA Tab

The **Auto ARIMA** tab follows the algorithm of [Hyndman and Khandakar (2008)](#ref-HK2008a): unit-root and seasonal-strength tests set d and D, then a search over p, q, P and Q minimises the chosen **Criterion**. With the **Search** input set to stepwise, `auto_arima` starts from a few simple models and moves to their neighbours while the criterion improves. Exhaustive search, `stepwise=false`, fits every model within the order limits and takes much longer, usually for a small gain. The differencing test is the one of [Kwiatkowski, Phillips, Schmidt and Shin (1992)](#ref-KPSS1992a), whose null hypothesis is stationarity.

## The Auto ETS Tab

The **Auto ETS** tab fits exponential smoothing as a state-space model and uses `ets(y, m, "ZZZ")`, where each Z asks for the error, trend and seasonal component to be chosen automatically. The framework of [Hyndman, Koehler, Snyder and Grose (2002)](#ref-HKSG2002a) gives each form a likelihood, so that an information criterion can compare them. Components can be additive or multiplicative, and the trend may be damped. **Damped Trend** restricts the search, and **Box-Cox** applies a variance-stabilising transformation first. A multiplicative seasonal form is the right shape when seasonal swings grow with the level.

## The Auto ARARMA Tab

The **Auto ARARMA** tab applies the approach of [Parzen (1982)](#ref-Par1982a). A memory-shortening filter first turns a slowly decaying series into a short-memory one, and `auto_ararma` then fits an ARMA to the result, trying orders up to **Max AR Order** and **Max MA Order** under its own **Criterion**. The method avoids a hard decision on differencing, since the filter removes only as much persistence as the data show. It offers no seasonal search, so the tab suits series with long memory and no clear period, and its strength is at short horizons.

## The Model Race Tab

The **Model Race** tab scores auto ARIMA, auto ETS, auto theta and auto ARARMA on the last h observations, capped at a fifth of the series, and refits the winner on all the data. Accuracy is measured with MASE, the scaled error of [Hyndman and Koehler (2006)](#ref-HK2006a). Auto theta, based on the model of [Assimakopoulos and Nikolopoulos (2000)](#ref-AN2000a) with the optimised forms of [Fiorucci, Pellegrini, Louzada, Petropoulos and Koehler (2016)](#ref-FPLPK2016a), appears only in the race. Selecting by holdout targets forecasting skill directly, which an in-sample criterion only approximates. The cost is that one short holdout is a noisy judge.

## Common Workflow for Automatic Forecasting

1. Look at the series with **Autocorrelation** and set **Seasonal Period** from what is known about the data.
2. Run a tab, or **Model Race** if there is no prior view on the family.
3. Read **Selected Model** and **Candidates Considered** to see what was weighed.
4. Check **Residual Diagnostics** and **Selection Stability**.
5. Compare with **Compare Methods** and **Forecast Combination**, and read horizons with **Rolling-Origin Accuracy**.

## References

<a id="ref-AN2000a"></a>Assimakopoulos, V. and Nikolopoulos, K. (2000). The theta model: a decomposition approach to forecasting. *International Journal of Forecasting* 16(4), 521–530. [doi:10.1016/S0169-2070(00)00066-2](https://doi.org/10.1016/S0169-2070(00)00066-2)

<a id="ref-BD2016a"></a>Brockwell, P. J. and Davis, R. A. (2016). Introduction to Time Series and Forecasting. *Springer*. [doi:10.1007/978-3-319-29854-2](https://doi.org/10.1007/978-3-319-29854-2)

<a id="ref-FPLPK2016a"></a>Fiorucci, J. A., Pellegrini, T. R., Louzada, F., Petropoulos, F. and Koehler, A. B. (2016). Models for Optimising the Theta Method and Their Relationship to State Space Models. *International Journal of Forecasting* 32(4), 1151–1161. [doi:10.1016/j.ijforecast.2016.02.005](https://doi.org/10.1016/j.ijforecast.2016.02.005)

<a id="ref-HKSG2002a"></a>Hyndman, R. J., Koehler, A. B., Snyder, R. D. and Grose, S. (2002). A State Space Framework for Automatic Forecasting Using Exponential Smoothing Methods. *International Journal of Forecasting* 18(3), 439–454. [doi:10.1016/S0169-2070(01)00110-8](https://doi.org/10.1016/S0169-2070(01)00110-8)

<a id="ref-HK2006a"></a>Hyndman, R. J. and Koehler, A. B. (2006). Another look at measures of forecast accuracy. *International Journal of Forecasting* 22(4), 679–688. [doi:10.1016/j.ijforecast.2006.03.001](https://doi.org/10.1016/j.ijforecast.2006.03.001)

<a id="ref-HK2008a"></a>Hyndman, R. J. and Khandakar, Y. (2008). Automatic Time Series Forecasting: The forecast Package for R. *Journal of Statistical Software* 27(3). [doi:10.18637/jss.v027.i03](https://doi.org/10.18637/jss.v027.i03)

<a id="ref-HA2021a"></a>Hyndman, R. J. and Athanasopoulos, G. (2021). Forecasting: Principles and Practice. *OTexts*. [Link](https://otexts.com/fpp3/)

<a id="ref-KPSS1992a"></a>Kwiatkowski, D., Phillips, P. C.B., Schmidt, P. and Shin, Y. (1992). Testing the null hypothesis of stationarity against the alternative of a unit root. *Journal of Econometrics* 54(1-3), 159–178. [doi:10.1016/0304-4076(92)90104-Y](https://doi.org/10.1016/0304-4076(92)90104-Y)

<a id="ref-Par1982a"></a>Parzen, E. (1982). ARARMA Models for Time Series Analysis and Forecasting. *Journal of Forecasting* 1(1), 67–82. [doi:10.1002/for.3980010108](https://doi.org/10.1002/for.3980010108)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
