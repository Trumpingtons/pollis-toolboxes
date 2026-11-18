# GARCH-Type Models — Decision Guide

Most decisions involve symmetry, order and distribution. The first model should be simple, with complexity added only when a diagnostic demands it.

## Which Volatility Model to Choose

| Situation | Tab | Reason |
|---|---|---|
| Baseline for any return series | **GARCH** | A symmetric response, with few parameters and easy reading |
| Equities or indices with a leverage effect | **GJR-GARCH** | Adds one asymmetry term and keeps the GARCH units |
| Asymmetry and a variance that must remain positive with no constraints | **EGARCH** | Works on the logarithm of the variance |
| Several assets with changing correlations | **DCC** | A GARCH for each asset, then one correlation process |

## How to Choose the Lag Orders

Start with one lag of each, since GARCH(1,1) performs very well in most comparisons. **Lag Order Selection** searches all lag orders up to 2 by BIC and compares the best with the current fit. Higher orders usually add little and create identification problems, as parameters can become nearly redundant. Check residual squares with **Standardised Residual Checks** after any change, since an asymmetric term often fixes what a higher order did not. If a preferred model has more than two lags, a regime or a seasonal effect may be the real issue.

## How to Choose the Innovation Distribution

Use **Innovation Distributions** to compare Gaussian, Student's t, GED and skewed t on AIC and BIC. Student's t is the usual improvement for daily returns. Skewed t helps when negative tails are noticeably heavier. For forecasting variance alone, the choice has limited effect. For Value-at-Risk at low probabilities, the choice matters a great deal, and the **QQ Plot Against the Fitted Distribution** should support it. In the **DCC** tab, the distribution input does not apply, since the multivariate normal is always used.

## When to Use Another Volatility Approach

The GARCH family is not always the best tool. When the variance has its own source of noise and full posterior inference is wanted, use the Discrete-Time Stochastic Volatility Models panel. When high, low and open prices are available and the need is a volatility measure rather than a forecasting model, the Range-Based Volatility Estimation panel is much more efficient per observation. When volatility moves between distinct levels, Markov-Switching ARCH in the Regime Switching Models panel is more appropriate. Many assets with a shared structure may call for a factor model, because a single correlation process across hundreds of assets becomes too restrictive.

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
