# Business Cycle Filters — Diagnostics

Diagnostics help decide whether a cycle looks like a business cycle, how much of the movement it claims, and how stable it is.

## Reading the Power Spectrum

**Power Spectrum** computes the periodogram of the cycle, converts frequencies to periods in quarters, and reports the dominant period and the share of power at periods from 6 to 32 quarters. A large share in that band means that the cycle really does lie at business-cycle frequencies. A dominant period at the edge of the range suggests a filter that passes too much low-frequency movement, or high-frequency noise. Baxter-King will show high share by construction, so the measure says more about the other filters.

## Reading the Variance Ratio

**Variance Ratio** shows the variance of the trend and of the cycle relative to the variance of the series, along with the covariance term that makes the shares add to one. A cycle share near one suggests that the trend is barely moving. A negative covariance means that the trend and cycle move in opposite directions, which is common with Beveridge-Nelson and hard to interpret as a conventional gap. A very low cycle share may mean a filter that attributes almost all movement to the trend.

## Measuring End-Point Sensitivity

**End-Point Sensitivity** reruns the selected filter without the last 4 observations and measures the revision to the trend on the dates that both runs cover. Large revisions near the end warn that the current output gap is uncertain, which matters in real-time policy work. Small revisions are reassuring only for that specific sample and event. The check can be made more demanding by repeating it across different points of history, since a sample ending at a turning point tends to give the largest revision.

## Comparing Filters and the Random Walk

**Filter Comparison** applies all five filters to the same series, aligns the cycles on the dates that every filter covers, and shows the HP cycle of a pure random walk as a control. High correlation across filters supports robust conclusions. Large differences mean that the conclusions rest on the definition. The random walk control has no true cycle, so the real HP cycle should look distinctly different from it. A finding that holds in the real series and also in the random walk has no evidential value.

## See Also

- [Assumptions](assumptions.md) · [Interpretation](interpretation.md) · [Decision Guide](decision-guide.md)
