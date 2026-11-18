# Range-Based Volatility Estimation — Assumptions

Range-based estimators get their precision from a specific model of prices. The precision shrinks when the model fails, and the bias can grow large.

## The Continuous Random Walk Assumption

Every range-based formula assumes that the log price follows a Brownian motion within the day, with constant volatility and no jumps. The factor 4 log 2 in Parkinson and the Garman-Klass coefficients both come from the distribution of the range of that process. Intraday volatility is in fact not constant, since activity peaks near the open and the close, and a jump adds to the range in a different way than diffusion does. Under an intraday pattern, the estimators still measure total variation reasonably well, though their theoretical efficiency no longer holds.

## Zero Drift and Overnight Gaps

Parkinson and Garman-Klass assume a drift of zero and no overnight moves. With a strong trend during the day, the range partly reflects direction, and those estimators are biased upward. With overnight gaps, Parkinson, Garman-Klass and Rogers-Satchell all miss the variance accumulated while the market is shut, and so they understate the volatility of a full day. Rogers-Satchell solves the drift problem, GK-Yang-Zhang the gap problem, and Yang-Zhang both. Daily drift is usually small relative to daily volatility, which makes overnight gaps the more serious concern for most equities.

## Discrete Trading and Measurement Error

Formulas assume that the price is observed continuously, but the true high and low occur between actual trades, so the recorded range is too narrow and the estimate is biased downward. The bias is largest for thinly traded assets. Bid-ask bounce pushes the other way, by widening the recorded range with no change in value. A misreported print has a large effect, because the range is defined by one extreme observation. Check inputs: a high below the open or close, or a low above either, signals a bad row.

## Constant Volatility Within the Window

A single estimate over a window assumes that volatility is constant across that window. A long window lowers sampling error but blends different market states. A short window responds faster, but its estimate has more noise. Efficient estimators soften that trade-off, since they need fewer days to reach a given precision. In the full-sample number, clustering gets averaged away entirely, so **Volatility Clustering** is a useful check before relying on one number. Annualising by the square root of time further assumes that returns are uncorrelated.

## See Also

- [Diagnostics](diagnostics.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
