# GARCH-Type Models — Overview

Each univariate tab specifies an equation for the conditional variance of returns r(t) = sigma(t) z(t), where z(t) is an independent shock with mean zero and variance one. The **data variable** is a vector of log returns for those tabs, and a matrix with one asset per column for DCC.

## The GARCH Tab

The **GARCH** tab fits sigma(t)^2 = omega + beta sigma(t-1)^2 + alpha r(t-1)^2, called with `GARCH{p, q}`. In the notation of ARCHModels.jl, **GARCH order p** counts lagged variances, and **ARCH order q** counts lagged squared shocks, as in [Bollerslev (1986)](#ref-Bol1986a). Then `fit` estimates by maximum likelihood, `coeftable` reports the estimates, `volatilities` returns the conditional volatility series, and `predict(am, :volatility)` gives the next value. One lag of each, the GARCH(1,1), remains hard to beat. The response to a shock is symmetric, so a fall and a rise of the same size have an equal effect.

## The EGARCH Tab

The **EGARCH** tab fits the logarithm of the variance, following [Nelson (1991)](#ref-Nel1991a), with `EGARCH{o, p, q}`, where **asymmetry o** sets the number of signed terms. Modelling the logarithm guarantees a positive variance without constraints on the parameters. A negative coefficient on the signed term means that a fall raises volatility more than a rise, the so-called leverage effect. Effects enter multiplicatively, which allows a big shock to have a very large effect on volatility, and that sensitivity can make forecasts unstable after extreme observations.

## The GJR-GARCH Tab

The **GJR-GARCH** tab adds a term that is active only after negative shocks, following [Glosten, Jagannathan and Runkle (1993)](#ref-GJR1993a), with `TGARCH{o, p, q}` as the type name in ARCHModels.jl. The variance equation is sigma(t)^2 = omega + (alpha + gamma I(r(t-1) < 0)) r(t-1)^2 + beta sigma(t-1)^2, where I is an indicator. A positive gamma captures the leverage effect, and the parameters stay in the same units as GARCH, which makes them easier to read. Positivity of the variance needs constraints on the parameters. Equity indices usually show a clearly positive gamma.

## The DCC Tab

The **DCC** tab fits the dynamic conditional correlation model of [Engle (2002)](#ref-Eng2002a), called as `DCC{dcc-p, dcc-q, GARCH{p, q}}`. Each asset first gets its own GARCH model. The standardised residuals then drive a single dynamic correlation process with two parameters, which keeps the model feasible for many assets. The method `correlations` returns the correlation matrix at each date, and the innovations are always multivariate standard normal in this tab. One set of correlation parameters shared by all pairs is a strong restriction, and that restriction is the main price paid for simplicity.

## Common Workflow for Fitting a GARCH Model

1. Provide returns, and fit a GARCH(1,1) with the default distribution.
2. Plot them with **Returns and Volatility Bands**, and see the shape with **News Impact Curve**.
3. Run **Standardised Residual Checks** and **QQ Plot Against the Fitted Distribution**.
4. Compare with **Innovation Distributions** and **Lag Order Selection**.
5. Read **Persistence and Half-Life** and **Estimates with Confidence Intervals**.
6. Forecast with **Volatility Forecast Path** and check risk with **Value-at-Risk Backtest**.

## References

<a id="ref-Bol1986a"></a>Bollerslev, T. (1986). Generalized Autoregressive Conditional Heteroskedasticity. *Journal of Econometrics* 31(3), 307–327. [doi:10.1016/0304-4076(86)90063-1](https://doi.org/10.1016/0304-4076(86)90063-1)

<a id="ref-Eng2002a"></a>Engle, R. (2002). Dynamic Conditional Correlation: A Simple Class of Multivariate Generalized Autoregressive Conditional Heteroskedasticity Models. *Journal of Business & Economic Statistics* 20(3), 339–350. [doi:10.1198/073500102288618487](https://doi.org/10.1198/073500102288618487)

<a id="ref-GJR1993a"></a>Glosten, L. R., Jagannathan, R. and Runkle, D. E. (1993). On the Relation between the Expected Value and the Volatility of the Nominal Excess Return on Stocks. *Journal of Finance* 48(5), 1779–1801. [doi:10.1111/j.1540-6261.1993.tb05128.x](https://doi.org/10.1111/j.1540-6261.1993.tb05128.x)

<a id="ref-Nel1991a"></a>Nelson, D. B. (1991). Conditional Heteroskedasticity in Asset Returns: A New Approach. *Econometrica* 59(2), 347. [doi:10.2307/2938260](https://doi.org/10.2307/2938260)

## See Also

- [Factsheet](factsheet.md) · [Decision Guide](decision-guide.md) · [Interpretation](interpretation.md)
