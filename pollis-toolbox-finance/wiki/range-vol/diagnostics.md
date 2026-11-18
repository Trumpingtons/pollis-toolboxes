# Range-Based Volatility Estimation — Diagnostics

Diagnostic actions decide which estimator's assumptions hold for the data, and whether the efficiency gain carries through to real data.

## Checking Drift and Overnight Gaps

**Drift and Overnight Gaps** reports a t statistic for the mean return, the share of variance arising overnight, days with a zero range, and rows with inconsistent prices. The code advises a preference for Yang-Zhang or GK-Yang-Zhang when the overnight share is above 0.1, for Rogers-Satchell or Yang-Zhang when the absolute drift t statistic is above 2, and otherwise says that Parkinson and Garman-Klass are fine. Treat these thresholds as rules of thumb. Inconsistent rows should be repaired or removed before any estimator is trusted.

## Checking Volatility Clustering

**Volatility Clustering** shows the autocorrelation of squared returns and of the daily range, with a Ljung-Box test. Strong persistence means that one full-sample number hides meaningful variation and that a rolling series is the better summary. The range usually shows smoother and more persistent autocorrelation than squared returns, because it is a less noisy measure of daily variance. That difference is an informal sign of the extra information in the range, and a finding of no clustering at all is unusual enough in daily financial data to question the input.

## Comparing All Estimators on the Same Data

**All Estimators** computes all seven on the same data, with the usually quoted efficiency beside each. Close agreement suggests that assumptions hold. Parkinson and Garman-Klass falling well below close-to-close and Yang-Zhang suggests overnight variance. Parkinson exceeding Rogers-Satchell suggests drift. A single estimator far from the rest suggests a bad row. The Alizadeh-Brandt-Diebold entry is implied from the mean log range after subtracting 0.43, so it is an approximate level and not the main use of the method.

## Measuring Efficiency on Real Data

**Empirical Efficiency** computes the ratio of squared coefficients of variation between close-to-close and the selected estimator over non-overlapping windows. A value above 1 means that the estimator pins down volatility with fewer days of data. Genuine changes in volatility add to both estimators, so the ratio understates the theoretical gain. **Forecast Backtest** then uses each rolling estimate to predict the realised volatility of the next window, and compares RMSE and correlation against close-to-close. An efficiency gain that does not improve the forecast is of limited practical value.

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
