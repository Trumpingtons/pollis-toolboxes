# Business Cycle Filters — Interpretation

A filtered cycle gives a size, a timing and a relationship with other series. All three should be read together with the filter's definition of the cycle.

## Reading the Cycle in Percent

With 100 times log inputs, a cycle reads as a percent deviation from trend. A value of 2 means that output is about 2% above its trend under that filter's definition. The result is not the same as an official output gap, which is usually built from a production function and considers inflation and labour market data. Sign and magnitude both depend on the filter, so a statement that the economy is above trend should come with the method, and ideally the range across methods.

## Reading Turning Points

**Turning Points** identifies local peaks and troughs in the cycle using a rolling window. A wider window finds only the larger cycles, and a narrower window finds many small ones. Dates may be compared with an external chronology such as official recession dates, keeping in mind that those measure declines in activity, whereas filters measure deviations from trend. A growth slowdown may be a trough in a gap but not a recession. Near the end of the sample, turning points are provisional, since they depend on data still to come.

## Reading Cross-Correlations

**Cross-Correlation with GDP** computes lead and lag correlations of the extracted cycle with the cycle of a reference series filtered the same way. A peak at lag zero means that the series moves with the cycle, a peak at a positive lead indicates a leading variable, and a negative peak indicates a countercyclical one. Standard practice in business-cycle research reads these correlations as stylised facts, which a model must reproduce. Since a two-sided filter uses future data, an apparent lead cannot be used directly for real-time forecasting.

## Reading Differences Between Filters

Disagreement carries information. Hamilton cycles are often larger and more persistent than HP cycles, because trend removal is less flexible. Beveridge-Nelson with low-order models tends to give small, noisy cycles, since most of the movement is classified as permanent. Baxter-King removes both high-frequency noise and low-frequency swings, so it often looks the smoothest of all. Boosted HP sits between its single-pass parent and a more flexible trend. The filters answer different questions, so the choice should depend on the concept of a cycle that the application needs.

## See Also

- [Diagnostics](diagnostics.md) · [Decision Guide](decision-guide.md) · [Overview](overview.md)
