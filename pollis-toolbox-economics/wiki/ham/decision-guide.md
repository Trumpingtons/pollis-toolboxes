# Heterogeneous-Agent Models — Decision Guide

The choice depends on whether the question needs capital and wages, and on how far the simple income process can carry the analysis.

## Which Heterogeneous-Agent Economy to Choose

| Question | Tab | Reason |
|---|---|---|
| Why is the risk-free rate low? How do credit limits affect it? | **Huggett** | Bonds in zero net supply, so the interest rate adjusts on its own |
| How does uninsured risk affect capital and output? | **Aiyagari** | Saving builds the capital stock of a Cobb-Douglas firm, so wages adjust too |

## How to Set the Borrowing Limit and Income Risk

**phi (borrowing limit)** must be below 0 in the Huggett economy for the market to clear with any trade, while the capital economy of [Aiyagari (1994)](#ref-Aiy1994a) also works with a limit of 0. A sensible first limit is a modest multiple of mean income. **sigma (income vol)** and **kappa (mean reversion)** set the stationary variance of income, sigma^2 / (2 kappa), so calibrate them together to match a measure of income dispersion and persistence. A very high kappa makes shocks transitory and easily self-insured, and low values approach a permanent shock.

## How to Set the Grid

Begin with the default **N (grid points)**, and refine until moments stop moving. Equilibrium rates are more sensitive than policies, since aggregate saving is steep near the discount rate. A grid that is twice as fine doubles the size of the matrix, and the search for an equilibrium rate requires many solves, so keep refinement proportionate. Check the upper end through **Wealth Distribution**: density near zero at the top bound shows a sufficient grid. If the density is cut off at the top, extend the grid before refining anything else.

## When to Extend the Model

The panel's stationary economies are a base for extensions. Questions about monetary policy need an additional illiquid asset, price stickiness and aggregate dynamics, as in [Kaplan, Moll and Violante (2018)](#ref-KMV2018a), and they require more than the panel's two tabs. Matching top wealth shares usually requires heterogeneous returns, entrepreneurs, or a jump process for income. For a quick answer about an average household's response to aggregate shocks, use the Dynamic Stochastic General Equilibrium (DSGE) panel. For a question about financial assets rather than households, the Continuous-Time Macro-Finance panel uses the same solver.

## References

<a id="ref-Aiy1994a"></a>Aiyagari, S. R. (1994). Uninsured Idiosyncratic Risk and Aggregate Saving. *The Quarterly Journal of Economics* 109(3), 659–684. [doi:10.2307/2118417](https://doi.org/10.2307/2118417)

<a id="ref-KMV2018a"></a>Kaplan, G., Moll, B. and Violante, G. L. (2018). Monetary Policy According to HANK. *American Economic Review* 108(3), 697–743. [doi:10.1257/aer.20160042](https://doi.org/10.1257/aer.20160042)

## See Also

- [Factsheet](factsheet.md) · [Overview](overview.md) · [Interpretation](interpretation.md)
