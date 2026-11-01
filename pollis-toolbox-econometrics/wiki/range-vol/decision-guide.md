# Range-Based Volatility Estimation — Decision Guide

The right estimator depends on which data are available and on which assumptions fail. **Drift and Overnight Gaps** answers most of the question for a given asset.

## Which Range-Based Estimator to Choose

| Data and market | Tab | Reason |
|---|---|---|
| Closes only, or a textbook baseline | **Close-to-Close** | Needs only closing prices, at the cost of the lowest precision |
| Highs and lows of a market trading around the clock, no trend | **Parkinson** | Uses the range alone; simple and precise under ideal assumptions |
| OHLC, no trend and no overnight gaps | **Garman-Klass** | Adds the open-to-close return to the range |
| OHLC with a trend, small gaps | **Rogers-Satchell** | Has an expectation free of drift |
| OHLC from an exchange that closes overnight | **GK-Yang-Zhang** | Adds the overnight jump to the Garman-Klass terms |
| OHLC with drift and overnight gaps, as with equities | **Yang-Zhang** | Combines overnight, open-to-close and Rogers-Satchell variances |
| An observation for a state-space model | **Alizadeh-Brandt-Diebold** | Close to Gaussian around log volatility |

## How Long a Window to Use

**Window (days)** usually lies between 20 and 60. Short windows react faster, and they are where range-based precision pays most. Long windows are steadier, but they mix market conditions and respond late. A sensible approach is to choose by purpose: about a month of trading days for matching a short-dated option, about a quarter for a risk report. Use **Forecast Backtest** with a few alternatives if the goal is prediction, keeping in mind that a best window found on one sample may not persist on later data.

## When Close-to-Close Is Still Preferable

The simplest estimator remains the better choice in a few cases. Illiquid assets have ranges dominated by stale prints and bid-ask bounce, so a range-based figure is unreliable. Markets with large overnight moves and no trustworthy open price leave the combined estimators without a key input. Some consumers of the number, including contracts settled on realised variance, define volatility from closes, so matching that definition matters more than efficiency. Close-to-close also serves as a check, since a large gap from the range-based figures helps to expose data problems.

## When to Use a Model Instead

An estimator measures, while a model explains and forecasts. Choose the GARCH-Type Models panel when a volatility forecast should respond to the latest shocks and decay toward a long-run level. Choose the Discrete-Time Stochastic Volatility Models panel for a latent process with full inference, using the output of **Alizadeh-Brandt-Diebold** as an observation when ranges are available. Where intraday prices exist, realised variance from high-frequency returns is the stronger measure, with range-based values as a robust check, since discrete sampling and microstructure noise affect each method differently.

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
