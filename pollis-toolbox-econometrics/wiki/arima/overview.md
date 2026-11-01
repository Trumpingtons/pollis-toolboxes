# ARIMA Models — Overview

The panel writes an ARIMA model as three orders: p lags of the differenced series, d differences, and q lagged shocks. In lag-operator form, phi(L) (1 - L)^d y(t) = c + theta(L) e(t), where e(t) is white noise. [Box, Jenkins, Reinsel and Ljung (2015)](#ref-BJRL2015a) set out the identify, estimate and check cycle that the panel's actions follow.

## The ARIMA Tab

The **ARIMA** tab takes a **Data variable** and the orders **p (AR)**, **d (diff)** and **q (MA)**. StateSpaceModels.jl builds the model with `SARIMA(y; order=(p, d, q))` and `fit!` estimates it by maximum likelihood through the Kalman filter. Then `print_results` reports the estimates, their standard errors, the log-likelihood and the information criteria. A series with a stochastic trend usually takes d = 1, and p and q rarely need to exceed 3. A random walk with no short-run structure is the special case p = 0, d = 1, q = 0.

## The Seasonal ARIMA Tab

The **Seasonal ARIMA** tab adds **P (seas. AR)**, **D (seas. diff)**, **Q (seas. MA)** and **s (period)**, passed as `seasonal_order`. Seasonal polynomials multiply the non-seasonal ones, so a seasonal shock recurs one period later and also interacts with the short-run dynamics. A monthly series takes s = 12, a quarterly one s = 4, and daily data with a weekly cycle s = 7. The classic airline specification, ARIMA(0,1,1)(0,1,1) with period 12, is a useful first candidate for trending monthly data with a stable seasonal pattern.

## The ARIMAX Tab

The **ARIMAX** tab regresses the series on **Regressors**, a vector or a matrix with one column per variable, and treats the deviation from that regression as an ARIMA process. Durbyn.jl fits the model with `arima(y, 1; order=PDQ(p, d, q), xreg=X)`. Forecasts need **Future regressors**, with one row per step of the horizon. Because a difference in the error model also differences the regressors, a coefficient describes how a change in a regressor moves the change in the series when d is 1.

## Common Workflow for an ARIMA Analysis

1. Inspect the series with **Differenced Series** and run **ADF Unit Root Test** to settle d.
2. Set p and q, or start from **Automatic Order Selection**, which uses the stepwise search of [Hyndman and Khandakar (2008)](#ref-HK2008a).
3. Read the **Coefficient Table**, then check **Residual ACF and PACF** and **Ljung-Box and Normality**.
4. Compare candidates with **Order Grid (AICc)**, or with **With and Without the Regressors** in the ARIMAX tab.
5. Forecast with **Forecast with Intervals** and judge real accuracy with **Rolling Backtest**.

## References

<a id="ref-BJRL2015a"></a>Box, G. E. P., Jenkins, G. M., Reinsel, G. C. and Ljung, G. M. (2015). Time Series Analysis: Forecasting and Control. *Wiley*.

<a id="ref-HK2008a"></a>Hyndman, R. J. and Khandakar, Y. (2008). Automatic Time Series Forecasting: The forecast Package for R. *Journal of Statistical Software* 27(3). [doi:10.18637/jss.v027.i03](https://doi.org/10.18637/jss.v027.i03)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
