# Diagnostics

The Extreme Value Risk Measures panel offers **Exceedance Rate Analysis** and **Return Level Uncertainty** under Diagnose, and **Empirical vs Extreme Value Risk** under Interpret. None of the three tests whether the tail fit is correct, and that test belongs to the Extreme Value Diagnostics panel.

## How to Read the Exceedance Rate Analysis

**Exceedance Rate Analysis** appears on the **Peaks-Over-Threshold** and **Tail Risk** tabs. It plots `mean(y .> t)` over 50 thresholds t from the minimum of the data to the 95th percentile. The curve is the empirical survival function, falling to 0.05 at the last threshold. Its action description speaks of validating the setup, but the plot involves no fit, so it cannot confirm that a GP tail is right.

The plot does show how many exceedances a threshold leaves. Multiply a rate by n to get the count, and treat a threshold that leaves only a few dozen excesses with caution. A step or plateau shows repeated or rounded values.

## How to Use the Return Level Uncertainty Step

**Return Level Uncertainty** appears on the **Return Levels** tab and prints a 95 percent interval for each of the **Return periods**. It uses the fit of that tab, so it follows the **Estimation method**. Extremes.jl 1.0.5 has no profile-likelihood interval. For a maximum likelihood fit, `cint` gives a Normal interval from the delta method, which is symmetric around the estimate, while the true uncertainty at long periods is usually skewed upward.

A useful interval widens steadily with T. An interval whose upper end is several times the estimate means the data do not fix that level, and the figure needs reporting as a range. Bayesian fits give a posterior interval and probability-weighted fits a bootstrap one through the same `cint`.

## How to Judge the Empirical vs Extreme Value Risk Comparison

**Empirical vs Extreme Value Risk** prints the **Empirical VaR**, `quantile(y, 1 - alpha)`, and the **Empirical ES**, the mean of the losses above it, beside the Extreme Value figures. The step appears on the **Tail Risk** tab and takes that tab's fit, threshold and alpha.

Where alpha is well inside the data, such as several percent of a long sample, the two sets of figures should be close. A wide gap there suggests a poor threshold or fit. A gap at very small alpha is expected, since empirical figures stop at the largest loss in the record while the fit goes on. Neither direction of difference shows which figure is right. Closeness at moderate alpha also does not validate the extrapolation at small alpha.

## What to Check Outside the Extreme Value Risk Measures Panel

| Concern | What the user can do |
|---|---|
| Choice of threshold | **Mean Excess**, **Threshold Stability** in the Extreme Value Diagnostics panel |
| Fit of the distribution | **QQ Plot** in the Extreme Value Diagnostics panel; `diagnosticplots(fm)` in Extremes.jl |
| Fit at long periods | `returnlevelplot(fm)` and `returnlevelplotci(fm)` in Extremes.jl |
| Calibration of VaR | Fit on an early sample, count later losses above VaR, and compare the share with alpha |
| Sensitivity | Repeat each tab at nearby thresholds and with another **Estimation method** |

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
