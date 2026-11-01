# VAR Models — Decision Guide

The choice follows from the data's persistence, the number of indicators, and whether the question is structural.

## Which VAR-Type Model to Choose

| Situation | Tab | Why |
|---|---|---|
| Stationary series and a forecasting or predictability question | **VAR** | Joint dynamics, forecasts and Granger causality with no identification |
| Economic shocks to identify | **SVAR** | Causal impulse responses under recursive, long-run or sign restrictions |
| A large panel of informative indicators | **FAVAR** | Summarises many series in a few factors inside the VAR |
| Non-stationary, cointegrated series | **VECM** | Long-run equilibrium relations plus short-run adjustment |

## Which Identification Scheme to Choose

**Recursive (Cholesky)** suits a clear timing argument, such as a central bank that reacts within the quarter while output responds later. **Long-Run (Blanchard-Quah)** suits a distinction between shocks with permanent and transitory effects on growth rates, the setting of [Blanchard and Quah (1989)](#ref-BQ1989a). **Sign Restrictions** suits a situation where theory gives directions but not zeros, following [Uhlig (2005)](#ref-Uhl2005a), and accepts a set of answers as the cost. [Rubio-Ramírez, Waggoner and Zha (2010)](#ref-RWZ2010a) describe when a set of restrictions identifies a model exactly. Running two schemes and comparing them is more persuasive than defending one assumption.

## How to Choose Lags, Factors and Rank

**p (Lags)** comes from **Lag Selection**, with residual behaviour as a further check, and should be set before identification. **Factors** starts at 3, the value used by [Bernanke, Boivin and Eliasz (2005)](#ref-BBE2005a), and more factors help when the panel has several distinct blocks of data, at the cost of a bigger VAR. **r (Rank)** comes from **Johansen Cointegration Test**, along with **VAR vs VECM** and theory about how many long-run relations make sense. Each of these choices affects later results, so keep a record of the alternatives tried.

## When to Move Beyond This Panel

Time-varying volatility or parameters fit a sample with a clear change in regime, as covered by the Regime Switching Models panel. Single-equation forecasting of one series belongs in the ARIMA Models panel. Questions that require full structural interpretation, such as a change in a policy rule, fit the Dynamic Stochastic General Equilibrium (DSGE) panel. A VAR estimate is still a useful comparison for that structural model. When the sample is short and the system large, Bayesian shrinkage works better than unrestricted least squares, though the panel does not offer it.

## References

<a id="ref-BBE2005a"></a>Bernanke, B. S., Boivin, J. and Eliasz, P. (2005). Measuring the Effects of Monetary Policy: A Factor-Augmented Vector Autoregressive (FAVAR) Approach. *The Quarterly Journal of Economics* 120(1), 387–422. [doi:10.1162/0033553053327452](https://doi.org/10.1162/0033553053327452)

<a id="ref-BQ1989a"></a>Blanchard, O. J. and Quah, D. (1989). The Dynamic Effects of Aggregate Demand and Supply Disturbances. *American Economic Review* 79(4), 655–673. [Link](https://ideas.repec.org/a/aea/aecrev/v79y1989i4p655-73.html)

<a id="ref-RWZ2010a"></a>Rubio-Ramírez, J. F., Waggoner, D. F. and Zha, T. (2010). Structural Vector Autoregressions: Theory of Identification and Algorithms for Inference. *Review of Economic Studies* 77(2), 665–696. [doi:10.1111/j.1467-937X.2009.00578.x](https://doi.org/10.1111/j.1467-937X.2009.00578.x)

<a id="ref-Uhl2005a"></a>Uhlig, H. (2005). What are the effects of monetary policy on output? Results from an agnostic identification procedure. *Journal of Monetary Economics* 52(2), 381–419. [doi:10.1016/j.jmoneco.2004.05.007](https://doi.org/10.1016/j.jmoneco.2004.05.007)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
