# Business Cycle Filters — Factsheet

The Business Cycle Filters panel splits one macroeconomic series into a slowly moving trend and a cyclical component, using five methods that disagree in instructive ways. No cycle can be observed directly, so each filter is a definition as much as a measurement. MacroEconometricModels.jl provides the filters.

| | |
|---|---|
| **Purpose** | Separate a series into a trend and a cycle, and compare the result across methods |
| **Julia stack** | MacroEconometricModels.jl, with FFTW.jl for the power spectrum |
| **Models** | Hodrick-Prescott, Hamilton, Beveridge-Nelson, Baxter-King, Boosted HP |
| **Output** | A trend and a cycle, the power spectrum of the cycle, turning points, comparisons across filters |
| **Key choice** | Which definition of the cycle suits the question, and whether future data may be used |

## When to Use a Business Cycle Filter

A filter suits questions about how output, employment or prices move around their long-run paths: dating booms and slumps, measuring an output gap, or computing the volatility and co-movement statistics that macroeconomic models are asked to match. The input is usually 100 times the log of a quarterly real series, so that the cycle reads as a percent deviation from trend. A long sample helps, since the slowest cycles of interest last up to eight years, and a series shorter than two or three such cycles says little about them.

## What a Filter Does Not Establish

A filtered cycle is a statistical construct, not a measured economic quantity. Two reasonable filters can give very different gaps and dates for one series, so a result that holds only under one filter should be doubted. A filter is also silent about causes: it does not tell supply shocks from demand shocks, or whether a change in trend reflects productivity. Filtered series are not safe inputs to every later regression either, since the filter itself creates dynamics, and two-sided filters use information unavailable at the time.

## See Also

- [Overview](overview.md) · [Decision Guide](decision-guide.md) · [Assumptions](assumptions.md)
